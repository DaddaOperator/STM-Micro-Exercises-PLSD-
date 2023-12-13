################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main.c \
../Src/stm32wlxx_hal_msp.c \
../Src/stm32wlxx_it.c \
../Src/stm32wlxx_nucleo_bus.c \
../Src/system_stm32wlxx.c 

OBJS += \
./Src/main.o \
./Src/stm32wlxx_hal_msp.o \
./Src/stm32wlxx_it.o \
./Src/stm32wlxx_nucleo_bus.o \
./Src/system_stm32wlxx.o 

C_DEPS += \
./Src/main.d \
./Src/stm32wlxx_hal_msp.d \
./Src/stm32wlxx_it.d \
./Src/stm32wlxx_nucleo_bus.d \
./Src/system_stm32wlxx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/alega/STM32CubeIDE/workspace_1.13.2/UART_Printf/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/main.cyclo ./Src/main.d ./Src/main.o ./Src/main.su ./Src/stm32wlxx_hal_msp.cyclo ./Src/stm32wlxx_hal_msp.d ./Src/stm32wlxx_hal_msp.o ./Src/stm32wlxx_hal_msp.su ./Src/stm32wlxx_it.cyclo ./Src/stm32wlxx_it.d ./Src/stm32wlxx_it.o ./Src/stm32wlxx_it.su ./Src/stm32wlxx_nucleo_bus.cyclo ./Src/stm32wlxx_nucleo_bus.d ./Src/stm32wlxx_nucleo_bus.o ./Src/stm32wlxx_nucleo_bus.su ./Src/system_stm32wlxx.cyclo ./Src/system_stm32wlxx.d ./Src/system_stm32wlxx.o ./Src/system_stm32wlxx.su

.PHONY: clean-Src

