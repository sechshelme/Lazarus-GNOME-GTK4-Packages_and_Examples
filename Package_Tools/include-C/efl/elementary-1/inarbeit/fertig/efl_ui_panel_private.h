#ifndef EFL_UI_PANEL_H
#define EFL_UI_PANEL_H

#include "elm_interface_scrollable.h"
#include "elm_widget_layout.h"
#include "efl_ui_panel.eo.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(EFL_UI_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * Base layout smart data extended with panel instance data.
 */
typedef struct _Efl_Ui_Panel_Data Efl_Ui_Panel_Data;
struct _Efl_Ui_Panel_Data
{
   Evas_Object                          *bx, *content;
   Evas_Object                          *event;
   Evas_Object                          *scr_ly;
   Evas_Object                          *panel_edje, *scr_edje;
   Evas_Object                          *scr_panel, *scr_event;
   Evas_Object                          *smanager, *pan_obj;


   Efl_Ui_Panel_Orient                   orient;

   double                                content_size_ratio;
   Evas_Coord                            down_x, down_y;
   Evas_Coord                            handler_size;
   Ecore_Timer                          *timer;

   Eina_Bool                             hidden : 1;
   Eina_Bool                             delete_me : 1;
   Eina_Bool                             scrollable : 1;
   Eina_Bool                             freeze: 1;
   Eina_Bool                             callback_added: 1;
};


