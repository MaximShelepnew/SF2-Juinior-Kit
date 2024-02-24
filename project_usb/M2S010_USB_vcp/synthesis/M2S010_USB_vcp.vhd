-- Version: v11.8 11.8.0.26

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity M2S010_USB_vcp_MSS is

    port( USB_ULPI_DATA            : inout std_logic_vector(7 downto 0) := (others => 'Z');
          USB_ULPI_XCLK            : in    std_logic;
          USB_ULPI_STP             : out   std_logic;
          USB_ULPI_NXT             : in    std_logic;
          USB_ULPI_DIR             : in    std_logic;
          MMUART_0_TXD_M2F_c       : out   std_logic;
          AND2_0_Y                 : in    std_logic;
          MMUART_0_RXD_F2M_c       : in    std_logic;
          OSC_0_RCOSC_25_50MHZ_O2F : in    std_logic
        );

end M2S010_USB_vcp_MSS;

architecture DEF_ARCH of M2S010_USB_vcp_MSS is 

  component BIBUF
    generic (IOSTD:string := "");

    port( PAD : inout   std_logic;
          D   : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component INBUF
    generic (IOSTD:string := "");

    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component MSS_010

            generic (INIT:std_logic_vector(1437 downto 0) := "00" & x"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"; 
        ACT_UBITS:std_logic_vector(55 downto 0) := x"FFFFFFFFFFFFFF"; 
        MEMORYFILE:string := ""; RTC_MAIN_XTL_FREQ:real := 0.0; 
        RTC_MAIN_XTL_MODE:string := "1"; DDR_CLK_FREQ:real := 0.0
        );

    port( CAN_RXBUS_MGPIO3A_H2F_A                 : out   std_logic;
          CAN_RXBUS_MGPIO3A_H2F_B                 : out   std_logic;
          CAN_TX_EBL_MGPIO4A_H2F_A                : out   std_logic;
          CAN_TX_EBL_MGPIO4A_H2F_B                : out   std_logic;
          CAN_TXBUS_MGPIO2A_H2F_A                 : out   std_logic;
          CAN_TXBUS_MGPIO2A_H2F_B                 : out   std_logic;
          CLK_CONFIG_APB                          : out   std_logic;
          COMMS_INT                               : out   std_logic;
          CONFIG_PRESET_N                         : out   std_logic;
          EDAC_ERROR                              : out   std_logic_vector(7 downto 0);
          F_FM0_RDATA                             : out   std_logic_vector(31 downto 0);
          F_FM0_READYOUT                          : out   std_logic;
          F_FM0_RESP                              : out   std_logic;
          F_HM0_ADDR                              : out   std_logic_vector(31 downto 0);
          F_HM0_ENABLE                            : out   std_logic;
          F_HM0_SEL                               : out   std_logic;
          F_HM0_SIZE                              : out   std_logic_vector(1 downto 0);
          F_HM0_TRANS1                            : out   std_logic;
          F_HM0_WDATA                             : out   std_logic_vector(31 downto 0);
          F_HM0_WRITE                             : out   std_logic;
          FAB_CHRGVBUS                            : out   std_logic;
          FAB_DISCHRGVBUS                         : out   std_logic;
          FAB_DMPULLDOWN                          : out   std_logic;
          FAB_DPPULLDOWN                          : out   std_logic;
          FAB_DRVVBUS                             : out   std_logic;
          FAB_IDPULLUP                            : out   std_logic;
          FAB_OPMODE                              : out   std_logic_vector(1 downto 0);
          FAB_SUSPENDM                            : out   std_logic;
          FAB_TERMSEL                             : out   std_logic;
          FAB_TXVALID                             : out   std_logic;
          FAB_VCONTROL                            : out   std_logic_vector(3 downto 0);
          FAB_VCONTROLLOADM                       : out   std_logic;
          FAB_XCVRSEL                             : out   std_logic_vector(1 downto 0);
          FAB_XDATAOUT                            : out   std_logic_vector(7 downto 0);
          FACC_GLMUX_SEL                          : out   std_logic;
          FIC32_0_MASTER                          : out   std_logic_vector(1 downto 0);
          FIC32_1_MASTER                          : out   std_logic_vector(1 downto 0);
          FPGA_RESET_N                            : out   std_logic;
          GTX_CLK                                 : out   std_logic;
          H2F_INTERRUPT                           : out   std_logic_vector(15 downto 0);
          H2F_NMI                                 : out   std_logic;
          H2FCALIB                                : out   std_logic;
          I2C0_SCL_MGPIO31B_H2F_A                 : out   std_logic;
          I2C0_SCL_MGPIO31B_H2F_B                 : out   std_logic;
          I2C0_SDA_MGPIO30B_H2F_A                 : out   std_logic;
          I2C0_SDA_MGPIO30B_H2F_B                 : out   std_logic;
          I2C1_SCL_MGPIO1A_H2F_A                  : out   std_logic;
          I2C1_SCL_MGPIO1A_H2F_B                  : out   std_logic;
          I2C1_SDA_MGPIO0A_H2F_A                  : out   std_logic;
          I2C1_SDA_MGPIO0A_H2F_B                  : out   std_logic;
          MDCF                                    : out   std_logic;
          MDOENF                                  : out   std_logic;
          MDOF                                    : out   std_logic;
          MMUART0_CTS_MGPIO19B_H2F_A              : out   std_logic;
          MMUART0_CTS_MGPIO19B_H2F_B              : out   std_logic;
          MMUART0_DCD_MGPIO22B_H2F_A              : out   std_logic;
          MMUART0_DCD_MGPIO22B_H2F_B              : out   std_logic;
          MMUART0_DSR_MGPIO20B_H2F_A              : out   std_logic;
          MMUART0_DSR_MGPIO20B_H2F_B              : out   std_logic;
          MMUART0_DTR_MGPIO18B_H2F_A              : out   std_logic;
          MMUART0_DTR_MGPIO18B_H2F_B              : out   std_logic;
          MMUART0_RI_MGPIO21B_H2F_A               : out   std_logic;
          MMUART0_RI_MGPIO21B_H2F_B               : out   std_logic;
          MMUART0_RTS_MGPIO17B_H2F_A              : out   std_logic;
          MMUART0_RTS_MGPIO17B_H2F_B              : out   std_logic;
          MMUART0_RXD_MGPIO28B_H2F_A              : out   std_logic;
          MMUART0_RXD_MGPIO28B_H2F_B              : out   std_logic;
          MMUART0_SCK_MGPIO29B_H2F_A              : out   std_logic;
          MMUART0_SCK_MGPIO29B_H2F_B              : out   std_logic;
          MMUART0_TXD_MGPIO27B_H2F_A              : out   std_logic;
          MMUART0_TXD_MGPIO27B_H2F_B              : out   std_logic;
          MMUART1_DTR_MGPIO12B_H2F_A              : out   std_logic;
          MMUART1_RTS_MGPIO11B_H2F_A              : out   std_logic;
          MMUART1_RTS_MGPIO11B_H2F_B              : out   std_logic;
          MMUART1_RXD_MGPIO26B_H2F_A              : out   std_logic;
          MMUART1_RXD_MGPIO26B_H2F_B              : out   std_logic;
          MMUART1_SCK_MGPIO25B_H2F_A              : out   std_logic;
          MMUART1_SCK_MGPIO25B_H2F_B              : out   std_logic;
          MMUART1_TXD_MGPIO24B_H2F_A              : out   std_logic;
          MMUART1_TXD_MGPIO24B_H2F_B              : out   std_logic;
          MPLL_LOCK                               : out   std_logic;
          PER2_FABRIC_PADDR                       : out   std_logic_vector(15 downto 2);
          PER2_FABRIC_PENABLE                     : out   std_logic;
          PER2_FABRIC_PSEL                        : out   std_logic;
          PER2_FABRIC_PWDATA                      : out   std_logic_vector(31 downto 0);
          PER2_FABRIC_PWRITE                      : out   std_logic;
          RTC_MATCH                               : out   std_logic;
          SLEEPDEEP                               : out   std_logic;
          SLEEPHOLDACK                            : out   std_logic;
          SLEEPING                                : out   std_logic;
          SMBALERT_NO0                            : out   std_logic;
          SMBALERT_NO1                            : out   std_logic;
          SMBSUS_NO0                              : out   std_logic;
          SMBSUS_NO1                              : out   std_logic;
          SPI0_CLK_OUT                            : out   std_logic;
          SPI0_SDI_MGPIO5A_H2F_A                  : out   std_logic;
          SPI0_SDI_MGPIO5A_H2F_B                  : out   std_logic;
          SPI0_SDO_MGPIO6A_H2F_A                  : out   std_logic;
          SPI0_SDO_MGPIO6A_H2F_B                  : out   std_logic;
          SPI0_SS0_MGPIO7A_H2F_A                  : out   std_logic;
          SPI0_SS0_MGPIO7A_H2F_B                  : out   std_logic;
          SPI0_SS1_MGPIO8A_H2F_A                  : out   std_logic;
          SPI0_SS1_MGPIO8A_H2F_B                  : out   std_logic;
          SPI0_SS2_MGPIO9A_H2F_A                  : out   std_logic;
          SPI0_SS2_MGPIO9A_H2F_B                  : out   std_logic;
          SPI0_SS3_MGPIO10A_H2F_A                 : out   std_logic;
          SPI0_SS3_MGPIO10A_H2F_B                 : out   std_logic;
          SPI0_SS4_MGPIO19A_H2F_A                 : out   std_logic;
          SPI0_SS5_MGPIO20A_H2F_A                 : out   std_logic;
          SPI0_SS6_MGPIO21A_H2F_A                 : out   std_logic;
          SPI0_SS7_MGPIO22A_H2F_A                 : out   std_logic;
          SPI1_CLK_OUT                            : out   std_logic;
          SPI1_SDI_MGPIO11A_H2F_A                 : out   std_logic;
          SPI1_SDI_MGPIO11A_H2F_B                 : out   std_logic;
          SPI1_SDO_MGPIO12A_H2F_A                 : out   std_logic;
          SPI1_SDO_MGPIO12A_H2F_B                 : out   std_logic;
          SPI1_SS0_MGPIO13A_H2F_A                 : out   std_logic;
          SPI1_SS0_MGPIO13A_H2F_B                 : out   std_logic;
          SPI1_SS1_MGPIO14A_H2F_A                 : out   std_logic;
          SPI1_SS1_MGPIO14A_H2F_B                 : out   std_logic;
          SPI1_SS2_MGPIO15A_H2F_A                 : out   std_logic;
          SPI1_SS2_MGPIO15A_H2F_B                 : out   std_logic;
          SPI1_SS3_MGPIO16A_H2F_A                 : out   std_logic;
          SPI1_SS3_MGPIO16A_H2F_B                 : out   std_logic;
          SPI1_SS4_MGPIO17A_H2F_A                 : out   std_logic;
          SPI1_SS5_MGPIO18A_H2F_A                 : out   std_logic;
          SPI1_SS6_MGPIO23A_H2F_A                 : out   std_logic;
          SPI1_SS7_MGPIO24A_H2F_A                 : out   std_logic;
          TCGF                                    : out   std_logic_vector(9 downto 0);
          TRACECLK                                : out   std_logic;
          TRACEDATA                               : out   std_logic_vector(3 downto 0);
          TX_CLK                                  : out   std_logic;
          TX_ENF                                  : out   std_logic;
          TX_ERRF                                 : out   std_logic;
          TXCTL_EN_RIF                            : out   std_logic;
          TXD_RIF                                 : out   std_logic_vector(3 downto 0);
          TXDF                                    : out   std_logic_vector(7 downto 0);
          TXEV                                    : out   std_logic;
          WDOGTIMEOUT                             : out   std_logic;
          F_ARREADY_HREADYOUT1                    : out   std_logic;
          F_AWREADY_HREADYOUT0                    : out   std_logic;
          F_BID                                   : out   std_logic_vector(3 downto 0);
          F_BRESP_HRESP0                          : out   std_logic_vector(1 downto 0);
          F_BVALID                                : out   std_logic;
          F_RDATA_HRDATA01                        : out   std_logic_vector(63 downto 0);
          F_RID                                   : out   std_logic_vector(3 downto 0);
          F_RLAST                                 : out   std_logic;
          F_RRESP_HRESP1                          : out   std_logic_vector(1 downto 0);
          F_RVALID                                : out   std_logic;
          F_WREADY                                : out   std_logic;
          MDDR_FABRIC_PRDATA                      : out   std_logic_vector(15 downto 0);
          MDDR_FABRIC_PREADY                      : out   std_logic;
          MDDR_FABRIC_PSLVERR                     : out   std_logic;
          CAN_RXBUS_F2H_SCP                       : in    std_logic := 'U';
          CAN_TX_EBL_F2H_SCP                      : in    std_logic := 'U';
          CAN_TXBUS_F2H_SCP                       : in    std_logic := 'U';
          COLF                                    : in    std_logic := 'U';
          CRSF                                    : in    std_logic := 'U';
          F2_DMAREADY                             : in    std_logic_vector(1 downto 0) := (others => 'U');
          F2H_INTERRUPT                           : in    std_logic_vector(15 downto 0) := (others => 'U');
          F2HCALIB                                : in    std_logic := 'U';
          F_DMAREADY                              : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_FM0_ADDR                              : in    std_logic_vector(31 downto 0) := (others => 'U');
          F_FM0_ENABLE                            : in    std_logic := 'U';
          F_FM0_MASTLOCK                          : in    std_logic := 'U';
          F_FM0_READY                             : in    std_logic := 'U';
          F_FM0_SEL                               : in    std_logic := 'U';
          F_FM0_SIZE                              : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_FM0_TRANS1                            : in    std_logic := 'U';
          F_FM0_WDATA                             : in    std_logic_vector(31 downto 0) := (others => 'U');
          F_FM0_WRITE                             : in    std_logic := 'U';
          F_HM0_RDATA                             : in    std_logic_vector(31 downto 0) := (others => 'U');
          F_HM0_READY                             : in    std_logic := 'U';
          F_HM0_RESP                              : in    std_logic := 'U';
          FAB_AVALID                              : in    std_logic := 'U';
          FAB_HOSTDISCON                          : in    std_logic := 'U';
          FAB_IDDIG                               : in    std_logic := 'U';
          FAB_LINESTATE                           : in    std_logic_vector(1 downto 0) := (others => 'U');
          FAB_M3_RESET_N                          : in    std_logic := 'U';
          FAB_PLL_LOCK                            : in    std_logic := 'U';
          FAB_RXACTIVE                            : in    std_logic := 'U';
          FAB_RXERROR                             : in    std_logic := 'U';
          FAB_RXVALID                             : in    std_logic := 'U';
          FAB_RXVALIDH                            : in    std_logic := 'U';
          FAB_SESSEND                             : in    std_logic := 'U';
          FAB_TXREADY                             : in    std_logic := 'U';
          FAB_VBUSVALID                           : in    std_logic := 'U';
          FAB_VSTATUS                             : in    std_logic_vector(7 downto 0) := (others => 'U');
          FAB_XDATAIN                             : in    std_logic_vector(7 downto 0) := (others => 'U');
          GTX_CLKPF                               : in    std_logic := 'U';
          I2C0_BCLK                               : in    std_logic := 'U';
          I2C0_SCL_F2H_SCP                        : in    std_logic := 'U';
          I2C0_SDA_F2H_SCP                        : in    std_logic := 'U';
          I2C1_BCLK                               : in    std_logic := 'U';
          I2C1_SCL_F2H_SCP                        : in    std_logic := 'U';
          I2C1_SDA_F2H_SCP                        : in    std_logic := 'U';
          MDIF                                    : in    std_logic := 'U';
          MGPIO0A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO10A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO11A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO11B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO12A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO13A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO14A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO15A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO16A_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO17B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO18B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO19B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO1A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO20B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO21B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO22B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO24B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO25B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO26B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO27B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO28B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO29B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO2A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO30B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO31B_F2H_GPIN                       : in    std_logic := 'U';
          MGPIO3A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO4A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO5A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO6A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO7A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO8A_F2H_GPIN                        : in    std_logic := 'U';
          MGPIO9A_F2H_GPIN                        : in    std_logic := 'U';
          MMUART0_CTS_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_DCD_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_DSR_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_DTR_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_RI_F2H_SCP                      : in    std_logic := 'U';
          MMUART0_RTS_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_RXD_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_SCK_F2H_SCP                     : in    std_logic := 'U';
          MMUART0_TXD_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_CTS_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_DCD_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_DSR_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_RI_F2H_SCP                      : in    std_logic := 'U';
          MMUART1_RTS_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_RXD_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_SCK_F2H_SCP                     : in    std_logic := 'U';
          MMUART1_TXD_F2H_SCP                     : in    std_logic := 'U';
          PER2_FABRIC_PRDATA                      : in    std_logic_vector(31 downto 0) := (others => 'U');
          PER2_FABRIC_PREADY                      : in    std_logic := 'U';
          PER2_FABRIC_PSLVERR                     : in    std_logic := 'U';
          RCGF                                    : in    std_logic_vector(9 downto 0) := (others => 'U');
          RX_CLKPF                                : in    std_logic := 'U';
          RX_DVF                                  : in    std_logic := 'U';
          RX_ERRF                                 : in    std_logic := 'U';
          RX_EV                                   : in    std_logic := 'U';
          RXDF                                    : in    std_logic_vector(7 downto 0) := (others => 'U');
          SLEEPHOLDREQ                            : in    std_logic := 'U';
          SMBALERT_NI0                            : in    std_logic := 'U';
          SMBALERT_NI1                            : in    std_logic := 'U';
          SMBSUS_NI0                              : in    std_logic := 'U';
          SMBSUS_NI1                              : in    std_logic := 'U';
          SPI0_CLK_IN                             : in    std_logic := 'U';
          SPI0_SDI_F2H_SCP                        : in    std_logic := 'U';
          SPI0_SDO_F2H_SCP                        : in    std_logic := 'U';
          SPI0_SS0_F2H_SCP                        : in    std_logic := 'U';
          SPI0_SS1_F2H_SCP                        : in    std_logic := 'U';
          SPI0_SS2_F2H_SCP                        : in    std_logic := 'U';
          SPI0_SS3_F2H_SCP                        : in    std_logic := 'U';
          SPI1_CLK_IN                             : in    std_logic := 'U';
          SPI1_SDI_F2H_SCP                        : in    std_logic := 'U';
          SPI1_SDO_F2H_SCP                        : in    std_logic := 'U';
          SPI1_SS0_F2H_SCP                        : in    std_logic := 'U';
          SPI1_SS1_F2H_SCP                        : in    std_logic := 'U';
          SPI1_SS2_F2H_SCP                        : in    std_logic := 'U';
          SPI1_SS3_F2H_SCP                        : in    std_logic := 'U';
          TX_CLKPF                                : in    std_logic := 'U';
          USER_MSS_GPIO_RESET_N                   : in    std_logic := 'U';
          USER_MSS_RESET_N                        : in    std_logic := 'U';
          XCLK_FAB                                : in    std_logic := 'U';
          CLK_BASE                                : in    std_logic := 'U';
          CLK_MDDR_APB                            : in    std_logic := 'U';
          F_ARADDR_HADDR1                         : in    std_logic_vector(31 downto 0) := (others => 'U');
          F_ARBURST_HTRANS1                       : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_ARID_HSEL1                            : in    std_logic_vector(3 downto 0) := (others => 'U');
          F_ARLEN_HBURST1                         : in    std_logic_vector(3 downto 0) := (others => 'U');
          F_ARLOCK_HMASTLOCK1                     : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_ARSIZE_HSIZE1                         : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_ARVALID_HWRITE1                       : in    std_logic := 'U';
          F_AWADDR_HADDR0                         : in    std_logic_vector(31 downto 0) := (others => 'U');
          F_AWBURST_HTRANS0                       : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_AWID_HSEL0                            : in    std_logic_vector(3 downto 0) := (others => 'U');
          F_AWLEN_HBURST0                         : in    std_logic_vector(3 downto 0) := (others => 'U');
          F_AWLOCK_HMASTLOCK0                     : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_AWSIZE_HSIZE0                         : in    std_logic_vector(1 downto 0) := (others => 'U');
          F_AWVALID_HWRITE0                       : in    std_logic := 'U';
          F_BREADY                                : in    std_logic := 'U';
          F_RMW_AXI                               : in    std_logic := 'U';
          F_RREADY                                : in    std_logic := 'U';
          F_WDATA_HWDATA01                        : in    std_logic_vector(63 downto 0) := (others => 'U');
          F_WID_HREADY01                          : in    std_logic_vector(3 downto 0) := (others => 'U');
          F_WLAST                                 : in    std_logic := 'U';
          F_WSTRB                                 : in    std_logic_vector(7 downto 0) := (others => 'U');
          F_WVALID                                : in    std_logic := 'U';
          FPGA_MDDR_ARESET_N                      : in    std_logic := 'U';
          MDDR_FABRIC_PADDR                       : in    std_logic_vector(10 downto 2) := (others => 'U');
          MDDR_FABRIC_PENABLE                     : in    std_logic := 'U';
          MDDR_FABRIC_PSEL                        : in    std_logic := 'U';
          MDDR_FABRIC_PWDATA                      : in    std_logic_vector(15 downto 0) := (others => 'U');
          MDDR_FABRIC_PWRITE                      : in    std_logic := 'U';
          PRESET_N                                : in    std_logic := 'U';
          CAN_RXBUS_USBA_DATA1_MGPIO3A_IN         : in    std_logic := 'U';
          CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN        : in    std_logic := 'U';
          CAN_TXBUS_USBA_DATA0_MGPIO2A_IN         : in    std_logic := 'U';
          DM_IN                                   : in    std_logic_vector(2 downto 0) := (others => 'U');
          DRAM_DQ_IN                              : in    std_logic_vector(17 downto 0) := (others => 'U');
          DRAM_DQS_IN                             : in    std_logic_vector(2 downto 0) := (others => 'U');
          DRAM_FIFO_WE_IN                         : in    std_logic_vector(1 downto 0) := (others => 'U');
          I2C0_SCL_USBC_DATA1_MGPIO31B_IN         : in    std_logic := 'U';
          I2C0_SDA_USBC_DATA0_MGPIO30B_IN         : in    std_logic := 'U';
          I2C1_SCL_USBA_DATA4_MGPIO1A_IN          : in    std_logic := 'U';
          I2C1_SDA_USBA_DATA3_MGPIO0A_IN          : in    std_logic := 'U';
          MMUART0_CTS_USBC_DATA7_MGPIO19B_IN      : in    std_logic := 'U';
          MMUART0_DCD_MGPIO22B_IN                 : in    std_logic := 'U';
          MMUART0_DSR_MGPIO20B_IN                 : in    std_logic := 'U';
          MMUART0_DTR_USBC_DATA6_MGPIO18B_IN      : in    std_logic := 'U';
          MMUART0_RI_MGPIO21B_IN                  : in    std_logic := 'U';
          MMUART0_RTS_USBC_DATA5_MGPIO17B_IN      : in    std_logic := 'U';
          MMUART0_RXD_USBC_STP_MGPIO28B_IN        : in    std_logic := 'U';
          MMUART0_SCK_USBC_NXT_MGPIO29B_IN        : in    std_logic := 'U';
          MMUART0_TXD_USBC_DIR_MGPIO27B_IN        : in    std_logic := 'U';
          MMUART1_RXD_USBC_DATA3_MGPIO26B_IN      : in    std_logic := 'U';
          MMUART1_SCK_USBC_DATA4_MGPIO25B_IN      : in    std_logic := 'U';
          MMUART1_TXD_USBC_DATA2_MGPIO24B_IN      : in    std_logic := 'U';
          RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN     : in    std_logic := 'U';
          RGMII_MDC_RMII_MDC_IN                   : in    std_logic := 'U';
          RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN      : in    std_logic := 'U';
          RGMII_RX_CLK_IN                         : in    std_logic := 'U';
          RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN  : in    std_logic := 'U';
          RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN      : in    std_logic := 'U';
          RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN      : in    std_logic := 'U';
          RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN     : in    std_logic := 'U';
          RGMII_RXD3_USBB_DATA4_IN                : in    std_logic := 'U';
          RGMII_TX_CLK_IN                         : in    std_logic := 'U';
          RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN     : in    std_logic := 'U';
          RGMII_TXD0_RMII_TXD0_USBB_DIR_IN        : in    std_logic := 'U';
          RGMII_TXD1_RMII_TXD1_USBB_STP_IN        : in    std_logic := 'U';
          RGMII_TXD2_USBB_DATA5_IN                : in    std_logic := 'U';
          RGMII_TXD3_USBB_DATA6_IN                : in    std_logic := 'U';
          SPI0_SCK_USBA_XCLK_IN                   : in    std_logic := 'U';
          SPI0_SDI_USBA_DIR_MGPIO5A_IN            : in    std_logic := 'U';
          SPI0_SDO_USBA_STP_MGPIO6A_IN            : in    std_logic := 'U';
          SPI0_SS0_USBA_NXT_MGPIO7A_IN            : in    std_logic := 'U';
          SPI0_SS1_USBA_DATA5_MGPIO8A_IN          : in    std_logic := 'U';
          SPI0_SS2_USBA_DATA6_MGPIO9A_IN          : in    std_logic := 'U';
          SPI0_SS3_USBA_DATA7_MGPIO10A_IN         : in    std_logic := 'U';
          SPI1_SCK_IN                             : in    std_logic := 'U';
          SPI1_SDI_MGPIO11A_IN                    : in    std_logic := 'U';
          SPI1_SDO_MGPIO12A_IN                    : in    std_logic := 'U';
          SPI1_SS0_MGPIO13A_IN                    : in    std_logic := 'U';
          SPI1_SS1_MGPIO14A_IN                    : in    std_logic := 'U';
          SPI1_SS2_MGPIO15A_IN                    : in    std_logic := 'U';
          SPI1_SS3_MGPIO16A_IN                    : in    std_logic := 'U';
          SPI1_SS4_MGPIO17A_IN                    : in    std_logic := 'U';
          SPI1_SS5_MGPIO18A_IN                    : in    std_logic := 'U';
          SPI1_SS6_MGPIO23A_IN                    : in    std_logic := 'U';
          SPI1_SS7_MGPIO24A_IN                    : in    std_logic := 'U';
          USBC_XCLK_IN                            : in    std_logic := 'U';
          CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT        : out   std_logic;
          CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT       : out   std_logic;
          CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT        : out   std_logic;
          DRAM_ADDR                               : out   std_logic_vector(15 downto 0);
          DRAM_BA                                 : out   std_logic_vector(2 downto 0);
          DRAM_CASN                               : out   std_logic;
          DRAM_CKE                                : out   std_logic;
          DRAM_CLK                                : out   std_logic;
          DRAM_CSN                                : out   std_logic;
          DRAM_DM_RDQS_OUT                        : out   std_logic_vector(2 downto 0);
          DRAM_DQ_OUT                             : out   std_logic_vector(17 downto 0);
          DRAM_DQS_OUT                            : out   std_logic_vector(2 downto 0);
          DRAM_FIFO_WE_OUT                        : out   std_logic_vector(1 downto 0);
          DRAM_ODT                                : out   std_logic;
          DRAM_RASN                               : out   std_logic;
          DRAM_RSTN                               : out   std_logic;
          DRAM_WEN                                : out   std_logic;
          I2C0_SCL_USBC_DATA1_MGPIO31B_OUT        : out   std_logic;
          I2C0_SDA_USBC_DATA0_MGPIO30B_OUT        : out   std_logic;
          I2C1_SCL_USBA_DATA4_MGPIO1A_OUT         : out   std_logic;
          I2C1_SDA_USBA_DATA3_MGPIO0A_OUT         : out   std_logic;
          MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT     : out   std_logic;
          MMUART0_DCD_MGPIO22B_OUT                : out   std_logic;
          MMUART0_DSR_MGPIO20B_OUT                : out   std_logic;
          MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT     : out   std_logic;
          MMUART0_RI_MGPIO21B_OUT                 : out   std_logic;
          MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT     : out   std_logic;
          MMUART0_RXD_USBC_STP_MGPIO28B_OUT       : out   std_logic;
          MMUART0_SCK_USBC_NXT_MGPIO29B_OUT       : out   std_logic;
          MMUART0_TXD_USBC_DIR_MGPIO27B_OUT       : out   std_logic;
          MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT     : out   std_logic;
          MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT     : out   std_logic;
          MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT     : out   std_logic;
          RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT    : out   std_logic;
          RGMII_MDC_RMII_MDC_OUT                  : out   std_logic;
          RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT     : out   std_logic;
          RGMII_RX_CLK_OUT                        : out   std_logic;
          RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT : out   std_logic;
          RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT     : out   std_logic;
          RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT     : out   std_logic;
          RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT    : out   std_logic;
          RGMII_RXD3_USBB_DATA4_OUT               : out   std_logic;
          RGMII_TX_CLK_OUT                        : out   std_logic;
          RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT    : out   std_logic;
          RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT       : out   std_logic;
          RGMII_TXD1_RMII_TXD1_USBB_STP_OUT       : out   std_logic;
          RGMII_TXD2_USBB_DATA5_OUT               : out   std_logic;
          RGMII_TXD3_USBB_DATA6_OUT               : out   std_logic;
          SPI0_SCK_USBA_XCLK_OUT                  : out   std_logic;
          SPI0_SDI_USBA_DIR_MGPIO5A_OUT           : out   std_logic;
          SPI0_SDO_USBA_STP_MGPIO6A_OUT           : out   std_logic;
          SPI0_SS0_USBA_NXT_MGPIO7A_OUT           : out   std_logic;
          SPI0_SS1_USBA_DATA5_MGPIO8A_OUT         : out   std_logic;
          SPI0_SS2_USBA_DATA6_MGPIO9A_OUT         : out   std_logic;
          SPI0_SS3_USBA_DATA7_MGPIO10A_OUT        : out   std_logic;
          SPI1_SCK_OUT                            : out   std_logic;
          SPI1_SDI_MGPIO11A_OUT                   : out   std_logic;
          SPI1_SDO_MGPIO12A_OUT                   : out   std_logic;
          SPI1_SS0_MGPIO13A_OUT                   : out   std_logic;
          SPI1_SS1_MGPIO14A_OUT                   : out   std_logic;
          SPI1_SS2_MGPIO15A_OUT                   : out   std_logic;
          SPI1_SS3_MGPIO16A_OUT                   : out   std_logic;
          SPI1_SS4_MGPIO17A_OUT                   : out   std_logic;
          SPI1_SS5_MGPIO18A_OUT                   : out   std_logic;
          SPI1_SS6_MGPIO23A_OUT                   : out   std_logic;
          SPI1_SS7_MGPIO24A_OUT                   : out   std_logic;
          USBC_XCLK_OUT                           : out   std_logic;
          CAN_RXBUS_USBA_DATA1_MGPIO3A_OE         : out   std_logic;
          CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE        : out   std_logic;
          CAN_TXBUS_USBA_DATA0_MGPIO2A_OE         : out   std_logic;
          DM_OE                                   : out   std_logic_vector(2 downto 0);
          DRAM_DQ_OE                              : out   std_logic_vector(17 downto 0);
          DRAM_DQS_OE                             : out   std_logic_vector(2 downto 0);
          I2C0_SCL_USBC_DATA1_MGPIO31B_OE         : out   std_logic;
          I2C0_SDA_USBC_DATA0_MGPIO30B_OE         : out   std_logic;
          I2C1_SCL_USBA_DATA4_MGPIO1A_OE          : out   std_logic;
          I2C1_SDA_USBA_DATA3_MGPIO0A_OE          : out   std_logic;
          MMUART0_CTS_USBC_DATA7_MGPIO19B_OE      : out   std_logic;
          MMUART0_DCD_MGPIO22B_OE                 : out   std_logic;
          MMUART0_DSR_MGPIO20B_OE                 : out   std_logic;
          MMUART0_DTR_USBC_DATA6_MGPIO18B_OE      : out   std_logic;
          MMUART0_RI_MGPIO21B_OE                  : out   std_logic;
          MMUART0_RTS_USBC_DATA5_MGPIO17B_OE      : out   std_logic;
          MMUART0_RXD_USBC_STP_MGPIO28B_OE        : out   std_logic;
          MMUART0_SCK_USBC_NXT_MGPIO29B_OE        : out   std_logic;
          MMUART0_TXD_USBC_DIR_MGPIO27B_OE        : out   std_logic;
          MMUART1_RXD_USBC_DATA3_MGPIO26B_OE      : out   std_logic;
          MMUART1_SCK_USBC_DATA4_MGPIO25B_OE      : out   std_logic;
          MMUART1_TXD_USBC_DATA2_MGPIO24B_OE      : out   std_logic;
          RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE     : out   std_logic;
          RGMII_MDC_RMII_MDC_OE                   : out   std_logic;
          RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE      : out   std_logic;
          RGMII_RX_CLK_OE                         : out   std_logic;
          RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE  : out   std_logic;
          RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE      : out   std_logic;
          RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE      : out   std_logic;
          RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE     : out   std_logic;
          RGMII_RXD3_USBB_DATA4_OE                : out   std_logic;
          RGMII_TX_CLK_OE                         : out   std_logic;
          RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE     : out   std_logic;
          RGMII_TXD0_RMII_TXD0_USBB_DIR_OE        : out   std_logic;
          RGMII_TXD1_RMII_TXD1_USBB_STP_OE        : out   std_logic;
          RGMII_TXD2_USBB_DATA5_OE                : out   std_logic;
          RGMII_TXD3_USBB_DATA6_OE                : out   std_logic;
          SPI0_SCK_USBA_XCLK_OE                   : out   std_logic;
          SPI0_SDI_USBA_DIR_MGPIO5A_OE            : out   std_logic;
          SPI0_SDO_USBA_STP_MGPIO6A_OE            : out   std_logic;
          SPI0_SS0_USBA_NXT_MGPIO7A_OE            : out   std_logic;
          SPI0_SS1_USBA_DATA5_MGPIO8A_OE          : out   std_logic;
          SPI0_SS2_USBA_DATA6_MGPIO9A_OE          : out   std_logic;
          SPI0_SS3_USBA_DATA7_MGPIO10A_OE         : out   std_logic;
          SPI1_SCK_OE                             : out   std_logic;
          SPI1_SDI_MGPIO11A_OE                    : out   std_logic;
          SPI1_SDO_MGPIO12A_OE                    : out   std_logic;
          SPI1_SS0_MGPIO13A_OE                    : out   std_logic;
          SPI1_SS1_MGPIO14A_OE                    : out   std_logic;
          SPI1_SS2_MGPIO15A_OE                    : out   std_logic;
          SPI1_SS3_MGPIO16A_OE                    : out   std_logic;
          SPI1_SS4_MGPIO17A_OE                    : out   std_logic;
          SPI1_SS5_MGPIO18A_OE                    : out   std_logic;
          SPI1_SS6_MGPIO23A_OE                    : out   std_logic;
          SPI1_SS7_MGPIO24A_OE                    : out   std_logic;
          USBC_XCLK_OE                            : out   std_logic
        );
  end component;

  component TRIBUFF
    generic (IOSTD:string := "");

    port( D   : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

    signal USB_ULPI_XCLK_PAD_Y, 
        MSS_ADLIB_INST_RGMII_TXD1_RMII_TXD1_USBB_STP_OUT, 
        MSS_ADLIB_INST_RGMII_TXD1_RMII_TXD1_USBB_STP_OE, 
        USB_ULPI_NXT_PAD_Y, USB_ULPI_DIR_PAD_Y, 
        USB_ULPI_DATA_7_PAD_Y, 
        MSS_ADLIB_INST_RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT, 
        MSS_ADLIB_INST_RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE, 
        USB_ULPI_DATA_6_PAD_Y, 
        MSS_ADLIB_INST_RGMII_TXD3_USBB_DATA6_OUT, 
        MSS_ADLIB_INST_RGMII_TXD3_USBB_DATA6_OE, 
        USB_ULPI_DATA_5_PAD_Y, 
        MSS_ADLIB_INST_RGMII_TXD2_USBB_DATA5_OUT, 
        MSS_ADLIB_INST_RGMII_TXD2_USBB_DATA5_OE, 
        USB_ULPI_DATA_4_PAD_Y, 
        MSS_ADLIB_INST_RGMII_RXD3_USBB_DATA4_OUT, 
        MSS_ADLIB_INST_RGMII_RXD3_USBB_DATA4_OE, 
        USB_ULPI_DATA_3_PAD_Y, 
        MSS_ADLIB_INST_RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT, 
        MSS_ADLIB_INST_RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE, 
        USB_ULPI_DATA_2_PAD_Y, 
        MSS_ADLIB_INST_RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT, 
        MSS_ADLIB_INST_RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE, 
        USB_ULPI_DATA_1_PAD_Y, 
        MSS_ADLIB_INST_RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT, 
        MSS_ADLIB_INST_RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE, 
        USB_ULPI_DATA_0_PAD_Y, 
        MSS_ADLIB_INST_RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT, 
        MSS_ADLIB_INST_RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE, 
        VCC_net_1, GND_net_1 : std_logic;
    signal nc228, nc203, nc265, nc216, nc194, nc151, nc23, nc175, 
        nc250, nc58, nc116, nc74, nc133, nc238, nc167, nc84, nc39, 
        nc72, nc256, nc212, nc205, nc82, nc367, nc145, nc181, 
        nc160, nc57, nc349, nc156, nc280, nc125, nc211, nc73, 
        nc107, nc329, nc66, nc83, nc9, nc252, nc171, nc54, nc286, 
        nc307, nc135, nc41, nc100, nc270, nc339, nc52, nc251, 
        nc186, nc29, nc269, nc118, nc60, nc141, nc311, nc276, 
        nc193, nc214, nc298, nc282, nc240, nc45, nc53, nc121, 
        nc176, nc360, nc220, nc158, nc281, nc209, nc246, nc368, 
        nc351, nc162, nc11, nc272, nc131, nc364, nc254, nc267, 
        nc96, nc79, nc226, nc146, nc230, nc89, nc119, nc48, nc271, 
        nc213, nc366, nc300, nc126, nc195, nc188, nc242, nc15, 
        nc308, nc236, nc102, nc304, nc3, nc207, nc47, nc90, nc284, 
        nc222, nc159, nc136, nc241, nc253, nc178, nc306, nc215, 
        nc59, nc362, nc221, nc371, nc232, nc274, nc18, nc44, 
        nc117, nc189, nc164, nc148, nc42, nc231, nc191, nc255, 
        nc283, nc363, nc341, nc317, nc290, nc17, nc2, nc302, 
        nc110, nc128, nc244, nc321, nc43, nc179, nc157, nc36, 
        nc224, nc296, nc273, nc61, nc104, nc138, nc14, nc357, 
        nc285, nc303, nc150, nc365, nc331, nc196, nc234, nc149, 
        nc12, nc219, nc30, nc243, nc187, nc65, nc7, nc292, nc129, 
        nc275, nc8, nc223, nc13, nc305, nc180, nc26, nc291, nc177, 
        nc139, nc310, nc259, nc245, nc233, nc163, nc318, nc268, 
        nc112, nc68, nc49, nc314, nc217, nc170, nc91, nc225, nc5, 
        nc20, nc198, nc147, nc350, nc316, nc67, nc289, nc358, 
        nc294, nc152, nc127, nc103, nc235, nc76, nc347, nc208, 
        nc354, nc140, nc257, nc86, nc95, nc327, nc120, nc165, 
        nc356, nc279, nc137, nc64, nc19, nc369, nc312, nc70, 
        nc182, nc62, nc337, nc199, nc80, nc130, nc287, nc98, 
        nc293, nc249, nc114, nc56, nc370, nc105, nc63, nc352, 
        nc313, nc309, nc172, nc229, nc374, nc277, nc97, nc161, 
        nc31, nc340, nc295, nc154, nc50, nc260, nc239, nc353, 
        nc348, nc142, nc320, nc344, nc315, nc247, nc94, nc197, 
        nc328, nc122, nc266, nc35, nc324, nc4, nc227, nc92, nc101, 
        nc346, nc330, nc184, nc200, nc190, nc166, nc372, nc355, 
        nc338, nc326, nc132, nc334, nc21, nc237, nc93, nc262, 
        nc69, nc206, nc174, nc38, nc113, nc336, nc218, nc342, 
        nc373, nc106, nc261, nc25, nc1, nc322, nc299, nc37, nc202, 
        nc144, nc153, nc46, nc258, nc343, nc71, nc124, nc332, 
        nc81, nc375, nc201, nc168, nc323, nc34, nc28, nc361, 
        nc115, nc264, nc192, nc319, nc134, nc32, nc40, nc297, 
        nc99, nc75, nc183, nc345, nc333, nc288, nc85, nc27, nc108, 
        nc325, nc16, nc155, nc51, nc301, nc33, nc359, nc204, 
        nc173, nc278, nc169, nc78, nc263, nc335, nc24, nc88, 
        nc111, nc55, nc10, nc22, nc210, nc185, nc143, nc248, nc77, 
        nc6, nc109, nc87, nc123 : std_logic;

begin 


    USB_ULPI_DATA_5_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(5), D => 
        MSS_ADLIB_INST_RGMII_TXD2_USBB_DATA5_OUT, E => 
        MSS_ADLIB_INST_RGMII_TXD2_USBB_DATA5_OE, Y => 
        USB_ULPI_DATA_5_PAD_Y);
    
    USB_ULPI_DATA_4_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(4), D => 
        MSS_ADLIB_INST_RGMII_RXD3_USBB_DATA4_OUT, E => 
        MSS_ADLIB_INST_RGMII_RXD3_USBB_DATA4_OE, Y => 
        USB_ULPI_DATA_4_PAD_Y);
    
    USB_ULPI_DATA_7_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(7), D => 
        MSS_ADLIB_INST_RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT, E => 
        MSS_ADLIB_INST_RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE, Y => 
        USB_ULPI_DATA_7_PAD_Y);
    
    USB_ULPI_DATA_3_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(3), D => 
        MSS_ADLIB_INST_RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT, E
         => MSS_ADLIB_INST_RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE, Y
         => USB_ULPI_DATA_3_PAD_Y);
    
    USB_ULPI_NXT_PAD : INBUF
      port map(PAD => USB_ULPI_NXT, Y => USB_ULPI_NXT_PAD_Y);
    
    USB_ULPI_XCLK_PAD : INBUF
      port map(PAD => USB_ULPI_XCLK, Y => USB_ULPI_XCLK_PAD_Y);
    
    USB_ULPI_DATA_6_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(6), D => 
        MSS_ADLIB_INST_RGMII_TXD3_USBB_DATA6_OUT, E => 
        MSS_ADLIB_INST_RGMII_TXD3_USBB_DATA6_OE, Y => 
        USB_ULPI_DATA_6_PAD_Y);
    
    USB_ULPI_DATA_2_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(2), D => 
        MSS_ADLIB_INST_RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT, E
         => MSS_ADLIB_INST_RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE, 
        Y => USB_ULPI_DATA_2_PAD_Y);
    
    \GND\ : GND
      port map(Y => GND_net_1);
    
    USB_ULPI_DIR_PAD : INBUF
      port map(PAD => USB_ULPI_DIR, Y => USB_ULPI_DIR_PAD_Y);
    
    \VCC\ : VCC
      port map(Y => VCC_net_1);
    
    MSS_ADLIB_INST : MSS_010

              generic map(INIT => "00" & x"000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000120481204812048120D8120D8120F00000000F000000000000000000000000000000007FFFFFFFB000001007C33F00000000E092C0F00003FFFFE400000000000110000000000E01C000001FF4FC4010842108421000001FE34001FF8000000400000000020091007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF",
         ACT_UBITS => x"FFFFFFFFFFFFFF",
         MEMORYFILE => "ENVM_init.mem", RTC_MAIN_XTL_FREQ => 0.0,
         DDR_CLK_FREQ => 100.0)

      port map(CAN_RXBUS_MGPIO3A_H2F_A => OPEN, 
        CAN_RXBUS_MGPIO3A_H2F_B => OPEN, CAN_TX_EBL_MGPIO4A_H2F_A
         => OPEN, CAN_TX_EBL_MGPIO4A_H2F_B => OPEN, 
        CAN_TXBUS_MGPIO2A_H2F_A => OPEN, CAN_TXBUS_MGPIO2A_H2F_B
         => OPEN, CLK_CONFIG_APB => OPEN, COMMS_INT => OPEN, 
        CONFIG_PRESET_N => OPEN, EDAC_ERROR(7) => nc228, 
        EDAC_ERROR(6) => nc203, EDAC_ERROR(5) => nc265, 
        EDAC_ERROR(4) => nc216, EDAC_ERROR(3) => nc194, 
        EDAC_ERROR(2) => nc151, EDAC_ERROR(1) => nc23, 
        EDAC_ERROR(0) => nc175, F_FM0_RDATA(31) => nc250, 
        F_FM0_RDATA(30) => nc58, F_FM0_RDATA(29) => nc116, 
        F_FM0_RDATA(28) => nc74, F_FM0_RDATA(27) => nc133, 
        F_FM0_RDATA(26) => nc238, F_FM0_RDATA(25) => nc167, 
        F_FM0_RDATA(24) => nc84, F_FM0_RDATA(23) => nc39, 
        F_FM0_RDATA(22) => nc72, F_FM0_RDATA(21) => nc256, 
        F_FM0_RDATA(20) => nc212, F_FM0_RDATA(19) => nc205, 
        F_FM0_RDATA(18) => nc82, F_FM0_RDATA(17) => nc367, 
        F_FM0_RDATA(16) => nc145, F_FM0_RDATA(15) => nc181, 
        F_FM0_RDATA(14) => nc160, F_FM0_RDATA(13) => nc57, 
        F_FM0_RDATA(12) => nc349, F_FM0_RDATA(11) => nc156, 
        F_FM0_RDATA(10) => nc280, F_FM0_RDATA(9) => nc125, 
        F_FM0_RDATA(8) => nc211, F_FM0_RDATA(7) => nc73, 
        F_FM0_RDATA(6) => nc107, F_FM0_RDATA(5) => nc329, 
        F_FM0_RDATA(4) => nc66, F_FM0_RDATA(3) => nc83, 
        F_FM0_RDATA(2) => nc9, F_FM0_RDATA(1) => nc252, 
        F_FM0_RDATA(0) => nc171, F_FM0_READYOUT => OPEN, 
        F_FM0_RESP => OPEN, F_HM0_ADDR(31) => nc54, 
        F_HM0_ADDR(30) => nc286, F_HM0_ADDR(29) => nc307, 
        F_HM0_ADDR(28) => nc135, F_HM0_ADDR(27) => nc41, 
        F_HM0_ADDR(26) => nc100, F_HM0_ADDR(25) => nc270, 
        F_HM0_ADDR(24) => nc339, F_HM0_ADDR(23) => nc52, 
        F_HM0_ADDR(22) => nc251, F_HM0_ADDR(21) => nc186, 
        F_HM0_ADDR(20) => nc29, F_HM0_ADDR(19) => nc269, 
        F_HM0_ADDR(18) => nc118, F_HM0_ADDR(17) => nc60, 
        F_HM0_ADDR(16) => nc141, F_HM0_ADDR(15) => nc311, 
        F_HM0_ADDR(14) => nc276, F_HM0_ADDR(13) => nc193, 
        F_HM0_ADDR(12) => nc214, F_HM0_ADDR(11) => nc298, 
        F_HM0_ADDR(10) => nc282, F_HM0_ADDR(9) => nc240, 
        F_HM0_ADDR(8) => nc45, F_HM0_ADDR(7) => nc53, 
        F_HM0_ADDR(6) => nc121, F_HM0_ADDR(5) => nc176, 
        F_HM0_ADDR(4) => nc360, F_HM0_ADDR(3) => nc220, 
        F_HM0_ADDR(2) => nc158, F_HM0_ADDR(1) => nc281, 
        F_HM0_ADDR(0) => nc209, F_HM0_ENABLE => OPEN, F_HM0_SEL
         => OPEN, F_HM0_SIZE(1) => nc246, F_HM0_SIZE(0) => nc368, 
        F_HM0_TRANS1 => OPEN, F_HM0_WDATA(31) => nc351, 
        F_HM0_WDATA(30) => nc162, F_HM0_WDATA(29) => nc11, 
        F_HM0_WDATA(28) => nc272, F_HM0_WDATA(27) => nc131, 
        F_HM0_WDATA(26) => nc364, F_HM0_WDATA(25) => nc254, 
        F_HM0_WDATA(24) => nc267, F_HM0_WDATA(23) => nc96, 
        F_HM0_WDATA(22) => nc79, F_HM0_WDATA(21) => nc226, 
        F_HM0_WDATA(20) => nc146, F_HM0_WDATA(19) => nc230, 
        F_HM0_WDATA(18) => nc89, F_HM0_WDATA(17) => nc119, 
        F_HM0_WDATA(16) => nc48, F_HM0_WDATA(15) => nc271, 
        F_HM0_WDATA(14) => nc213, F_HM0_WDATA(13) => nc366, 
        F_HM0_WDATA(12) => nc300, F_HM0_WDATA(11) => nc126, 
        F_HM0_WDATA(10) => nc195, F_HM0_WDATA(9) => nc188, 
        F_HM0_WDATA(8) => nc242, F_HM0_WDATA(7) => nc15, 
        F_HM0_WDATA(6) => nc308, F_HM0_WDATA(5) => nc236, 
        F_HM0_WDATA(4) => nc102, F_HM0_WDATA(3) => nc304, 
        F_HM0_WDATA(2) => nc3, F_HM0_WDATA(1) => nc207, 
        F_HM0_WDATA(0) => nc47, F_HM0_WRITE => OPEN, FAB_CHRGVBUS
         => OPEN, FAB_DISCHRGVBUS => OPEN, FAB_DMPULLDOWN => OPEN, 
        FAB_DPPULLDOWN => OPEN, FAB_DRVVBUS => OPEN, FAB_IDPULLUP
         => OPEN, FAB_OPMODE(1) => nc90, FAB_OPMODE(0) => nc284, 
        FAB_SUSPENDM => OPEN, FAB_TERMSEL => OPEN, FAB_TXVALID
         => OPEN, FAB_VCONTROL(3) => nc222, FAB_VCONTROL(2) => 
        nc159, FAB_VCONTROL(1) => nc136, FAB_VCONTROL(0) => nc241, 
        FAB_VCONTROLLOADM => OPEN, FAB_XCVRSEL(1) => nc253, 
        FAB_XCVRSEL(0) => nc178, FAB_XDATAOUT(7) => nc306, 
        FAB_XDATAOUT(6) => nc215, FAB_XDATAOUT(5) => nc59, 
        FAB_XDATAOUT(4) => nc362, FAB_XDATAOUT(3) => nc221, 
        FAB_XDATAOUT(2) => nc371, FAB_XDATAOUT(1) => nc232, 
        FAB_XDATAOUT(0) => nc274, FACC_GLMUX_SEL => OPEN, 
        FIC32_0_MASTER(1) => nc18, FIC32_0_MASTER(0) => nc44, 
        FIC32_1_MASTER(1) => nc117, FIC32_1_MASTER(0) => nc189, 
        FPGA_RESET_N => OPEN, GTX_CLK => OPEN, H2F_INTERRUPT(15)
         => nc164, H2F_INTERRUPT(14) => nc148, H2F_INTERRUPT(13)
         => nc42, H2F_INTERRUPT(12) => nc231, H2F_INTERRUPT(11)
         => nc191, H2F_INTERRUPT(10) => nc255, H2F_INTERRUPT(9)
         => nc283, H2F_INTERRUPT(8) => nc363, H2F_INTERRUPT(7)
         => nc341, H2F_INTERRUPT(6) => nc317, H2F_INTERRUPT(5)
         => nc290, H2F_INTERRUPT(4) => nc17, H2F_INTERRUPT(3) => 
        nc2, H2F_INTERRUPT(2) => nc302, H2F_INTERRUPT(1) => nc110, 
        H2F_INTERRUPT(0) => nc128, H2F_NMI => OPEN, H2FCALIB => 
        OPEN, I2C0_SCL_MGPIO31B_H2F_A => OPEN, 
        I2C0_SCL_MGPIO31B_H2F_B => OPEN, I2C0_SDA_MGPIO30B_H2F_A
         => OPEN, I2C0_SDA_MGPIO30B_H2F_B => OPEN, 
        I2C1_SCL_MGPIO1A_H2F_A => OPEN, I2C1_SCL_MGPIO1A_H2F_B
         => OPEN, I2C1_SDA_MGPIO0A_H2F_A => OPEN, 
        I2C1_SDA_MGPIO0A_H2F_B => OPEN, MDCF => OPEN, MDOENF => 
        OPEN, MDOF => OPEN, MMUART0_CTS_MGPIO19B_H2F_A => OPEN, 
        MMUART0_CTS_MGPIO19B_H2F_B => OPEN, 
        MMUART0_DCD_MGPIO22B_H2F_A => OPEN, 
        MMUART0_DCD_MGPIO22B_H2F_B => OPEN, 
        MMUART0_DSR_MGPIO20B_H2F_A => OPEN, 
        MMUART0_DSR_MGPIO20B_H2F_B => OPEN, 
        MMUART0_DTR_MGPIO18B_H2F_A => OPEN, 
        MMUART0_DTR_MGPIO18B_H2F_B => OPEN, 
        MMUART0_RI_MGPIO21B_H2F_A => OPEN, 
        MMUART0_RI_MGPIO21B_H2F_B => OPEN, 
        MMUART0_RTS_MGPIO17B_H2F_A => OPEN, 
        MMUART0_RTS_MGPIO17B_H2F_B => OPEN, 
        MMUART0_RXD_MGPIO28B_H2F_A => OPEN, 
        MMUART0_RXD_MGPIO28B_H2F_B => OPEN, 
        MMUART0_SCK_MGPIO29B_H2F_A => OPEN, 
        MMUART0_SCK_MGPIO29B_H2F_B => OPEN, 
        MMUART0_TXD_MGPIO27B_H2F_A => MMUART_0_TXD_M2F_c, 
        MMUART0_TXD_MGPIO27B_H2F_B => OPEN, 
        MMUART1_DTR_MGPIO12B_H2F_A => OPEN, 
        MMUART1_RTS_MGPIO11B_H2F_A => OPEN, 
        MMUART1_RTS_MGPIO11B_H2F_B => OPEN, 
        MMUART1_RXD_MGPIO26B_H2F_A => OPEN, 
        MMUART1_RXD_MGPIO26B_H2F_B => OPEN, 
        MMUART1_SCK_MGPIO25B_H2F_A => OPEN, 
        MMUART1_SCK_MGPIO25B_H2F_B => OPEN, 
        MMUART1_TXD_MGPIO24B_H2F_A => OPEN, 
        MMUART1_TXD_MGPIO24B_H2F_B => OPEN, MPLL_LOCK => OPEN, 
        PER2_FABRIC_PADDR(15) => nc244, PER2_FABRIC_PADDR(14) => 
        nc321, PER2_FABRIC_PADDR(13) => nc43, 
        PER2_FABRIC_PADDR(12) => nc179, PER2_FABRIC_PADDR(11) => 
        nc157, PER2_FABRIC_PADDR(10) => nc36, 
        PER2_FABRIC_PADDR(9) => nc224, PER2_FABRIC_PADDR(8) => 
        nc296, PER2_FABRIC_PADDR(7) => nc273, 
        PER2_FABRIC_PADDR(6) => nc61, PER2_FABRIC_PADDR(5) => 
        nc104, PER2_FABRIC_PADDR(4) => nc138, 
        PER2_FABRIC_PADDR(3) => nc14, PER2_FABRIC_PADDR(2) => 
        nc357, PER2_FABRIC_PENABLE => OPEN, PER2_FABRIC_PSEL => 
        OPEN, PER2_FABRIC_PWDATA(31) => nc285, 
        PER2_FABRIC_PWDATA(30) => nc303, PER2_FABRIC_PWDATA(29)
         => nc150, PER2_FABRIC_PWDATA(28) => nc365, 
        PER2_FABRIC_PWDATA(27) => nc331, PER2_FABRIC_PWDATA(26)
         => nc196, PER2_FABRIC_PWDATA(25) => nc234, 
        PER2_FABRIC_PWDATA(24) => nc149, PER2_FABRIC_PWDATA(23)
         => nc12, PER2_FABRIC_PWDATA(22) => nc219, 
        PER2_FABRIC_PWDATA(21) => nc30, PER2_FABRIC_PWDATA(20)
         => nc243, PER2_FABRIC_PWDATA(19) => nc187, 
        PER2_FABRIC_PWDATA(18) => nc65, PER2_FABRIC_PWDATA(17)
         => nc7, PER2_FABRIC_PWDATA(16) => nc292, 
        PER2_FABRIC_PWDATA(15) => nc129, PER2_FABRIC_PWDATA(14)
         => nc275, PER2_FABRIC_PWDATA(13) => nc8, 
        PER2_FABRIC_PWDATA(12) => nc223, PER2_FABRIC_PWDATA(11)
         => nc13, PER2_FABRIC_PWDATA(10) => nc305, 
        PER2_FABRIC_PWDATA(9) => nc180, PER2_FABRIC_PWDATA(8) => 
        nc26, PER2_FABRIC_PWDATA(7) => nc291, 
        PER2_FABRIC_PWDATA(6) => nc177, PER2_FABRIC_PWDATA(5) => 
        nc139, PER2_FABRIC_PWDATA(4) => nc310, 
        PER2_FABRIC_PWDATA(3) => nc259, PER2_FABRIC_PWDATA(2) => 
        nc245, PER2_FABRIC_PWDATA(1) => nc233, 
        PER2_FABRIC_PWDATA(0) => nc163, PER2_FABRIC_PWRITE => 
        OPEN, RTC_MATCH => OPEN, SLEEPDEEP => OPEN, SLEEPHOLDACK
         => OPEN, SLEEPING => OPEN, SMBALERT_NO0 => OPEN, 
        SMBALERT_NO1 => OPEN, SMBSUS_NO0 => OPEN, SMBSUS_NO1 => 
        OPEN, SPI0_CLK_OUT => OPEN, SPI0_SDI_MGPIO5A_H2F_A => 
        OPEN, SPI0_SDI_MGPIO5A_H2F_B => OPEN, 
        SPI0_SDO_MGPIO6A_H2F_A => OPEN, SPI0_SDO_MGPIO6A_H2F_B
         => OPEN, SPI0_SS0_MGPIO7A_H2F_A => OPEN, 
        SPI0_SS0_MGPIO7A_H2F_B => OPEN, SPI0_SS1_MGPIO8A_H2F_A
         => OPEN, SPI0_SS1_MGPIO8A_H2F_B => OPEN, 
        SPI0_SS2_MGPIO9A_H2F_A => OPEN, SPI0_SS2_MGPIO9A_H2F_B
         => OPEN, SPI0_SS3_MGPIO10A_H2F_A => OPEN, 
        SPI0_SS3_MGPIO10A_H2F_B => OPEN, SPI0_SS4_MGPIO19A_H2F_A
         => OPEN, SPI0_SS5_MGPIO20A_H2F_A => OPEN, 
        SPI0_SS6_MGPIO21A_H2F_A => OPEN, SPI0_SS7_MGPIO22A_H2F_A
         => OPEN, SPI1_CLK_OUT => OPEN, SPI1_SDI_MGPIO11A_H2F_A
         => OPEN, SPI1_SDI_MGPIO11A_H2F_B => OPEN, 
        SPI1_SDO_MGPIO12A_H2F_A => OPEN, SPI1_SDO_MGPIO12A_H2F_B
         => OPEN, SPI1_SS0_MGPIO13A_H2F_A => OPEN, 
        SPI1_SS0_MGPIO13A_H2F_B => OPEN, SPI1_SS1_MGPIO14A_H2F_A
         => OPEN, SPI1_SS1_MGPIO14A_H2F_B => OPEN, 
        SPI1_SS2_MGPIO15A_H2F_A => OPEN, SPI1_SS2_MGPIO15A_H2F_B
         => OPEN, SPI1_SS3_MGPIO16A_H2F_A => OPEN, 
        SPI1_SS3_MGPIO16A_H2F_B => OPEN, SPI1_SS4_MGPIO17A_H2F_A
         => OPEN, SPI1_SS5_MGPIO18A_H2F_A => OPEN, 
        SPI1_SS6_MGPIO23A_H2F_A => OPEN, SPI1_SS7_MGPIO24A_H2F_A
         => OPEN, TCGF(9) => nc318, TCGF(8) => nc268, TCGF(7) => 
        nc112, TCGF(6) => nc68, TCGF(5) => nc49, TCGF(4) => nc314, 
        TCGF(3) => nc217, TCGF(2) => nc170, TCGF(1) => nc91, 
        TCGF(0) => nc225, TRACECLK => OPEN, TRACEDATA(3) => nc5, 
        TRACEDATA(2) => nc20, TRACEDATA(1) => nc198, TRACEDATA(0)
         => nc147, TX_CLK => OPEN, TX_ENF => OPEN, TX_ERRF => 
        OPEN, TXCTL_EN_RIF => OPEN, TXD_RIF(3) => nc350, 
        TXD_RIF(2) => nc316, TXD_RIF(1) => nc67, TXD_RIF(0) => 
        nc289, TXDF(7) => nc358, TXDF(6) => nc294, TXDF(5) => 
        nc152, TXDF(4) => nc127, TXDF(3) => nc103, TXDF(2) => 
        nc235, TXDF(1) => nc76, TXDF(0) => nc347, TXEV => OPEN, 
        WDOGTIMEOUT => OPEN, F_ARREADY_HREADYOUT1 => OPEN, 
        F_AWREADY_HREADYOUT0 => OPEN, F_BID(3) => nc208, F_BID(2)
         => nc354, F_BID(1) => nc140, F_BID(0) => nc257, 
        F_BRESP_HRESP0(1) => nc86, F_BRESP_HRESP0(0) => nc95, 
        F_BVALID => OPEN, F_RDATA_HRDATA01(63) => nc327, 
        F_RDATA_HRDATA01(62) => nc120, F_RDATA_HRDATA01(61) => 
        nc165, F_RDATA_HRDATA01(60) => nc356, 
        F_RDATA_HRDATA01(59) => nc279, F_RDATA_HRDATA01(58) => 
        nc137, F_RDATA_HRDATA01(57) => nc64, F_RDATA_HRDATA01(56)
         => nc19, F_RDATA_HRDATA01(55) => nc369, 
        F_RDATA_HRDATA01(54) => nc312, F_RDATA_HRDATA01(53) => 
        nc70, F_RDATA_HRDATA01(52) => nc182, F_RDATA_HRDATA01(51)
         => nc62, F_RDATA_HRDATA01(50) => nc337, 
        F_RDATA_HRDATA01(49) => nc199, F_RDATA_HRDATA01(48) => 
        nc80, F_RDATA_HRDATA01(47) => nc130, F_RDATA_HRDATA01(46)
         => nc287, F_RDATA_HRDATA01(45) => nc98, 
        F_RDATA_HRDATA01(44) => nc293, F_RDATA_HRDATA01(43) => 
        nc249, F_RDATA_HRDATA01(42) => nc114, 
        F_RDATA_HRDATA01(41) => nc56, F_RDATA_HRDATA01(40) => 
        nc370, F_RDATA_HRDATA01(39) => nc105, 
        F_RDATA_HRDATA01(38) => nc63, F_RDATA_HRDATA01(37) => 
        nc352, F_RDATA_HRDATA01(36) => nc313, 
        F_RDATA_HRDATA01(35) => nc309, F_RDATA_HRDATA01(34) => 
        nc172, F_RDATA_HRDATA01(33) => nc229, 
        F_RDATA_HRDATA01(32) => nc374, F_RDATA_HRDATA01(31) => 
        nc277, F_RDATA_HRDATA01(30) => nc97, F_RDATA_HRDATA01(29)
         => nc161, F_RDATA_HRDATA01(28) => nc31, 
        F_RDATA_HRDATA01(27) => nc340, F_RDATA_HRDATA01(26) => 
        nc295, F_RDATA_HRDATA01(25) => nc154, 
        F_RDATA_HRDATA01(24) => nc50, F_RDATA_HRDATA01(23) => 
        nc260, F_RDATA_HRDATA01(22) => nc239, 
        F_RDATA_HRDATA01(21) => nc353, F_RDATA_HRDATA01(20) => 
        nc348, F_RDATA_HRDATA01(19) => nc142, 
        F_RDATA_HRDATA01(18) => nc320, F_RDATA_HRDATA01(17) => 
        nc344, F_RDATA_HRDATA01(16) => nc315, 
        F_RDATA_HRDATA01(15) => nc247, F_RDATA_HRDATA01(14) => 
        nc94, F_RDATA_HRDATA01(13) => nc197, F_RDATA_HRDATA01(12)
         => nc328, F_RDATA_HRDATA01(11) => nc122, 
        F_RDATA_HRDATA01(10) => nc266, F_RDATA_HRDATA01(9) => 
        nc35, F_RDATA_HRDATA01(8) => nc324, F_RDATA_HRDATA01(7)
         => nc4, F_RDATA_HRDATA01(6) => nc227, 
        F_RDATA_HRDATA01(5) => nc92, F_RDATA_HRDATA01(4) => nc101, 
        F_RDATA_HRDATA01(3) => nc346, F_RDATA_HRDATA01(2) => 
        nc330, F_RDATA_HRDATA01(1) => nc184, F_RDATA_HRDATA01(0)
         => nc200, F_RID(3) => nc190, F_RID(2) => nc166, F_RID(1)
         => nc372, F_RID(0) => nc355, F_RLAST => OPEN, 
        F_RRESP_HRESP1(1) => nc338, F_RRESP_HRESP1(0) => nc326, 
        F_RVALID => OPEN, F_WREADY => OPEN, 
        MDDR_FABRIC_PRDATA(15) => nc132, MDDR_FABRIC_PRDATA(14)
         => nc334, MDDR_FABRIC_PRDATA(13) => nc21, 
        MDDR_FABRIC_PRDATA(12) => nc237, MDDR_FABRIC_PRDATA(11)
         => nc93, MDDR_FABRIC_PRDATA(10) => nc262, 
        MDDR_FABRIC_PRDATA(9) => nc69, MDDR_FABRIC_PRDATA(8) => 
        nc206, MDDR_FABRIC_PRDATA(7) => nc174, 
        MDDR_FABRIC_PRDATA(6) => nc38, MDDR_FABRIC_PRDATA(5) => 
        nc113, MDDR_FABRIC_PRDATA(4) => nc336, 
        MDDR_FABRIC_PRDATA(3) => nc218, MDDR_FABRIC_PRDATA(2) => 
        nc342, MDDR_FABRIC_PRDATA(1) => nc373, 
        MDDR_FABRIC_PRDATA(0) => nc106, MDDR_FABRIC_PREADY => 
        OPEN, MDDR_FABRIC_PSLVERR => OPEN, CAN_RXBUS_F2H_SCP => 
        VCC_net_1, CAN_TX_EBL_F2H_SCP => VCC_net_1, 
        CAN_TXBUS_F2H_SCP => VCC_net_1, COLF => VCC_net_1, CRSF
         => VCC_net_1, F2_DMAREADY(1) => VCC_net_1, 
        F2_DMAREADY(0) => VCC_net_1, F2H_INTERRUPT(15) => 
        GND_net_1, F2H_INTERRUPT(14) => GND_net_1, 
        F2H_INTERRUPT(13) => GND_net_1, F2H_INTERRUPT(12) => 
        GND_net_1, F2H_INTERRUPT(11) => GND_net_1, 
        F2H_INTERRUPT(10) => GND_net_1, F2H_INTERRUPT(9) => 
        GND_net_1, F2H_INTERRUPT(8) => GND_net_1, 
        F2H_INTERRUPT(7) => GND_net_1, F2H_INTERRUPT(6) => 
        GND_net_1, F2H_INTERRUPT(5) => GND_net_1, 
        F2H_INTERRUPT(4) => GND_net_1, F2H_INTERRUPT(3) => 
        GND_net_1, F2H_INTERRUPT(2) => GND_net_1, 
        F2H_INTERRUPT(1) => GND_net_1, F2H_INTERRUPT(0) => 
        GND_net_1, F2HCALIB => VCC_net_1, F_DMAREADY(1) => 
        VCC_net_1, F_DMAREADY(0) => VCC_net_1, F_FM0_ADDR(31) => 
        GND_net_1, F_FM0_ADDR(30) => GND_net_1, F_FM0_ADDR(29)
         => GND_net_1, F_FM0_ADDR(28) => GND_net_1, 
        F_FM0_ADDR(27) => GND_net_1, F_FM0_ADDR(26) => GND_net_1, 
        F_FM0_ADDR(25) => GND_net_1, F_FM0_ADDR(24) => GND_net_1, 
        F_FM0_ADDR(23) => GND_net_1, F_FM0_ADDR(22) => GND_net_1, 
        F_FM0_ADDR(21) => GND_net_1, F_FM0_ADDR(20) => GND_net_1, 
        F_FM0_ADDR(19) => GND_net_1, F_FM0_ADDR(18) => GND_net_1, 
        F_FM0_ADDR(17) => GND_net_1, F_FM0_ADDR(16) => GND_net_1, 
        F_FM0_ADDR(15) => GND_net_1, F_FM0_ADDR(14) => GND_net_1, 
        F_FM0_ADDR(13) => GND_net_1, F_FM0_ADDR(12) => GND_net_1, 
        F_FM0_ADDR(11) => GND_net_1, F_FM0_ADDR(10) => GND_net_1, 
        F_FM0_ADDR(9) => GND_net_1, F_FM0_ADDR(8) => GND_net_1, 
        F_FM0_ADDR(7) => GND_net_1, F_FM0_ADDR(6) => GND_net_1, 
        F_FM0_ADDR(5) => GND_net_1, F_FM0_ADDR(4) => GND_net_1, 
        F_FM0_ADDR(3) => GND_net_1, F_FM0_ADDR(2) => GND_net_1, 
        F_FM0_ADDR(1) => GND_net_1, F_FM0_ADDR(0) => GND_net_1, 
        F_FM0_ENABLE => GND_net_1, F_FM0_MASTLOCK => GND_net_1, 
        F_FM0_READY => VCC_net_1, F_FM0_SEL => GND_net_1, 
        F_FM0_SIZE(1) => GND_net_1, F_FM0_SIZE(0) => GND_net_1, 
        F_FM0_TRANS1 => GND_net_1, F_FM0_WDATA(31) => GND_net_1, 
        F_FM0_WDATA(30) => GND_net_1, F_FM0_WDATA(29) => 
        GND_net_1, F_FM0_WDATA(28) => GND_net_1, F_FM0_WDATA(27)
         => GND_net_1, F_FM0_WDATA(26) => GND_net_1, 
        F_FM0_WDATA(25) => GND_net_1, F_FM0_WDATA(24) => 
        GND_net_1, F_FM0_WDATA(23) => GND_net_1, F_FM0_WDATA(22)
         => GND_net_1, F_FM0_WDATA(21) => GND_net_1, 
        F_FM0_WDATA(20) => GND_net_1, F_FM0_WDATA(19) => 
        GND_net_1, F_FM0_WDATA(18) => GND_net_1, F_FM0_WDATA(17)
         => GND_net_1, F_FM0_WDATA(16) => GND_net_1, 
        F_FM0_WDATA(15) => GND_net_1, F_FM0_WDATA(14) => 
        GND_net_1, F_FM0_WDATA(13) => GND_net_1, F_FM0_WDATA(12)
         => GND_net_1, F_FM0_WDATA(11) => GND_net_1, 
        F_FM0_WDATA(10) => GND_net_1, F_FM0_WDATA(9) => GND_net_1, 
        F_FM0_WDATA(8) => GND_net_1, F_FM0_WDATA(7) => GND_net_1, 
        F_FM0_WDATA(6) => GND_net_1, F_FM0_WDATA(5) => GND_net_1, 
        F_FM0_WDATA(4) => GND_net_1, F_FM0_WDATA(3) => GND_net_1, 
        F_FM0_WDATA(2) => GND_net_1, F_FM0_WDATA(1) => GND_net_1, 
        F_FM0_WDATA(0) => GND_net_1, F_FM0_WRITE => GND_net_1, 
        F_HM0_RDATA(31) => GND_net_1, F_HM0_RDATA(30) => 
        GND_net_1, F_HM0_RDATA(29) => GND_net_1, F_HM0_RDATA(28)
         => GND_net_1, F_HM0_RDATA(27) => GND_net_1, 
        F_HM0_RDATA(26) => GND_net_1, F_HM0_RDATA(25) => 
        GND_net_1, F_HM0_RDATA(24) => GND_net_1, F_HM0_RDATA(23)
         => GND_net_1, F_HM0_RDATA(22) => GND_net_1, 
        F_HM0_RDATA(21) => GND_net_1, F_HM0_RDATA(20) => 
        GND_net_1, F_HM0_RDATA(19) => GND_net_1, F_HM0_RDATA(18)
         => GND_net_1, F_HM0_RDATA(17) => GND_net_1, 
        F_HM0_RDATA(16) => GND_net_1, F_HM0_RDATA(15) => 
        GND_net_1, F_HM0_RDATA(14) => GND_net_1, F_HM0_RDATA(13)
         => GND_net_1, F_HM0_RDATA(12) => GND_net_1, 
        F_HM0_RDATA(11) => GND_net_1, F_HM0_RDATA(10) => 
        GND_net_1, F_HM0_RDATA(9) => GND_net_1, F_HM0_RDATA(8)
         => GND_net_1, F_HM0_RDATA(7) => GND_net_1, 
        F_HM0_RDATA(6) => GND_net_1, F_HM0_RDATA(5) => GND_net_1, 
        F_HM0_RDATA(4) => GND_net_1, F_HM0_RDATA(3) => GND_net_1, 
        F_HM0_RDATA(2) => GND_net_1, F_HM0_RDATA(1) => GND_net_1, 
        F_HM0_RDATA(0) => GND_net_1, F_HM0_READY => VCC_net_1, 
        F_HM0_RESP => GND_net_1, FAB_AVALID => VCC_net_1, 
        FAB_HOSTDISCON => VCC_net_1, FAB_IDDIG => VCC_net_1, 
        FAB_LINESTATE(1) => VCC_net_1, FAB_LINESTATE(0) => 
        VCC_net_1, FAB_M3_RESET_N => AND2_0_Y, FAB_PLL_LOCK => 
        VCC_net_1, FAB_RXACTIVE => VCC_net_1, FAB_RXERROR => 
        VCC_net_1, FAB_RXVALID => VCC_net_1, FAB_RXVALIDH => 
        GND_net_1, FAB_SESSEND => VCC_net_1, FAB_TXREADY => 
        VCC_net_1, FAB_VBUSVALID => VCC_net_1, FAB_VSTATUS(7) => 
        VCC_net_1, FAB_VSTATUS(6) => VCC_net_1, FAB_VSTATUS(5)
         => VCC_net_1, FAB_VSTATUS(4) => VCC_net_1, 
        FAB_VSTATUS(3) => VCC_net_1, FAB_VSTATUS(2) => VCC_net_1, 
        FAB_VSTATUS(1) => VCC_net_1, FAB_VSTATUS(0) => VCC_net_1, 
        FAB_XDATAIN(7) => VCC_net_1, FAB_XDATAIN(6) => VCC_net_1, 
        FAB_XDATAIN(5) => VCC_net_1, FAB_XDATAIN(4) => VCC_net_1, 
        FAB_XDATAIN(3) => VCC_net_1, FAB_XDATAIN(2) => VCC_net_1, 
        FAB_XDATAIN(1) => VCC_net_1, FAB_XDATAIN(0) => VCC_net_1, 
        GTX_CLKPF => VCC_net_1, I2C0_BCLK => VCC_net_1, 
        I2C0_SCL_F2H_SCP => VCC_net_1, I2C0_SDA_F2H_SCP => 
        VCC_net_1, I2C1_BCLK => VCC_net_1, I2C1_SCL_F2H_SCP => 
        VCC_net_1, I2C1_SDA_F2H_SCP => VCC_net_1, MDIF => 
        VCC_net_1, MGPIO0A_F2H_GPIN => VCC_net_1, 
        MGPIO10A_F2H_GPIN => VCC_net_1, MGPIO11A_F2H_GPIN => 
        VCC_net_1, MGPIO11B_F2H_GPIN => VCC_net_1, 
        MGPIO12A_F2H_GPIN => VCC_net_1, MGPIO13A_F2H_GPIN => 
        VCC_net_1, MGPIO14A_F2H_GPIN => VCC_net_1, 
        MGPIO15A_F2H_GPIN => VCC_net_1, MGPIO16A_F2H_GPIN => 
        VCC_net_1, MGPIO17B_F2H_GPIN => VCC_net_1, 
        MGPIO18B_F2H_GPIN => VCC_net_1, MGPIO19B_F2H_GPIN => 
        VCC_net_1, MGPIO1A_F2H_GPIN => VCC_net_1, 
        MGPIO20B_F2H_GPIN => VCC_net_1, MGPIO21B_F2H_GPIN => 
        VCC_net_1, MGPIO22B_F2H_GPIN => VCC_net_1, 
        MGPIO24B_F2H_GPIN => VCC_net_1, MGPIO25B_F2H_GPIN => 
        VCC_net_1, MGPIO26B_F2H_GPIN => VCC_net_1, 
        MGPIO27B_F2H_GPIN => VCC_net_1, MGPIO28B_F2H_GPIN => 
        VCC_net_1, MGPIO29B_F2H_GPIN => VCC_net_1, 
        MGPIO2A_F2H_GPIN => VCC_net_1, MGPIO30B_F2H_GPIN => 
        VCC_net_1, MGPIO31B_F2H_GPIN => VCC_net_1, 
        MGPIO3A_F2H_GPIN => VCC_net_1, MGPIO4A_F2H_GPIN => 
        VCC_net_1, MGPIO5A_F2H_GPIN => VCC_net_1, 
        MGPIO6A_F2H_GPIN => VCC_net_1, MGPIO7A_F2H_GPIN => 
        VCC_net_1, MGPIO8A_F2H_GPIN => VCC_net_1, 
        MGPIO9A_F2H_GPIN => VCC_net_1, MMUART0_CTS_F2H_SCP => 
        VCC_net_1, MMUART0_DCD_F2H_SCP => VCC_net_1, 
        MMUART0_DSR_F2H_SCP => VCC_net_1, MMUART0_DTR_F2H_SCP => 
        VCC_net_1, MMUART0_RI_F2H_SCP => VCC_net_1, 
        MMUART0_RTS_F2H_SCP => VCC_net_1, MMUART0_RXD_F2H_SCP => 
        MMUART_0_RXD_F2M_c, MMUART0_SCK_F2H_SCP => VCC_net_1, 
        MMUART0_TXD_F2H_SCP => VCC_net_1, MMUART1_CTS_F2H_SCP => 
        VCC_net_1, MMUART1_DCD_F2H_SCP => VCC_net_1, 
        MMUART1_DSR_F2H_SCP => VCC_net_1, MMUART1_RI_F2H_SCP => 
        VCC_net_1, MMUART1_RTS_F2H_SCP => VCC_net_1, 
        MMUART1_RXD_F2H_SCP => VCC_net_1, MMUART1_SCK_F2H_SCP => 
        VCC_net_1, MMUART1_TXD_F2H_SCP => VCC_net_1, 
        PER2_FABRIC_PRDATA(31) => VCC_net_1, 
        PER2_FABRIC_PRDATA(30) => VCC_net_1, 
        PER2_FABRIC_PRDATA(29) => VCC_net_1, 
        PER2_FABRIC_PRDATA(28) => VCC_net_1, 
        PER2_FABRIC_PRDATA(27) => VCC_net_1, 
        PER2_FABRIC_PRDATA(26) => VCC_net_1, 
        PER2_FABRIC_PRDATA(25) => VCC_net_1, 
        PER2_FABRIC_PRDATA(24) => VCC_net_1, 
        PER2_FABRIC_PRDATA(23) => VCC_net_1, 
        PER2_FABRIC_PRDATA(22) => VCC_net_1, 
        PER2_FABRIC_PRDATA(21) => VCC_net_1, 
        PER2_FABRIC_PRDATA(20) => VCC_net_1, 
        PER2_FABRIC_PRDATA(19) => VCC_net_1, 
        PER2_FABRIC_PRDATA(18) => VCC_net_1, 
        PER2_FABRIC_PRDATA(17) => VCC_net_1, 
        PER2_FABRIC_PRDATA(16) => VCC_net_1, 
        PER2_FABRIC_PRDATA(15) => VCC_net_1, 
        PER2_FABRIC_PRDATA(14) => VCC_net_1, 
        PER2_FABRIC_PRDATA(13) => VCC_net_1, 
        PER2_FABRIC_PRDATA(12) => VCC_net_1, 
        PER2_FABRIC_PRDATA(11) => VCC_net_1, 
        PER2_FABRIC_PRDATA(10) => VCC_net_1, 
        PER2_FABRIC_PRDATA(9) => VCC_net_1, PER2_FABRIC_PRDATA(8)
         => VCC_net_1, PER2_FABRIC_PRDATA(7) => VCC_net_1, 
        PER2_FABRIC_PRDATA(6) => VCC_net_1, PER2_FABRIC_PRDATA(5)
         => VCC_net_1, PER2_FABRIC_PRDATA(4) => VCC_net_1, 
        PER2_FABRIC_PRDATA(3) => VCC_net_1, PER2_FABRIC_PRDATA(2)
         => VCC_net_1, PER2_FABRIC_PRDATA(1) => VCC_net_1, 
        PER2_FABRIC_PRDATA(0) => VCC_net_1, PER2_FABRIC_PREADY
         => VCC_net_1, PER2_FABRIC_PSLVERR => VCC_net_1, RCGF(9)
         => VCC_net_1, RCGF(8) => VCC_net_1, RCGF(7) => VCC_net_1, 
        RCGF(6) => VCC_net_1, RCGF(5) => VCC_net_1, RCGF(4) => 
        VCC_net_1, RCGF(3) => VCC_net_1, RCGF(2) => VCC_net_1, 
        RCGF(1) => VCC_net_1, RCGF(0) => VCC_net_1, RX_CLKPF => 
        VCC_net_1, RX_DVF => VCC_net_1, RX_ERRF => VCC_net_1, 
        RX_EV => VCC_net_1, RXDF(7) => VCC_net_1, RXDF(6) => 
        VCC_net_1, RXDF(5) => VCC_net_1, RXDF(4) => VCC_net_1, 
        RXDF(3) => VCC_net_1, RXDF(2) => VCC_net_1, RXDF(1) => 
        VCC_net_1, RXDF(0) => VCC_net_1, SLEEPHOLDREQ => 
        GND_net_1, SMBALERT_NI0 => VCC_net_1, SMBALERT_NI1 => 
        VCC_net_1, SMBSUS_NI0 => VCC_net_1, SMBSUS_NI1 => 
        VCC_net_1, SPI0_CLK_IN => VCC_net_1, SPI0_SDI_F2H_SCP => 
        VCC_net_1, SPI0_SDO_F2H_SCP => VCC_net_1, 
        SPI0_SS0_F2H_SCP => VCC_net_1, SPI0_SS1_F2H_SCP => 
        VCC_net_1, SPI0_SS2_F2H_SCP => VCC_net_1, 
        SPI0_SS3_F2H_SCP => VCC_net_1, SPI1_CLK_IN => VCC_net_1, 
        SPI1_SDI_F2H_SCP => VCC_net_1, SPI1_SDO_F2H_SCP => 
        VCC_net_1, SPI1_SS0_F2H_SCP => VCC_net_1, 
        SPI1_SS1_F2H_SCP => VCC_net_1, SPI1_SS2_F2H_SCP => 
        VCC_net_1, SPI1_SS3_F2H_SCP => VCC_net_1, TX_CLKPF => 
        VCC_net_1, USER_MSS_GPIO_RESET_N => VCC_net_1, 
        USER_MSS_RESET_N => AND2_0_Y, XCLK_FAB => VCC_net_1, 
        CLK_BASE => OSC_0_RCOSC_25_50MHZ_O2F, CLK_MDDR_APB => 
        VCC_net_1, F_ARADDR_HADDR1(31) => VCC_net_1, 
        F_ARADDR_HADDR1(30) => VCC_net_1, F_ARADDR_HADDR1(29) => 
        VCC_net_1, F_ARADDR_HADDR1(28) => VCC_net_1, 
        F_ARADDR_HADDR1(27) => VCC_net_1, F_ARADDR_HADDR1(26) => 
        VCC_net_1, F_ARADDR_HADDR1(25) => VCC_net_1, 
        F_ARADDR_HADDR1(24) => VCC_net_1, F_ARADDR_HADDR1(23) => 
        VCC_net_1, F_ARADDR_HADDR1(22) => VCC_net_1, 
        F_ARADDR_HADDR1(21) => VCC_net_1, F_ARADDR_HADDR1(20) => 
        VCC_net_1, F_ARADDR_HADDR1(19) => VCC_net_1, 
        F_ARADDR_HADDR1(18) => VCC_net_1, F_ARADDR_HADDR1(17) => 
        VCC_net_1, F_ARADDR_HADDR1(16) => VCC_net_1, 
        F_ARADDR_HADDR1(15) => VCC_net_1, F_ARADDR_HADDR1(14) => 
        VCC_net_1, F_ARADDR_HADDR1(13) => VCC_net_1, 
        F_ARADDR_HADDR1(12) => VCC_net_1, F_ARADDR_HADDR1(11) => 
        VCC_net_1, F_ARADDR_HADDR1(10) => VCC_net_1, 
        F_ARADDR_HADDR1(9) => VCC_net_1, F_ARADDR_HADDR1(8) => 
        VCC_net_1, F_ARADDR_HADDR1(7) => VCC_net_1, 
        F_ARADDR_HADDR1(6) => VCC_net_1, F_ARADDR_HADDR1(5) => 
        VCC_net_1, F_ARADDR_HADDR1(4) => VCC_net_1, 
        F_ARADDR_HADDR1(3) => VCC_net_1, F_ARADDR_HADDR1(2) => 
        VCC_net_1, F_ARADDR_HADDR1(1) => VCC_net_1, 
        F_ARADDR_HADDR1(0) => VCC_net_1, F_ARBURST_HTRANS1(1) => 
        GND_net_1, F_ARBURST_HTRANS1(0) => GND_net_1, 
        F_ARID_HSEL1(3) => GND_net_1, F_ARID_HSEL1(2) => 
        GND_net_1, F_ARID_HSEL1(1) => GND_net_1, F_ARID_HSEL1(0)
         => GND_net_1, F_ARLEN_HBURST1(3) => GND_net_1, 
        F_ARLEN_HBURST1(2) => GND_net_1, F_ARLEN_HBURST1(1) => 
        GND_net_1, F_ARLEN_HBURST1(0) => GND_net_1, 
        F_ARLOCK_HMASTLOCK1(1) => GND_net_1, 
        F_ARLOCK_HMASTLOCK1(0) => GND_net_1, F_ARSIZE_HSIZE1(1)
         => GND_net_1, F_ARSIZE_HSIZE1(0) => GND_net_1, 
        F_ARVALID_HWRITE1 => GND_net_1, F_AWADDR_HADDR0(31) => 
        VCC_net_1, F_AWADDR_HADDR0(30) => VCC_net_1, 
        F_AWADDR_HADDR0(29) => VCC_net_1, F_AWADDR_HADDR0(28) => 
        VCC_net_1, F_AWADDR_HADDR0(27) => VCC_net_1, 
        F_AWADDR_HADDR0(26) => VCC_net_1, F_AWADDR_HADDR0(25) => 
        VCC_net_1, F_AWADDR_HADDR0(24) => VCC_net_1, 
        F_AWADDR_HADDR0(23) => VCC_net_1, F_AWADDR_HADDR0(22) => 
        VCC_net_1, F_AWADDR_HADDR0(21) => VCC_net_1, 
        F_AWADDR_HADDR0(20) => VCC_net_1, F_AWADDR_HADDR0(19) => 
        VCC_net_1, F_AWADDR_HADDR0(18) => VCC_net_1, 
        F_AWADDR_HADDR0(17) => VCC_net_1, F_AWADDR_HADDR0(16) => 
        VCC_net_1, F_AWADDR_HADDR0(15) => VCC_net_1, 
        F_AWADDR_HADDR0(14) => VCC_net_1, F_AWADDR_HADDR0(13) => 
        VCC_net_1, F_AWADDR_HADDR0(12) => VCC_net_1, 
        F_AWADDR_HADDR0(11) => VCC_net_1, F_AWADDR_HADDR0(10) => 
        VCC_net_1, F_AWADDR_HADDR0(9) => VCC_net_1, 
        F_AWADDR_HADDR0(8) => VCC_net_1, F_AWADDR_HADDR0(7) => 
        VCC_net_1, F_AWADDR_HADDR0(6) => VCC_net_1, 
        F_AWADDR_HADDR0(5) => VCC_net_1, F_AWADDR_HADDR0(4) => 
        VCC_net_1, F_AWADDR_HADDR0(3) => VCC_net_1, 
        F_AWADDR_HADDR0(2) => VCC_net_1, F_AWADDR_HADDR0(1) => 
        VCC_net_1, F_AWADDR_HADDR0(0) => VCC_net_1, 
        F_AWBURST_HTRANS0(1) => GND_net_1, F_AWBURST_HTRANS0(0)
         => GND_net_1, F_AWID_HSEL0(3) => GND_net_1, 
        F_AWID_HSEL0(2) => GND_net_1, F_AWID_HSEL0(1) => 
        GND_net_1, F_AWID_HSEL0(0) => GND_net_1, 
        F_AWLEN_HBURST0(3) => GND_net_1, F_AWLEN_HBURST0(2) => 
        GND_net_1, F_AWLEN_HBURST0(1) => GND_net_1, 
        F_AWLEN_HBURST0(0) => GND_net_1, F_AWLOCK_HMASTLOCK0(1)
         => GND_net_1, F_AWLOCK_HMASTLOCK0(0) => GND_net_1, 
        F_AWSIZE_HSIZE0(1) => GND_net_1, F_AWSIZE_HSIZE0(0) => 
        GND_net_1, F_AWVALID_HWRITE0 => GND_net_1, F_BREADY => 
        GND_net_1, F_RMW_AXI => GND_net_1, F_RREADY => GND_net_1, 
        F_WDATA_HWDATA01(63) => VCC_net_1, F_WDATA_HWDATA01(62)
         => VCC_net_1, F_WDATA_HWDATA01(61) => VCC_net_1, 
        F_WDATA_HWDATA01(60) => VCC_net_1, F_WDATA_HWDATA01(59)
         => VCC_net_1, F_WDATA_HWDATA01(58) => VCC_net_1, 
        F_WDATA_HWDATA01(57) => VCC_net_1, F_WDATA_HWDATA01(56)
         => VCC_net_1, F_WDATA_HWDATA01(55) => VCC_net_1, 
        F_WDATA_HWDATA01(54) => VCC_net_1, F_WDATA_HWDATA01(53)
         => VCC_net_1, F_WDATA_HWDATA01(52) => VCC_net_1, 
        F_WDATA_HWDATA01(51) => VCC_net_1, F_WDATA_HWDATA01(50)
         => VCC_net_1, F_WDATA_HWDATA01(49) => VCC_net_1, 
        F_WDATA_HWDATA01(48) => VCC_net_1, F_WDATA_HWDATA01(47)
         => VCC_net_1, F_WDATA_HWDATA01(46) => VCC_net_1, 
        F_WDATA_HWDATA01(45) => VCC_net_1, F_WDATA_HWDATA01(44)
         => VCC_net_1, F_WDATA_HWDATA01(43) => VCC_net_1, 
        F_WDATA_HWDATA01(42) => VCC_net_1, F_WDATA_HWDATA01(41)
         => VCC_net_1, F_WDATA_HWDATA01(40) => VCC_net_1, 
        F_WDATA_HWDATA01(39) => VCC_net_1, F_WDATA_HWDATA01(38)
         => VCC_net_1, F_WDATA_HWDATA01(37) => VCC_net_1, 
        F_WDATA_HWDATA01(36) => VCC_net_1, F_WDATA_HWDATA01(35)
         => VCC_net_1, F_WDATA_HWDATA01(34) => VCC_net_1, 
        F_WDATA_HWDATA01(33) => VCC_net_1, F_WDATA_HWDATA01(32)
         => VCC_net_1, F_WDATA_HWDATA01(31) => VCC_net_1, 
        F_WDATA_HWDATA01(30) => VCC_net_1, F_WDATA_HWDATA01(29)
         => VCC_net_1, F_WDATA_HWDATA01(28) => VCC_net_1, 
        F_WDATA_HWDATA01(27) => VCC_net_1, F_WDATA_HWDATA01(26)
         => VCC_net_1, F_WDATA_HWDATA01(25) => VCC_net_1, 
        F_WDATA_HWDATA01(24) => VCC_net_1, F_WDATA_HWDATA01(23)
         => VCC_net_1, F_WDATA_HWDATA01(22) => VCC_net_1, 
        F_WDATA_HWDATA01(21) => VCC_net_1, F_WDATA_HWDATA01(20)
         => VCC_net_1, F_WDATA_HWDATA01(19) => VCC_net_1, 
        F_WDATA_HWDATA01(18) => VCC_net_1, F_WDATA_HWDATA01(17)
         => VCC_net_1, F_WDATA_HWDATA01(16) => VCC_net_1, 
        F_WDATA_HWDATA01(15) => VCC_net_1, F_WDATA_HWDATA01(14)
         => VCC_net_1, F_WDATA_HWDATA01(13) => VCC_net_1, 
        F_WDATA_HWDATA01(12) => VCC_net_1, F_WDATA_HWDATA01(11)
         => VCC_net_1, F_WDATA_HWDATA01(10) => VCC_net_1, 
        F_WDATA_HWDATA01(9) => VCC_net_1, F_WDATA_HWDATA01(8) => 
        VCC_net_1, F_WDATA_HWDATA01(7) => VCC_net_1, 
        F_WDATA_HWDATA01(6) => VCC_net_1, F_WDATA_HWDATA01(5) => 
        VCC_net_1, F_WDATA_HWDATA01(4) => VCC_net_1, 
        F_WDATA_HWDATA01(3) => VCC_net_1, F_WDATA_HWDATA01(2) => 
        VCC_net_1, F_WDATA_HWDATA01(1) => VCC_net_1, 
        F_WDATA_HWDATA01(0) => VCC_net_1, F_WID_HREADY01(3) => 
        GND_net_1, F_WID_HREADY01(2) => GND_net_1, 
        F_WID_HREADY01(1) => GND_net_1, F_WID_HREADY01(0) => 
        GND_net_1, F_WLAST => GND_net_1, F_WSTRB(7) => GND_net_1, 
        F_WSTRB(6) => GND_net_1, F_WSTRB(5) => GND_net_1, 
        F_WSTRB(4) => GND_net_1, F_WSTRB(3) => GND_net_1, 
        F_WSTRB(2) => GND_net_1, F_WSTRB(1) => GND_net_1, 
        F_WSTRB(0) => GND_net_1, F_WVALID => GND_net_1, 
        FPGA_MDDR_ARESET_N => VCC_net_1, MDDR_FABRIC_PADDR(10)
         => VCC_net_1, MDDR_FABRIC_PADDR(9) => VCC_net_1, 
        MDDR_FABRIC_PADDR(8) => VCC_net_1, MDDR_FABRIC_PADDR(7)
         => VCC_net_1, MDDR_FABRIC_PADDR(6) => VCC_net_1, 
        MDDR_FABRIC_PADDR(5) => VCC_net_1, MDDR_FABRIC_PADDR(4)
         => VCC_net_1, MDDR_FABRIC_PADDR(3) => VCC_net_1, 
        MDDR_FABRIC_PADDR(2) => VCC_net_1, MDDR_FABRIC_PENABLE
         => VCC_net_1, MDDR_FABRIC_PSEL => VCC_net_1, 
        MDDR_FABRIC_PWDATA(15) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(14) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(13) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(12) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(11) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(10) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(9) => VCC_net_1, MDDR_FABRIC_PWDATA(8)
         => VCC_net_1, MDDR_FABRIC_PWDATA(7) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(6) => VCC_net_1, MDDR_FABRIC_PWDATA(5)
         => VCC_net_1, MDDR_FABRIC_PWDATA(4) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(3) => VCC_net_1, MDDR_FABRIC_PWDATA(2)
         => VCC_net_1, MDDR_FABRIC_PWDATA(1) => VCC_net_1, 
        MDDR_FABRIC_PWDATA(0) => VCC_net_1, MDDR_FABRIC_PWRITE
         => VCC_net_1, PRESET_N => GND_net_1, 
        CAN_RXBUS_USBA_DATA1_MGPIO3A_IN => GND_net_1, 
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_IN => GND_net_1, 
        CAN_TXBUS_USBA_DATA0_MGPIO2A_IN => GND_net_1, DM_IN(2)
         => GND_net_1, DM_IN(1) => GND_net_1, DM_IN(0) => 
        GND_net_1, DRAM_DQ_IN(17) => GND_net_1, DRAM_DQ_IN(16)
         => GND_net_1, DRAM_DQ_IN(15) => GND_net_1, 
        DRAM_DQ_IN(14) => GND_net_1, DRAM_DQ_IN(13) => GND_net_1, 
        DRAM_DQ_IN(12) => GND_net_1, DRAM_DQ_IN(11) => GND_net_1, 
        DRAM_DQ_IN(10) => GND_net_1, DRAM_DQ_IN(9) => GND_net_1, 
        DRAM_DQ_IN(8) => GND_net_1, DRAM_DQ_IN(7) => GND_net_1, 
        DRAM_DQ_IN(6) => GND_net_1, DRAM_DQ_IN(5) => GND_net_1, 
        DRAM_DQ_IN(4) => GND_net_1, DRAM_DQ_IN(3) => GND_net_1, 
        DRAM_DQ_IN(2) => GND_net_1, DRAM_DQ_IN(1) => GND_net_1, 
        DRAM_DQ_IN(0) => GND_net_1, DRAM_DQS_IN(2) => GND_net_1, 
        DRAM_DQS_IN(1) => GND_net_1, DRAM_DQS_IN(0) => GND_net_1, 
        DRAM_FIFO_WE_IN(1) => GND_net_1, DRAM_FIFO_WE_IN(0) => 
        GND_net_1, I2C0_SCL_USBC_DATA1_MGPIO31B_IN => GND_net_1, 
        I2C0_SDA_USBC_DATA0_MGPIO30B_IN => GND_net_1, 
        I2C1_SCL_USBA_DATA4_MGPIO1A_IN => GND_net_1, 
        I2C1_SDA_USBA_DATA3_MGPIO0A_IN => GND_net_1, 
        MMUART0_CTS_USBC_DATA7_MGPIO19B_IN => GND_net_1, 
        MMUART0_DCD_MGPIO22B_IN => GND_net_1, 
        MMUART0_DSR_MGPIO20B_IN => GND_net_1, 
        MMUART0_DTR_USBC_DATA6_MGPIO18B_IN => GND_net_1, 
        MMUART0_RI_MGPIO21B_IN => GND_net_1, 
        MMUART0_RTS_USBC_DATA5_MGPIO17B_IN => GND_net_1, 
        MMUART0_RXD_USBC_STP_MGPIO28B_IN => GND_net_1, 
        MMUART0_SCK_USBC_NXT_MGPIO29B_IN => GND_net_1, 
        MMUART0_TXD_USBC_DIR_MGPIO27B_IN => GND_net_1, 
        MMUART1_RXD_USBC_DATA3_MGPIO26B_IN => GND_net_1, 
        MMUART1_SCK_USBC_DATA4_MGPIO25B_IN => GND_net_1, 
        MMUART1_TXD_USBC_DATA2_MGPIO24B_IN => GND_net_1, 
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_IN => 
        USB_ULPI_XCLK_PAD_Y, RGMII_MDC_RMII_MDC_IN => GND_net_1, 
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_IN => 
        USB_ULPI_DATA_7_PAD_Y, RGMII_RX_CLK_IN => GND_net_1, 
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_IN => 
        USB_ULPI_DATA_2_PAD_Y, RGMII_RXD0_RMII_RXD0_USBB_DATA0_IN
         => USB_ULPI_DATA_0_PAD_Y, 
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_IN => 
        USB_ULPI_DATA_1_PAD_Y, 
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_IN => 
        USB_ULPI_DATA_3_PAD_Y, RGMII_RXD3_USBB_DATA4_IN => 
        USB_ULPI_DATA_4_PAD_Y, RGMII_TX_CLK_IN => GND_net_1, 
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_IN => USB_ULPI_NXT_PAD_Y, 
        RGMII_TXD0_RMII_TXD0_USBB_DIR_IN => USB_ULPI_DIR_PAD_Y, 
        RGMII_TXD1_RMII_TXD1_USBB_STP_IN => GND_net_1, 
        RGMII_TXD2_USBB_DATA5_IN => USB_ULPI_DATA_5_PAD_Y, 
        RGMII_TXD3_USBB_DATA6_IN => USB_ULPI_DATA_6_PAD_Y, 
        SPI0_SCK_USBA_XCLK_IN => GND_net_1, 
        SPI0_SDI_USBA_DIR_MGPIO5A_IN => GND_net_1, 
        SPI0_SDO_USBA_STP_MGPIO6A_IN => GND_net_1, 
        SPI0_SS0_USBA_NXT_MGPIO7A_IN => GND_net_1, 
        SPI0_SS1_USBA_DATA5_MGPIO8A_IN => GND_net_1, 
        SPI0_SS2_USBA_DATA6_MGPIO9A_IN => GND_net_1, 
        SPI0_SS3_USBA_DATA7_MGPIO10A_IN => GND_net_1, SPI1_SCK_IN
         => GND_net_1, SPI1_SDI_MGPIO11A_IN => GND_net_1, 
        SPI1_SDO_MGPIO12A_IN => GND_net_1, SPI1_SS0_MGPIO13A_IN
         => GND_net_1, SPI1_SS1_MGPIO14A_IN => GND_net_1, 
        SPI1_SS2_MGPIO15A_IN => GND_net_1, SPI1_SS3_MGPIO16A_IN
         => GND_net_1, SPI1_SS4_MGPIO17A_IN => GND_net_1, 
        SPI1_SS5_MGPIO18A_IN => GND_net_1, SPI1_SS6_MGPIO23A_IN
         => GND_net_1, SPI1_SS7_MGPIO24A_IN => GND_net_1, 
        USBC_XCLK_IN => GND_net_1, 
        CAN_RXBUS_USBA_DATA1_MGPIO3A_OUT => OPEN, 
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_OUT => OPEN, 
        CAN_TXBUS_USBA_DATA0_MGPIO2A_OUT => OPEN, DRAM_ADDR(15)
         => nc261, DRAM_ADDR(14) => nc25, DRAM_ADDR(13) => nc1, 
        DRAM_ADDR(12) => nc322, DRAM_ADDR(11) => nc299, 
        DRAM_ADDR(10) => nc37, DRAM_ADDR(9) => nc202, 
        DRAM_ADDR(8) => nc144, DRAM_ADDR(7) => nc153, 
        DRAM_ADDR(6) => nc46, DRAM_ADDR(5) => nc258, DRAM_ADDR(4)
         => nc343, DRAM_ADDR(3) => nc71, DRAM_ADDR(2) => nc124, 
        DRAM_ADDR(1) => nc332, DRAM_ADDR(0) => nc81, DRAM_BA(2)
         => nc375, DRAM_BA(1) => nc201, DRAM_BA(0) => nc168, 
        DRAM_CASN => OPEN, DRAM_CKE => OPEN, DRAM_CLK => OPEN, 
        DRAM_CSN => OPEN, DRAM_DM_RDQS_OUT(2) => nc323, 
        DRAM_DM_RDQS_OUT(1) => nc34, DRAM_DM_RDQS_OUT(0) => nc28, 
        DRAM_DQ_OUT(17) => nc361, DRAM_DQ_OUT(16) => nc115, 
        DRAM_DQ_OUT(15) => nc264, DRAM_DQ_OUT(14) => nc192, 
        DRAM_DQ_OUT(13) => nc319, DRAM_DQ_OUT(12) => nc134, 
        DRAM_DQ_OUT(11) => nc32, DRAM_DQ_OUT(10) => nc40, 
        DRAM_DQ_OUT(9) => nc297, DRAM_DQ_OUT(8) => nc99, 
        DRAM_DQ_OUT(7) => nc75, DRAM_DQ_OUT(6) => nc183, 
        DRAM_DQ_OUT(5) => nc345, DRAM_DQ_OUT(4) => nc333, 
        DRAM_DQ_OUT(3) => nc288, DRAM_DQ_OUT(2) => nc85, 
        DRAM_DQ_OUT(1) => nc27, DRAM_DQ_OUT(0) => nc108, 
        DRAM_DQS_OUT(2) => nc325, DRAM_DQS_OUT(1) => nc16, 
        DRAM_DQS_OUT(0) => nc155, DRAM_FIFO_WE_OUT(1) => nc51, 
        DRAM_FIFO_WE_OUT(0) => nc301, DRAM_ODT => OPEN, DRAM_RASN
         => OPEN, DRAM_RSTN => OPEN, DRAM_WEN => OPEN, 
        I2C0_SCL_USBC_DATA1_MGPIO31B_OUT => OPEN, 
        I2C0_SDA_USBC_DATA0_MGPIO30B_OUT => OPEN, 
        I2C1_SCL_USBA_DATA4_MGPIO1A_OUT => OPEN, 
        I2C1_SDA_USBA_DATA3_MGPIO0A_OUT => OPEN, 
        MMUART0_CTS_USBC_DATA7_MGPIO19B_OUT => OPEN, 
        MMUART0_DCD_MGPIO22B_OUT => OPEN, 
        MMUART0_DSR_MGPIO20B_OUT => OPEN, 
        MMUART0_DTR_USBC_DATA6_MGPIO18B_OUT => OPEN, 
        MMUART0_RI_MGPIO21B_OUT => OPEN, 
        MMUART0_RTS_USBC_DATA5_MGPIO17B_OUT => OPEN, 
        MMUART0_RXD_USBC_STP_MGPIO28B_OUT => OPEN, 
        MMUART0_SCK_USBC_NXT_MGPIO29B_OUT => OPEN, 
        MMUART0_TXD_USBC_DIR_MGPIO27B_OUT => OPEN, 
        MMUART1_RXD_USBC_DATA3_MGPIO26B_OUT => OPEN, 
        MMUART1_SCK_USBC_DATA4_MGPIO25B_OUT => OPEN, 
        MMUART1_TXD_USBC_DATA2_MGPIO24B_OUT => OPEN, 
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OUT => OPEN, 
        RGMII_MDC_RMII_MDC_OUT => OPEN, 
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT => 
        MSS_ADLIB_INST_RGMII_MDIO_RMII_MDIO_USBB_DATA7_OUT, 
        RGMII_RX_CLK_OUT => OPEN, 
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT => 
        MSS_ADLIB_INST_RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OUT, 
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT => 
        MSS_ADLIB_INST_RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT, 
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT => 
        MSS_ADLIB_INST_RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT, 
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT => 
        MSS_ADLIB_INST_RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OUT, 
        RGMII_RXD3_USBB_DATA4_OUT => 
        MSS_ADLIB_INST_RGMII_RXD3_USBB_DATA4_OUT, 
        RGMII_TX_CLK_OUT => OPEN, 
        RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OUT => OPEN, 
        RGMII_TXD0_RMII_TXD0_USBB_DIR_OUT => OPEN, 
        RGMII_TXD1_RMII_TXD1_USBB_STP_OUT => 
        MSS_ADLIB_INST_RGMII_TXD1_RMII_TXD1_USBB_STP_OUT, 
        RGMII_TXD2_USBB_DATA5_OUT => 
        MSS_ADLIB_INST_RGMII_TXD2_USBB_DATA5_OUT, 
        RGMII_TXD3_USBB_DATA6_OUT => 
        MSS_ADLIB_INST_RGMII_TXD3_USBB_DATA6_OUT, 
        SPI0_SCK_USBA_XCLK_OUT => OPEN, 
        SPI0_SDI_USBA_DIR_MGPIO5A_OUT => OPEN, 
        SPI0_SDO_USBA_STP_MGPIO6A_OUT => OPEN, 
        SPI0_SS0_USBA_NXT_MGPIO7A_OUT => OPEN, 
        SPI0_SS1_USBA_DATA5_MGPIO8A_OUT => OPEN, 
        SPI0_SS2_USBA_DATA6_MGPIO9A_OUT => OPEN, 
        SPI0_SS3_USBA_DATA7_MGPIO10A_OUT => OPEN, SPI1_SCK_OUT
         => OPEN, SPI1_SDI_MGPIO11A_OUT => OPEN, 
        SPI1_SDO_MGPIO12A_OUT => OPEN, SPI1_SS0_MGPIO13A_OUT => 
        OPEN, SPI1_SS1_MGPIO14A_OUT => OPEN, 
        SPI1_SS2_MGPIO15A_OUT => OPEN, SPI1_SS3_MGPIO16A_OUT => 
        OPEN, SPI1_SS4_MGPIO17A_OUT => OPEN, 
        SPI1_SS5_MGPIO18A_OUT => OPEN, SPI1_SS6_MGPIO23A_OUT => 
        OPEN, SPI1_SS7_MGPIO24A_OUT => OPEN, USBC_XCLK_OUT => 
        OPEN, CAN_RXBUS_USBA_DATA1_MGPIO3A_OE => OPEN, 
        CAN_TX_EBL_USBA_DATA2_MGPIO4A_OE => OPEN, 
        CAN_TXBUS_USBA_DATA0_MGPIO2A_OE => OPEN, DM_OE(2) => nc33, 
        DM_OE(1) => nc359, DM_OE(0) => nc204, DRAM_DQ_OE(17) => 
        nc173, DRAM_DQ_OE(16) => nc278, DRAM_DQ_OE(15) => nc169, 
        DRAM_DQ_OE(14) => nc78, DRAM_DQ_OE(13) => nc263, 
        DRAM_DQ_OE(12) => nc335, DRAM_DQ_OE(11) => nc24, 
        DRAM_DQ_OE(10) => nc88, DRAM_DQ_OE(9) => nc111, 
        DRAM_DQ_OE(8) => nc55, DRAM_DQ_OE(7) => nc10, 
        DRAM_DQ_OE(6) => nc22, DRAM_DQ_OE(5) => nc210, 
        DRAM_DQ_OE(4) => nc185, DRAM_DQ_OE(3) => nc143, 
        DRAM_DQ_OE(2) => nc248, DRAM_DQ_OE(1) => nc77, 
        DRAM_DQ_OE(0) => nc6, DRAM_DQS_OE(2) => nc109, 
        DRAM_DQS_OE(1) => nc87, DRAM_DQS_OE(0) => nc123, 
        I2C0_SCL_USBC_DATA1_MGPIO31B_OE => OPEN, 
        I2C0_SDA_USBC_DATA0_MGPIO30B_OE => OPEN, 
        I2C1_SCL_USBA_DATA4_MGPIO1A_OE => OPEN, 
        I2C1_SDA_USBA_DATA3_MGPIO0A_OE => OPEN, 
        MMUART0_CTS_USBC_DATA7_MGPIO19B_OE => OPEN, 
        MMUART0_DCD_MGPIO22B_OE => OPEN, MMUART0_DSR_MGPIO20B_OE
         => OPEN, MMUART0_DTR_USBC_DATA6_MGPIO18B_OE => OPEN, 
        MMUART0_RI_MGPIO21B_OE => OPEN, 
        MMUART0_RTS_USBC_DATA5_MGPIO17B_OE => OPEN, 
        MMUART0_RXD_USBC_STP_MGPIO28B_OE => OPEN, 
        MMUART0_SCK_USBC_NXT_MGPIO29B_OE => OPEN, 
        MMUART0_TXD_USBC_DIR_MGPIO27B_OE => OPEN, 
        MMUART1_RXD_USBC_DATA3_MGPIO26B_OE => OPEN, 
        MMUART1_SCK_USBC_DATA4_MGPIO25B_OE => OPEN, 
        MMUART1_TXD_USBC_DATA2_MGPIO24B_OE => OPEN, 
        RGMII_GTX_CLK_RMII_CLK_USBB_XCLK_OE => OPEN, 
        RGMII_MDC_RMII_MDC_OE => OPEN, 
        RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE => 
        MSS_ADLIB_INST_RGMII_MDIO_RMII_MDIO_USBB_DATA7_OE, 
        RGMII_RX_CLK_OE => OPEN, 
        RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE => 
        MSS_ADLIB_INST_RGMII_RX_CTL_RMII_CRS_DV_USBB_DATA2_OE, 
        RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE => 
        MSS_ADLIB_INST_RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE, 
        RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE => 
        MSS_ADLIB_INST_RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE, 
        RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE => 
        MSS_ADLIB_INST_RGMII_RXD2_RMII_RX_ER_USBB_DATA3_OE, 
        RGMII_RXD3_USBB_DATA4_OE => 
        MSS_ADLIB_INST_RGMII_RXD3_USBB_DATA4_OE, RGMII_TX_CLK_OE
         => OPEN, RGMII_TX_CTL_RMII_TX_EN_USBB_NXT_OE => OPEN, 
        RGMII_TXD0_RMII_TXD0_USBB_DIR_OE => OPEN, 
        RGMII_TXD1_RMII_TXD1_USBB_STP_OE => 
        MSS_ADLIB_INST_RGMII_TXD1_RMII_TXD1_USBB_STP_OE, 
        RGMII_TXD2_USBB_DATA5_OE => 
        MSS_ADLIB_INST_RGMII_TXD2_USBB_DATA5_OE, 
        RGMII_TXD3_USBB_DATA6_OE => 
        MSS_ADLIB_INST_RGMII_TXD3_USBB_DATA6_OE, 
        SPI0_SCK_USBA_XCLK_OE => OPEN, 
        SPI0_SDI_USBA_DIR_MGPIO5A_OE => OPEN, 
        SPI0_SDO_USBA_STP_MGPIO6A_OE => OPEN, 
        SPI0_SS0_USBA_NXT_MGPIO7A_OE => OPEN, 
        SPI0_SS1_USBA_DATA5_MGPIO8A_OE => OPEN, 
        SPI0_SS2_USBA_DATA6_MGPIO9A_OE => OPEN, 
        SPI0_SS3_USBA_DATA7_MGPIO10A_OE => OPEN, SPI1_SCK_OE => 
        OPEN, SPI1_SDI_MGPIO11A_OE => OPEN, SPI1_SDO_MGPIO12A_OE
         => OPEN, SPI1_SS0_MGPIO13A_OE => OPEN, 
        SPI1_SS1_MGPIO14A_OE => OPEN, SPI1_SS2_MGPIO15A_OE => 
        OPEN, SPI1_SS3_MGPIO16A_OE => OPEN, SPI1_SS4_MGPIO17A_OE
         => OPEN, SPI1_SS5_MGPIO18A_OE => OPEN, 
        SPI1_SS6_MGPIO23A_OE => OPEN, SPI1_SS7_MGPIO24A_OE => 
        OPEN, USBC_XCLK_OE => OPEN);
    
    USB_ULPI_DATA_0_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(0), D => 
        MSS_ADLIB_INST_RGMII_RXD0_RMII_RXD0_USBB_DATA0_OUT, E => 
        MSS_ADLIB_INST_RGMII_RXD0_RMII_RXD0_USBB_DATA0_OE, Y => 
        USB_ULPI_DATA_0_PAD_Y);
    
    USB_ULPI_DATA_1_PAD : BIBUF
      port map(PAD => USB_ULPI_DATA(1), D => 
        MSS_ADLIB_INST_RGMII_RXD1_RMII_RXD1_USBB_DATA1_OUT, E => 
        MSS_ADLIB_INST_RGMII_RXD1_RMII_RXD1_USBB_DATA1_OE, Y => 
        USB_ULPI_DATA_1_PAD_Y);
    
    USB_ULPI_STP_PAD : TRIBUFF
      port map(D => 
        MSS_ADLIB_INST_RGMII_TXD1_RMII_TXD1_USBB_STP_OUT, E => 
        MSS_ADLIB_INST_RGMII_TXD1_RMII_TXD1_USBB_STP_OE, PAD => 
        USB_ULPI_STP);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity M2S010_USB_vcp_OSC_0_OSC is

    port( OSC_0_RCOSC_25_50MHZ_O2F : out   std_logic
        );

