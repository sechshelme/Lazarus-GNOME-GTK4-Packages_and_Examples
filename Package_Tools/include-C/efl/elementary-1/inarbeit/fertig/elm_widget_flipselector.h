#ifndef ELM_WIDGET_FLIPSELECTOR_H
#define ELM_WIDGET_FLIPSELECTOR_H

#include "elm_widget_layout.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-flipselector-class The Elementary Flipselector Class
 *
 * Elementary, besides having the @ref Flipselector widget, exposes its
 * foundation -- the Elementary Flipselector Class -- in order to create other
 * widgets which are a flipselector with some more logic on top.
 */

/**
 * Base layout smart data extended with flipselector instance data.
 */
typedef struct _Elm_Flipselector_Data Elm_Flipselector_Data;
struct _Elm_Flipselector_Data
{
   Evas_Object          *obj;
   Eina_List            *items;
   Eina_List            *current;
   Eina_List            *sentinel; /* item containing the largest
                                    * label string */
   Ecore_Timer          *spin;
   Ecore_Job            *view_update;

   unsigned int          max_len;
   double                interval, first_interval;
   double                val_min, val_max;
   double                step; /**< step for the value change. 1 by default. */

   int                   walking;
   Eina_Bool             evaluating : 1;
   Eina_Bool             deleting : 1;
   Eina_Bool             need_update : 1;
};

typedef struct _Elm_Flipselector_Item_Data       Elm_Flipselector_Item_Data;
struct _Elm_Flipselector_Item_Data
{
   Elm_Widget_Item_Data *base;

   const char   *label;
   Evas_Smart_Cb func;
};


