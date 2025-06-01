#ifndef ELM_WIDGET_COMBOBOX_H
#define ELM_WIDGET_COMBOBOX_H

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
 * @section elm-combobox-class The Elementary Combobox Class
 *
 * Elementary, besides having the @ref Combobox widget, exposes its
 * foundation -- the Elementary Combobox Class -- in order to create other
 * widgets which are a combobox with some more logic on top.
 */

/**
 * Base button smart data extended with combobox instance data.
 */
typedef struct _Elm_Combobox_Data Elm_Combobox_Data;
struct _Elm_Combobox_Data
{
   /* aggregates a hover */
   Evas_Object          *hover;
   Evas_Object          *hover_parent;
   Evas_Object          *genlist;
   Evas_Object          *entry;
   Evas_Object          *tbl;
   Evas_Object          *spacer;
   Elm_Object_Item      *item;
   const char           *style;
   const char           *best_location;
   int                   count;
   int                   item_height;
   Eina_Bool             expanded:1;
   Eina_Bool             first_filter:1;
};

/**
 * @}
 */


#define ELM_COMBOBOX_CLASS elm_combobox_class_get()

extern const Efl_Class *elm_combobox_class_get(void) ;

#endif
