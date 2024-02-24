-- Version: v11.8 11.8.0.26

library ieee;
use ieee.std_logic_1164.all;
library smartfusion2;
use smartfusion2.all;

entity M2S010_I2C_UART_OSC_0_OSC is

    port( XTL                : in    std_logic;
          RCOSC_25_50MHZ_CCC : out   std_logic;
          RCOSC_25_50MHZ_O2F : out   std_logic;
          RCOSC_1MHZ_CCC     : out   std_logic;
          RCOSC_1MHZ_O2F     : out   std_logic;
          XTLOSC_CCC         : out   std_logic;
          XTLOSC_O2F         : out   std_logic
        );

end M2S010_I2C_UART_OSC_0_OSC;

architecture DEF_ARCH of M2S010_I2C_UART_OSC_0_OSC is 

  component RCOSC_25_50MHZ
    generic (FREQUENCY:real := 50.0);

    port( CLKOUT : out   std_logic
        );
  end component;


begin 


    I_RCOSC_25_50MHZ : RCOSC_25_50MHZ
      generic map(FREQUENCY => 50.0)

      port map(CLKOUT => RCOSC_25_50MHZ_CCC);
    

end DEF_ARCH; 
