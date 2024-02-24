-- ****************************************************************************/
-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
--
-- Description: CoreRMII - testbench
--
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
library ieee, std, work; 
use     ieee.std_logic_1164.all;
use     ieee.std_logic_unsigned.all;
use     ieee.std_logic_misc.all;
use std.textio.all;             
use ieee.std_logic_textio.all;  
use ieee.std_logic_arith.all;
use     work.XHDL_std_logic.all;
use     work.XHDL_misc.all;
use     work.coreparameters.all;


ENTITY testbench IS
 END ENTITY testbench;

ARCHITECTURE translated OF testbench IS
   COMPONENT M2S010_Ethernet_CORERMII_0_CORERMII
      GENERIC (
         --------------------------------------------------------------------------------
         -- Parameter declarations
         --------------------------------------------------------------------------------
         FAMILY                         :  integer := 19;    
	 LOOPBACK                       :  integer := 0;    
         TRANSFER_SPEED                 :  integer := 1;    --  0 - 10Mbp/s, 1 - 100Mbps 
         TRANSFER_TYPE                 :  integer := 1);    --  0 - 10Mbp/s, 1 - 100Mbps 
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
   END COMPONENT;

   CONSTANT xhdl_timescale         : time := 1 ns;

   CONSTANT  TX                    :  integer := 0;    --  1 - TX mode, 0 - non-TXmode
   CONSTANT  RX_FALSE_CARRIER      :  integer := 1;    --  1 - RX mode + False Carrier Error Injection, 0 - Error-free RXmode
   CONSTANT  TXCLK_PERIOD_100      :  integer := 20;    
   CONSTANT  RXCLK_PERIOD_100      :  integer := 20;    
   CONSTANT  REFCLK_PERIOD_100     :  integer := 10;    
   CONSTANT  TXCLK_PERIOD_10       :  integer := 200;    
   CONSTANT  RXCLK_PERIOD_10       :  integer := 200;    
   CONSTANT  REFCLK_PERIOD_10      :  integer := 100;    
   CONSTANT  INTERFRAMEGAP_PERIOD  :  integer := 96;    
   CONSTANT  FRAME_LENGTH          :  integer := 127;    
   CONSTANT  PAYLOAD_LENGTH        :  integer := 46;    
   CONSTANT  DBG                   :  integer := 0;    

   TYPE xhdl_1 IS ARRAY (0 TO 1000) OF std_logic_vector(3 DOWNTO 0);
   TYPE xhdl_2 IS ARRAY (0 TO 1000) OF std_logic_vector(1 DOWNTO 0);
   TYPE xhdl_3 IS ARRAY (0 TO 11) OF std_logic_vector(8 * 79 DOWNTO 1);

   -- Global signals
   SIGNAL TXCLK                    :  std_logic;   
   SIGNAL RXCLK                    :  std_logic;   
   SIGNAL REFCLK                   :  std_logic;   
   SIGNAL TXCLK_100                :  std_logic;   
   SIGNAL RXCLK_100                :  std_logic;   
   SIGNAL REFCLK_100               :  std_logic;   
   SIGNAL TXCLK_10                 :  std_logic;   
   SIGNAL RXCLK_10                 :  std_logic;   
   SIGNAL REFCLK_10                :  std_logic;   
   SIGNAL RSTN                     :  std_logic;   

   SIGNAL mac_txen                 :  std_logic;   
   SIGNAL mac_txd                  :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL tb_phy_rxd               :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL tb_phy_crsdv             :  std_logic;

   SIGNAL txd_phy                  :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL rxd_mac                  :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL tb_crsdv                 :  std_logic;   
   SIGNAL tb_crsdv_in              :  std_logic;   
   SIGNAL tb_rxd                   :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL phy_crsdv                :  std_logic;   
   SIGNAL tb_sfd_en                :  std_logic;   
   SIGNAL frame_done               :  std_logic;   
   SIGNAL ign                      :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL tb_txen                  :  std_logic;   
   SIGNAL tb_txdata                :  std_logic_vector(3 DOWNTO 0);   
   SIGNAL tb_rxdata                :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL tb_rxerr                 :  std_logic;   
   SIGNAL tx_en                    :  std_logic;   
   SIGNAL rx_en                    :  std_logic;   
   SIGNAL tb_sfd_txen              :  std_logic;   
   SIGNAL fwd_tx_en                :  std_logic;   
   SIGNAL fwd_tx_en1               :  std_logic;   
   SIGNAL fwd_tx_en2               :  std_logic;   
   SIGNAL fwd_tx_en3               :  std_logic;   
   SIGNAL fwd_tx_en4               :  std_logic;   
   SIGNAL fwd_rx_en               :  std_logic;   
   SIGNAL fwd_rx_en1               :  std_logic;   
   SIGNAL fwd_rx_en2               :  std_logic;   
   SIGNAL mem_mii_tx               :  xhdl_1;   
   SIGNAL mem_mii_txrx             :  xhdl_1;   
   SIGNAL mem_mii_rx               :  xhdl_1;   
   SIGNAL mem_rmii_rx              :  xhdl_2;   
   SIGNAL mem_rmii_tx              :  xhdl_2;   
   SIGNAL i                        :  integer := 0;   
   SIGNAL j                        :  integer := 0;   
   SIGNAL k                        :  integer := 0;   
   SIGNAL l                        :  integer := 0;   
   SIGNAL t                        :  integer := 0;
   SIGNAL s                        :  integer := 0;   
 
   SIGNAL error_cnt                :  integer;   
   --VARIABLE total_error_cnt_xhdl51 :  integer;
   SIGNAL total_error_cnt          :  integer;   
  
   SIGNAL tb_crsdv_loopback        :  std_logic;   
   SIGNAL temp_xhdl25              :  std_logic;   
   SIGNAL temp_xhdl26              :  std_logic;   
   SIGNAL temp_xhdl27              :  std_logic;   
   SIGNAL temp_xhdl37              :  std_logic;   
   SIGNAL temp_xhdl38              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL temp_xhdl39              :  std_logic_vector(1 DOWNTO 0);   
   SIGNAL col_mac                  :  std_logic;   
   SIGNAL crs_mac                  :  std_logic;   
   SIGNAL rxdv_mac                 :  std_logic;   
   SIGNAL rxerr_mac                :  std_logic;   
   SIGNAL txen_phy                 :  std_logic;   
   SIGNAL END_OF_SIMULATION        : boolean:=FALSE;


