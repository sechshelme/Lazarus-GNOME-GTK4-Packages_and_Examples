#ifndef EFL_UI_VIDEO_PRIV_H
#define EFL_UI_VIDEO_PRIV_H

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
 * @section elm-video-class The Elementary Video Class
 *
 * Elementary, besides having the @ref Video widget, exposes its
 * foundation -- the Elementary Video Class -- in order to create other
 * widgets which are a video with some more logic on top.
 */

/**
 * Base layout smart data extended with video instance data.
 */
typedef struct _Efl_Ui_Video_Data Efl_Ui_Video_Data;
struct _Efl_Ui_Video_Data
{
   Evas_Object          *emotion;
   Ecore_Timer          *timer;

   Eina_Bool             stop : 1;
   Eina_Bool             remember : 1;
};


