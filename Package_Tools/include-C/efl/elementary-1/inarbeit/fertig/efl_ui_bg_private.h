#ifndef ELM_WIDGET_BG_H
#define ELM_WIDGET_BG_H

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
 * @section elm-bg-class The Elementary Bg Class
 *
 * Elementary, besides having the @ref Bg widget, exposes its
 * foundation -- the Elementary Bg Class -- in order to create other
 * widgets which are a bg with some more logic on top.
 */

/**
 * Base layout smart data extended with bg instance data.
 */
typedef struct _Efl_Ui_Bg_Data Efl_Ui_Bg_Data;
struct _Efl_Ui_Bg_Data
{
   Evas_Object          *rect; /*<< Used for elm_bg_color_set(): elm.swallow.rectangle */
   Evas_Object          *img; /*<< Used for elm_bg_file_set(): elm.swallow.content */
   const char           *file; /*<< Used for elm_bg_file_set() with legacy widget */
   const char           *key; /*<< Used for elm_bg_file_set() with legacy widget */
};

/**
 * @}
 */


