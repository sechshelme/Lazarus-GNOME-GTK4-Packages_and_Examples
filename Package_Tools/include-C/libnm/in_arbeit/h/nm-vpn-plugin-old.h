/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2015 Red Hat, Inc.
 */

#ifndef __NM_VPN_PLUGIN_OLD_H__
#define __NM_VPN_PLUGIN_OLD_H__

#include <gio/gio.h>
#include "nm-vpn-dbus-interface.h"
#include "nm-connection.h"



#define NM_TYPE_VPN_PLUGIN_OLD (nm_vpn_plugin_old_get_type())
#define NM_VPN_PLUGIN_OLD(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_VPN_PLUGIN_OLD, NMVpnPluginOld))
#define NM_VPN_PLUGIN_OLD_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_VPN_PLUGIN_OLD, NMVpnPluginOldClass))
#define NM_IS_VPN_PLUGIN_OLD(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_VPN_PLUGIN_OLD))
#define NM_IS_VPN_PLUGIN_OLD_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_VPN_PLUGIN_OLD))
#define NM_VPN_PLUGIN_OLD_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_VPN_PLUGIN_OLD, NMVpnPluginOldClass))

#define NM_VPN_PLUGIN_OLD_DBUS_SERVICE_NAME "service-name"
#define NM_VPN_PLUGIN_OLD_STATE             "state"

/**
 * NMVpnPluginOld:
 */
typedef struct {
    //xxxx NM_DEPRECATED_IN__1_2
    GObject parent;
} NMVpnPluginOld;

typedef struct {
    //xxxx NM_DEPRECATED_IN__1_2
    GObjectClass parent;

    /* Signals */
    //xxxx NM_DEPRECATED_IN__1_2
    void (*state_changed)(NMVpnPluginOld *plugin, NMVpnServiceState state);

    //xxxx NM_DEPRECATED_IN__1_2
    void (*ip4_config)(NMVpnPluginOld *plugin, GVariant *ip4_config);

    //xxxx NM_DEPRECATED_IN__1_2
    void (*login_banner)(NMVpnPluginOld *plugin, const char *banner);

    //xxxx NM_DEPRECATED_IN__1_2
    void (*failure)(NMVpnPluginOld *plugin, NMVpnPluginFailure reason);

    //xxxx NM_DEPRECATED_IN__1_2
    void (*quit)(NMVpnPluginOld *plugin);

    //xxxx NM_DEPRECATED_IN__1_2
    void (*config)(NMVpnPluginOld *plugin, GVariant *config);

    //xxxx NM_DEPRECATED_IN__1_2
    void (*ip6_config)(NMVpnPluginOld *plugin, GVariant *config);

    /* virtual methods */
    //xxxx NM_DEPRECATED_IN__1_2
    gboolean (*connect)(NMVpnPluginOld *plugin, NMConnection *connection, GError **err);

    //xxxx NM_DEPRECATED_IN__1_2
    gboolean (*need_secrets)(NMVpnPluginOld *plugin,
                             NMConnection   *connection,
                             const char    **setting_name,
                             GError        **error);

    //xxxx NM_DEPRECATED_IN__1_2
    gboolean (*disconnect)(NMVpnPluginOld *plugin, GError **err);

    //xxxx NM_DEPRECATED_IN__1_2
    gboolean (*new_secrets)(NMVpnPluginOld *plugin, NMConnection *connection, GError **error);

    //xxxx NM_DEPRECATED_IN__1_2
    gboolean (*connect_interactive)(NMVpnPluginOld *plugin,
                                    NMConnection   *connection,
                                    GVariant       *details,
                                    GError        **error);

    /*< private >*/
    //xxxx NM_DEPRECATED_IN__1_2
    gpointer padding[8];
} NMVpnPluginOldClass;

//xxxx NM_DEPRECATED_IN__1_2
GType nm_vpn_plugin_old_get_type(void);

//xxxx NM_DEPRECATED_IN__1_2
GDBusConnection *nm_vpn_plugin_old_get_connection(NMVpnPluginOld *plugin);
//xxxx NM_DEPRECATED_IN__1_2
NMVpnServiceState nm_vpn_plugin_old_get_state(NMVpnPluginOld *plugin);
//xxxx NM_DEPRECATED_IN__1_2
void nm_vpn_plugin_old_set_state(NMVpnPluginOld *plugin, NMVpnServiceState state);

//xxxx NM_DEPRECATED_IN__1_2
void
nm_vpn_plugin_old_secrets_required(NMVpnPluginOld *plugin, const char *message, const char **hints);

//xxxx NM_DEPRECATED_IN__1_2
void nm_vpn_plugin_old_set_login_banner(NMVpnPluginOld *plugin, const char *banner);

//xxxx NM_DEPRECATED_IN__1_2
void nm_vpn_plugin_old_failure(NMVpnPluginOld *plugin, NMVpnPluginFailure reason);

//xxxx NM_DEPRECATED_IN__1_2
void nm_vpn_plugin_old_set_ip4_config(NMVpnPluginOld *plugin, GVariant *ip4_config);

//xxxx NM_DEPRECATED_IN__1_2
gboolean nm_vpn_plugin_old_disconnect(NMVpnPluginOld *plugin, GError **err);

/* Utility functions */

//xxxx NM_DEPRECATED_IN__1_2
gboolean
nm_vpn_plugin_old_read_vpn_details(int fd, GHashTable **out_data, GHashTable **out_secrets);

//xxxx NM_DEPRECATED_IN__1_2
gboolean nm_vpn_plugin_old_get_secret_flags(GHashTable           *data,
                                            const char           *secret_name,
                                            NMSettingSecretFlags *out_flags);



#endif /* __NM_VPN_PLUGIN_OLD_H__ */
