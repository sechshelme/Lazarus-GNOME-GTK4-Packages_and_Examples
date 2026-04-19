/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2018 Red Hat, Inc.
 */

#ifndef __NM_SETTING_ETHTOOL_H__
#define __NM_SETTING_ETHTOOL_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



extern
gboolean nm_ethtool_optname_is_feature(const char *optname);

extern
gboolean nm_ethtool_optname_is_coalesce(const char *optname);

extern
gboolean nm_ethtool_optname_is_ring(const char *optname);

extern
gboolean nm_ethtool_optname_is_pause(const char *optname);

extern
gboolean nm_ethtool_optname_is_channels(const char *optname);

extern
gboolean nm_ethtool_optname_is_eee(const char *optname);

/*****************************************************************************/

#define NM_TYPE_SETTING_ETHTOOL (nm_setting_ethtool_get_type())
#define NM_SETTING_ETHTOOL(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_ETHTOOL, NMSettingEthtool))
#define NM_SETTING_ETHTOOL_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_SETTING_ETHTOOL, NMSettingEthtoolClass))
#define NM_IS_SETTING_ETHTOOL(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_ETHTOOL))
#define NM_IS_SETTING_ETHTOOL_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_ETHTOOL))
#define NM_SETTING_ETHTOOL_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_ETHTOOL, NMSettingEthtoolClass))

#define NM_SETTING_ETHTOOL_SETTING_NAME "ethtool"

/*****************************************************************************/

typedef struct _NMSettingEthtoolClass NMSettingEthtoolClass;

extern
GType nm_setting_ethtool_get_type(void);

extern
NMSetting *nm_setting_ethtool_new(void);

/*****************************************************************************/

extern
//xxxx NM_DEPRECATED_IN__1_26
const char **nm_setting_ethtool_get_optnames(NMSettingEthtool *setting, guint *out_length);

extern
//xxxx NM_DEPRECATED_IN__1_26
NMTernary nm_setting_ethtool_get_feature(NMSettingEthtool *setting, const char *optname);
extern
//xxxx NM_DEPRECATED_IN__1_26
void
nm_setting_ethtool_set_feature(NMSettingEthtool *setting, const char *optname, NMTernary value);
extern
//xxxx NM_DEPRECATED_IN__1_26
void nm_setting_ethtool_clear_features(NMSettingEthtool *setting);



#endif /* __NM_SETTING_ETHTOOL_H__ */
