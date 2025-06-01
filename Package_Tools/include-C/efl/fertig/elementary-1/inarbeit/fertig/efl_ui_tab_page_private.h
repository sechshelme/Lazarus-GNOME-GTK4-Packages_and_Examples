#ifndef EFL_UI_TAB_PAGE_PRIVATE_H
#define EFL_UI_TAB_PAGE_PRIVATE_H

typedef struct _Efl_Ui_Tab_Page_Data                    Efl_Ui_Tab_Page_Data;

struct _Efl_Ui_Tab_Page_Data
{
   Eo                                   *content;
   const char                           *tab_label;
   const char                           *tab_icon;
   Eo                                   *tab_bar_icon;
};


