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
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DNDEBUG -I"../hal/CortexM3/GNU" -I"../hal/CortexM3" -I"../hal" -O2 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


