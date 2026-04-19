/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2017 - 2020 Red Hat, Inc.
 */

#ifndef __NM_SETTING_OVS_EXTERNAL_IDS_H__
#define __NM_SETTING_OVS_EXTERNAL_IDS_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



#define NM_TYPE_SETTING_OVS_EXTERNAL_IDS (nm_setting_ovs_external_ids_get_type())
#define NM_SETTING_OVS_EXTERNAL_IDS(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_OVS_EXTERNAL_IDS, NMSettingOvsExternalIDs))
#define NM_SETTING_OVS_EXTERNAL_IDS_CLASS(klass)               \
    (G_TYPE_CHECK_CLASS_CAST((klass),                          \
                             NM_TYPE_SETTING_OVS_EXTERNAL_IDS, \
                             NMSettingOvsExternalIDsClass))
#define NM_IS_SETTING_OVS_EXTERNAL_IDS(obj) \
    (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_OVS_EXTERNAL_IDS))
#define NM_IS_SETTING_OVS_EXTERNAL_IDS_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_OVS_EXTERNAL_IDS))
#define NM_SETTING_OVS_EXTERNAL_IDS_GET_CLASS(obj)               \
    (G_TYPE_INSTANCE_GET_CLASS((obj),                            \
                               NM_TYPE_SETTING_OVS_EXTERNAL_IDS, \
                               NMSettingOvsExternalIDsClass))

#define NM_SETTING_OVS_EXTERNAL_IDS_SETTING_NAME "ovs-external-ids"

#define NM_SETTING_OVS_EXTERNAL_IDS_DATA "data"

typedef struct _NMSettingOvsExternalIDsClass NMSettingOvsExternalIDsClass;

extern
GType nm_setting_ovs_external_ids_get_type(void);

extern
NMSetting *nm_setting_ovs_external_ids_new(void);

/*****************************************************************************/

extern
const char *const *nm_setting_ovs_external_ids_get_data_keys(NMSettingOvsExternalIDs *setting,
                                                             guint                   *out_len);

extern
const char *nm_setting_ovs_external_ids_get_data(NMSettingOvsExternalIDs *setting, const char *key);

extern
void nm_setting_ovs_external_ids_set_data(NMSettingOvsExternalIDs *setting,
                                          const char              *key,
                                          const char              *val);

/*****************************************************************************/

extern
gboolean nm_setting_ovs_external_ids_check_key(const char *key, GError **error);
extern
gboolean nm_setting_ovs_external_ids_check_val(const char *val, GError **error);



#endif /* __NM_SETTING_OVS_EXTERNAL_IDS_H__ */
