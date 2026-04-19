/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2017, 2018 Red Hat, Inc.
 */

#ifndef __NM_DEVICE_OVS_PORT_H__
#define __NM_DEVICE_OVS_PORT_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-device.h"



#define NM_TYPE_DEVICE_OVS_PORT (nm_device_ovs_port_get_type())
#define NM_DEVICE_OVS_PORT(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_DEVICE_OVS_PORT, NMDeviceOvsPort))
#define NM_DEVICE_OVS_PORT_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_DEVICE_OVS_PORT, NMDeviceOvsPortClass))
#define NM_IS_DEVICE_OVS_PORT(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_DEVICE_OVS_PORT))
#define NM_IS_DEVICE_OVS_PORT_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_DEVICE_OVS_PORT))
#define NM_DEVICE_OVS_PORT_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_DEVICE_OVS_PORT, NMDeviceOvsPortClass))

#define NM_DEVICE_OVS_PORT_SLAVES "slaves"

/**
 * NMDeviceOvsPort:
 *
 * Since: 1.10
 */
typedef struct _NMDeviceOvsPort      NMDeviceOvsPort;
typedef struct _NMDeviceOvsPortClass NMDeviceOvsPortClass;

extern
GType nm_device_ovs_port_get_type(void);

//xxxx NM_DEPRECATED_IN__1_34_FOR(nm_device_get_ports)
extern
const GPtrArray *nm_device_ovs_port_get_slaves(NMDeviceOvsPort *device);



#endif /* __NM_DEVICE_OVS_PORT_H__ */
