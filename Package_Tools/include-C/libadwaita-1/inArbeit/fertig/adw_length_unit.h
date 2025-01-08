/*
 * Copyright (C) 2023 Purism SPC
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



typedef enum {
  ADW_LENGTH_UNIT_PX,
  ADW_LENGTH_UNIT_PT,
  ADW_LENGTH_UNIT_SP,
} AdwLengthUnit;

extern
double adw_length_unit_to_px (AdwLengthUnit  unit,
                              double         value,
                              GtkSettings   *settings);

extern
double adw_length_unit_from_px (AdwLengthUnit  unit,
                                double         value,
                                GtkSettings   *settings);

