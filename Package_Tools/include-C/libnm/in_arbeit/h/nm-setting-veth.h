/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2020 Red Hat, Inc.
 */

#ifndef __NM_SETTING_VETH_H__
#define __NM_SETTING_VETH_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



#define NM_TYPE_SETTING_VETH (nm_setting_veth_get_type())
#define NM_SETTING_VETH(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_VETH, NMSettingVeth))
#define NM_IS_SETTING_VETH(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_VETH))
#define NM_IS_SETTING_VETH_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_VETH))
#define NM_SETTING_VETH_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_VETH, NMSettingVethClass))

#define NM_SETTING_VETH_SETTING_NAME "veth"

#define NM_SETTING_VETH_PEER "peer"

typedef struct _NMSettingVethClass NMSettingVethClass;

extern
GType nm_setting_veth_get_type(void);
extern
NMSetting *nm_setting_veth_new(void);

extern
const char *nm_setting_veth_get_peer(NMSettingVeth *setting);



#endif /* __NM_SETTING_VETH_H__ */