BEGIN

   ----------------------------------------------------------------------------//
   -- Initialize signals
   ----------------------------------------------------------------------------//
   
   PROCESS
      VARIABLE xhdl_initial : BOOLEAN := TRUE;
      VARIABLE TXCLK_100_xhdl12  : std_logic;
      VARIABLE RXCLK_100_xhdl13  : std_logic;
      VARIABLE REFCLK_100_xhdl14  : std_logic;
      VARIABLE TXCLK_10_xhdl15  : std_logic;
      VARIABLE RXCLK_10_xhdl16  : std_logic;
      VARIABLE REFCLK_10_xhdl17  : std_logic;

   BEGIN

      IF (xhdl_initial) THEN
 	 
         WRITE("\n############################################################################# \n" );   
         WRITE("\n(c) Copyright 2013 Microsemi Corporation. All rights reserved.");   
         WRITE("User Testbench for: CoreRMII\n");   
         WRITE("Version: 2.0 April 2013\n");   
         WRITE("\n############################################################################# \n" );   

         xhdl_initial := FALSE;
      ELSE
         WAIT;
      END IF;
   END PROCESS;

   ----------------------------------------------------------------------------//
   -- Clock generation
   ----------------------------------------------------------------------------//
   PROCESS
   BEGIN
      REFCLK_100 <= '0';
      WAIT FOR to_time(REFCLK_PERIOD_100);
      REFCLK_100 <= '1';    
      WAIT FOR to_time(REFCLK_PERIOD_100);
      IF(END_OF_SIMULATION) THEN
           WAIT;
      END IF;
   END PROCESS;
   PROCESS
   BEGIN
      REFCLK_10 <= '0';
      WAIT FOR to_time(REFCLK_PERIOD_10);
      REFCLK_10 <= '1';    
      WAIT FOR to_time(REFCLK_PERIOD_10);
      IF(END_OF_SIMULATION) THEN
           WAIT;
      END IF;
   END PROCESS;

   PROCESS
   BEGIN
      RXCLK_100 <= '0';
      WAIT FOR to_time(RXCLK_PERIOD_100);
      RXCLK_100 <= '1';    
      WAIT FOR to_time(RXCLK_PERIOD_100);
      IF(END_OF_SIMULATION) THEN
           WAIT;
      END IF;
   END PROCESS;
   PROCESS
   BEGIN
      RXCLK_10 <= '0';
      WAIT FOR to_time(RXCLK_PERIOD_10);
      RXCLK_10 <= '1';    
      WAIT FOR to_time(RXCLK_PERIOD_10);
      IF(END_OF_SIMULATION) THEN
           WAIT;
      END IF;
   END PROCESS;

   PROCESS
   BEGIN
      TXCLK_100 <= '0';
      WAIT FOR to_time(TXCLK_PERIOD_100);
      TXCLK_100 <= '1';    
      WAIT FOR to_time(TXCLK_PERIOD_100);
      IF(END_OF_SIMULATION) THEN
           WAIT;
      END IF;
   END PROCESS;
   PROCESS
   BEGIN
      TXCLK_10 <= '0';
      WAIT FOR to_time(TXCLK_PERIOD_10);
      TXCLK_10 <= '1';    
      WAIT FOR to_time(TXCLK_PERIOD_10);
      IF(END_OF_SIMULATION) THEN
           WAIT;
      END IF;
   END PROCESS;
   

   temp_xhdl25 <= TXCLK_100 WHEN TRANSFER_SPEED = 1 ELSE TXCLK_10;
   TXCLK <= temp_xhdl25 ;
   temp_xhdl26 <= RXCLK_100 WHEN TRANSFER_SPEED = 1 ELSE RXCLK_10;
   RXCLK <= temp_xhdl26 ;
   temp_xhdl27 <= REFCLK_100 WHEN TRANSFER_SPEED = 1 ELSE REFCLK_10;
   REFCLK <= temp_xhdl27 ;

   ----------------------------------------------------------------------------//
   -- Drive transmit frames
   ----------------------------------------------------------------------------//
   
   PROCESS
      VARIABLE xhdl_initial : BOOLEAN := TRUE;

      VARIABLE RSTN_xhdl28  : std_logic;

      VARIABLE drive_sfd_negedge_xhdl31  : std_logic;
      VARIABLE rx_elastic_nibble_en_xhdl32  : std_logic;
      VARIABLE fwd_loopback_en_xhdl33  : std_logic;
   BEGIN
      IF (xhdl_initial) THEN
         --flush;   
              mac_txd  <= "0000";    
              mac_txen <='0';    
              tb_phy_crsdv <= '0';    
              tb_phy_rxd   <= "00";    
              phy_crsdv <= '0';    
              tb_sfd_en <= '0';    
              tb_rxerr  <= '0';    
              tb_sfd_txen <= '0';    
              fwd_tx_en <= '0';
              frame_done <= '0';

	      -- RESET

               RSTN <= '0';    
               FOR X IN 1 TO 10 LOOP
                WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');             
               END LOOP;
               RSTN <= '1';   

              total_error_cnt <= 0;    
              error_cnt <= 0;

         FOR X IN 1 TO 5 LOOP
            WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
            
         END LOOP;
         RSTN <= '1';    
         FOR X IN 1 TO 1 LOOP
            FOR X IN 1 TO 10 LOOP
               WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
               
            END LOOP;
            frame_done <= '0';    
            WRITE("/////////////////////////////////////////////////////\n");   
            WRITE("// Testcase 1: Transmit Frame on the MII interface //\n");   
            WRITE("// Transmit Frame on the MII interface             //\n");   
            WRITE("/////////////////////////////////////////////////////\n");   

            --transmit;   --  TX
           --build_ethernet_frame(mac_txd, mac_txen);   --  Tx Frame 
           -- Preamble
           FOR X IN 1 TO 7 LOOP
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           fwd_tx_en <= '1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <= "0101";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0101";    
           mac_txen  <='1';
           END LOOP;
           --
           -- sfd
           tb_sfd_txen <= '1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0101";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1101";    
           mac_txen  <='1';      

           --
           -- mac dst
           FOR X IN 1 TO 6 LOOP
              --build_mac_dest_octet;   
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1011";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1101";    
           mac_txen  <='1';
           --

           END LOOP;
           --
           -- mac src
           FOR X IN 1 TO 6 LOOP
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1100";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1001";    
           mac_txen  <='1';    
           END LOOP;
           --
           -- ethertype
           FOR X IN 1 TO 2 LOOP
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0011";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0111";    
           mac_txen  <='1';   

           END LOOP;

           --
           -- data payload
            FOR X IN 1 TO PAYLOAD_LENGTH LOOP
             -- build_datapayload_octet;   

           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0011";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0101";    
           mac_txen  <='1'; 

           END LOOP;

           --
           -- CRC
          FOR X IN 1 TO 4 LOOP

           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1111";    
           mac_txen  <='1';    
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="1111";    
           mac_txen  <='1';    


           END LOOP;

           --


           IF (DBG /= 0) THEN
              WRITE("TIME = " & to_string(NOW) & " CRC END ***************************\n");   
           END IF;
           WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
           
           mac_txd  <="0000";    
           mac_txen  <='0';    
           IF (DBG /= 0) THEN
             -- WRITE("TIME = " & to_string(NOW) & " mac_txd = " & to_decstring(mac_txd) & "\n");   
           END IF;
      ------------

      IF (DBG /= 0) THEN
         WRITE("TIME = " & to_string(NOW) & " InterFrame Gap Start ***************************\n");   
      END IF;
      FOR X IN 1 TO INTERFRAMEGAP_PERIOD - 1 LOOP
         --build_interframegap;   
      WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');

      END LOOP;


            --

            --flush;   
              mac_txd  <= "0000";    
              mac_txen <='0';    
              tb_phy_crsdv <= '0';    
              tb_phy_rxd   <= "00";    
              phy_crsdv <= '0';    
              tb_sfd_en <= '0';    
              tb_rxerr  <= '0';    
              tb_sfd_txen <= '0';    
              fwd_tx_en <= '0';    
            --

            frame_done <= '1';    
            fwd_tx_en <= '0';    

            --compare_miitx_rmiitx;   
              IF (DBG /= 0) THEN
                 WRITE("Compare MII TXD data <--> RMII TXD data\n");   
              END IF;
              FOR k IN 0 TO (FRAME_LENGTH + 23) LOOP
  	      IF (frame_done = '1') THEN 
                 IF ((mem_mii_tx(k) = mem_rmii_tx(2 * k + 1) & mem_rmii_tx(2 * k))) THEN
                    IF (DBG /= 0) THEN
                       WRITE("MII TX data matches RMII TX data\n");   
                       WRITE("k = " & to_decstring(k) & ", Actual MII transmitted data on TXD = " & to_decstring(mem_mii_tx(k)) & ", Received data on RMII TXD line = " & to_decstring(mem_rmii_tx(2 * k + 1) & mem_rmii_tx(2 * k)) & "\n");   
                    END IF;
                    WAIT UNTIL (RXCLK'EVENT AND RXCLK = '1');
                    
                 ELSE
                    IF (DBG /= 0) THEN
                       WRITE("MISMATCH::MII TX data does NOT match RMII TX data!!\n");  
                       WRITE("k = " & to_decstring(k) & ", Actual MII transmitted data on TXD = " & to_decstring(mem_mii_tx(k)) & ", Received data on RMII TXD line = " & to_decstring(mem_rmii_tx(2 * k + 1) &  mem_rmii_tx(2 * k)) & "\n");   
                    END IF;
                    error_cnt <= error_cnt + 1;    
                    IF (DBG /= 0) THEN
                       WRITE("error count = " & to_decstring(error_cnt) & "\n");   
                    END IF;
                    WAIT UNTIL (RXCLK'EVENT AND RXCLK = '1');
                    
                 END IF;
              END IF;
              END LOOP;
            --


            IF (error_cnt = 0) THEN
               WRITE("---------------- " );   
               WRITE("Test 1 Passed ");   
               WRITE("---------------- " );   
            ELSE
               WRITE("---------------- " );   
               WRITE("Test 1 Failed\n");   
               WRITE("---------------- " );   
            END IF;
            --flush_cntr;   
              total_error_cnt <= total_error_cnt + error_cnt;    
              error_cnt <= 0;
            --

            frame_done <= '0';    
         END LOOP;
         -- Reset
         --reset_assert_deassert;   
          FOR X IN 1 TO 10 LOOP
             WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
             
          END LOOP;
          RSTN <= '0';    
          FOR X IN 1 TO 10 LOOP
             WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
             
          END LOOP;
          RSTN <= '1';   
         --

         WRITE("/////////////////////////////////////////////////////\n");   
         WRITE("// Testcase 2: Receive Frame on the RMII interface//\n");   
         WRITE("// Receive Frame on the RMII interface             //\n");   
         WRITE("/////////////////////////////////////////////////////\n");   
         --receive;   --  RX
         --build_ethernet_frame_rx(tb_phy_rxd, tb_phy_crsdv);   --  Rx Frame 
         phy_crsdv <= '1';  

         -- Preamble
         FOR X IN 1 TO 7 LOOP
         --   build_preamble_octet_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';  
         END LOOP;
         --
         -- SFD
        -- build_sfd_octet_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_sfd_en <= '1';    
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "11";    
         tb_phy_crsdv <= '1';
         --
         -- MAC DST
         FOR X IN 1 TO 6 LOOP
          --  build_mac_dest_octet_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "10";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "00";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "00";    
         tb_phy_crsdv <= '1';  

         END LOOP;

         --
         -- MAC SRC
         FOR X IN 1 TO 6 LOOP
          --  build_mac_src_octet_rx;  
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "11";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "10";    
         tb_phy_crsdv <= '1';    
         END LOOP;

         --
         -- Ethertype
         FOR X IN 1 TO 2 LOOP
           -- build_ethertype_octet_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "10";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "10";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1'; 

         END LOOP;
         --
         -- Payload
         FOR X IN 1 TO PAYLOAD_LENGTH LOOP
           -- build_datapayload_octet_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "01";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "10";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "11";    
         tb_phy_crsdv <= '1'; 

         END LOOP;

         --
         -- CRC
         IF (DBG /= 0) THEN
            WRITE("TIME = " & to_string(NOW) & ", CRC field start******************************\n");   
         END IF;
         FOR X IN 1 TO 4 LOOP
           -- build_CRC_wo_elasticnibbles_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "11";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "00";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "11";    
         tb_phy_crsdv <= '1';    
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         tb_phy_rxd <= "00";    
         tb_phy_crsdv <= '1';  
         --
         END LOOP;

         --


         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         
         IF (DBG /= 0) THEN
            WRITE("TIME = " & to_string(NOW) & " CRC END ***************************\n");   
         END IF;
         phy_crsdv <= '0';    
         tb_phy_rxd <= "00";    
         tb_phy_crsdv <= '0';    
         IF (DBG /= 0) THEN
    --        WRITE("TIME = " & to_string(NOW) & " tb_phy_rxd = " & to_decstring(tb_phy_rxd) & ", tb_phy_crsdv = " & to_decstring(tb_phy_crsdv) & "\n");   
         END IF;

         -- 
         IF (DBG /= 0) THEN
            WRITE("TIME = " & to_string(NOW) & " InterFrame Gap Start ***************************\n");   
         END IF;
         FOR X IN 1 TO INTERFRAMEGAP_PERIOD LOOP
            --build_interframegap_rx;   
         WAIT UNTIL (REFCLK'EVENT AND REFCLK = '1');
         END LOOP;


         --

         frame_done <= '1';    
         --flush;

         -- Compare RMII RXD <-> MII RXD
         -- compare_rmiirx_miirx;   
          IF (DBG /= 0) THEN
             WRITE("Compare RMII RXD data <--> MII RXD data\n");   
          END IF;
          FOR k IN 0 TO (FRAME_LENGTH - 1) LOOP
  	     IF (frame_done = '1') THEN 
             IF ((mem_mii_rx(k) = mem_rmii_rx(2 * k + 1) & mem_rmii_rx(2 * k))) THEN
                IF (DBG /= 0) THEN
                   WRITE("RMII RX data matches MII RX data\n");   
                   WRITE("TIME = " & to_string(NOW) & ", k = " & to_decstring(k) & ", Actual RMII transmitted data on RXD = " & to_decstring(mem_mii_rx(k)) & ", Received data on MII RXD line = " & to_decstring(mem_rmii_rx(2 * k + 1) & mem_rmii_rx(2 * k)) & "\n");   
                END IF;
                WAIT UNTIL (RXCLK'EVENT AND RXCLK = '1');
                
             ELSE
                IF (DBG /= 0) THEN
                   WRITE("MISMATCH::RMII RX data does NOT match MII RX data!!\n");  
                   WRITE("TIME = " & to_string(NOW) & ", k = " & to_decstring(k) & ", Actual RMII transmitted data on RXD = " & to_decstring(mem_mii_rx(k)) & ", Received data on MII RXD line = " & to_decstring(mem_rmii_rx(2 * k + 1) & mem_rmii_rx(2 * k)) & "\n");   
                END IF;
                error_cnt <= error_cnt + 1;    
                IF (DBG /= 0) THEN
                   WRITE("error count = " & to_decstring(error_cnt) & "\n");   
                END IF;
                WAIT UNTIL (RXCLK'EVENT AND RXCLK = '1');
                
             END IF;
             END IF;
          END LOOP;

         -- 


         IF (error_cnt = 0) THEN
            WRITE("---------------- " );   
            WRITE("Test 2 Passed");   
            WRITE("---------------- " );   
         ELSE
            WRITE("---------------- " );   
            WRITE("Test 2 Failed");   
            WRITE("---------------- " );   
         END IF;
         --flush_cntr;   
 
              total_error_cnt <= total_error_cnt + error_cnt;    
              error_cnt <= 0;

         --

         
	 -- Reset
         --reset_assert_deassert;   
          FOR X IN 1 TO 10 LOOP
             WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
             
          END LOOP;
          RSTN <= '0';    
          FOR X IN 1 TO 10 LOOP
             WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
             
          END LOOP;
          RSTN <= '1';   
         -- 

         FOR X IN 1 TO 10 LOOP
            WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
            
         END LOOP;
         frame_done <= '0';    

         -- Reset     
         --reset_assert_deassert;   
          FOR X IN 1 TO 10 LOOP
             WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
             
          END LOOP;
          RSTN <= '0';    
          FOR X IN 1 TO 10 LOOP
             WAIT UNTIL (TXCLK'EVENT AND TXCLK = '1');
             
          END LOOP;
          RSTN <= '1';   
         --

         -- Display simulation status         
         --display_status;   
          IF (total_error_cnt = 0) THEN
             WRITE("################### " );   
             WRITE("All Tests Passed !!");   
             WRITE("################### " );   
          ELSE
             WRITE("Tests Failed !!");   
          END IF;
         --


         END_OF_SIMULATION <= TRUE;  

         WAIT FOR 400 * xhdl_timescale;
         --ASSERT (FALSE) REPORT "'$finish' Encountered" SEVERITY FAILURE;   

         xhdl_initial := FALSE;
      ELSE
         WAIT;
      END IF;
   END PROCESS;
   
   ----------------------------------------------------------------------------//
   -- DUT instance
   ----------------------------------------------------------------------------//
   RMII_0 : M2S010_Ethernet_CORERMII_0_CORERMII 
      GENERIC MAP (
         FAMILY         => FAMILY,
         TRANSFER_SPEED => TRANSFER_SPEED,
         TRANSFER_TYPE  => 1,
	 LOOPBACK       => 0)
      PORT MAP (
         TXCLKM => TXCLK_100,
         RXCLKM => RXCLK_100,
         REFCLK => REFCLK_100,
         RSTN => RSTN,
         MII_TXD => mac_txd,
         MII_TXEN => mac_txen,
         MII_RXD => rxd_mac,
         MII_RXDV => rxdv_mac,
         MII_RXERR => rxerr_mac,
         MII_COL => col_mac,
         MII_CRS => crs_mac,
         RMII_TXD => txd_phy,
         RMII_TXEN => txen_phy,
         RMII_RXD => tb_rxd,
         RMII_CRSDV => tb_crsdv,
         RMII_RXERR => tb_rxerr);   
   

   
   PROCESS (RXCLK, RSTN)
   BEGIN
      IF (NOT RSTN = '1') THEN
         fwd_tx_en1 <= '0';    
         fwd_tx_en2 <= '0';    
         fwd_tx_en3 <= '0';    
         fwd_tx_en4 <= '0';    
      ELSIF (RXCLK'EVENT AND RXCLK = '1') THEN
         fwd_tx_en1 <= fwd_tx_en;    
         fwd_tx_en2 <= fwd_tx_en1;    
         fwd_tx_en3 <= fwd_tx_en2;    
         fwd_tx_en4 <= fwd_tx_en3;    
      END IF;
   END PROCESS;
   temp_xhdl37 <= (tb_phy_crsdv AND phy_crsdv);
   tb_crsdv <= temp_xhdl37 ;
   temp_xhdl38 <= tb_phy_rxd;
   temp_xhdl39 <= (temp_xhdl38);
   tb_rxd <= temp_xhdl39 ;
   tb_crsdv_in <= tb_crsdv ;





   PROCESS (TXCLK)
      VARIABLE mem_mii_tx_xhdl40  : xhdl_1;
   BEGIN
      IF (TXCLK'EVENT AND TXCLK = '1') THEN
         IF (i < FRAME_LENGTH + 24) THEN
            -- Used for Forward path comparison, store the entire frame starting from Preamble
            
            IF (fwd_tx_en = '1') THEN
               mem_mii_tx_xhdl40(i) := mac_txd;    
               IF (DBG /= 0) THEN
                  WRITE("TIME=" & to_string(NOW) & ",   i=" & to_decstring(i) & 
                  " , MAC Transmit data on TXD line = " & to_decstring(mac_txd) 
                  & "\n");   
                  WRITE("TIME=" & to_string(NOW) & ",   mem_mii_tx[" &  to_decstring(i) & "] = " & to_decstring(mem_mii_tx_xhdl40(i)) 
                  & "\n");   
               END IF;
               i <= i + 1;    
            ELSE
               i <= 0;
            END IF;	    
         END IF;
      END IF;
      mem_mii_tx <= mem_mii_tx_xhdl40;
   END PROCESS;

   -- Used for MII RX. Used to store the entire RX frame received on MII starting from SFD
   
   PROCESS (RXCLK)
      VARIABLE mem_mii_rx_xhdl44  : xhdl_1;
   BEGIN
      IF (RXCLK'EVENT AND RXCLK = '1') THEN
         IF (j < (FRAME_LENGTH + 4)) THEN
            IF (rxdv_mac = '1') THEN
               IF (DBG /= 0) THEN
                  WRITE("TIME=" & to_string(NOW) & ",   j=" & to_decstring(j) & 
                  " , MAC Received data on RXD line = " & to_decstring(rxd_mac) 
                  & "\n");   
               END IF;
               mem_mii_rx_xhdl44(j) := rxd_mac;    
               j <= j + 1;    
            ELSE
               j <= 0;
            END IF;
         END IF;
      END IF;
      mem_mii_rx <= mem_mii_rx_xhdl44;
   END PROCESS;

   -- Used for RMII RX. Used to store the entire frame sent on RMII starting from SFD
   
   PROCESS (REFCLK)
      VARIABLE mem_rmii_rx_xhdl46  : xhdl_2;
   BEGIN
      IF (REFCLK'EVENT AND REFCLK = '1') THEN
         IF (tb_sfd_en = '1') THEN
            IF (s < 2 * FRAME_LENGTH) THEN
               mem_rmii_rx_xhdl46(s) := tb_rxd;    
               IF (DBG /= 0) THEN
                  WRITE("TIME=" & to_string(NOW) & ",   s=" & to_decstring(s) & 
                  " ,  PHY Transmit data on RXD line = " & to_decstring(tb_rxd) 
                  & "\n");   
                  WRITE("TIME=" & to_string(NOW) & ",   mem_rmii_rx[" & 
                  to_decstring(s) & "] = " & to_decstring(mem_rmii_rx_xhdl46(s))
                  & "\n");   
               END IF;
               s <= s + 1;    
            END IF;
         ELSE
             s <= 0;
         END IF;
      END IF;
      mem_rmii_rx <= mem_rmii_rx_xhdl46;
   END PROCESS;

   -- Used for RMII TX. Used to store the entire frame received on RMII
   

   PROCESS (REFCLK)
      VARIABLE mem_rmii_tx_xhdl48  : xhdl_2;
   BEGIN
      IF (REFCLK'EVENT AND REFCLK = '1') THEN
         IF (t < (2 * FRAME_LENGTH + 48)) THEN
            IF (txen_phy = '1') THEN
               mem_rmii_tx_xhdl48(t) := txd_phy;    
               IF (DBG /= 0) THEN
                  WRITE("TIME=" & to_string(NOW) & ",   t=" & to_decstring(t) & 
                  " , RMII Transmit data on TXD line = " & to_decstring(txd_phy)
                  & "\n");   
                  WRITE("TIME=" & to_string(NOW) & ",   mem_rmii_tx[" & 
                  to_decstring(t) & "] = " & to_decstring(mem_rmii_tx_xhdl48(t))
                  & "\n");   
               END IF;
               t <= t + 1;    
            END IF;
         ELSE
             t <= 0;
         END IF;
      END IF;
      mem_rmii_tx <= mem_rmii_tx_xhdl48;
   END PROCESS;


END ARCHITECTURE translated;
