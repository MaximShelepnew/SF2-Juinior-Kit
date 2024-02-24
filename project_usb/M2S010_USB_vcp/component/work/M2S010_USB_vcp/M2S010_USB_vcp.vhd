----------------------------------------------------------------------
-- Created by SmartDesign Tue Jul 04 12:36:47 2017
-- Version: v11.8 11.8.0.26
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library smartfusion2;
use smartfusion2.all;
----------------------------------------------------------------------
-- M2S010_USB_vcp entity declaration
----------------------------------------------------------------------
entity M2S010_USB_vcp is
    -- Port list
    port(
        -- Inputs
        BtnReset         : in    std_logic;
        DEVRST_N         : in    std_logic;
        MMUART_0_RXD_F2M : in    std_logic;
        USB_ULPI_DIR     : in    std_logic;
        USB_ULPI_NXT     : in    std_logic;
        USB_ULPI_XCLK    : in    std_logic;
        -- Outputs
        MMUART_0_TXD_M2F : out   std_logic;
        USB_ULPI_STP     : out   std_logic;
        -- Inouts
        USB_ULPI_DATA    : inout std_logic_vector(7 downto 0)
        );
end M2S010_USB_vcp;
----------------------------------------------------------------------
-- M2S010_USB_vcp architecture body
----------------------------------------------------------------------
architecture RTL of M2S010_USB_vcp is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- AND2
component AND2
    -- Port list
    port(
        -- Inputs
        A : in  std_logic;
        B : in  std_logic;
        -- Outputs
        Y : out std_logic
        );
end component;
-- M2S010_USB_vcp_MSS
component M2S010_USB_vcp_MSS
    -- Port list
    port(
        -- Inputs
        M3_RESET_N       : in    std_logic;
        MCCC_CLK_BASE    : in    std_logic;
        MMUART_0_RXD_F2M : in    std_logic;
        MSS_RESET_N_F2M  : in    std_logic;
        USB_ULPI_DIR     : in    std_logic;
        USB_ULPI_NXT     : in    std_logic;
        USB_ULPI_XCLK    : in    std_logic;
        -- Outputs
        MMUART_0_TXD_M2F : out   std_logic;
        USB_ULPI_STP     : out   std_logic;
        -- Inouts
        USB_ULPI_DATA    : inout std_logic_vector(7 downto 0)
        );
end component;
-- M2S010_USB_vcp_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component M2S010_USB_vcp_OSC_0_OSC
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
signal AND2_0_Y                    : std_logic;
signal MMUART_0_TXD_M2F_net_0      : std_logic;
signal OSC_0_RCOSC_25_50MHZ_O2F    : std_logic;
signal SYSRESET_0_POWER_ON_RESET_N : std_logic;
signal USB_ULPI_STP_net_0          : std_logic;
signal USB_ULPI_STP_net_1          : std_logic;
signal MMUART_0_TXD_M2F_net_1      : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                     : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net <= '0';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 USB_ULPI_STP_net_1     <= USB_ULPI_STP_net_0;
 USB_ULPI_STP           <= USB_ULPI_STP_net_1;
 MMUART_0_TXD_M2F_net_1 <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F       <= MMUART_0_TXD_M2F_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- AND2_0
AND2_0 : AND2
    port map( 
        -- Inputs
        A => BtnReset,
        B => SYSRESET_0_POWER_ON_RESET_N,
        -- Outputs
        Y => AND2_0_Y 
        );
-- M2S010_USB_vcp_MSS_0
M2S010_USB_vcp_MSS_0 : M2S010_USB_vcp_MSS
    port map( 
        -- Inputs
        MCCC_CLK_BASE    => OSC_0_RCOSC_25_50MHZ_O2F,
        USB_ULPI_DIR     => USB_ULPI_DIR,
        USB_ULPI_NXT     => USB_ULPI_NXT,
        USB_ULPI_XCLK    => USB_ULPI_XCLK,
        MMUART_0_RXD_F2M => MMUART_0_RXD_F2M,
        MSS_RESET_N_F2M  => AND2_0_Y,
        M3_RESET_N       => AND2_0_Y,
        -- Outputs
        USB_ULPI_STP     => USB_ULPI_STP_net_0,
        MMUART_0_TXD_M2F => MMUART_0_TXD_M2F_net_0,
        -- Inouts
        USB_ULPI_DATA    => USB_ULPI_DATA 
        );
-- OSC_0   -   Actel:SgCore:OSC:2.0.101
OSC_0 : M2S010_USB_vcp_OSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => OPEN,
        RCOSC_25_50MHZ_O2F => OSC_0_RCOSC_25_50MHZ_O2F,
        RCOSC_1MHZ_CCC     => OPEN,
        RCOSC_1MHZ_O2F     => OPEN,
        XTLOSC_CCC         => OPEN,
        XTLOSC_O2F         => OPEN 
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
