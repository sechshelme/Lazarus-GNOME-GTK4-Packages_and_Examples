#ifndef EFL_UI_SLIDER_INTERVAL_PRIVATE_H
#define EFL_UI_SLIDER_INTERVAL_PRIVATE_H

#include "Elementary.h"
typedef struct _Efl_Ui_Slider_Interval_Data Efl_Ui_Slider_Interval_Data;
struct _Efl_Ui_Slider_Interval_Data
{
   Evas_Object                *spacer;
   Ecore_Timer                *delay;

   double                     intvl_from, intvl_to;
   double                     val, val_min, val_max, step;

   int                        intvl_flag;
   Evas_Coord                 downx, downy;
   Efl_Ui_Layout_Orientation  dir;

   Eina_Bool                  spacer_down : 1;
   Eina_Bool                  frozen : 1;
};


