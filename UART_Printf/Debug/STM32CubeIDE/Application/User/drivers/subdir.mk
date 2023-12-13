################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../STM32CubeIDE/Application/User/drivers/drv_hts221.c \
../STM32CubeIDE/Application/User/drivers/drv_lsm6dso.c 

OBJS += \
./STM32CubeIDE/Application/User/drivers/drv_hts221.o \
./STM32CubeIDE/Application/User/drivers/drv_lsm6dso.o 

C_DEPS += \
./STM32CubeIDE/Application/User/drivers/drv_hts221.d \
./STM32CubeIDE/Application/User/drivers/drv_lsm6dso.d 


# Each subdirectory must supply rules for building sources it contributes
STM32CubeIDE/Application/User/drivers/%.o STM32CubeIDE/Application/User/drivers/%.su STM32CubeIDE/Application/User/drivers/%.cyclo: ../STM32CubeIDE/Application/User/drivers/%.c STM32CubeIDE/Application/User/drivers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/alega/STM32CubeIDE/workspace_1.13.2/UART_Printf/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-STM32CubeIDE-2f-Application-2f-User-2f-drivers

clean-STM32CubeIDE-2f-Application-2f-User-2f-drivers:
	-$(RM) ./STM32CubeIDE/Application/User/drivers/drv_hts221.cyclo ./STM32CubeIDE/Application/User/drivers/drv_hts221.d ./STM32CubeIDE/Application/User/drivers/drv_hts221.o ./STM32CubeIDE/Application/User/drivers/drv_hts221.su ./STM32CubeIDE/Application/User/drivers/drv_lsm6dso.cyclo ./STM32CubeIDE/Application/User/drivers/drv_lsm6dso.d ./STM32CubeIDE/Application/User/drivers/drv_lsm6dso.o ./STM32CubeIDE/Application/User/drivers/drv_lsm6dso.su

.PHONY: clean-STM32CubeIDE-2f-Application-2f-User-2f-drivers

