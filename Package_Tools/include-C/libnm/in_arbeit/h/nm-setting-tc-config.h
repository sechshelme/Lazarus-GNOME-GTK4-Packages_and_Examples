/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2017 Red Hat, Inc.
 */

#ifndef NM_SETTING_TC_CONFIG_H
#define NM_SETTING_TC_CONFIG_H

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



typedef struct NMTCQdisc NMTCQdisc;

extern
GType nm_tc_qdisc_get_type(void);

extern
NMTCQdisc *nm_tc_qdisc_new(const char *kind, guint32 parent, GError **error);

extern
void nm_tc_qdisc_ref(NMTCQdisc *qdisc);
extern
void nm_tc_qdisc_unref(NMTCQdisc *qdisc);
extern
gboolean nm_tc_qdisc_equal(NMTCQdisc *qdisc, NMTCQdisc *other);

extern
NMTCQdisc *nm_tc_qdisc_dup(NMTCQdisc *qdisc);

extern
const char *nm_tc_qdisc_get_kind(NMTCQdisc *qdisc);
extern
guint32 nm_tc_qdisc_get_handle(NMTCQdisc *qdisc);
extern
void nm_tc_qdisc_set_handle(NMTCQdisc *qdisc, guint32 handle);
extern
guint32 nm_tc_qdisc_get_parent(NMTCQdisc *qdisc);

extern
const char **nm_tc_qdisc_get_attribute_names(NMTCQdisc *qdisc);
extern
GVariant *nm_tc_qdisc_get_attribute(NMTCQdisc *qdisc, const char *name);
extern
void nm_tc_qdisc_set_attribute(NMTCQdisc *qdisc, const char *name, GVariant *value);

typedef struct NMTCAction NMTCAction;

extern
GType nm_tc_action_get_type(void);

extern
NMTCAction *nm_tc_action_new(const char *kind, GError **error);

extern
void nm_tc_action_ref(NMTCAction *action);
extern
void nm_tc_action_unref(NMTCAction *action);
extern
gboolean nm_tc_action_equal(NMTCAction *action, NMTCAction *other);

extern
NMTCAction *nm_tc_action_dup(NMTCAction *action);

extern
const char *nm_tc_action_get_kind(NMTCAction *action);

extern
char **nm_tc_action_get_attribute_names(NMTCAction *action);
extern
GVariant *nm_tc_action_get_attribute(NMTCAction *action, const char *name);
extern
void nm_tc_action_set_attribute(NMTCAction *action, const char *name, GVariant *value);

typedef struct NMTCTfilter NMTCTfilter;

extern
GType nm_tc_tfilter_get_type(void);

extern
NMTCTfilter *nm_tc_tfilter_new(const char *kind, guint32 parent, GError **error);

extern
void nm_tc_tfilter_ref(NMTCTfilter *tfilter);
extern
void nm_tc_tfilter_unref(NMTCTfilter *tfilter);
extern
gboolean nm_tc_tfilter_equal(NMTCTfilter *tfilter, NMTCTfilter *other);

extern
NMTCTfilter *nm_tc_tfilter_dup(NMTCTfilter *tfilter);

extern
const char *nm_tc_tfilter_get_kind(NMTCTfilter *tfilter);
extern
guint32 nm_tc_tfilter_get_handle(NMTCTfilter *tfilter);
extern
void nm_tc_tfilter_set_handle(NMTCTfilter *tfilter, guint32 handle);
extern
guint32 nm_tc_tfilter_get_parent(NMTCTfilter *tfilter);
extern
NMTCAction *nm_tc_tfilter_get_action(NMTCTfilter *tfilter);
extern
void nm_tc_tfilter_set_action(NMTCTfilter *tfilter, NMTCAction *action);

#define NM_TYPE_SETTING_TC_CONFIG (nm_setting_tc_config_get_type())
#define NM_SETTING_TC_CONFIG(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_TC_CONFIG, NMSettingTCConfig))
#define NM_SETTING_TC_CONFIG_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_SETTING_TC_CONFIG, NMSettingTCConfigClass))
#define NM_IS_SETTING_TC_CONFIG(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_TC_CONFIG))
#define NM_IS_SETTING_TC_CONFIG_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_TC_CONFIG))
#define NM_SETTING_TC_CONFIG_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_TC_CONFIG, NMSettingTCConfigClass))

#define NM_SETTING_TC_CONFIG_SETTING_NAME "tc"

#define NM_SETTING_TC_CONFIG_QDISCS   "qdiscs"
#define NM_SETTING_TC_CONFIG_TFILTERS "tfilters"

typedef struct _NMSettingTCConfigClass NMSettingTCConfigClass;

GType nm_setting_tc_config_get_type(void);

extern
NMSetting *nm_setting_tc_config_new(void);

extern
guint nm_setting_tc_config_get_num_qdiscs(NMSettingTCConfig *setting);
extern
NMTCQdisc *nm_setting_tc_config_get_qdisc(NMSettingTCConfig *setting, guint idx);
extern
gboolean nm_setting_tc_config_add_qdisc(NMSettingTCConfig *setting, NMTCQdisc *qdisc);
extern
void nm_setting_tc_config_remove_qdisc(NMSettingTCConfig *setting, guint idx);
extern
gboolean nm_setting_tc_config_remove_qdisc_by_value(NMSettingTCConfig *setting, NMTCQdisc *qdisc);
extern
void nm_setting_tc_config_clear_qdiscs(NMSettingTCConfig *setting);

extern
guint nm_setting_tc_config_get_num_tfilters(NMSettingTCConfig *setting);
extern
NMTCTfilter *nm_setting_tc_config_get_tfilter(NMSettingTCConfig *setting, guint idx);
extern
gboolean nm_setting_tc_config_add_tfilter(NMSettingTCConfig *setting, NMTCTfilter *tfilter);
extern
void nm_setting_tc_config_remove_tfilter(NMSettingTCConfig *setting, guint idx);
extern
gboolean nm_setting_tc_config_remove_tfilter_by_value(NMSettingTCConfig *setting,
                                                      NMTCTfilter       *tfilter);
extern
void nm_setting_tc_config_clear_tfilters(NMSettingTCConfig *setting);



#endif /* NM_SETTING_TC_CONFIG_H */
