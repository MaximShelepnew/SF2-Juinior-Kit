----------------------------------------------------------------------
-- Created by SmartDesign Tue Oct 24 12:27:50 2017
-- Version: v11.8 SP1 11.8.1.12
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
library CORERMII_LIB;
use CORERMII_LIB.all;
----------------------------------------------------------------------
-- M2S010_Ethernet entity declaration
----------------------------------------------------------------------
entity M2S010_Ethernet is
    -- Port list
    port(
        -- Inputs
        BtnReset         : in    std_logic;
        DEVRST_N         : in    std_logic;
        MMUART_0_RXD_F2M : in    std_logic;
        REFCLK           : in    std_logic;
        RMII_CRSDV       : in    std_logic;
        RMII_RXD         : in    std_logic_vector(1 downto 0);
        RMII_RXERR       : in    std_logic;
        XTL              : in    std_logic;
        -- Outputs
        LED1             : out   std_logic;
        LED2             : out   std_logic;
        LED3             : out   std_logic;
        LED4             : out   std_logic;
        MAC_MII_MDC      : out   std_logic;
        MMUART_0_TXD_M2F : out   std_logic;
        PHY_reset        : out   std_logic;
        RMII_TXD         : out   std_logic_vector(1 downto 0);
        RMII_TXEN        : out   std_logic;
        -- Inouts
        MDIO             : inout std_logic
        );
end M2S010_Ethernet;
----------------------------------------------------------------------
-- M2S010_Ethernet architecture body
----------------------------------------------------------------------
architecture RTL of M2S010_Ethernet is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AND3
component AND3
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        C : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- BIBUF
component BIBUF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        D   : in    std_logic;
        E   : in    std_logic;
        -- Outputs
        Y   : out   std_logic;
        -- Inouts
        PAD : inout std_logic
        );
end component;
-- M2S010_Ethernet_CORERMII_0_CORERMII   -   Actel:DirectCore:CORERMII:2.0.102
component M2S010_Ethernet_CORERMII_0_CORERMII
    generic( 
        FAMILY         : integer := 19 ;
        LOOPBACK       : integer := 0 ;
        TRANSFER_SPEED : integer := 1 ;
        TRANSFER_TYPE  : integer := 1 
        );
    -- Port list
    port(
        -- Inputs
        MII_TXD    : in  std_logic_vector(3 downto 0);
        MII_TXEN   : in  std_logic;
        REFCLK     : in  std_logic;
        RMII_CRSDV : in  std_logic;
        RMII_RXD   : in  std_logic_vector(1 downto 0);
        RMII_RXERR : in  std_logic;
        RSTN       : in  std_logic;
        RXCLKM     : in  std_logic;
        TXCLKM     : in  std_logic;
        -- Outputs
        MII_COL    : out std_logic;
        MII_CRS    : out std_logic;
        MII_RXD    : out std_logic_vector(3 downto 0);
        MII_RXDV   : out std_logic;
        MII_RXERR  : out std_logic;
        RMII_TXD   : out std_logic_vector(1 downto 0);
        RMII_TXEN  : out std_logic
        );
end component;
-- M2S010_Ethernet_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
component M2S010_Ethernet_FCCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        XTLOSC : in  std_logic;
        -- Outputs
        GL0    : out std_logic;
        GL1    : out std_logic;
        LOCK   : out std_logic
        );
end component;
-- M2S010_Ethernet_MSS
component M2S010_Ethernet_MSS
    -- Port list
    port(
        -- Inputs
        M3_RESET_N       : in  std_logic;
        MAC_MII_COL      : in  std_logic;
        MAC_MII_CRS      : in  std_logic;
        MAC_MII_MDI      : in  std_logic;
        MAC_MII_RXD      : in  std_logic_vector(3 downto 0);
        MAC_MII_RX_CLK   : in  std_logic;
        MAC_MII_RX_DV    : in  std_logic;
        MAC_MII_RX_ER    : in  std_logic;
        MAC_MII_TX_CLK   : in  std_logic;
        MCCC_CLK_BASE    : in  std_logic;
        MMUART_0_RXD_F2M : in  std_logic;
        MSS_RESET_N_F2M  : in  std_logic;
        -- Outputs
        GPIO_0_M2F       : out std_logic;
        GPIO_1_M2F       : out std_logic;
        GPIO_2_M2F       : out std_logic;
        GPIO_3_M2F       : out std_logic;
        MAC_MII_MDC      : out std_logic;
        MAC_MII_MDO      : out std_logic;
        MAC_MII_MDO_EN   : out std_logic;
        MAC_MII_TXD      : out std_logic_vector(3 downto 0);
        MAC_MII_TX_EN    : out std_logic;
        MAC_MII_TX_ER    : out std_logic;
        MMUART_0_TXD_M2F : out std_logic
        );
