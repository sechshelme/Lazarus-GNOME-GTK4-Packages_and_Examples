#ifndef EFL_UI_RADIO_PRIVATE_H
#define EFL_UI_RADIO_PRIVATE_H

#include "Elementary.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-radio-class The Elementary Radio Class
 *
 * Elementary, besides having the @ref Radio widget, exposes its
 * foundation -- the Elementary Radio Class -- in order to create other
 * widgets which are a radio with some more logic on top.
 */

/**
 * Base layout smart data extended with radio instance data.
 */
typedef struct _Efl_Ui_Radio_Data       Efl_Ui_Radio_Data;
typedef struct _Group                Group;

struct _Group
{
   int        value;
   int       *valuep;
   Eina_List *radios;
};

struct _Efl_Ui_Radio_Data
{
   int                   value;
   Group                *group;
};

/**
 * @}
 */

