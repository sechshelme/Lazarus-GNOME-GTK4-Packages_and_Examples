/*
 * Copyright (C) 2021 Nahuel Gomez Castro
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-style-manager.h"



#define ADAP_TYPE_APPLICATION (adap_application_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapApplication, adap_application, ADAP, APPLICATION, GtkApplication)

/**
 * AdapApplicationClass:
 * @parent_class: The parent class
 */
struct _AdapApplicationClass
{
  GtkApplicationClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
AdapApplication *adap_application_new (const char        *application_id,
                                     GApplicationFlags  flags) ;

extern
AdapStyleManager *adap_application_get_style_manager (AdapApplication *self);


