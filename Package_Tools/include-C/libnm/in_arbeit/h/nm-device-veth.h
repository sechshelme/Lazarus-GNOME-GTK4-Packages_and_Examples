/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2020 Red Hat, Inc.
 */

#ifndef __NM_DEVICE_VETH_H__
#define __NM_DEVICE_VETH_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-device.h"



#define NM_TYPE_DEVICE_VETH (nm_device_veth_get_type())
#define NM_DEVICE_VETH(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_DEVICE_VETH, NMDeviceVeth))
#define NM_DEVICE_VETH_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_DEVICE_VETH, NMDeviceVethClass))
#define NM_IS_DEVICE_VETH(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_DEVICE_VETH))
#define NM_IS_DEVICE_VETH_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_DEVICE_VETH))
#define NM_DEVICE_VETH_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_DEVICE_VETH, NMDeviceVethClass))

#define NM_DEVICE_VETH_PEER "peer"

/**
 * NMDeviceVeth:
 *
 * Since: 1.30
 */
typedef struct _NMDeviceVeth      NMDeviceVeth;
typedef struct _NMDeviceVethClass NMDeviceVethClass;

extern
GType nm_device_veth_get_type(void);

extern
NMDevice *nm_device_veth_get_peer(NMDeviceVeth *device);



#endif /* __NM_DEVICE_VETH_H__ */
