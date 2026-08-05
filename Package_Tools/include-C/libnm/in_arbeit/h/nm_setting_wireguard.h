/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2018 - 2019 Red Hat, Inc.
 */

#ifndef __NM_SETTING_WIREGUARD_H__
#define __NM_SETTING_WIREGUARD_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"
#include "nm-utils.h"



/*****************************************************************************/

#define NM_WIREGUARD_PUBLIC_KEY_LEN    32
#define NM_WIREGUARD_SYMMETRIC_KEY_LEN 32

/*****************************************************************************/

typedef struct _NMWireGuardPeer NMWireGuardPeer;

extern
GType nm_wireguard_peer_get_type(void);

extern
NMWireGuardPeer *nm_wireguard_peer_new(void);

extern
NMWireGuardPeer *nm_wireguard_peer_new_clone(const NMWireGuardPeer *self, gboolean with_secrets);

extern
NMWireGuardPeer *nm_wireguard_peer_ref(NMWireGuardPeer *self);
extern
void nm_wireguard_peer_unref(NMWireGuardPeer *self);

extern
void nm_wireguard_peer_seal(NMWireGuardPeer *self);
extern
gboolean nm_wireguard_peer_is_sealed(const NMWireGuardPeer *self);

extern
const char *nm_wireguard_peer_get_public_key(const NMWireGuardPeer *self);
extern
gboolean nm_wireguard_peer_set_public_key(NMWireGuardPeer *self,
                                          const char      *public_key,
                                          gboolean         accept_invalid);

extern
const char *nm_wireguard_peer_get_preshared_key(const NMWireGuardPeer *self);
extern
gboolean nm_wireguard_peer_set_preshared_key(NMWireGuardPeer *self,
                                             const char      *preshared_key,
                                             gboolean         accept_invalid);

extern
NMSettingSecretFlags nm_wireguard_peer_get_preshared_key_flags(const NMWireGuardPeer *self);
extern
void nm_wireguard_peer_set_preshared_key_flags(NMWireGuardPeer     *self,
                                               NMSettingSecretFlags preshared_key_flags);

extern
guint16 nm_wireguard_peer_get_persistent_keepalive(const NMWireGuardPeer *self);
extern
void nm_wireguard_peer_set_persistent_keepalive(NMWireGuardPeer *self,
                                                guint16          persistent_keepalive);

extern
const char *nm_wireguard_peer_get_endpoint(const NMWireGuardPeer *self);
extern
gboolean
nm_wireguard_peer_set_endpoint(NMWireGuardPeer *self, const char *endpoint, gboolean allow_invalid);

extern
guint nm_wireguard_peer_get_allowed_ips_len(const NMWireGuardPeer *self);
extern
const char *
nm_wireguard_peer_get_allowed_ip(const NMWireGuardPeer *self, guint idx, gboolean *out_is_valid);
extern
void nm_wireguard_peer_clear_allowed_ips(NMWireGuardPeer *self);
extern
gboolean nm_wireguard_peer_append_allowed_ip(NMWireGuardPeer *self,
                                             const char      *allowed_ip,
                                             gboolean         accept_invalid);
extern
gboolean nm_wireguard_peer_remove_allowed_ip(NMWireGuardPeer *self, guint idx);

extern
gboolean nm_wireguard_peer_is_valid(const NMWireGuardPeer *self,
                                    gboolean               check_non_secrets,
                                    gboolean               check_secrets,
                                    GError               **error);

extern
int nm_wireguard_peer_cmp(const NMWireGuardPeer *a,
                          const NMWireGuardPeer *b,
                          NMSettingCompareFlags  compare_flags);

/*****************************************************************************/

#define NM_TYPE_SETTING_WIREGUARD (nm_setting_wireguard_get_type())
#define NM_SETTING_WIREGUARD(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_WIREGUARD, NMSettingWireGuard))
#define NM_SETTING_WIREGUARD_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_SETTING_WIREGUARD, NMSettingWireGuardClass))
#define NM_IS_SETTING_WIREGUARD(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_WIREGUARD))
#define NM_IS_SETTING_WIREGUARD_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_WIREGUARD))
#define NM_SETTING_WIREGUARD_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_WIREGUARD, NMSettingWireGuardClass))

