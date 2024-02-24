----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Tue Oct 24 12:27:46 2017
-- Parameters for CORERMII
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FAMILY : integer := 19;
    constant HDL_License : string( 1 to 1 ) := "U";
    constant LOOPBACK : integer := 0;
    constant TestBench : string( 1 to 4 ) := "User";
    constant TRANSFER_SPEED : integer := 1;
    constant TRANSFER_TYPE : integer := 1;
end coreparameters;
