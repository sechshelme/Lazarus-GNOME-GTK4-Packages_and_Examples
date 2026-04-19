/* SPDX-License-Identifier: LGPL-2.1-or-later */

#ifndef __NM_DEVICE_VRF_H__
#define __NM_DEVICE_VRF_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-device.h"



#define NM_TYPE_DEVICE_VRF (nm_device_vrf_get_type())
#define NM_DEVICE_VRF(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_DEVICE_VRF, NMDeviceVrf))
#define NM_DEVICE_VRF_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_DEVICE_VRF, NMDeviceVrfClass))
#define NM_IS_DEVICE_VRF(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_DEVICE_VRF))
#define NM_IS_DEVICE_VRF_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_DEVICE_VRF))
#define NM_DEVICE_VRF_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_DEVICE_VRF, NMDeviceVrfClass))

#define NM_DEVICE_VRF_TABLE "table"

/**
 * NMDeviceVrf:
 *
 * Since: 1.24
 */
typedef struct _NMDeviceVrf      NMDeviceVrf;
typedef struct _NMDeviceVrfClass NMDeviceVrfClass;

extern
GType nm_device_vrf_get_type(void);
extern
guint32 nm_device_vrf_get_table(NMDeviceVrf *device);



#endif /* __NM_DEVICE_VRF_H__ */
