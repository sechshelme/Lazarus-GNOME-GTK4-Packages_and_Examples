/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2023 Red Hat, Inc.
 */

#ifndef __NM_SETTING_HSR_H__
#define __NM_SETTING_HSR_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



#define NM_TYPE_SETTING_HSR            (nm_setting_hsr_get_type())
#define NM_SETTING_HSR(obj)            (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_HSR, NMSettingHsr))
#define NM_IS_SETTING_HSR(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_HSR))
#define NM_IS_SETTING_HSR_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_HSR))
#define NM_SETTING_HSR_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_HSR, NMSettingHsrClass))

#define NM_SETTING_HSR_SETTING_NAME "hsr"

#define NM_SETTING_HSR_PORT1          "port1"
#define NM_SETTING_HSR_PORT2          "port2"
#define NM_SETTING_HSR_MULTICAST_SPEC "multicast-spec"
#define NM_SETTING_HSR_PRP            "prp"

typedef struct _NMSettingHsrClass NMSettingHsrClass;


GType nm_setting_hsr_get_type(void);

NMSetting *nm_setting_hsr_new(void);


const char *nm_setting_hsr_get_port1(NMSettingHsr *setting);

const char *nm_setting_hsr_get_port2(NMSettingHsr *setting);

guint32 nm_setting_hsr_get_multicast_spec(NMSettingHsr *setting);

gboolean nm_setting_hsr_get_prp(NMSettingHsr *setting);



#endif /* __NM_SETTING_HSR_H__ */
