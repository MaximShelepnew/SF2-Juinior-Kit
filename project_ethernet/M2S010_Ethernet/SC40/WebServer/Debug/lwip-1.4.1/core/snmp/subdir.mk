################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip-1.4.1/core/snmp/asn1_dec.c \
../lwip-1.4.1/core/snmp/asn1_enc.c \
../lwip-1.4.1/core/snmp/mib2.c \
../lwip-1.4.1/core/snmp/mib_structs.c \
../lwip-1.4.1/core/snmp/msg_in.c \
../lwip-1.4.1/core/snmp/msg_out.c 

OBJS += \
./lwip-1.4.1/core/snmp/asn1_dec.o \
./lwip-1.4.1/core/snmp/asn1_enc.o \
./lwip-1.4.1/core/snmp/mib2.o \
./lwip-1.4.1/core/snmp/mib_structs.o \
./lwip-1.4.1/core/snmp/msg_in.o \
./lwip-1.4.1/core/snmp/msg_out.o 

C_DEPS += \
./lwip-1.4.1/core/snmp/asn1_dec.d \
./lwip-1.4.1/core/snmp/asn1_enc.d \
./lwip-1.4.1/core/snmp/mib2.d \
./lwip-1.4.1/core/snmp/mib_structs.d \
./lwip-1.4.1/core/snmp/msg_in.d \
./lwip-1.4.1/core/snmp/msg_out.d 


# Each subdirectory must supply rules for building sources it contributes
lwip-1.4.1/core/snmp/%.o: ../lwip-1.4.1/core/snmp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\Application" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\CMSIS" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\CMSIS\startup_gcc" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_gpio" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_rtc" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_timer" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers\mss_uart" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers_config" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\drivers_config\sys_config" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\include" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable\GCC" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable\GCC\ARM_CM3" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\FreeRTOS\portable\MemMang" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\hal" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\hal\CortexM3" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\hal\CortexM3\GNU" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\api" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\core" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\core\ipv4" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\core\snmp" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\ipv4" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\ipv4\lwip" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\lwip" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\netif" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\posix" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\include\posix\sys" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\netif" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\netif\ppp" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\port" -I"D:\Demo\M2S\8\M2S010_Ethernet\SC40\WebServer\lwip-1.4.1\port\FreeRTOS" -I�../drivers/mss_uart/ -I../drivers/mss_gpio/ -I�../CMSIS/� -std=gnu11 --specs=cmsis.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

