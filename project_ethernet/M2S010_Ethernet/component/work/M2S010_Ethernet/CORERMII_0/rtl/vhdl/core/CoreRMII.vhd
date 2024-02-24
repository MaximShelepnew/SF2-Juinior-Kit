-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: CoreRMII - MII <-> RMII conversion 
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

ENTITY M2S010_Ethernet_CORERMII_0_CORERMII IS
   GENERIC (
      --------------------------------------------------------------------------------
      -- Parameter declarations
      --------------------------------------------------------------------------------
      FAMILY                         :  integer := 19;    
      LOOPBACK                       :  integer := 0;     --  0 - Disable, 1 - Enable 
      TRANSFER_TYPE                  :  integer := 1;     --  0 - Half-duplex, 1 - Full-duplex 
      TRANSFER_SPEED                 :  integer := 1);    --  0 - 10Mbp/s, 1 - 100Mbps 
   PORT (
      --------------------------------------------------------------------------------
-- Port declarations
--------------------------------------------------------------------------------
-- -----------
-- Inputs
-- -----------

      TXCLKM                  : IN std_logic;   
      RXCLKM                  : IN std_logic;   
      REFCLK                  : IN std_logic;   
      RSTN                    : IN std_logic;   
      -- MAC->RMII core ports

      MII_TXD                 : IN std_logic_vector(3 DOWNTO 0);   
      MII_TXEN                : IN std_logic;   
      -- -----------
-- Outputs
-- -----------
-- RMII->MAC ports

      MII_RXD                 : OUT std_logic_vector(3 DOWNTO 0);   
      MII_RXDV                : OUT std_logic;   
      MII_RXERR               : OUT std_logic;   
      MII_COL                 : OUT std_logic;   
      MII_CRS                 : OUT std_logic;   
      -- RMII->PHY ports

      RMII_TXD                : OUT std_logic_vector(1 DOWNTO 0);   
      RMII_TXEN               : OUT std_logic;   
      -- PHY->RMII core ports

      RMII_RXD                : IN std_logic_vector(1 DOWNTO 0);   
      RMII_CRSDV              : IN std_logic;   
      RMII_RXERR              : IN std_logic);   
END ENTITY M2S010_Ethernet_CORERMII_0_CORERMII;

ARCHITECTURE translated OF M2S010_Ethernet_CORERMII_0_CORERMII IS
   COMPONENT RMII_TX
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
   END COMPONENT;


   COMPONENT RMII_RX
      GENERIC (
         --------------------------------------------------------------------------------
         -- Parameter declarations
         --------------------------------------------------------------------------------
         TRANSFER_TYPE                  :  integer := 1;     --  0 - Half-duplex, 1 - Full-duplex 
         TRANSFER_SPEED                 :  integer := 1);    --  0 - 10Mbp/s, 1 - 100Mbps 
      PORT (
         --------------------------------------------------------------------------------
-- Port declarations
--------------------------------------------------------------------------------
-- -----------
-- Inputs
-- -----------

         rxclk                   : IN std_logic;   
         refclk                  : IN std_logic;   
         resetn                  : IN std_logic;   
         tx_txen                 : IN std_logic;   
         -- -----------
-- Outputs
-- -----------
-- RMII->MAC ports

         rx2mii_rxd              : OUT std_logic_vector(3 DOWNTO 0);   
         rx2mii_rxdv             : OUT std_logic;   
         rx2mii_rxerr            : OUT std_logic;   
         rx2mii_col              : OUT std_logic;   
         rx2mii_crs              : OUT std_logic;   
         -- PHY->RMII core ports

         rmii2rx_rxd             : IN std_logic_vector(1 DOWNTO 0);   
         rmii2rx_crsdv           : IN std_logic;   
         rmii2rx_rxerr           : IN std_logic);
   END COMPONENT;
   


   SIGNAL MII_RXD_xhdl1            :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL MII_RXDV_xhdl2           :  std_logic;   
   SIGNAL MII_RXERR_xhdl3          :  std_logic;   
   SIGNAL MII_COL_xhdl4            :  std_logic;   
   SIGNAL MII_CRS_xhdl5            :  std_logic;   
   SIGNAL RMII_TXD_xhdl6           :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL RMII_TXEN_xhdl7          :  std_logic;   
   SIGNAL lb_rmii_rxd              :  std_logic_vector(1 DOWNTO 0);
   SIGNAL lb_rmii_crsdv            :  std_logic;




BEGIN
   MII_RXD <= MII_RXD_xhdl1;
   MII_RXDV <= MII_RXDV_xhdl2;
   MII_RXERR <= MII_RXERR_xhdl3;
   MII_COL <= MII_COL_xhdl4;
   MII_CRS <= MII_CRS_xhdl5;
   RMII_TXD <= RMII_TXD_xhdl6;
   RMII_TXEN <= RMII_TXEN_xhdl7;

   --//--------------------------------------------------------------------------//
   --// For loopback feature implementation
   --//--------------------------------------------------------------------------//
   lb_rmii_rxd   <= RMII_TXD_xhdl6  WHEN (LOOPBACK = 1) ELSE RMII_RXD;
   lb_rmii_crsdv <= RMII_TXEN_xhdl7 WHEN (LOOPBACK = 1) ELSE RMII_CRSDV;

   -- -----------------
   -- Internal signals
   -- -----------------
   --////////////////////////////////////////////////////////////////////////////
   --                           Start-of-Code                                  //
   --////////////////////////////////////////////////////////////////////////////
   ----------------------------------------------------------------------------//
   -- Transmit logic block instance                                            //
   -- MII -> RMII Transmit logic:                                              //
   ----------------------------------------------------------------------------//
   U_RMII_TX : RMII_TX 
      GENERIC MAP (
         TRANSFER_SPEED => TRANSFER_SPEED)
      PORT MAP (
         txclk => TXCLKM,
         refclk => REFCLK,
         resetn => RSTN,
         mii2tx_txd => MII_TXD,
         mii2tx_txen => MII_TXEN,
         tx2rmii_txd => RMII_TXD_xhdl6,
         tx2rmii_txen => RMII_TXEN_xhdl7);   
   
   
   ----------------------------------------------------------------------------//
   -- Receive logic block instance                                             //
   -- RMII -> MII Receive logic:                                               //
   ----------------------------------------------------------------------------//
   U_RMII_RX : RMII_RX 
      GENERIC MAP (
         TRANSFER_TYPE => TRANSFER_TYPE,
         TRANSFER_SPEED => TRANSFER_SPEED)
      PORT MAP (
         rxclk => RXCLKM,
         refclk => REFCLK,
         resetn => RSTN,
         tx_txen => MII_TXEN,
         rx2mii_rxd => MII_RXD_xhdl1,
         rx2mii_rxdv => MII_RXDV_xhdl2,
         rx2mii_rxerr => MII_RXERR_xhdl3,
         rx2mii_col => MII_COL_xhdl4,
         rx2mii_crs => MII_CRS_xhdl5,
         rmii2rx_rxd   => lb_rmii_rxd,
         rmii2rx_crsdv => lb_rmii_crsdv,
         rmii2rx_rxerr => RMII_RXERR);   
   

END ARCHITECTURE translated;
