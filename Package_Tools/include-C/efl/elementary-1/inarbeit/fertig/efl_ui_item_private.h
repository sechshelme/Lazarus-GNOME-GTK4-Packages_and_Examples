#ifndef EFL_UI_ITEM_PRIVATE_H
#define EFL_UI_ITEM_PRIVATE_H

#include "Elementary.h"

typedef struct _Efl_Ui_Item_Data
{
   // Eo Objects
   Eo *container; /* Parent Widget */
   Efl_Ui_Item *parent;

   // Boolean Data
   Eina_Bool  selected : 1; /* State for item selected */
   Eina_Bool  locked : 1;
} Efl_Ui_Item_Data;



