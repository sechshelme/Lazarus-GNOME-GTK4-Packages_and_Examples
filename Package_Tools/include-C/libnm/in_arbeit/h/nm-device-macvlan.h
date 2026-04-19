/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2015 Red Hat, Inc.
 */

#ifndef __NM_DEVICE_MACVLAN_H__
#define __NM_DEVICE_MACVLAN_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-device.h"



#define NM_TYPE_DEVICE_MACVLAN (nm_device_macvlan_get_type())
#define NM_DEVICE_MACVLAN(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_DEVICE_MACVLAN, NMDeviceMacvlan))
#define NM_DEVICE_MACVLAN_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_DEVICE_MACVLAN, NMDeviceMacvlanClass))
#define NM_IS_DEVICE_MACVLAN(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_DEVICE_MACVLAN))
#define NM_IS_DEVICE_MACVLAN_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_DEVICE_MACVLAN))
#define NM_DEVICE_MACVLAN_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_DEVICE_MACVLAN, NMDeviceMacvlanClass))

#define NM_DEVICE_MACVLAN_PARENT     "parent"
#define NM_DEVICE_MACVLAN_MODE       "mode"
#define NM_DEVICE_MACVLAN_NO_PROMISC "no-promisc"
#define NM_DEVICE_MACVLAN_TAP        "tap"
#define NM_DEVICE_MACVLAN_HW_ADDRESS "hw-address"

/**
 * NMDeviceMacvlan:
 *
 * Since: 1.2
 */
typedef struct _NMDeviceMacvlan      NMDeviceMacvlan;
typedef struct _NMDeviceMacvlanClass NMDeviceMacvlanClass;

extern
GType nm_device_macvlan_get_type(void);

extern
NMDevice *nm_device_macvlan_get_parent(NMDeviceMacvlan *device);
extern
const char *nm_device_macvlan_get_mode(NMDeviceMacvlan *device);
extern
gboolean nm_device_macvlan_get_no_promisc(NMDeviceMacvlan *device);
extern
gboolean nm_device_macvlan_get_tap(NMDeviceMacvlan *device);

//xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address)
extern
const char *nm_device_macvlan_get_hw_address(NMDeviceMacvlan *device);



#endif /* __NM_DEVICE_MACVLAN_H__ */
