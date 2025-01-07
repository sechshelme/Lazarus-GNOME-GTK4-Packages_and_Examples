/*
 * Copyright (C) 2022-2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-length-unit.h"



#define ADW_TYPE_BREAKPOINT_CONDITION (adw_breakpoint_condition_get_type ())

typedef enum {
  ADW_BREAKPOINT_CONDITION_MIN_WIDTH,
  ADW_BREAKPOINT_CONDITION_MAX_WIDTH,
  ADW_BREAKPOINT_CONDITION_MIN_HEIGHT,
  ADW_BREAKPOINT_CONDITION_MAX_HEIGHT,
} AdwBreakpointConditionLengthType;

typedef enum {
  ADW_BREAKPOINT_CONDITION_MIN_ASPECT_RATIO,
  ADW_BREAKPOINT_CONDITION_MAX_ASPECT_RATIO,
} AdwBreakpointConditionRatioType;

typedef struct _AdwBreakpointCondition AdwBreakpointCondition;

extern
GType adw_breakpoint_condition_get_type (void) ;

extern
AdwBreakpointCondition *adw_breakpoint_condition_new_length (AdwBreakpointConditionLengthType type,
                                                             double                           value,
                                                             AdwLengthUnit                    unit) ;

extern
AdwBreakpointCondition *adw_breakpoint_condition_new_ratio (AdwBreakpointConditionRatioType type,
                                                            int                             width,
                                                            int                             height) ;

extern
AdwBreakpointCondition *adw_breakpoint_condition_new_and (AdwBreakpointCondition *condition_1,
                                                          AdwBreakpointCondition *condition_2) ;

extern
AdwBreakpointCondition *adw_breakpoint_condition_new_or (AdwBreakpointCondition *condition_1,
                                                         AdwBreakpointCondition *condition_2) ;

extern
AdwBreakpointCondition *adw_breakpoint_condition_copy (AdwBreakpointCondition *self);
extern
void                    adw_breakpoint_condition_free (AdwBreakpointCondition *self);

extern
AdwBreakpointCondition *adw_breakpoint_condition_parse (const char *str);

extern
char *adw_breakpoint_condition_to_string (AdwBreakpointCondition *self);

//G_DEFINE_AUTOPTR_CLEANUP_FUNC (AdwBreakpointCondition, adw_breakpoint_condition_free)

#define ADW_TYPE_BREAKPOINT (adw_breakpoint_get_type())

//G_DECLARE_FINAL_TYPE (AdwBreakpoint, adw_breakpoint, ADW, BREAKPOINT, GObject)

extern
AdwBreakpoint *adw_breakpoint_new (AdwBreakpointCondition *condition) ;

extern
AdwBreakpointCondition *adw_breakpoint_get_condition (AdwBreakpoint          *self);
extern
void                    adw_breakpoint_set_condition (AdwBreakpoint          *self,
                                                      AdwBreakpointCondition *condition);

extern
void adw_breakpoint_add_setter (AdwBreakpoint *self,
                                GObject       *object,
                                const char    *property,
                                const GValue  *value);

extern
void adw_breakpoint_add_setters        (AdwBreakpoint *self,
                                        GObject       *first_object,
                                        const char    *first_property,
                                        ...) ;
extern
void adw_breakpoint_add_settersv       (AdwBreakpoint *self,
                                        int            n_setters,
                                        GObject       *objects[],
                                        const char    *names[],
                                        const GValue  *values[]);
extern
void adw_breakpoint_add_setters_valist (AdwBreakpoint *self,
                                        GObject       *first_object,
                                        const char    *first_property,
                                        va_list        args);


