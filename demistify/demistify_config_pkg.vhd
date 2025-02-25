-- DeMiSTifyConfig_pkg.vhd
-- Copyright 2021 by Alastair M. Robinson

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package demistify_config_pkg is
constant demistify_romspace : integer := 15; -- 32k address space to accommodate 18K of ROM
constant demistify_romsize1 : integer := 14; -- 16k fot the first chunk
constant demistify_romsize2 : integer := 11; -- 2k for the second chunk

-- Core-specific button mapping.
-- Joysticks are (currently) 8 bits width, with the directions in the lower four bits.
-- Button 1 is the main fire button, Button 2 is the secondary fire button to the right of button 1
-- Button 3 is a third (possibly less conveniently placed) button 
-- Button 4 is mapped as a "start" or "run" button.

-- By adjusting the following constants you can assign each button a place in the joystick bitmap.
-- The Megadrive core, for instance, expects the following bitmap:
-- start(7) C(6) B(5) A(4) directions(3:0)
-- Since Megadrive button B is the most important, we map button 1 -> B, button 2 -> C, button 3 -> A
-- and button 4 -> Start, hence button1 = 5, button2 = 6, button3 = 4 and button4 = 7,

constant demistify_joybits : integer := 8;

constant demistify_button1 : integer := 4;
constant demistify_button2 : integer := 5;
constant demistify_button3 : integer := 6;
constant demistify_button4 : integer := 7;
constant demistify_button5 : integer := 8;
constant demistify_button6 : integer := 9;

constant demistify_serialdebug : std_logic := '0';


	-- Declare the guest component
	-- input ports defined as `ifdef DEMISTIFY  make sure that have default values
	
	COMPONENT Next186_MiST -- Rename to match the guest core
		PORT
		(
			CLOCK_27 	:	IN STD_LOGIC;	-- Comment out one of these two lines
			LED			:	 OUT STD_LOGIC;
			SDRAM_DQ	:	 INOUT STD_LOGIC_VECTOR(15 DOWNTO 0);
			SDRAM_A		:	 OUT STD_LOGIC_VECTOR(12 DOWNTO 0);
			SDRAM_DQML	:	 OUT STD_LOGIC;
			SDRAM_DQMH	:	 OUT STD_LOGIC;
			SDRAM_nWE	:	 OUT STD_LOGIC;
			SDRAM_nCAS	:	 OUT STD_LOGIC;
			SDRAM_nRAS	:	 OUT STD_LOGIC;
			SDRAM_nCS	:	 OUT STD_LOGIC;
			SDRAM_BA	:	 OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
			SDRAM_CLK	:	 OUT STD_LOGIC;
			SDRAM_CKE	:	 OUT STD_LOGIC;
			SPI_DO		:	 INOUT STD_LOGIC;
			SPI_DI		:	 IN STD_LOGIC;
			SPI_SCK		:	 IN STD_LOGIC;
			SPI_SS2		:	 IN STD_LOGIC;
			SPI_SS3		:	 IN STD_LOGIC;
			SPI_SS4		:	 IN STD_LOGIC;
			CONF_DATA0	:	 IN STD_LOGIC;
			VGA_HS		:	 OUT STD_LOGIC;
			VGA_VS		:	 OUT STD_LOGIC;
			VGA_R		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			VGA_G		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			VGA_B		:	 OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
			AUDIO_L  	: 	OUT STD_LOGIC;
			AUDIO_R  	: 	OUT STD_LOGIC;
			I2S_BCK  	: 	OUT STD_LOGIC;
			I2S_LRCK  	: 	OUT STD_LOGIC;
			I2S_DATA  	: 	OUT STD_LOGIC;
			UART_RX  	: 	IN STD_LOGIC;
			UART_TX  	: 	OUT STD_LOGIC;
			PS2K_CLK : in std_logic;
			PS2K_DAT : in std_logic;
			PS2M_CLK : in std_logic;
			PS2M_DAT : in std_logic;
			PS2K_CLK_OUT : out std_logic;
			PS2K_DAT_OUT : out std_logic;
			PS2M_CLK_OUT : out std_logic;
			PS2M_DAT_OUT : out std_logic						
		);
	END COMPONENT;
	

end package;
