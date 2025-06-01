#ifndef ELM_WIDGET_ACTIONSLIDER_H
#define ELM_WIDGET_ACTIONSLIDER_H

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
 * @section elm-actionslider-class The Elementary Actionslider Class
 *
 * Elementary, besides having the @ref Actionslider widget, exposes its
 * foundation -- the Elementary Actionslider Class -- in order to create other
 * widgets which are a actionslider with some more logic on top.
 */

/**
 * Base layout smart data extended with actionslider instance data.
 */
typedef struct _Elm_Actionslider_Data Elm_Actionslider_Data;
struct _Elm_Actionslider_Data
{
   Evas_Object          *drag_button_base;
   Elm_Actionslider_Pos  magnet_position, enabled_position;
   Ecore_Animator       *button_animator;
   double                final_position;

   Eina_Bool             mouse_down : 1;
};


