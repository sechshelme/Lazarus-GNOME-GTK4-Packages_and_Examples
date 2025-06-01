#ifndef EFL_UI_TAB_BAR_PRIVATE_H
#define EFL_UI_TAB_BAR_PRIVATE_H

typedef struct _Efl_Ui_Tab_Bar_Data                   Efl_Ui_Tab_Bar_Data;

struct _Efl_Ui_Tab_Bar_Data
{
   Efl_Ui_Box                           *bx;
   Efl_Ui_Item                          *selected, *fallback_selection;
   Eina_Bool                             in_value_change;
   Eina_Bool                             allow_manual_deselection : 1;
};

