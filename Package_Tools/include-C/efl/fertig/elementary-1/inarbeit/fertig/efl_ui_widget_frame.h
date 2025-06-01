#ifndef EFL_UI_WIDGET_FRAME_H
#define EFL_UI_WIDGET_FRAME_H

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
 * @section elm-frame-class The Elementary Frame Class
 *
 * Elementary, besides having the @ref Frame widget, exposes its
 * foundation -- the Elementary Frame Class -- in order to create other
 * widgets which are a frame with some more logic on top.
 */

/**
 * Base layout smart data extended with frame instance data.
 */
typedef struct _Efl_Ui_Frame_Data Efl_Ui_Frame_Data;
struct _Efl_Ui_Frame_Data
{
   Eina_Bool             collapsed : 1;
   Eina_Bool             collapsible : 1;
   Eina_Bool             anim : 1;
};

/**
 * @}
 */


