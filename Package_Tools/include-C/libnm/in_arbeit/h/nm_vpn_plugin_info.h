/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2015 Red Hat, Inc.
 */

#ifndef __NM_VPN_PLUGIN_INFO_H__
#define __NM_VPN_PLUGIN_INFO_H__

#include <glib.h>
#include <glib-object.h>

#include "nm-utils.h"
#include "nm-vpn-editor-plugin.h"



#define NM_TYPE_VPN_PLUGIN_INFO (nm_vpn_plugin_info_get_type())
#define NM_VPN_PLUGIN_INFO(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_VPN_PLUGIN_INFO, NMVpnPluginInfo))
#define NM_VPN_PLUGIN_INFO_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_VPN_PLUGIN_INFO, NMVpnPluginInfoClass))
#define NM_IS_VPN_PLUGIN_INFO(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_VPN_PLUGIN_INFO))
#define NM_IS_VPN_PLUGIN_INFO_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_VPN_PLUGIN_INFO))
#define NM_VPN_PLUGIN_INFO_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_VPN_PLUGIN_INFO, NMVpnPluginInfoClass))

#define NM_VPN_PLUGIN_INFO_NAME     "name"
#define NM_VPN_PLUGIN_INFO_FILENAME "filename"
#define NM_VPN_PLUGIN_INFO_KEYFILE  "keyfile"

#define NM_VPN_PLUGIN_INFO_KF_GROUP_CONNECTION "VPN Connection"
#define NM_VPN_PLUGIN_INFO_KF_GROUP_LIBNM      "libnm"
#define NM_VPN_PLUGIN_INFO_KF_GROUP_GNOME      "GNOME"

typedef struct _NMVpnPluginInfoClass NMVpnPluginInfoClass;

extern
GType nm_vpn_plugin_info_get_type(void);

extern
NMVpnPluginInfo *nm_vpn_plugin_info_new_from_file(const char *filename, GError **error);

extern
NMVpnPluginInfo *
nm_vpn_plugin_info_new_with_data(const char *filename, GKeyFile *keyfile, GError **error);

extern
NMVpnPluginInfo *nm_vpn_plugin_info_new_search_file(const char *name, const char *service);

extern
const char *nm_vpn_plugin_info_get_name(NMVpnPluginInfo *self);
extern
const char *nm_vpn_plugin_info_get_filename(NMVpnPluginInfo *self);
extern
const char *nm_vpn_plugin_info_get_service(NMVpnPluginInfo *self);
extern
const char *nm_vpn_plugin_info_get_plugin(NMVpnPluginInfo *self);
extern
const char *nm_vpn_plugin_info_get_program(NMVpnPluginInfo *self);
extern
const char *nm_vpn_plugin_info_get_auth_dialog(NMVpnPluginInfo *self);
extern
gboolean nm_vpn_plugin_info_supports_hints(NMVpnPluginInfo *self);
extern
gboolean nm_vpn_plugin_info_supports_multiple(NMVpnPluginInfo *self);
extern
const char *const *nm_vpn_plugin_info_get_aliases(NMVpnPluginInfo *self);
extern
const char *
nm_vpn_plugin_info_lookup_property(NMVpnPluginInfo *self, const char *group, const char *key);

extern
gboolean nm_vpn_plugin_info_validate_filename(const char *filename);

extern
GSList *nm_vpn_plugin_info_list_load(void);
extern
gboolean nm_vpn_plugin_info_list_add(GSList **list, NMVpnPluginInfo *plugin_info, GError **error);
extern
gboolean nm_vpn_plugin_info_list_remove(GSList **list, NMVpnPluginInfo *plugin_info);
extern
NMVpnPluginInfo *nm_vpn_plugin_info_list_find_by_name(GSList *list, const char *name);
extern
NMVpnPluginInfo *nm_vpn_plugin_info_list_find_by_filename(GSList *list, const char *filename);
extern
NMVpnPluginInfo *nm_vpn_plugin_info_list_find_by_service(GSList *list, const char *service);

extern
char *nm_vpn_plugin_info_list_find_service_type(GSList *list, const char *name);
extern
char **nm_vpn_plugin_info_list_get_service_types(GSList  *list,
                                                 gboolean only_existing,
                                                 gboolean with_abbreviations);

extern
NMVpnEditorPlugin *nm_vpn_plugin_info_get_editor_plugin(NMVpnPluginInfo *self);
extern
void nm_vpn_plugin_info_set_editor_plugin(NMVpnPluginInfo *self, NMVpnEditorPlugin *plugin);
extern
NMVpnEditorPlugin *nm_vpn_plugin_info_load_editor_plugin(NMVpnPluginInfo *self, GError **error);



#endif /* __NM_VPN_PLUGIN_INFO_H__ */
