################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c 

OBJS += \
./main.o 

C_DEPS += \
./main.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\CMSIS -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\CMSIS\startup_gcc -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers\mss_gpio -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers\mss_hpdma -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers\mss_nvm -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers\mss_sys_services -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers\mss_timer -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers\mss_uart -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers_config -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\drivers_config\sys_config -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\hal -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\hal\CortexM3 -IE:\Projects\Actel\ActelKit\M2S\RefDes\1\MyFirstProject\SoftConsole\MyFirstProject_MSS_CM3\MyFirstProject_MSS_CM3_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -v -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


