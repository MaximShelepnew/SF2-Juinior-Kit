-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: RMII RX - RMII Receive logic 
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


ENTITY RMII_RX IS
   GENERIC (
--------------------------------------------------------------------------------
-- Parameter declarations
--------------------------------------------------------------------------------
      TRANSFER_TYPE  :  integer := 1;    --  0 - Half-duplex, 1 - Full-duplex 
      TRANSFER_SPEED :  integer := 1);    --  0 - 10Mbp/s, 1 - 100Mbps 
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
END ENTITY RMII_RX;

ARCHITECTURE translated OF RMII_RX IS


   -- -----------------
   -- Internal signals
   -- -----------------
   SIGNAL rmii2rx_scrsdv1          :  std_logic;   
   SIGNAL rmii2rx_scrsdv2          :  std_logic;   
   SIGNAL ccrsdv1                  :  std_logic;   
   SIGNAL ccrsdv2                  :  std_logic; 
   SIGNAL ccrsdv3                  :  std_logic; 
   SIGNAL rmii2rx_crxd             :  std_logic_vector(7 DOWNTO 0);   
   SIGNAL rmii2rx_rrxd             :  std_logic_vector(7 DOWNTO 0);   
   -- Start-of-frame delimiter signals
   SIGNAL sfd                      :  std_logic;   
   SIGNAL crsfd                    :  std_logic;   
   SIGNAL rsfd                     :  std_logic;   
   SIGNAL rsfdd                    :  std_logic;   
   SIGNAL crsfdd                   :  std_logic;   
   -- False carrier signals
   SIGNAL cbrfc                    :  std_logic;   
   SIGNAL brfc                     :  std_logic;   
   SIGNAL crfcd                    :  std_logic;   
   SIGNAL rfcd                     :  std_logic;   
   SIGNAL srfcd1                   :  std_logic;   
   SIGNAL srfcd2                   :  std_logic;   
   SIGNAL srfcd2_d                 :  std_logic;   
   SIGNAL srfcd                    :  std_logic;   
   -- Error signals
   SIGNAL rmii2rx_rxerr_r          :  std_logic;   
   SIGNAL rx_err_int               :  std_logic;   
   -- Receive data valid signals
   SIGNAL crxdv                    :  std_logic;   
   SIGNAL rrxdv                    :  std_logic;   
   SIGNAL crrxdv                   :  std_logic;   
   SIGNAL srxdv1                   :  std_logic;   
   SIGNAL pmde                     :  std_logic;   
   SIGNAL gpmde                    :  std_logic;   
   -- Receive carrier sense signals
   SIGNAL cbcs                     :  std_logic;   
   SIGNAL bcs                      :  std_logic;   
   -- Receive data signals
   SIGNAL rrxd                     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL mrxd                     :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL crxdata_en               :  std_logic;   
   SIGNAL rxdata_en                :  std_logic;   
   SIGNAL mrxd1                    :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL cntr                     :  std_logic_vector(4 DOWNTO 0);   
   SIGNAL gsfdpos                  :  std_logic;   
   SIGNAL sfdpos                   :  std_logic;   
   -- Counter signals used for 10Mbps operation
   SIGNAL rxen_10m                 :  std_logic;   
   SIGNAL rxen_10mreg              :  std_logic;   
   SIGNAL rxen_10r                 :  std_logic;   
   SIGNAL rxen_10rreg              :  std_logic;   
   ----------------------------------------------------------------------------//
   -- rmii2rx_crxd : Combinatorial received data rmii2rx_rxd[1:0]
   ----------------------------------------------------------------------------//
   -- for 100mbps
   -- for 10mbps
   SIGNAL temp_xhdl6               :  std_logic_vector(7 DOWNTO 0);   
   -- 100mbps
   -- 10mbps
   SIGNAL temp_xhdl7               :  std_logic;   
   -- 100mbps
   -- 10mbps
   SIGNAL temp_xhdl8               :  std_logic_vector(3 DOWNTO 0);   
   ----------------------------------------------------------------------------//
   -- Transfer the RXD data onto the rxclk
   ----------------------------------------------------------------------------//
   SIGNAL temp_xhdl9               :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL temp_xhdl10              :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rx2mii_rxd_xhdl1         :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL rx2mii_rxdv_xhdl2        :  std_logic;   
   SIGNAL rx2mii_rxerr_xhdl3       :  std_logic;   
   SIGNAL rx2mii_col_xhdl4         :  std_logic;   
   SIGNAL rx2mii_crs_xhdl5         :  std_logic;   

   SIGNAL cpred                    :  std_logic;   
   SIGNAL spred                    :  std_logic;   
   SIGNAL spred_d                  :  std_logic;   
   SIGNAL pred                     :  std_logic;      
   
   SIGNAL trans_speed                     :  std_logic;   

