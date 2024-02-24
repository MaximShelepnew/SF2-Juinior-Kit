----------------------------------------------------------------------
-- Created by SmartDesign Fri Jun 23 14:11:03 2017
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
-- M2S010_I2C_UART entity declaration
----------------------------------------------------------------------
entity M2S010_I2C_UART is
    -- Port list
    port(
        -- Inputs
        BtnReset         : in    std_logic;
        DEVRST_N         : in    std_logic;
        MMUART_0_RXD_F2M : in    std_logic;
        -- Outputs
        MMUART_0_TXD_M2F : out   std_logic;
        -- Inouts
        SCL              : inout std_logic;
        SDA              : inout std_logic
        );
end M2S010_I2C_UART;
----------------------------------------------------------------------
-- M2S010_I2C_UART architecture body
----------------------------------------------------------------------
architecture RTL of M2S010_I2C_UART is
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
-- M2S010_I2C_UART_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
component M2S010_I2C_UART_FCCC_0_FCCC
    -- Port list
    port(
        -- Inputs
        RCOSC_25_50MHZ : in  std_logic;
        -- Outputs
        GL0            : out std_logic;
        LOCK           : out std_logic
        );
end component;
-- M2S010_I2C_UART_MSS
component M2S010_I2C_UART_MSS
    -- Port list
    port(
        -- Inputs
        I2C_0_SCL_F2M    : in  std_logic;
        I2C_0_SDA_F2M    : in  std_logic;
        M3_RESET_N       : in  std_logic;
        MCCC_CLK_BASE    : in  std_logic;
        MMUART_0_RXD_F2M : in  std_logic;
        MSS_RESET_N_F2M  : in  std_logic;
        -- Outputs
        I2C_0_SCL_M2F    : out std_logic;
        I2C_0_SCL_M2F_OE : out std_logic;
        I2C_0_SDA_M2F    : out std_logic;
        I2C_0_SDA_M2F_OE : out std_logic;
        MMUART_0_TXD_M2F : out std_logic
        );
end component;
-- M2S010_I2C_UART_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
component M2S010_I2C_UART_OSC_0_OSC
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
signal AND3_0_Y                                        : std_logic;
signal BIBUF_0_Y                                       : std_logic;
signal BIBUF_1_Y                                       : std_logic;
signal FCCC_0_GL0                                      : std_logic;
signal FCCC_0_LOCK                                     : std_logic;
signal M2S010_I2C_UART_MSS_0_I2C_0_SCL_M2F             : std_logic;
signal M2S010_I2C_UART_MSS_0_I2C_0_SCL_M2F_OE          : std_logic;
signal M2S010_I2C_UART_MSS_0_I2C_0_SDA_M2F             : std_logic;
signal M2S010_I2C_UART_MSS_0_I2C_0_SDA_M2F_OE          : std_logic;
signal MMUART_0_TXD_M2F_net_0                          : std_logic;
signal OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC : std_logic;
signal SYSRESET_0_POWER_ON_RESET_N                     : std_logic;
signal MMUART_0_TXD_M2F_net_1                          : std_logic;
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                                         : std_logic;
signal PADDR_const_net_0                               : std_logic_vector(7 downto 2);
signal PWDATA_const_net_0                              : std_logic_vector(7 downto 0);

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
 MMUART_0_TXD_M2F_net_1 <= MMUART_0_TXD_M2F_net_0;
 MMUART_0_TXD_M2F       <= MMUART_0_TXD_M2F_net_1;
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
        D   => M2S010_I2C_UART_MSS_0_I2C_0_SDA_M2F,
        E   => M2S010_I2C_UART_MSS_0_I2C_0_SDA_M2F_OE,
        -- Outputs
        Y   => BIBUF_0_Y,
        -- Inouts
        PAD => SDA 
        );
-- BIBUF_1
BIBUF_1 : BIBUF
    port map( 
        -- Inputs
        D   => M2S010_I2C_UART_MSS_0_I2C_0_SCL_M2F,
        E   => M2S010_I2C_UART_MSS_0_I2C_0_SCL_M2F_OE,
        -- Outputs
        Y   => BIBUF_1_Y,
        -- Inouts
        PAD => SCL 
        );
-- FCCC_0   -   Actel:SgCore:FCCC:2.0.201
FCCC_0 : M2S010_I2C_UART_FCCC_0_FCCC
    port map( 
        -- Inputs
        RCOSC_25_50MHZ => OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        -- Outputs
        GL0            => FCCC_0_GL0,
        LOCK           => FCCC_0_LOCK 
        );
-- M2S010_I2C_UART_MSS_0
M2S010_I2C_UART_MSS_0 : M2S010_I2C_UART_MSS
    port map( 
        -- Inputs
        MCCC_CLK_BASE    => FCCC_0_GL0,
        MMUART_0_RXD_F2M => MMUART_0_RXD_F2M,
        I2C_0_SDA_F2M    => BIBUF_0_Y,
        I2C_0_SCL_F2M    => BIBUF_1_Y,
        MSS_RESET_N_F2M  => AND3_0_Y,
        M3_RESET_N       => AND3_0_Y,
        -- Outputs
        MMUART_0_TXD_M2F => MMUART_0_TXD_M2F_net_0,
        I2C_0_SDA_M2F    => M2S010_I2C_UART_MSS_0_I2C_0_SDA_M2F,
        I2C_0_SDA_M2F_OE => M2S010_I2C_UART_MSS_0_I2C_0_SDA_M2F_OE,
        I2C_0_SCL_M2F    => M2S010_I2C_UART_MSS_0_I2C_0_SCL_M2F,
        I2C_0_SCL_M2F_OE => M2S010_I2C_UART_MSS_0_I2C_0_SCL_M2F_OE 
        );
-- OSC_0   -   Actel:SgCore:OSC:2.0.101
OSC_0 : M2S010_I2C_UART_OSC_0_OSC
    port map( 
        -- Inputs
        XTL                => GND_net, -- tied to '0' from definition
        -- Outputs
        RCOSC_25_50MHZ_CCC => OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC,
        RCOSC_25_50MHZ_O2F => OPEN,
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