end component;
-- M2S010_Ethernet_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component M2S010_Ethernet_OSC_0_OSC
    -- Port list
    port(
        -- Inputs
        XTL                : in  std_logic;
        -- Outputs
        RCOSC_1MHZ_CCC     : out std_logic;
        RCOSC_1MHZ_O2F     : out std_logic;
        RCOSC_25_50MHZ_CCC : out std_logic;
        RCOSC_25_50MHZ_O2F : out std_logic;
        XTLOSC_CCC         : out std_logic;
        XTLOSC_O2F         : out std_logic
        );
end component;
-- OUTBUF
component OUTBUF
    generic( 
        IOSTD : string := "" 
        );
    -- Port list
    port(
        -- Inputs
        D   : in  std_logic;
        -- Outputs
        PAD : out std_logic
        );
end component;
-- SYSRESET
component SYSRESET
    -- Port list
    port(
        -- Inputs
        DEVRST_N         : in  std_logic;
        -- Outputs
        POWER_ON_RESET_N : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal AND3_0_Y                             : std_logic;
signal BIBUF_0_Y                            : std_logic;
signal CCC_OUT_XTLOSC_CCC                   : std_logic;
signal CORERMII_0_MII_COL                   : std_logic;
signal CORERMII_0_MII_CRS                   : std_logic;
signal CORERMII_0_MII_RXD                   : std_logic_vector(3 downto 0);
signal CORERMII_0_MII_RXDV                  : std_logic;
signal CORERMII_0_MII_RXERR                 : std_logic;
signal FCCC_0_GL0                           : std_logic;
signal FCCC_0_GL1                           : std_logic;
signal FCCC_0_LOCK                          : std_logic;
signal LED1_net_0                           : std_logic;
signal LED2_net_0                           : std_logic;
signal LED3_net_0                           : std_logic;
signal LED4_net_0                           : std_logic;
signal M2S010_Ethernet_MSS_0_MAC_MII_MDO    : std_logic;
signal M2S010_Ethernet_MSS_0_MAC_MII_MDO_EN : std_logic;
signal M2S010_Ethernet_MSS_0_MAC_MII_TX_EN  : std_logic;
signal M2S010_Ethernet_MSS_0_MAC_MII_TXD    : std_logic_vector(3 downto 0);
signal MAC_MII_MDC_net_0                    : std_logic;
signal MMUART_0_TXD_M2F_net_0               : std_logic;
signal PHY_reset_net_0                      : std_logic;
signal RMII_TXD_net_0                       : std_logic_vector(1 downto 0);
signal RMII_TXEN_net_0                      : std_logic;
signal SYSRESET_0_POWER_ON_RESET_N          : std_logic;
signal RMII_TXD_net_1                       : std_logic_vector(1 downto 0);
signal RMII_TXEN_net_1                      : std_logic;
signal PHY_reset_net_1                      : std_logic;
signal MAC_MII_MDC_net_1                    : std_logic;
signal MMUART_0_TXD_M2F_net_1               : std_logic;
signal LED1_net_1                           : std_logic;
signal LED2_net_1                           : std_logic;
signal LED3_net_1                           : std_logic;
signal LED4_net_1                           : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                              : std_logic;
signal PADDR_const_net_0                    : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                   : std_logic_vector(7 downto 0);

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net            <= '0';
 PADDR_const_net_0  <= B"000000";
 PWDATA_const_net_0 <= B"00000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 RMII_TXD_net_1         <= RMII_TXD_net_0;
 RMII_TXD(1 downto 0)   <= RMII_TXD_net_1;
 RMII_TXEN_net_1        <= RMII_TXEN_net_0;
 RMII_TXEN              <= RMII_TXEN_net_1;
 PHY_reset_net_1        <= PHY_reset_net_0;
 PHY_reset              <= PHY_reset_net_1;
 MAC_MII_MDC_net_1      <= MAC_MII_MDC_net_0;
 MAC_MII_MDC            <= MAC_MII_MDC_net_1;
 MMUART_0_TXD_M2F_net_1 <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F       <= MMUART_0_TXD_M2F_net_1;
 LED1_net_1             <= LED1_net_0;
 LED1                   <= LED1_net_1;
 LED2_net_1             <= LED2_net_0;
 LED2                   <= LED2_net_1;
 LED3_net_1             <= LED3_net_0;
 LED3                   <= LED3_net_1;
 LED4_net_1             <= LED4_net_0;
 LED4                   <= LED4_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AND3_0
AND3_0 : AND3
    port map( 
        -- Inputs
        A => FCCC_0_LOCK,
        B => BtnReset,
        C => SYSRESET_0_POWER_ON_RESET_N,
        -- Outputs
        Y => AND3_0_Y 
        );
-- BIBUF_0
BIBUF_0 : BIBUF
    port map( 
        -- Inputs
        D   => M2S010_Ethernet_MSS_0_MAC_MII_MDO,
        E   => M2S010_Ethernet_MSS_0_MAC_MII_MDO_EN,
        -- Outputs
        Y   => BIBUF_0_Y,
        -- Inouts
        PAD => MDIO 
        );
-- CORERMII_0   -   Actel:DirectCore:CORERMII:2.0.102
CORERMII_0 : M2S010_Ethernet_CORERMII_0_CORERMII
    generic map( 
        FAMILY         => ( 19 ),
        LOOPBACK       => ( 0 ),
        TRANSFER_SPEED => ( 1 ),
        TRANSFER_TYPE  => ( 1 )
        )
    port map( 
        -- Inputs
        TXCLKM     => FCCC_0_GL0,
        RXCLKM     => FCCC_0_GL0,
        REFCLK     => REFCLK,
        RSTN       => AND3_0_Y,
        MII_TXEN   => M2S010_Ethernet_MSS_0_MAC_MII_TX_EN,
        RMII_CRSDV => RMII_CRSDV,
        RMII_RXERR => RMII_RXERR,
        MII_TXD    => M2S010_Ethernet_MSS_0_MAC_MII_TXD,
        RMII_RXD   => RMII_RXD,
        -- Outputs
        MII_RXDV   => CORERMII_0_MII_RXDV,
        MII_RXERR  => CORERMII_0_MII_RXERR,
        MII_COL    => CORERMII_0_MII_COL,
        MII_CRS    => CORERMII_0_MII_CRS,
        RMII_TXEN  => RMII_TXEN_net_0,
        MII_RXD    => CORERMII_0_MII_RXD,
        RMII_TXD   => RMII_TXD_net_0 
        );
-- FCCC_0   -   Actel:SgCore:FCCC:2.0.201
FCCC_0 : M2S010_Ethernet_FCCC_0_FCCC
    port map( 
        -- Inputs
        XTLOSC => CCC_OUT_XTLOSC_CCC,
        -- Outputs
        GL0    => FCCC_0_GL0,
        GL1    => FCCC_0_GL1,
        LOCK   => FCCC_0_LOCK 
        );
-- M2S010_Ethernet_MSS_0
M2S010_Ethernet_MSS_0 : M2S010_Ethernet_MSS
    port map( 
        -- Inputs
        MCCC_CLK_BASE    => FCCC_0_GL1,
        MAC_MII_RX_ER    => CORERMII_0_MII_RXERR,
        MAC_MII_RX_DV    => CORERMII_0_MII_RXDV,
        MAC_MII_CRS      => CORERMII_0_MII_CRS,
        MAC_MII_COL      => CORERMII_0_MII_COL,
        MAC_MII_RX_CLK   => FCCC_0_GL0,
        MAC_MII_TX_CLK   => FCCC_0_GL0,
        MMUART_0_RXD_F2M => MMUART_0_RXD_F2M,
        MSS_RESET_N_F2M  => AND3_0_Y,
        M3_RESET_N       => AND3_0_Y,
        MAC_MII_MDI      => BIBUF_0_Y,
        MAC_MII_RXD      => CORERMII_0_MII_RXD,
        -- Outputs
        MAC_MII_TX_EN    => M2S010_Ethernet_MSS_0_MAC_MII_TX_EN,
        MAC_MII_TX_ER    => OPEN,
        MMUART_0_TXD_M2F => MMUART_0_TXD_M2F_net_0,
        GPIO_0_M2F       => LED1_net_0,
        GPIO_1_M2F       => LED2_net_0,
        GPIO_2_M2F       => LED3_net_0,
        GPIO_3_M2F       => LED4_net_0,
        MAC_MII_MDC      => MAC_MII_MDC_net_0,
        MAC_MII_MDO_EN   => M2S010_Ethernet_MSS_0_MAC_MII_MDO_EN,
        MAC_MII_MDO      => M2S010_Ethernet_MSS_0_MAC_MII_MDO,
        MAC_MII_TXD      => M2S010_Ethernet_MSS_0_MAC_MII_TXD 
        );
-- OSC_0   -   Actel:SgCore:OSC:2.0.101
OSC_0 : M2S010_Ethernet_OSC_0_OSC
    port map( 
        -- Inputs
        XTL                => XTL,
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => OPEN,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => CCC_OUT_XTLOSC_CCC,
        XTLOSC_O2F         => OPEN 
        );
-- OUTBUF_0
OUTBUF_0 : OUTBUF
    port map( 
        -- Inputs
        D   => AND3_0_Y,
        -- Outputs
        PAD => PHY_reset_net_0 
        );
-- SYSRESET_0
SYSRESET_0 : SYSRESET
    port map( 
        -- Inputs
        DEVRST_N         => DEVRST_N,
        -- Outputs
        POWER_ON_RESET_N => SYSRESET_0_POWER_ON_RESET_N 
        );

end RTL;
