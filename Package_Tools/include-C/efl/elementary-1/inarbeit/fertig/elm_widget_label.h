#ifndef ELM_WIDGET_LABEL_H
#define ELM_WIDGET_LABEL_H

#include "Elementary.h"

#include <Eio.h>

#include "elm_label_eo.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * Base layout smart data extended with label instance data.
 */
typedef struct _Elm_Label_Data Elm_Label_Data;
struct _Elm_Label_Data
{
   const char           *format;
   double                slide_duration;
   double                slide_speed;
   Evas_Coord            lastw; /*<< lastly calculated resize object width.This is used to force the calculation on width changes. */
   Evas_Coord            wrap_w; /*<< wrap width by pixel for the line wrap support **/
   Elm_Wrap_Type         linewrap;
   Elm_Label_Slide_Mode  slide_mode;

   Eina_Bool             ellipsis : 1;
   Eina_Bool             slide_ellipsis : 1;
   Eina_Bool             use_slide_speed : 1;
   Eina_Bool             slide_state : 1; /**< This will be marked as EINA_TRUE after elm_label_slide_go() is called. */
};


