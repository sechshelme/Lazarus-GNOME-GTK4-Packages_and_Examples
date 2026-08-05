/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2017 Red Hat, Inc.
 */

#ifndef __NM_SETTING_OVS_PORT_H__
#define __NM_SETTING_OVS_PORT_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



#define NM_TYPE_SETTING_OVS_PORT (nm_setting_ovs_port_get_type())
#define NM_SETTING_OVS_PORT(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_OVS_PORT, NMSettingOvsPort))
#define NM_SETTING_OVS_PORT_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_SETTING_OVS_PORTCONFIG, NMSettingOvsPortClass))
#define NM_IS_SETTING_OVS_PORT(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_OVS_PORT))
#define NM_IS_SETTING_OVS_PORT_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_OVS_PORT))
#define NM_SETTING_OVS_PORT_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_OVS_PORT, NMSettingOvsPortClass))

#define NM_SETTING_OVS_PORT_SETTING_NAME "ovs-port"

#define NM_SETTING_OVS_PORT_VLAN_MODE      "vlan-mode"
#define NM_SETTING_OVS_PORT_TAG            "tag"
#define NM_SETTING_OVS_PORT_TRUNKS         "trunks"
#define NM_SETTING_OVS_PORT_LACP           "lacp"
#define NM_SETTING_OVS_PORT_BOND_MODE      "bond-mode"
#define NM_SETTING_OVS_PORT_BOND_UPDELAY   "bond-updelay"
#define NM_SETTING_OVS_PORT_BOND_DOWNDELAY "bond-downdelay"

typedef struct _NMSettingOvsPortClass NMSettingOvsPortClass;

extern
GType nm_setting_ovs_port_get_type(void);
extern
NMSetting *nm_setting_ovs_port_new(void);

extern
const char *nm_setting_ovs_port_get_vlan_mode(NMSettingOvsPort *self);
extern
guint nm_setting_ovs_port_get_tag(NMSettingOvsPort *self);
extern
const char *nm_setting_ovs_port_get_lacp(NMSettingOvsPort *self);
extern
const char *nm_setting_ovs_port_get_bond_mode(NMSettingOvsPort *self);
extern
guint nm_setting_ovs_port_get_bond_updelay(NMSettingOvsPort *self);
extern
guint nm_setting_ovs_port_get_bond_downdelay(NMSettingOvsPort *self);

extern
void nm_setting_ovs_port_add_trunk(NMSettingOvsPort *setting, NMRange *trunk);
extern
guint nm_setting_ovs_port_get_num_trunks(NMSettingOvsPort *setting);
extern
NMRange *nm_setting_ovs_port_get_trunk(NMSettingOvsPort *setting, guint idx);
extern
void nm_setting_ovs_port_remove_trunk(NMSettingOvsPort *setting, guint idx);
extern
gboolean
nm_setting_ovs_port_remove_trunk_by_value(NMSettingOvsPort *setting, guint start, guint end);
extern
void nm_setting_ovs_port_clear_trunks(NMSettingOvsPort *setting);



#endif /* __NM_SETTING_OVS_PORT_H__ */
