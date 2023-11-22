/*
 * drv_lsm6dso.c
 *
 *  Created on: Nov 22, 2023
 *
 */

/* Includes -----------------------------------------------------------*/
#include "drv_lsm6dso.h"
#include "stm32wlxx_nucleo_bus.h"
#include "lsm6dso16is.h"
#include <stdint.h>

/* Variables -----------------------------------------------------------*/
static LSM6DSO16IS_Object_t LSM6DSO_OB_Handle;
static LSM6DSO16IS_IO_t LSM6DSO_IO_Handle;

/* Init -----------------------------------------------------------*/
int32_t LSM6DSO_USER_Init(void)
{

	uint8_t t8_sup;
	float f_sup;

	LSM6DSO_IO_Handle.Address=0xD6;
	LSM6DSO_IO_Handle.BusType=0;
	LSM6DSO_IO_Handle.WriteReg=BSP_I2C2_WriteReg;
	LSM6DSO_IO_Handle.ReadReg=BSP_I2C2_ReadReg;

	LSM6DSO16IS_RegisterBusIO(&LSM6DSO_OB_Handle, &LSM6DSO_IO_Handle);
	LSM6DSO16IS_Init(&LSM6DSO_OB_Handle);

	if(0 != LSM6DSO16IS_ReadID(&LSM6DSO_OB_Handle, &t8_sup)){
		return -1;
	}
	if(0 != LSM6DSO16IS_ACC_Enable(&LSM6DSO_OB_Handle)){
		return -1;
	}
	if(0 != LSM6DSO16IS_ACC_GetOutputDataRate(&LSM6DSO_OB_Handle, &f_sup)){
		return -1;
	}
	return 0;


}

int32_t LSM6DSO_USER_Acc_GetAxes(int32_t *px, int32_t *py, int32_t *pz)
{
	LSM6DSO16IS_Axes_t acc;
	int32_t ret;

	ret = LSM6DSO16IS_GYRO_GetAxes(&LSM6DSO_OB_Handle, &acc);

	*px = acc.x;
	*py = acc.y;
	*pz = acc.z;

	return ret;

}



