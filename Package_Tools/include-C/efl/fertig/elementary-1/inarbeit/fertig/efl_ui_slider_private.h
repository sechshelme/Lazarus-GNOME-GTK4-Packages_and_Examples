#ifndef EFL_UI_SLIDER_PRIVATE_H
#define EFL_UI_SLIDER_PRIVATE_H

#include "Elementary.h"

typedef struct _Efl_Ui_Slider_Data Efl_Ui_Slider_Data;
struct _Efl_Ui_Slider_Data
{
   Evas_Object                *spacer;
   Ecore_Timer                *delay;

   double                      val, val_min, val_max, step;

   Evas_Coord                  downx, downy;
   Efl_Ui_Layout_Orientation   dir;

   Eina_Bool                   spacer_down : 1;
   Eina_Bool                   frozen : 1;
};

/**
 * @}
 */