BEGIN
   rx2mii_rxd <= rx2mii_rxd_xhdl1;
   rx2mii_rxdv <= rx2mii_rxdv_xhdl2;
   rx2mii_rxerr <= rx2mii_rxerr_xhdl3;
   rx2mii_col <= rx2mii_col_xhdl4;
   rx2mii_crs <= rx2mii_crs_xhdl5;

   --////////////////////////////////////////////////////////////////////////////
   --                           Start-of-Code                                  //
   --////////////////////////////////////////////////////////////////////////////
   --//------------------------------------------------------------------------//
   --//                                                                        //
   --//         ||||||   ||\  /||  ||  ||     ||||||  |||||                    //
   --//         ||||||   || \/ ||  ||  || ==    ||    |||                      //
   --//         ||  \\   ||    ||  ||  ||     ||||||  ||                       //
   --//                                                                        //
   --//------------------------------------------------------------------------//
   --// RMII<->MII Receive logic:                                              //
   --//                                                                        //
   --//Inputs:                                                                 //
   --//-------                                                                 //
   --//rmii2rx_rxd[1:0]                                                        //
   --// rmii2rx_crsdv                                                          //
   --//                                                                        //
   --// Outputs:                                                               //
   --// --------                                                               //
   --// rx2mii_rxd[3:0]                                                        //
   --// rx2mii_rxdv                                                            //
   --// rx2mii_crs                                                             //
   --// rx2mii_col                                                             //
   --// rx2mii_rxerr                                                           //
   --//                                                                        //
   --//                                                                        //
   --//------------------------------------------------------------------------//

   ----------------------------------------------------------------------------//
   -- CRS_DV is synchronized to the reference clock
   -- rmii2rx_scrsdv1 : registered version of rmii2rx_crsdv
   ----------------------------------------------------------------------------//
   trans_speed <= '1' when TRANSFER_SPEED = 1 else '0' ;
   
   ccrsdv1 <= ((trans_speed AND rmii2rx_crsdv) OR 
              (NOT (trans_speed) AND rmii2rx_crsdv) OR
              ((NOT (trans_speed) AND rmii2rx_scrsdv1) AND NOT (rxen_10mreg) )OR
              ((NOT(trans_speed) AND rmii2rx_crsdv) AND rxen_10mreg) );



   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rmii2rx_scrsdv1 <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
	   rmii2rx_scrsdv1 <= ccrsdv1;
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- rmii2rx_scrsdv2 : synchronized version of rmii2rx_crsdv
   ----------------------------------------------------------------------------//
   ccrsdv2 <= (((CONV_STD_LOGIC(TRANSFER_SPEED) AND rmii2rx_scrsdv1) OR 
            (NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rmii2rx_scrsdv1) OR 
            ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rmii2rx_scrsdv2) AND NOT 
            rxen_10mreg) OR ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND 
            rmii2rx_scrsdv1) AND rxen_10mreg)) );

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rmii2rx_scrsdv2 <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
	   rmii2rx_scrsdv2 <= ccrsdv2;
      END IF;
   END PROCESS;

   ccrsdv3 <= ccrsdv1 OR rsfd ;

   temp_xhdl6 <= ((ccrsdv3) & (ccrsdv3) & (ccrsdv3) & (ccrsdv3) & (ccrsdv3) & 
   (ccrsdv3) & (ccrsdv3) & (ccrsdv3) AND rmii2rx_rxd(1 DOWNTO 0) & rmii2rx_rrxd(7 
   DOWNTO 2)) WHEN TRANSFER_SPEED /= 0 ELSE ((ccrsdv3 AND rxen_10mreg) & (ccrsdv3 
   AND rxen_10mreg) & (ccrsdv3 AND rxen_10mreg) & (ccrsdv3 AND rxen_10mreg) & 
   (ccrsdv3 AND rxen_10mreg) & (ccrsdv3 AND rxen_10mreg) & (ccrsdv3 AND 
   rxen_10mreg) & (ccrsdv3 AND rxen_10mreg) AND rmii2rx_rxd(1 DOWNTO 0) & 
   rmii2rx_rrxd(7 DOWNTO 2)) OR ((ccrsdv3 AND NOT rxen_10mreg) & (ccrsdv3 AND NOT 
   rxen_10mreg) & (ccrsdv3 AND NOT rxen_10mreg) & (ccrsdv3 AND NOT rxen_10mreg) & 
   (ccrsdv3 AND NOT rxen_10mreg) & (ccrsdv3 AND NOT rxen_10mreg) & (ccrsdv3 AND 
   NOT rxen_10mreg) & (ccrsdv3 AND NOT rxen_10mreg) AND rmii2rx_rrxd(7 DOWNTO 0))
   ;
   rmii2rx_crxd <= temp_xhdl6 ;

   ----------------------------------------------------------------------------//
   -- rmii2rx_rrxd : Registered received data rmii2rx_rrxd[1:0]
   ----------------------------------------------------------------------------//
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rmii2rx_rrxd <= "00000000";    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rmii2rx_rrxd <= rmii2rx_crxd;    
      END IF;
   END PROCESS;
   -- gsfdpos :: Go SFD Position
   gsfdpos <= ((sfdpos AND NOT (CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND 
   NOT rsfd)) AND rxdata_en) OR ((NOT sfdpos AND (CONV_STD_LOGIC(rmii2rx_rrxd = 
   "11010101") AND NOT rsfd)) AND NOT rxdata_en) ;

   -- sfdpos :: SFD Position
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         sfdpos <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         sfdpos <= gsfdpos;    
      END IF;
   END PROCESS;
   ----------------------------------------------------------------------------//
   -- rsfd : Registered Start-of-frame delimiter rsfd
   ----------------------------------------------------------------------------//
   crsfd <= ((CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "11010101")) AND 
   NOT rsfd) OR 
   ((CONV_STD_LOGIC(TRANSFER_SPEED) AND rsfd) AND (rmii2rx_scrsdv1 
   OR rmii2rx_scrsdv2)) OR 
   (((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND 
   CONV_STD_LOGIC(rmii2rx_rrxd = "11010101")) AND NOT rsfd) AND rxen_10mreg) OR 
   ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rsfd) AND NOT rxen_10mreg) OR 
   ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rsfd) AND (rmii2rx_scrsdv1 OR 
   rmii2rx_scrsdv2) AND rxen_10mreg);

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rsfd <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rsfd <= crsfd;    
      END IF;
   END PROCESS;
   crsfdd <= (((CONV_STD_LOGIC(TRANSFER_SPEED) AND NOT rsfdd) AND rsfd) AND NOT 
   (rmii2rx_scrsdv1 OR rmii2rx_scrsdv2)) OR ((CONV_STD_LOGIC(TRANSFER_SPEED) 
   AND rsfdd) AND rxdata_en) ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rsfdd <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rsfdd <= crsfdd;    
      END IF;
   END PROCESS;

