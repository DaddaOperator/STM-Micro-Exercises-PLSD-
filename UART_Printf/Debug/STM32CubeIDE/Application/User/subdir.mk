################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32CubeIDE/Application/User/syscalls.c \
../STM32CubeIDE/Application/User/sysmem.c 

OBJS += \
./STM32CubeIDE/Application/User/syscalls.o \
./STM32CubeIDE/Application/User/sysmem.o 

C_DEPS += \
./STM32CubeIDE/Application/User/syscalls.d \
./STM32CubeIDE/Application/User/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
STM32CubeIDE/Application/User/%.o STM32CubeIDE/Application/User/%.su STM32CubeIDE/Application/User/%.cyclo: ../STM32CubeIDE/Application/User/%.c STM32CubeIDE/Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/alega/STM32CubeIDE/workspace_1.13.2/UART_Printf/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-STM32CubeIDE-2f-Application-2f-User

clean-STM32CubeIDE-2f-Application-2f-User:
	-$(RM) ./STM32CubeIDE/Application/User/syscalls.cyclo ./STM32CubeIDE/Application/User/syscalls.d ./STM32CubeIDE/Application/User/syscalls.o ./STM32CubeIDE/Application/User/syscalls.su ./STM32CubeIDE/Application/User/sysmem.cyclo ./STM32CubeIDE/Application/User/sysmem.d ./STM32CubeIDE/Application/User/sysmem.o ./STM32CubeIDE/Application/User/sysmem.su

.PHONY: clean-STM32CubeIDE-2f-Application-2f-User

