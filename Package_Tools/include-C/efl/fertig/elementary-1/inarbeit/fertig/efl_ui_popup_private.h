#ifndef EFL_UI_WIDGET_POPUP_H
#define EFL_UI_WIDGET_POPUP_H

typedef struct _Efl_Ui_Popup_Data Efl_Ui_Popup_Data;
struct _Efl_Ui_Popup_Data
{
   Eo                *win_parent;
   Eo                *backwall;
   Efl_Ui_Popup_Align align;
   Eo                 *anchor;
   Efl_Ui_Popup_Align  priority[5];
   Efl_Ui_Popup_Align  used_align;
   Ecore_Timer       *timer;
   double             timeout;
   Eina_Bool          in_calc : 1;
};


