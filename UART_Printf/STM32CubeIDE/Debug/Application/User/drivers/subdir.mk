################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/User/drivers/drv_hts221.c \
../Application/User/drivers/drv_lsm6dso.c 

OBJS += \
./Application/User/drivers/drv_hts221.o \
./Application/User/drivers/drv_lsm6dso.o 

C_DEPS += \
./Application/User/drivers/drv_hts221.d \
./Application/User/drivers/drv_lsm6dso.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/drivers/%.o Application/User/drivers/%.su Application/User/drivers/%.cyclo: ../Application/User/drivers/%.c Application/User/drivers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/STM32CubeIDE/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Application-2f-User-2f-drivers

clean-Application-2f-User-2f-drivers:
	-$(RM) ./Application/User/drivers/drv_hts221.cyclo ./Application/User/drivers/drv_hts221.d ./Application/User/drivers/drv_hts221.o ./Application/User/drivers/drv_hts221.su ./Application/User/drivers/drv_lsm6dso.cyclo ./Application/User/drivers/drv_lsm6dso.d ./Application/User/drivers/drv_lsm6dso.o ./Application/User/drivers/drv_lsm6dso.su

.PHONY: clean-Application-2f-User-2f-drivers

