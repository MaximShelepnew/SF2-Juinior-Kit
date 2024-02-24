################################################################################
# Automatically-generated file. Do not edit!
################################################################################

O_SRCS := 
C_SRCS := 
S_UPPER_SRCS := 
S_SRCS := 
OBJ_SRCS := 
MEMORYMAP := 
OBJS := 
C_DEPS := 
SRECFILES := 
IHEXFILES := 
LISTINGS := 
EXECUTABLE := 

# Every subdirectory with source files must be described here
SUBDIRS := \
. \
hal/CortexM3 \
hal/CortexM3/GNU \
drivers_config/sys_config \
drivers/mss_usb \
drivers/mss_uart \
drivers/mss_sys_services \
drivers/mss_nvm \
drivers/mss_hpdma \
drivers/mss_gpio \
CMSIS \
CMSIS/startup_gcc \

################################################################################
# Microsemi SoftConsole IDE Variables
################################################################################

BUILDCMD = arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -specs=bare.specs -T ../CMSIS/startup_gcc/debug-in-microsemi-smartfusion2-esram.ld -Wl,-Map=$(EXECUTABLE).map 
SHELL := cmd.exe
EXECUTABLE := usb_device_cdc_vcp

# Target-specific items to be cleaned up in the top directory.
clean::
	-$(RM) $(wildcard ./*.map) 