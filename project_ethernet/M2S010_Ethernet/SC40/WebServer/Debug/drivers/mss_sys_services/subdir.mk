################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/mss_sys_services/mss_comblk.c \
../drivers/mss_sys_services/mss_sys_services.c 

OBJS += \
./drivers/mss_sys_services/mss_comblk.o \
./drivers/mss_sys_services/mss_sys_services.o 

C_DEPS += \
./drivers/mss_sys_services/mss_comblk.d \
./drivers/mss_sys_services/mss_sys_services.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/mss_sys_services/%.o: ../drivers/mss_sys_services/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\Application" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\CMSIS" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\CMSIS\startup_gcc" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_gpio" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_rtc" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_timer" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_uart" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers_config" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers_config\sys_config" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\include" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable\GCC" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable\GCC\ARM_CM3" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable\MemMang" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\hal" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\hal\CortexM3" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\hal\CortexM3\GNU" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\api" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\core" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\core\ipv4" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\core\snmp" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\ipv4" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\ipv4\lwip" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\lwip" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\netif" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\posix" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\posix\sys" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\netif" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\netif\ppp" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\port" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\port\FreeRTOS" -I“../drivers/mss_uart/ -I../drivers/mss_gpio/ -I“../CMSIS/” -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


