-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: RMII Tx - RMII Transmit logic 
--
-- Revision Information:
-- Date            Description
-- ----            -----------------------------------------
-- 02Feb11         Inital. Ports and Parameters declaration
--
-- SVN Revision Information:
-- SVN $Revision: 11146 $
-- SVN $Date: 2009-11-21 11:44:53 -0800 (Sat, 21 Nov 2009) $
--
-- Resolved SARs
-- SAR      Date     Who   Description
--
-- Notes:
-- 1. 
--
-- ****************************************************************************/
library ieee;
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;
use     work.XHDL_std_logic.all;
use     work.XHDL_misc.all;


ENTITY RMII_TX IS
   GENERIC (
      --------------------------------------------------------------------------------
      -- Parameter declarations
      --------------------------------------------------------------------------------
      TRANSFER_SPEED                 :  integer := 1);    --  0 - 10Mbp/s, 1 - 100Mbps 
   PORT (
      --------------------------------------------------------------------------------
-- Port declarations
--------------------------------------------------------------------------------
-- -----------
-- Inputs
-- -----------

      txclk                   : IN std_logic;   
      refclk                  : IN std_logic;   
      resetn                  : IN std_logic;   
      -- MAC->RMII core ports

      mii2tx_txd              : IN std_logic_vector(3 DOWNTO 0);   
      mii2tx_txen             : IN std_logic;   
      -- -----------
-- Outputs
-- -----------
-- RMII->PHY ports

      tx2rmii_txd             : OUT std_logic_vector(1 DOWNTO 0);   
      tx2rmii_txen            : OUT std_logic);   
END ENTITY RMII_TX;

ARCHITECTURE translated OF RMII_TX IS


   -- -----------------
   -- Internal signals
   -- -----------------
   SIGNAL txd_m                    :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL txen_m                   :  std_logic;   
   SIGNAL txen_r                   :  std_logic;   
   SIGNAL txd_r                    :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL txd_mreg                 :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL txen_mreg                :  std_logic;   
   SIGNAL second_dibit_en          :  std_logic;   
   SIGNAL cntr                     :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL txen_10m                 :  std_logic;   
   SIGNAL txen_10mreg              :  std_logic;   
   SIGNAL txen_10r                 :  std_logic;   
   SIGNAL txen_10rreg              :  std_logic;   

   -- for 10Mbps
   SIGNAL temp_xhdl3               :  std_logic_vector(3 DOWNTO 0);   --  for 10Mbps
   -- Transmit the 2-bit TXD data alternaltely starting with lower order [1:0]
   -- and then [3:2]
   SIGNAL temp_xhdl4               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL tx2rmii_txd_xhdl1        :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL tx2rmii_txen_xhdl2       :  std_logic;   

