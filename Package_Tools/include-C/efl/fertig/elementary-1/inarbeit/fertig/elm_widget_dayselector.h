#ifndef ELM_WIDGET_DAYSELECTOR_H
#define ELM_WIDGET_DAYSELECTOR_H

#include "Elementary.h"
#include "elm_dayselector_item_eo.h"
#include "elm_dayselector_eo.h"


/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-dayselector-class The Elementary Dayselector Class
 *
 * Elementary, besides having the @ref Dayselector widget, exposes its
 * foundation -- the Elementary Dayselector Class -- in order to create other
 * widgets which are a dayselector with some more logic on top.
 */

/**
 * Base layout smart data extended with dayselector instance data.
 */
typedef struct _Elm_Dayselector_Data Elm_Dayselector_Data;
struct _Elm_Dayselector_Data
{
   Eina_List            *items;
   Elm_Dayselector_Day   week_start;
   Elm_Dayselector_Day   weekend_start;
   unsigned int          weekend_len;
   Eina_Bool weekdays_names_set : 1;
};

typedef struct _Elm_Dayselector_Item_Data       Elm_Dayselector_Item_Data;
struct _Elm_Dayselector_Item_Data
{
   Elm_Widget_Item_Data *base;
   Elm_Dayselector_Day day;
   const char         *day_style;
};

/**
 * @}
 */