#define NM_SETTING_WIREGUARD_SETTING_NAME "wireguard"

#define NM_SETTING_WIREGUARD_FWMARK            "fwmark"
#define NM_SETTING_WIREGUARD_LISTEN_PORT       "listen-port"
#define NM_SETTING_WIREGUARD_PRIVATE_KEY       "private-key"
#define NM_SETTING_WIREGUARD_PRIVATE_KEY_FLAGS "private-key-flags"

#define NM_SETTING_WIREGUARD_PEERS "peers"

#define NM_SETTING_WIREGUARD_MTU                    "mtu"
#define NM_SETTING_WIREGUARD_PEER_ROUTES            "peer-routes"
#define NM_SETTING_WIREGUARD_IP4_AUTO_DEFAULT_ROUTE "ip4-auto-default-route"
#define NM_SETTING_WIREGUARD_IP6_AUTO_DEFAULT_ROUTE "ip6-auto-default-route"

#define NM_WIREGUARD_PEER_ATTR_ALLOWED_IPS          "allowed-ips"
#define NM_WIREGUARD_PEER_ATTR_ENDPOINT             "endpoint"
#define NM_WIREGUARD_PEER_ATTR_PERSISTENT_KEEPALIVE "persistent-keepalive"
#define NM_WIREGUARD_PEER_ATTR_PRESHARED_KEY        "preshared-key"
#define NM_WIREGUARD_PEER_ATTR_PRESHARED_KEY_FLAGS  "preshared-key-flags"
#define NM_WIREGUARD_PEER_ATTR_PUBLIC_KEY           "public-key"

/*****************************************************************************/

typedef struct _NMSettingWireGuardClass NMSettingWireGuardClass;

extern
GType nm_setting_wireguard_get_type(void);

extern
NMSetting *nm_setting_wireguard_new(void);

/*****************************************************************************/

extern
const char *nm_setting_wireguard_get_private_key(NMSettingWireGuard *self);

extern
NMSettingSecretFlags nm_setting_wireguard_get_private_key_flags(NMSettingWireGuard *self);

extern
guint16 nm_setting_wireguard_get_listen_port(NMSettingWireGuard *self);

extern
guint32 nm_setting_wireguard_get_fwmark(NMSettingWireGuard *self);

/*****************************************************************************/

extern
guint nm_setting_wireguard_get_peers_len(NMSettingWireGuard *self);

extern
NMWireGuardPeer *nm_setting_wireguard_get_peer(NMSettingWireGuard *self, guint idx);

extern
NMWireGuardPeer *nm_setting_wireguard_get_peer_by_public_key(NMSettingWireGuard *self,
                                                             const char         *public_key,
                                                             guint              *out_idx);

extern
void nm_setting_wireguard_set_peer(NMSettingWireGuard *self, NMWireGuardPeer *peer, guint idx);

extern
void nm_setting_wireguard_append_peer(NMSettingWireGuard *self, NMWireGuardPeer *peer);

extern
gboolean nm_setting_wireguard_remove_peer(NMSettingWireGuard *self, guint idx);

extern
guint nm_setting_wireguard_clear_peers(NMSettingWireGuard *self);

extern
gboolean nm_setting_wireguard_get_peer_routes(NMSettingWireGuard *self);

extern
guint32 nm_setting_wireguard_get_mtu(NMSettingWireGuard *self);

extern
NMTernary nm_setting_wireguard_get_ip4_auto_default_route(NMSettingWireGuard *self);

extern
NMTernary nm_setting_wireguard_get_ip6_auto_default_route(NMSettingWireGuard *self);

/*****************************************************************************/



#endif /* __NM_SETTING_WIREGUARD_H__ */