-- --------------------------------------------------------------------------//
-- spred : Registered Preamble detect spred
-- --------------------------------------------------------------------------//

  cpred <= ((CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "01010101")) AND NOT rsfd AND NOT spred) OR
         (CONV_STD_LOGIC(TRANSFER_SPEED) AND NOT rsfd  AND spred AND (rmii2rx_scrsdv1 OR rmii2rx_scrsdv2)) OR
         (((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "01010101")) AND NOT rsfd AND NOT spred) AND rxen_10mreg) OR
         ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND NOT rsfd AND spred) AND NOT rxen_10mreg) OR
         ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND NOT rsfd AND spred) AND ((rmii2rx_scrsdv1 OR rmii2rx_scrsdv2) AND rxen_10mreg));

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         spred <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         spred <= cpred;    
      END IF;
   END PROCESS;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         spred_d <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         spred_d <= spred;    
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- The RMII specification: False Carrier
   -- -----------------------
   --   If False Carrier is detected (Bad SSD), then RXD[1:0] shall be '10'
   --   until the end of the receive event. This is a unique pattern since
   --   False Carrier can only occur at the beginning of a packet where
   --   preamble will be decoded (i.e. RXD[1:0]=01).
   ----------------------------------------------------------------------------//
   -- brfc : Registered False Carrier 
   ----------------------------------------------------------------------------//
   cbrfc <= (CONV_STD_LOGIC(rmii2rx_rxd(1 DOWNTO 0) = "01") AND NOT brfc) OR (brfc AND 
   (rmii2rx_scrsdv1 OR rmii2rx_scrsdv2)) ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         brfc <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         brfc <= cbrfc;    
      END IF;
   END PROCESS;
   ----------------------------------------------------------------------------//
   -- rfcd : Registered False Carrier detection
   ----------------------------------------------------------------------------//
   crfcd <= (((CONV_STD_LOGIC(rmii2rx_rxd = "10") AND NOT brfc) AND NOT rfcd) 
   AND rmii2rx_scrsdv2) OR (rfcd AND (rmii2rx_scrsdv1 OR rmii2rx_scrsdv2)) ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rfcd <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rfcd <= crfcd;    
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- srfcd1 : Synchronize rfcd (False Carrier detection) to rxclk
   ----------------------------------------------------------------------------//
   
   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         srfcd1 <= '0';    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
         srfcd1 <= rfcd;    
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- srfcd2 : Synchronize srfcd1 (False Carrier detection) to rxclk
   ----------------------------------------------------------------------------//
   
   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         srfcd2 <= '0';    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
         srfcd2 <= srfcd1;    
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- srfcd2_d : Delayed srfcd1
   ----------------------------------------------------------------------------//
   
   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         srfcd2_d <= '0';    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
         srfcd2_d <= srfcd2;    
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- srfcd : False Carrier 
   -- It is generated at the end of the false carrier cycle
   ----------------------------------------------------------------------------//
   
   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         srfcd <= '0';    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
         IF ((srfcd2_d AND NOT srfcd2) = '1') THEN
            srfcd <= '1';    
         END IF;
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- rx2mii_rxerr : MII Receive Error
   -- It is generated at the end of the false carrier cycle when the receive 
   -- data rmii2rx_rxd[1:0] is loaded with "10" pattern until the end of the 
   -- carrier activity OR when the receive error rmii2rx_rxerr input coming from
   -- the PHY is asserted
   ----------------------------------------------------------------------------//
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rmii2rx_rxerr_r <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rmii2rx_rxerr_r <= rmii2rx_rxerr;    
      END IF;
   END PROCESS;
   temp_xhdl7 <= (rmii2rx_rxerr OR rmii2rx_rxerr_r OR srfcd) WHEN 
   TRANSFER_SPEED /= 0 ELSE ((rmii2rx_rxerr OR rmii2rx_rxerr_r OR srfcd) AND 
   rxen_10rreg);
   rx_err_int <= temp_xhdl7 ;

   ----------------------------------------------------------------------------//
   -- Synchronize to rx-clk
   ----------------------------------------------------------------------------//
   
   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rx2mii_rxerr_xhdl3 <= '0';    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
         rx2mii_rxerr_xhdl3 <= rx_err_int;    
      END IF;
   END PROCESS;
   ----------------------------------------------------------------------------//
   -- In 10Mb/s operation, the receive packet is not necessarily aligned to
   -- the Receive Clock Enable, rxcen, pulses which are sent to the MAC.
   -- These rxcen pulses effectively reduce the bandwidth of the medium to
   -- 10 Mb/s.  Since the input receive packet can end between consecutive
   -- rxcen pulses, Pre-MII Data Enable, pmde, is a pulse which guarantees
   -- the last nibble is not shortchanged.
   ----------------------------------------------------------------------------//
   gpmde <= ((NOT pmde AND rrxdv) AND rxen_10mreg) OR ((pmde AND rrxdv) AND NOT 
   rxen_10mreg) ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         pmde <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         pmde <= gpmde;    
      END IF;
   END PROCESS;
   ----------------------------------------------------------------------------//
   -- Receive Data Valid
   ----------------------------------------------------------------------------//
   -- Register rrxdv on refclk on detection of SFD
   -- This is used to generate the rx2mii_rxdv output
   -- Asserted on detection of SFD pattern "5D", de-asserted when rsfd/rsfdd is
   -- de-asserted.
   -- When SFD is detected on negedge of rxclk, the delayed rsfdd is blocked
   -- and rrxdv will be high as long as rsfd is high. In this case rxdata_en is 
   -- high when rsfdd is high.
   -- When SFD is detected on posedge of rxclk, the delayed rsfdd is used i.e.
   -- rrxdv will be high as long as rsfdd is high. In this case rxdata_en is 
   -- low when rsfdd is high.
   ----------------------------------------------------------------------------//
   crxdv <= ((CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "11010101")) AND (NOT rsfd)) OR 
            ((CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "01010101")) AND (NOT rsfd) AND (NOT spred)) OR 	   
            (CONV_STD_LOGIC(TRANSFER_SPEED) AND (rsfd OR (rsfdd AND NOT 
   rxdata_en))) OR 
            (CONV_STD_LOGIC(TRANSFER_SPEED) AND (spred OR (spred_d AND NOT
   rxdata_en))) OR                                        
             ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "11010101")) AND NOT rsfd AND rxen_10mreg) OR
             ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND CONV_STD_LOGIC(rmii2rx_rrxd = "01010101")) AND NOT rsfd AND (NOT spred) AND rxen_10mreg) OR 
	     ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND (rsfd OR (rsfdd AND rxdata_en))) AND rxen_10mreg) OR 
	     ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND (spred OR (spred_d AND rxdata_en))) AND rxen_10mreg) OR 	     
   ((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rrxdv) AND NOT (pmde AND 
   rxen_10mreg)) ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rrxdv <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rrxdv <= crxdv;    
      END IF;
   END PROCESS;
   crrxdv <= (CONV_STD_LOGIC(TRANSFER_SPEED) AND rrxdv) OR ((NOT CONV_STD_LOGIC( 
   TRANSFER_SPEED) AND rrxdv) AND rxen_10rreg) OR ((NOT CONV_STD_LOGIC( 
   TRANSFER_SPEED) AND srxdv1) AND NOT rxen_10rreg) ;

   ----------------------------------------------------------------------------//
   -- Synchronize rrxdv to rxclk using double syncronizer
   ----------------------------------------------------------------------------//
   
   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         srxdv1 <= '0';    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
         srxdv1 <= crrxdv;    
      END IF;
   END PROCESS;
   rx2mii_rxdv_xhdl2 <= srxdv1 ;
   ----------------------------------------------------------------------------//
   -- rx2mii_crs: Receive Carrier Sense
   ----------------------------------------------------------------------------//
   -- The RMII describes the behavior of crs_dv as follows:
   --
   --     "CRS_DV shall be asserted by the PHY when the receive medium is
   --      nonidle. The specifics of the definition of idle for 10BASE-T and
   --      100BASE-X are contained in IEEE 802.3 and IEEE 802.3u. CRS_DV is
   --      asserted asynchronously on detection of carrier due to the criteria
   --      relevant to the operating mode. That is, in 10BASE-T mode, when
   --      squelch is passed or in 100BASE-X mode when 2 non-contiguous zeroes
   --      in 10 bits are detected carrier is said to be detected.
   --
   --      Loss of carrier shall result in the deassertion of CRS_DV
   --      synchronous to the cycle of REF_CLK which presents the first di-bit
   --      of a nibble onto RXD[1:0] (i.e. CRS_DV is deasserted only on nibble
   --      boundaries). If the PHY has additional bits to be presented on
   --      RXD[1:0] following the initial deassertion of CRS_DV, then the PHY
   --      shall assert CRS_DV on cycles of REF_CLK which present the second
   --      di-bit of each nibble and deassert CRS_DV on cycles of REF_CLK
   --      which present the first di-bit of a nibble. The result is: Starting
   --      on nibble boundaries CRS_DV toggles at 25 MHz in 100Mb/s mode and
   --      2.5 MHz in 10Mb/s mode when CRS ends before RX_DV (i.e. the FIFO
   --      still has bits to transfer when the carrier event ends.) Therefore,
   --      the MAC can accurately recover RX_DV and CRS.
   --
   --      During a false carrier event, CRS_DV shall remain asserted for the
   --      duration of carrier activity. The data on RXD[1:0] is considered
   --      valid once CRS_DV is asserted. However, since the assertion of
   --      CRS_DV is asynchronous relative to REF_CLK, the data on RXD[1:0]
   --      shall be '00' until proper receive signal decoding takes place
   --      (see definition of RXD[1:0] behavior)."
   --
   -- Here, rmii2rx_crsdv is multiplexed Carrier Sense/Data Valid signal on the 
   -- RMII side. On the MII side, rx2mii_crs is output to the MAC. 
   -- Assertion of CRS_DV is asynchronous to refclk while de-assertion is
   -- synchronous to the refclk based on the loss of carrier. The de-assertion
   -- of Carrier Sense CRS(rx2mii_crs) may happen well before the MII receive 
   -- Data valid(rx2mii_rxdv). 
   --
   -- Carrier sense, rx2mii_crs is asserted only during the carrier event
   ----------------------------------------------------------------------------//
   rx2mii_crs_xhdl5 <= (rmii2rx_crsdv AND NOT bcs) OR tx_txen ;
   cbcs <= (((NOT rmii2rx_crsdv AND rmii2rx_scrsdv1) AND NOT bcs) AND rsfd) OR 
   (bcs AND rsfd) ;

   ----------------------------------------------------------------------------//
   -- The PHY may have additional bits to present on the RXD[1:0] bus after 
   -- the initial de-assertion of the CRSDV line by allowing the elasticity FIFO
   -- to drain. 
   -- Block carrier sense, bcs is generated when the CRSDV toggles when there 
   -- are still bits to be sent by the PHY after the carrier is lost.
   ----------------------------------------------------------------------------//
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         bcs <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         bcs <= cbcs;    
      END IF;
   END PROCESS;
   ----------------------------------------------------------------------------//
   -- Receive Collision, rx2mii_col 
   -- It is asserted in the half-duplex mode when both the MAC and the PHY
   -- starts sending on the line.
   ----------------------------------------------------------------------------//
  rx2mii_col_xhdl4 <= '0' WHEN TRANSFER_TYPE = 1 ELSE ((rmii2rx_crsdv AND NOT bcs) AND tx_txen );   -- Added

   ----------------------------------------------------------------------------//
   -- Receive data enable, rxdata_en
   -- After the detection of the SFD, the receive data enable toggles every 
   -- refclk and stores the nibble data.
   ----------------------------------------------------------------------------//
   crxdata_en <= ((CONV_STD_LOGIC(TRANSFER_SPEED) AND rsfd) AND NOT rxdata_en) OR 
		 ((CONV_STD_LOGIC(TRANSFER_SPEED) AND spred) AND NOT rxdata_en) OR 
                 (((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rsfd) AND NOT rxdata_en) AND 
   rxen_10mreg) OR 
                 (((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND spred) AND NOT rxdata_en) AND 
   rxen_10mreg) OR
                 (((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND spred) AND rxdata_en) AND 
   NOT rxen_10mreg) OR   
                 (((NOT CONV_STD_LOGIC(TRANSFER_SPEED) AND rsfd) AND rxdata_en) AND NOT rxen_10mreg) ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rxdata_en <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rxdata_en <= crxdata_en;    
      END IF;
   END PROCESS;
   sfd <= CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd ;
   pred <= CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT spred AND NOT rsfd ;  -- Added

   temp_xhdl8 <= (((CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) & 
   (CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) & 
   (CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) & 
   (CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) AND "0101") OR 
   ((CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT spred AND NOT rsfd) & 
   (CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT spred AND NOT rsfd) & 
   (CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT spred AND NOT rsfd) & 
   (CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT spred AND NOT rsfd) AND "0101") OR  
   (rxdata_en & rxdata_en & rxdata_en & rxdata_en AND rmii2rx_rrxd(3 DOWNTO 0)) OR 
   ((NOT rxdata_en AND NOT pred) & (NOT rxdata_en AND NOT pred) & (NOT 
   rxdata_en AND NOT pred) & (NOT rxdata_en AND NOT pred) AND rrxd(3 DOWNTO 0))) 
   WHEN TRANSFER_SPEED /= 0 ELSE 
   ((((((NOT rxdata_en AND NOT sfd) AND rxen_10mreg) AND rsfd) OR (NOT (pmde AND rxen_10mreg))) &    ((((NOT rxdata_en AND NOT sfd) AND rxen_10mreg) AND rsfd) OR (NOT (pmde AND rxen_10mreg))) &    ((((NOT rxdata_en AND NOT sfd) AND rxen_10mreg) AND rsfd) OR (NOT (pmde AND rxen_10mreg))) &    ((((NOT rxdata_en AND NOT sfd) AND rxen_10mreg) AND rsfd) OR (NOT (pmde AND rxen_10mreg))) AND rrxd(3 DOWNTO 0)) OR 
(((((NOT rxdata_en AND NOT pred) AND rxen_10mreg) AND spred) OR (NOT (pmde AND rxen_10mreg))) &    ((((NOT rxdata_en AND NOT pred) AND rxen_10mreg) AND spred) OR (NOT (pmde AND rxen_10mreg))) &    ((((NOT rxdata_en AND NOT pred) AND rxen_10mreg) AND spred) OR (NOT (pmde AND rxen_10mreg))) &    ((((NOT rxdata_en AND NOT pred) AND rxen_10mreg) AND spred) OR (NOT (pmde AND rxen_10mreg))) AND rrxd(3 DOWNTO 0)) OR   
   ((((rxdata_en AND rxen_10mreg) AND rsfd) & 
     ((rxdata_en AND rxen_10mreg) AND rsfd) & 
     ((rxdata_en AND rxen_10mreg) AND rsfd) & 
     ((rxdata_en AND rxen_10mreg) AND rsfd)) AND rmii2rx_rrxd(3 DOWNTO 0)) OR 
   ((((rxdata_en AND rxen_10mreg) AND spred) & 
     ((rxdata_en AND rxen_10mreg) AND spred) & 
     ((rxdata_en AND rxen_10mreg) AND spred) & 
     ((rxdata_en AND rxen_10mreg) AND spred)) AND rmii2rx_rrxd(3 DOWNTO 0)) OR
     ((((CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT rsfd AND NOT spred) AND rxen_10mreg) & 
       ((CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT rsfd AND NOT spred) AND rxen_10mreg) & 
       ((CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT rsfd AND NOT spred) AND rxen_10mreg) & 
       ((CONV_STD_LOGIC(rmii2rx_rrxd = "01010101") AND NOT rsfd AND NOT spred) AND rxen_10mreg)) AND "0101") OR  
     ((((CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) AND rxen_10mreg) & 
       ((CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) AND rxen_10mreg) & 
       ((CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) AND rxen_10mreg) & 
       ((CONV_STD_LOGIC(rmii2rx_rrxd = "11010101") AND NOT rsfd) AND rxen_10mreg)) AND "0101"));

   mrxd <= temp_xhdl8 ;

   PROCESS (refclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rrxd <= "0000";    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rrxd <= mrxd;    
      END IF;
   END PROCESS;
   temp_xhdl9 <= rrxd WHEN rxen_10rreg = '1' ELSE rx2mii_rxd_xhdl1;
   temp_xhdl10 <= rrxd WHEN TRANSFER_SPEED /= 0 ELSE (temp_xhdl9);
   mrxd1 <= temp_xhdl10 ;

   PROCESS (rxclk, resetn)
   BEGIN
      IF (NOT resetn = '1') THEN
         rx2mii_rxd_xhdl1 <= "0000";    
      ELSIF (rxclk'EVENT AND rxclk = '1') THEN
	 -- OR with false carrier event detection signal so that the RXD data line 
	 -- output 'E' during false carrier condition 
         rx2mii_rxd_xhdl1 <= ((mrxd1(3) OR srfcd) & (mrxd1(2) OR srfcd) & (mrxd1(1) OR srfcd) & (mrxd1(0)));    
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
   rxen_10m <= CONV_STD_LOGIC(cntr = "01000" OR cntr = "10010") ;
   rxen_10r <= CONV_STD_LOGIC(cntr = "01000" OR cntr = "01001" OR cntr = 
   "10010" OR cntr = "10011") ;

   -- Register the pulse generated for 10Mbps mode operation
   
   PROCESS (refclk, resetn)
   BEGIN
      IF (resetn = '0') THEN
         rxen_10mreg <= '0';    
         rxen_10rreg <= '0';    
      ELSIF (refclk'EVENT AND refclk = '1') THEN
         rxen_10mreg <= rxen_10m;    
         rxen_10rreg <= rxen_10r;    
      END IF;
   END PROCESS;

END ARCHITECTURE translated;
