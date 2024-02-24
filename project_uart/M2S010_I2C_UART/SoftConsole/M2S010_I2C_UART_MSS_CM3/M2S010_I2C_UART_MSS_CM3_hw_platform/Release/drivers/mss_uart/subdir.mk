################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/mss_uart/mss_uart.c 

OBJS += \
./drivers/mss_uart/mss_uart.o 

C_DEPS += \
./drivers/mss_uart/mss_uart.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/mss_uart/%.o: ../drivers/mss_uart/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DNDEBUG -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\CMSIS -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\CMSIS\startup_gcc -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers\mss_hpdma -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers\mss_i2c -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers\mss_nvm -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers\mss_sys_services -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers\mss_timer -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers\mss_uart -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers_config -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\drivers_config\sys_config -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\hal -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\hal\CortexM3 -IE:\Projects\Actel\ActelKit\RefDes\5\SoC\M2S010_I2C_UART\SoftConsole\M2S010_I2C_UART_MSS_CM3\M2S010_I2C_UART_MSS_CM3_hw_platform\hal\CortexM3\GNU -O2 -ffunction-sections -fdata-sections -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


