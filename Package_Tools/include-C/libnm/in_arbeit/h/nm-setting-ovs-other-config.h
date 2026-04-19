/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2017 - 2020, 2022 Red Hat, Inc.
 */

#ifndef __NM_SETTING_OVS_OTHER_CONFIG_H__
#define __NM_SETTING_OVS_OTHER_CONFIG_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



#define NM_TYPE_SETTING_OVS_OTHER_CONFIG (nm_setting_ovs_other_config_get_type())
#define NM_SETTING_OVS_OTHER_CONFIG(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_OVS_OTHER_CONFIG, NMSettingOvsOtherConfig))
#define NM_SETTING_OVS_OTHER_CONFIG_CLASS(klass)               \
    (G_TYPE_CHECK_CLASS_CAST((klass),                          \
                             NM_TYPE_SETTING_OVS_OTHER_CONFIG, \
                             NMSettingOvsOtherConfigClass))
#define NM_IS_SETTING_OVS_OTHER_CONFIG(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_OVS_OTHER_CONFIG))
#define NM_IS_SETTING_OVS_OTHER_CONFIG_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_OVS_OTHER_CONFIG))
#define NM_SETTING_OVS_OTHER_CONFIG_GET_CLASS(obj)               \
    (G_TYPE_INSTANCE_GET_CLASS((obj),                            \
                               NM_TYPE_SETTING_OVS_OTHER_CONFIG, \
                               NMSettingOvsOtherConfigClass))

#define NM_SETTING_OVS_OTHER_CONFIG_SETTING_NAME "ovs-other-config"

#define NM_SETTING_OVS_OTHER_CONFIG_DATA "data"

typedef struct _NMSettingOvsOtherConfigClass NMSettingOvsOtherConfigClass;

extern
GType nm_setting_ovs_other_config_get_type(void);

extern
NMSetting *nm_setting_ovs_other_config_new(void);

/*****************************************************************************/

extern
const char *const *nm_setting_ovs_other_config_get_data_keys(NMSettingOvsOtherConfig *setting,
                                                             guint                   *out_len);

extern
const char *nm_setting_ovs_other_config_get_data(NMSettingOvsOtherConfig *setting, const char *key);

extern
void nm_setting_ovs_other_config_set_data(NMSettingOvsOtherConfig *setting,
                                          const char              *key,
                                          const char              *val);

/*****************************************************************************/



#endif /* __NM_SETTING_OVS_OTHER_CONFIG_H__ */