end M2S010_USB_vcp_OSC_0_OSC;

architecture DEF_ARCH of M2S010_USB_vcp_OSC_0_OSC is 

  component RCOSC_25_50MHZ_FAB
    port( A      : in    std_logic := 'U';
          CLKOUT : out   std_logic
        );
  end component;

  component RCOSC_25_50MHZ
    generic (FREQUENCY:real := 50.0);

    port( CLKOUT : out   std_logic
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component CLKINT
    port( A : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal N_RCOSC_25_50MHZ_CLKINT, N_RCOSC_25_50MHZ_CLKOUT, 
        GND_net_1, VCC_net_1 : std_logic;

begin 


    I_RCOSC_25_50MHZ_FAB : RCOSC_25_50MHZ_FAB
      port map(A => N_RCOSC_25_50MHZ_CLKOUT, CLKOUT => 
        N_RCOSC_25_50MHZ_CLKINT);
    
    I_RCOSC_25_50MHZ : RCOSC_25_50MHZ
      generic map(FREQUENCY => 50.0)

      port map(CLKOUT => N_RCOSC_25_50MHZ_CLKOUT);
    
    \VCC\ : VCC
      port map(Y => VCC_net_1);
    
    \GND\ : GND
      port map(Y => GND_net_1);
    
    I_RCOSC_25_50MHZ_FAB_CLKINT : CLKINT
      port map(A => N_RCOSC_25_50MHZ_CLKINT, Y => 
        OSC_0_RCOSC_25_50MHZ_O2F);
    

end DEF_ARCH; 

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity M2S010_USB_vcp is

    port( USB_ULPI_DATA    : inout std_logic_vector(7 downto 0) := (others => 'Z');
          BtnReset         : in    std_logic;
          DEVRST_N         : in    std_logic;
          MMUART_0_RXD_F2M : in    std_logic;
          USB_ULPI_DIR     : in    std_logic;
          USB_ULPI_NXT     : in    std_logic;
          USB_ULPI_XCLK    : in    std_logic;
          MMUART_0_TXD_M2F : out   std_logic;
          USB_ULPI_STP     : out   std_logic
        );

end M2S010_USB_vcp;

architecture DEF_ARCH of M2S010_USB_vcp is 

  component INBUF
    generic (IOSTD:string := "");

    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component M2S010_USB_vcp_MSS
    port( USB_ULPI_DATA            : inout   std_logic_vector(7 downto 0);
          USB_ULPI_XCLK            : in    std_logic := 'U';
          USB_ULPI_STP             : out   std_logic;
          USB_ULPI_NXT             : in    std_logic := 'U';
          USB_ULPI_DIR             : in    std_logic := 'U';
          MMUART_0_TXD_M2F_c       : out   std_logic;
          AND2_0_Y                 : in    std_logic := 'U';
          MMUART_0_RXD_F2M_c       : in    std_logic := 'U';
          OSC_0_RCOSC_25_50MHZ_O2F : in    std_logic := 'U'
        );
  end component;

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component M2S010_USB_vcp_OSC_0_OSC
    port( OSC_0_RCOSC_25_50MHZ_O2F : out   std_logic
        );
  end component;

  component SYSRESET
    port( POWER_ON_RESET_N : out   std_logic;
          DEVRST_N         : in    std_logic := 'U'
        );
  end component;

  component OUTBUF
    generic (IOSTD:string := "");

    port( D   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

  component AND2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

    signal SYSRESET_0_POWER_ON_RESET_N, AND2_0_Y, 
        OSC_0_RCOSC_25_50MHZ_O2F, GND_net_1, VCC_net_1, 
        BtnReset_c, MMUART_0_RXD_F2M_c, MMUART_0_TXD_M2F_c
         : std_logic;

    for all : M2S010_USB_vcp_MSS
	Use entity work.M2S010_USB_vcp_MSS(DEF_ARCH);
    for all : M2S010_USB_vcp_OSC_0_OSC
	Use entity work.M2S010_USB_vcp_OSC_0_OSC(DEF_ARCH);
begin 


    MMUART_0_RXD_F2M_ibuf : INBUF
      port map(PAD => MMUART_0_RXD_F2M, Y => MMUART_0_RXD_F2M_c);
    
    M2S010_USB_vcp_MSS_0 : M2S010_USB_vcp_MSS
      port map(USB_ULPI_DATA(7) => USB_ULPI_DATA(7), 
        USB_ULPI_DATA(6) => USB_ULPI_DATA(6), USB_ULPI_DATA(5)
         => USB_ULPI_DATA(5), USB_ULPI_DATA(4) => 
        USB_ULPI_DATA(4), USB_ULPI_DATA(3) => USB_ULPI_DATA(3), 
        USB_ULPI_DATA(2) => USB_ULPI_DATA(2), USB_ULPI_DATA(1)
         => USB_ULPI_DATA(1), USB_ULPI_DATA(0) => 
        USB_ULPI_DATA(0), USB_ULPI_XCLK => USB_ULPI_XCLK, 
        USB_ULPI_STP => USB_ULPI_STP, USB_ULPI_NXT => 
        USB_ULPI_NXT, USB_ULPI_DIR => USB_ULPI_DIR, 
        MMUART_0_TXD_M2F_c => MMUART_0_TXD_M2F_c, AND2_0_Y => 
        AND2_0_Y, MMUART_0_RXD_F2M_c => MMUART_0_RXD_F2M_c, 
        OSC_0_RCOSC_25_50MHZ_O2F => OSC_0_RCOSC_25_50MHZ_O2F);
    
    \VCC\ : VCC
      port map(Y => VCC_net_1);
    
    OSC_0 : M2S010_USB_vcp_OSC_0_OSC
      port map(OSC_0_RCOSC_25_50MHZ_O2F => 
        OSC_0_RCOSC_25_50MHZ_O2F);
    
    SYSRESET_0 : SYSRESET
      port map(POWER_ON_RESET_N => SYSRESET_0_POWER_ON_RESET_N, 
        DEVRST_N => DEVRST_N);
    
    MMUART_0_TXD_M2F_obuf : OUTBUF
      port map(D => MMUART_0_TXD_M2F_c, PAD => MMUART_0_TXD_M2F);
    
    \GND\ : GND
      port map(Y => GND_net_1);
    
    BtnReset_ibuf : INBUF
      port map(PAD => BtnReset, Y => BtnReset_c);
    
    AND2_0 : AND2
      port map(A => BtnReset_c, B => SYSRESET_0_POWER_ON_RESET_N, 
        Y => AND2_0_Y);
    

end DEF_ARCH; 
