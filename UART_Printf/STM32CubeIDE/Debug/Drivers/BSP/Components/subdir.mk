################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/hts221/hts221.c \
C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/hts221/hts221_reg.c \
C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/lsm6dso16is/lsm6dso16is.c \
C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/lsm6dso16is/lsm6dso16is_reg.c 

OBJS += \
./Drivers/BSP/Components/hts221.o \
./Drivers/BSP/Components/hts221_reg.o \
./Drivers/BSP/Components/lsm6dso16is.o \
./Drivers/BSP/Components/lsm6dso16is_reg.o 

C_DEPS += \
./Drivers/BSP/Components/hts221.d \
./Drivers/BSP/Components/hts221_reg.d \
./Drivers/BSP/Components/lsm6dso16is.d \
./Drivers/BSP/Components/lsm6dso16is_reg.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/hts221.o: C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/hts221/hts221.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/STM32CubeIDE/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/hts221_reg.o: C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/hts221/hts221_reg.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/STM32CubeIDE/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/lsm6dso16is.o: C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/lsm6dso16is/lsm6dso16is.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/STM32CubeIDE/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/BSP/Components/lsm6dso16is_reg.o: C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/Drivers/BSP/Components/lsm6dso16is/lsm6dso16is_reg.c Drivers/BSP/Components/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 '-DMBEDTLS_CONFIG_FILE="mbedtls_config.h"' -DUSE_HAL_DRIVER -DSTM32WL55xx -DCORE_CM4 -DDEBUG -c -I../../Inc -I"C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/UART_Printf/STM32CubeIDE/Application/User/drivers" -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Drivers/BSP/Components/hts221 -I../../Drivers/BSP/Components/lsm6dso16is -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-Components

clean-Drivers-2f-BSP-2f-Components:
	-$(RM) ./Drivers/BSP/Components/hts221.cyclo ./Drivers/BSP/Components/hts221.d ./Drivers/BSP/Components/hts221.o ./Drivers/BSP/Components/hts221.su ./Drivers/BSP/Components/hts221_reg.cyclo ./Drivers/BSP/Components/hts221_reg.d ./Drivers/BSP/Components/hts221_reg.o ./Drivers/BSP/Components/hts221_reg.su ./Drivers/BSP/Components/lsm6dso16is.cyclo ./Drivers/BSP/Components/lsm6dso16is.d ./Drivers/BSP/Components/lsm6dso16is.o ./Drivers/BSP/Components/lsm6dso16is.su ./Drivers/BSP/Components/lsm6dso16is_reg.cyclo ./Drivers/BSP/Components/lsm6dso16is_reg.d ./Drivers/BSP/Components/lsm6dso16is_reg.o ./Drivers/BSP/Components/lsm6dso16is_reg.su

.PHONY: clean-Drivers-2f-BSP-2f-Components

