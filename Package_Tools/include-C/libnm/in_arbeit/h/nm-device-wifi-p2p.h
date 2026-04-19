/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2018 - 2019 Red Hat, Inc.
 */

#ifndef __NM_DEVICE_WIFI_P2P_H__
#define __NM_DEVICE_WIFI_P2P_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-device.h"



#define NM_TYPE_DEVICE_WIFI_P2P (nm_device_wifi_p2p_get_type())
#define NM_DEVICE_WIFI_P2P(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_DEVICE_WIFI_P2P, NMDeviceWifiP2P))
#define NM_DEVICE_WIFI_P2P_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_DEVICE_WIFI_P2P, NMDeviceWifiP2PClass))
#define NM_IS_DEVICE_WIFI_P2P(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_DEVICE_WIFI_P2P))
#define NM_IS_DEVICE_WIFI_P2P_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_DEVICE_WIFI_P2P))
#define NM_DEVICE_WIFI_P2P_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_DEVICE_WIFI_P2P, NMDeviceWifiP2PClass))

#define NM_DEVICE_WIFI_P2P_HW_ADDRESS "hw-address"
#define NM_DEVICE_WIFI_P2P_PEERS      "peers"
#define NM_DEVICE_WIFI_P2P_WFDIES     "wfdies"

/**
 * NMDeviceWifiP2P:
 *
 * Since: 1.16
 */
typedef struct _NMDeviceWifiP2P      NMDeviceWifiP2P;
typedef struct _NMDeviceWifiP2PClass NMDeviceWifiP2PClass;

extern
GType nm_device_wifi_p2p_get_type(void);

//xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address)
extern
const char *nm_device_wifi_p2p_get_hw_address(NMDeviceWifiP2P *device);

extern
NMWifiP2PPeer *nm_device_wifi_p2p_get_peer_by_path(NMDeviceWifiP2P *device, const char *path);

extern
const GPtrArray *nm_device_wifi_p2p_get_peers(NMDeviceWifiP2P *device);

extern
void nm_device_wifi_p2p_start_find(NMDeviceWifiP2P    *device,
                                   GVariant           *options,
                                   GCancellable       *cancellable,
                                   GAsyncReadyCallback callback,
                                   gpointer            user_data);
extern
gboolean
nm_device_wifi_p2p_start_find_finish(NMDeviceWifiP2P *device, GAsyncResult *result, GError **error);

extern
void nm_device_wifi_p2p_stop_find(NMDeviceWifiP2P    *device,
                                  GCancellable       *cancellable,
                                  GAsyncReadyCallback callback,
                                  gpointer            user_data);
extern
gboolean
nm_device_wifi_p2p_stop_find_finish(NMDeviceWifiP2P *device, GAsyncResult *result, GError **error);



#endif /* __NM_DEVICE_WIFI_P2P_H__ */
