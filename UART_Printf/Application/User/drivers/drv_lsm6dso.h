/*
 * drv_lsm6dso.h
 *
 *  Created on: Nov 22, 2023
 *
 */

#ifndef APPLICATION_USER_DRIVERS_DRV_LSM6DSO_H_
#define APPLICATION_USER_DRIVERS_DRV_LSM6DSO_H_

#include <stdint.h>

int32_t LSM6DSO_USER_Init(void);
int32_t LSM6DSO_USER_Acc_GetAxes(int32_t *px, int32_t *py, int32_t *pz);

#endif /* APPLICATION_USER_DRIVERS_DRV_LSM6DSO_H_ */
