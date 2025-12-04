/*
 * Copyright (C) 2022-2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-length-unit.h"



#define ADAP_TYPE_BREAKPOINT_CONDITION (adap_breakpoint_condition_get_type ())

typedef enum {
  ADAP_BREAKPOINT_CONDITION_MIN_WIDTH,
  ADAP_BREAKPOINT_CONDITION_MAX_WIDTH,
  ADAP_BREAKPOINT_CONDITION_MIN_HEIGHT,
  ADAP_BREAKPOINT_CONDITION_MAX_HEIGHT,
} AdapBreakpointConditionLengthType;

typedef enum {
  ADAP_BREAKPOINT_CONDITION_MIN_ASPECT_RATIO,
  ADAP_BREAKPOINT_CONDITION_MAX_ASPECT_RATIO,
} AdapBreakpointConditionRatioType;

typedef struct _AdapBreakpointCondition AdapBreakpointCondition;

extern
GType adap_breakpoint_condition_get_type (void) ;

extern
AdapBreakpointCondition *adap_breakpoint_condition_new_length (AdapBreakpointConditionLengthType type,
                                                             double                           value,
                                                             AdapLengthUnit                    unit) ;

extern
AdapBreakpointCondition *adap_breakpoint_condition_new_ratio (AdapBreakpointConditionRatioType type,
                                                            int                             width,
                                                            int                             height) ;

extern
AdapBreakpointCondition *adap_breakpoint_condition_new_and (AdapBreakpointCondition *condition_1,
                                                          AdapBreakpointCondition *condition_2) ;

extern
AdapBreakpointCondition *adap_breakpoint_condition_new_or (AdapBreakpointCondition *condition_1,
                                                         AdapBreakpointCondition *condition_2) ;

extern
AdapBreakpointCondition *adap_breakpoint_condition_copy (AdapBreakpointCondition *self);
extern
void                    adap_breakpoint_condition_free (AdapBreakpointCondition *self);

extern
AdapBreakpointCondition *adap_breakpoint_condition_parse (const char *str);

extern
char *adap_breakpoint_condition_to_string (AdapBreakpointCondition *self);


#define ADAP_TYPE_BREAKPOINT (adap_breakpoint_get_type())

//G_DECLARE_FINAL_TYPE (AdapBreakpoint, adap_breakpoint, ADAP, BREAKPOINT, GObject)

extern
AdapBreakpoint *adap_breakpoint_new (AdapBreakpointCondition *condition) ;

extern
AdapBreakpointCondition *adap_breakpoint_get_condition (AdapBreakpoint          *self);
extern
void                    adap_breakpoint_set_condition (AdapBreakpoint          *self,
                                                      AdapBreakpointCondition *condition);

extern
void adap_breakpoint_add_setter (AdapBreakpoint *self,
                                GObject       *object,
                                const char    *property,
                                const GValue  *value);

extern
void adap_breakpoint_add_setters        (AdapBreakpoint *self,
                                        GObject       *first_object,
                                        const char    *first_property,
                                        ...) ;
extern
void adap_breakpoint_add_settersv       (AdapBreakpoint *self,
                                        int            n_setters,
                                        GObject       *objects[],
                                        const char    *names[],
                                        const GValue  *values[]);
extern
void adap_breakpoint_add_setters_valist (AdapBreakpoint *self,
                                        GObject       *first_object,
                                        const char    *first_property,
                                        va_list        args);