BEGIN
   --////////////////////////////////////////////////////////////////////////////
   --                           Start-of-Code                                  //
   --////////////////////////////////////////////////////////////////////////////

   --//------------------------------------------------------------------------//
   --//                                                                        //
   --//           ||\  /||  ||  ||     ||||||  |||||                           //
   --//           || \/ ||  ||  || ==    ||    |||                             //
   --//           ||    ||  ||  ||     ||||||  ||                              //
   --//                                                                        //
   --//------------------------------------------------------------------------//
   --// MII Transmit logic:                                                    //
   --//                                                                        //
   --// Top Inputs:                                                            //
   --// -----------                                                            //
   --// mii2tx_txd[3:0]                                                        //
   --// mii2tx_txen                                                            //
   --//                                                                        //
   --// Internal Outputs:                                                      //
   --// -----------------                                                      //
   --// txd_mreg[3:0]                                                          //
   --// txen_mreg                                                              //
   --//                                                                        //
   --//                                                                        //
   --//------------------------------------------------------------------------//

   tx2rmii_txd <= tx2rmii_txd_xhdl1;
   tx2rmii_txen <= tx2rmii_txen_xhdl2;

   -- Generate the TXEN signal from the MII interface internally
   -- TRANSFER SPEED = 1 for 100 Mbps mode, 0 for 10Mbps mode operation
   txen_m <= (CONV_STD_LOGIC(TRANSFER_SPEED) AND mii2tx_txen) OR 
   ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND mii2tx_txen) AND txen_10mreg) OR 
   ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND txen_mreg) AND NOT txen_10mreg) ;

   -- Register the internally generated txen_m signal on the Reference clock
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         txen_mreg <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         txen_mreg <= txen_m;    
      END IF;
   END PROCESS;
   temp_xhdl3 <= (mii2tx_txen & mii2tx_txen & mii2tx_txen & mii2tx_txen AND 
   mii2tx_txd) WHEN TRANSFER_SPEED /= 0 ELSE (((mii2tx_txen AND txen_10mreg) & 
   (mii2tx_txen AND txen_10mreg) & (mii2tx_txen AND txen_10mreg) & (mii2tx_txen 
   AND txen_10mreg) AND mii2tx_txd) OR ((txen_mreg AND NOT txen_10mreg) & 
   (txen_mreg AND NOT txen_10mreg) & (txen_mreg AND NOT txen_10mreg) & 
   (txen_mreg AND NOT txen_10mreg) AND txd_mreg));
   txd_m <= temp_xhdl3 ;

   -- Register the internally generated txd_m signal on the Reference clock
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         txd_mreg <= "0000";    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         txd_mreg <= txd_m;    
      END IF;
   END PROCESS;

   -- Clock Enable counter generation for 10Mbps mode
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         cntr <= "00000";    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         IF (TRANSFER_SPEED /= 1) THEN
            IF (cntr < "10011") THEN
               cntr <= cntr + "00001";    
            ELSE
               cntr <= "00000";    
            END IF;
         ELSE
            cntr <= "00000";    
         END IF;
      END IF;
   END PROCESS;
   -- Generate a pulse every tenth of the counter value for 10Mbps mode
   txen_10m <= CONV_STD_LOGIC(cntr = "00001" OR cntr = "01011") ;
   txen_10r <= CONV_STD_LOGIC(cntr = "00001" OR cntr = "01011") ;

   -- Register the pulse generated for 10Mbps mode operation
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         txen_10mreg <= '0';    
         txen_10rreg <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         txen_10mreg <= txen_10m;    
         txen_10rreg <= txen_10r;    
      END IF;
   END PROCESS;
   ----------------------------------------------------------------------------//
   --                                                                          //
   --           ||||||   ||\  /||  ||  ||     ||||||  |||||                    //
   --           ||||||   || \/ ||  ||  || ==    ||    |||                      //
   --           ||  \\   ||    ||  ||  ||     ||||||  ||                       //
   --                                                                          //
   ----------------------------------------------------------------------------//
   -- RMII Transmit logic:                                                     //
   --                                                                          //
   -- Inputs:                                                                  //
   -- -------                                                                  //
   -- txen_mreg                                                                //
   -- txd_mreg[3:0]                                                            //
   --                                                                          //
   -- Outputs:                                                                 //
   -- --------                                                                 //
   -- tx2rmii_txd[1:0]                                                        //
   -- tx2rmii_txen                                                            //
   --                                                                          //
   -- The RMII interface latches the TXD data and the TXEN signals.            //
   --                                                                          //
   ----------------------------------------------------------------------------//
   txen_r <= txen_mreg ;

   -- Register the internally generated txen_r signal on the Reference clock
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         tx2rmii_txen_xhdl2 <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         tx2rmii_txen_xhdl2 <= txen_r;    
      END IF;
   END PROCESS;
   temp_xhdl4 <= (((txen_r AND second_dibit_en) & (txen_r AND second_dibit_en) 
   AND txd_mreg(3 DOWNTO 2)) OR ((txen_r AND NOT second_dibit_en) & (txen_r AND 
   NOT second_dibit_en) AND txd_mreg(1 DOWNTO 0))) WHEN TRANSFER_SPEED /= 0 
   ELSE (((txen_r AND second_dibit_en) & (txen_r AND second_dibit_en) AND 
   txd_mreg(3 DOWNTO 2)) OR ((txen_r AND NOT second_dibit_en) & (txen_r AND NOT 
   second_dibit_en) AND txd_mreg(1 DOWNTO 0)));
   txd_r <= "00" & temp_xhdl4 ;

   -- Register the internally generated txd_r signal on the Reference clock
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         tx2rmii_txd_xhdl1 <= "00";    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         tx2rmii_txd_xhdl1 <= txd_r(1 DOWNTO 0);    
      END IF;
   END PROCESS;

   -- Logic for second_dibit_en generation
   -- This generates the logic for data enable, for transferring 2-bits of data on the RMII interface from the 
   -- 4-bit data available on the MII interface. It alternatively switches between [1:0] and [3:2] bits and tranfers 
   -- on the RMII interface.
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         second_dibit_en <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         IF ((((txen_r AND CONV_STD_LOGIC(TRANSFER_SPEED)) AND NOT 
         second_dibit_en) OR (((txen_r AND NOT CONV_STD_LOGIC(TRANSFER_SPEED)) 
         AND NOT second_dibit_en) AND txen_10mreg) OR (((txen_r AND 
         NOT CONV_STD_LOGIC(TRANSFER_SPEED)) AND second_dibit_en) AND NOT 
         txen_10mreg)) = '1') THEN
            second_dibit_en <= '1';    
         ELSE
            second_dibit_en <= '0';    
         END IF;
      END IF;
   END PROCESS;

END ARCHITECTURE translated;
