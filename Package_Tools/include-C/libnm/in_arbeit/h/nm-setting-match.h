/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2018 Red Hat, Inc.
 */

#ifndef NM_SETTING_MATCH_H
#define NM_SETTING_MATCH_H

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"



#define NM_TYPE_SETTING_MATCH (nm_setting_match_get_type())
#define NM_SETTING_MATCH(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_MATCH, NMSettingMatch))
#define NM_SETTING_MATCH_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_SETTING_MATCH, NMSettingMatchClass))
#define NM_IS_SETTING_MATCH(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_MATCH))
#define NM_IS_SETTING_MATCH_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_MATCH))
#define NM_SETTING_MATCH_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_MATCH, NMSettingMatchClass))

#define NM_SETTING_MATCH_SETTING_NAME "match"

#define NM_SETTING_MATCH_INTERFACE_NAME      "interface-name"
#define NM_SETTING_MATCH_KERNEL_COMMAND_LINE "kernel-command-line"
#define NM_SETTING_MATCH_DRIVER              "driver"
#define NM_SETTING_MATCH_PATH                "path"

typedef struct _NMSettingMatchClass NMSettingMatchClass;

extern
GType nm_setting_match_get_type(void);
extern
NMSetting *nm_setting_match_new(void);

extern
guint nm_setting_match_get_num_interface_names(NMSettingMatch *setting);
extern
const char *nm_setting_match_get_interface_name(NMSettingMatch *setting, int idx);
extern
void nm_setting_match_remove_interface_name(NMSettingMatch *setting, int idx);
extern
gboolean nm_setting_match_remove_interface_name_by_value(NMSettingMatch *setting,
                                                         const char     *interface_name);
extern
void nm_setting_match_add_interface_name(NMSettingMatch *setting, const char *interface_name);
extern
void nm_setting_match_clear_interface_names(NMSettingMatch *setting);
extern
const char *const *nm_setting_match_get_interface_names(NMSettingMatch *setting, guint *length);


guint nm_setting_match_get_num_kernel_command_lines(NMSettingMatch *setting);

const char *nm_setting_match_get_kernel_command_line(NMSettingMatch *setting, guint idx);

void nm_setting_match_remove_kernel_command_line(NMSettingMatch *setting, guint idx);

gboolean nm_setting_match_remove_kernel_command_line_by_value(NMSettingMatch *setting,
                                                              const char     *kernel_command_line);

void nm_setting_match_add_kernel_command_line(NMSettingMatch *setting,
                                              const char     *kernel_command_line);

void nm_setting_match_clear_kernel_command_lines(NMSettingMatch *setting);

const char *const *nm_setting_match_get_kernel_command_lines(NMSettingMatch *setting,
                                                             guint          *length);


guint nm_setting_match_get_num_drivers(NMSettingMatch *setting);

const char *nm_setting_match_get_driver(NMSettingMatch *setting, guint idx);

void nm_setting_match_remove_driver(NMSettingMatch *setting, guint idx);

gboolean nm_setting_match_remove_driver_by_value(NMSettingMatch *setting, const char *driver);

void nm_setting_match_add_driver(NMSettingMatch *setting, const char *driver);

void nm_setting_match_clear_drivers(NMSettingMatch *setting);

const char *const *nm_setting_match_get_drivers(NMSettingMatch *setting, guint *length);


guint nm_setting_match_get_num_paths(NMSettingMatch *setting);

const char *nm_setting_match_get_path(NMSettingMatch *setting, guint idx);

void nm_setting_match_remove_path(NMSettingMatch *setting, guint idx);

gboolean nm_setting_match_remove_path_by_value(NMSettingMatch *setting, const char *path);

void nm_setting_match_add_path(NMSettingMatch *setting, const char *path);

void nm_setting_match_clear_paths(NMSettingMatch *setting);

const char *const *nm_setting_match_get_paths(NMSettingMatch *setting, guint *length);



#endif /* NM_SETTING_MATCH_H */
