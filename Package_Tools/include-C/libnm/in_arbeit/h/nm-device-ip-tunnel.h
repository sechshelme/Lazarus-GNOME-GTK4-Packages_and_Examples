/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2015 Red Hat, Inc.
 */

#ifndef __NM_DEVICE_IP_TUNNEL_H__
#define __NM_DEVICE_IP_TUNNEL_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-device.h"
#include "nm-setting-ip-tunnel.h"



#define NM_TYPE_DEVICE_IP_TUNNEL (nm_device_ip_tunnel_get_type())
#define NM_DEVICE_IP_TUNNEL(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_DEVICE_IP_TUNNEL, NMDeviceIPTunnel))
#define NM_DEVICE_IP_TUNNEL_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_DEVICE_IP_TUNNEL, NMDeviceIPTunnelClass))
#define NM_IS_DEVICE_IP_TUNNEL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_DEVICE_IP_TUNNEL))
#define NM_IS_DEVICE_IP_TUNNEL_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_DEVICE_IP_TUNNEL))
#define NM_DEVICE_IP_TUNNEL_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_DEVICE_IP_TUNNEL, NMDeviceIPTunnelClass))

#define NM_DEVICE_IP_TUNNEL_MODE                "mode"
#define NM_DEVICE_IP_TUNNEL_PARENT              "parent"
#define NM_DEVICE_IP_TUNNEL_LOCAL               "local"
#define NM_DEVICE_IP_TUNNEL_REMOTE              "remote"
#define NM_DEVICE_IP_TUNNEL_TTL                 "ttl"
#define NM_DEVICE_IP_TUNNEL_TOS                 "tos"
#define NM_DEVICE_IP_TUNNEL_PATH_MTU_DISCOVERY  "path-mtu-discovery"
#define NM_DEVICE_IP_TUNNEL_INPUT_KEY           "input-key"
#define NM_DEVICE_IP_TUNNEL_OUTPUT_KEY          "output-key"
#define NM_DEVICE_IP_TUNNEL_ENCAPSULATION_LIMIT "encapsulation-limit"
#define NM_DEVICE_IP_TUNNEL_FLOW_LABEL          "flow-label"
#define NM_DEVICE_IP_TUNNEL_FWMARK              "fwmark"
#define NM_DEVICE_IP_TUNNEL_FLAGS               "flags"

/**
 * NMDeviceIPTunnel:
 *
 * Since: 1.2
 */
typedef struct _NMDeviceIPTunnel      NMDeviceIPTunnel;
typedef struct _NMDeviceIPTunnelClass NMDeviceIPTunnelClass;

extern
GType nm_device_ip_tunnel_get_type(void);

extern
NMDevice *nm_device_ip_tunnel_get_parent(NMDeviceIPTunnel *device);
extern
NMIPTunnelMode nm_device_ip_tunnel_get_mode(NMDeviceIPTunnel *device);
extern
const char *nm_device_ip_tunnel_get_local(NMDeviceIPTunnel *device);
extern
const char *nm_device_ip_tunnel_get_remote(NMDeviceIPTunnel *device);
extern
guint8 nm_device_ip_tunnel_get_ttl(NMDeviceIPTunnel *device);
extern
guint8 nm_device_ip_tunnel_get_tos(NMDeviceIPTunnel *device);
extern
gboolean nm_device_ip_tunnel_get_path_mtu_discovery(NMDeviceIPTunnel *device);
extern
const char *nm_device_ip_tunnel_get_input_key(NMDeviceIPTunnel *device);
extern
const char *nm_device_ip_tunnel_get_output_key(NMDeviceIPTunnel *device);
extern
guint8 nm_device_ip_tunnel_get_encapsulation_limit(NMDeviceIPTunnel *device);
extern
guint nm_device_ip_tunnel_get_flow_label(NMDeviceIPTunnel *device);
guint32 nm_device_ip_tunnel_get_fwmark(NMDeviceIPTunnel *device);
extern
NMIPTunnelFlags nm_device_ip_tunnel_get_flags(NMDeviceIPTunnel *device);



#endif /* __NM_DEVICE_IP_TUNNEL_H__ */
