################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../main.c \
../usb_user_descriptors.c \
../vcp_app.c 

OBJS += \
./main.o \
./usb_user_descriptors.o \
./vcp_app.o 

C_DEPS += \
./main.d \
./usb_user_descriptors.d \
./vcp_app.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -I"../hal/CortexM3/GNU" -I"../hal/CortexM3" -I"../hal" -O0 -g3 -Wall -c -fmessage-length=0 -v -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


