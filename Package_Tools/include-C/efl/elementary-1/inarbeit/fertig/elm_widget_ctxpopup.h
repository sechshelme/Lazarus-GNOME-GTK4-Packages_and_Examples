#ifndef ELM_WIDGET_CTXPOPUP_H
#define ELM_WIDGET_CTXPOPUP_H

#include "elm_widget_layout.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-ctxpopup-class The Elementary Ctxpopup Class
 *
 * Elementary, besides having the @ref Ctxpopup widget, exposes its
 * foundation -- the Elementary Ctxpopup Class -- in order to create other
 * widgets which are a ctxpopup with some more logic on top.
 */

typedef struct _Elm_Ctxpopup_Item_Data       Elm_Ctxpopup_Item_Data;

/**
 * Base widget smart data extended with ctxpopup instance data.
 */
typedef struct _Elm_Ctxpopup_Data Elm_Ctxpopup_Data;
struct _Elm_Ctxpopup_Item_Data
{
   Elm_Widget_Item_Data *base;

   Elm_Object_Item *list_item;

   struct
     {
        Evas_Smart_Cb org_func_cb;
        const void    *org_data;
        Evas_Object   *cobj;
     } wcb;

   Eina_Bool      selected : 1;
};

struct _Elm_Ctxpopup_Data
{
   Evas_Object           *parent;
   Evas_Object           *list;
   Evas_Object           *box;
   Eina_List             *items;

   Evas_Object           *arrow;
   Evas_Object           *bg;
   Evas_Object           *content;

   Elm_Ctxpopup_Direction dir;
   Elm_Ctxpopup_Direction dir_priority[4];

   Eina_Bool              list_visible : 1;
   Eina_Bool              horizontal : 1;
   Eina_Bool              finished : 1;
   Eina_Bool              emitted : 1;
   Eina_Bool              visible : 1;
   Eina_Bool              auto_hide : 1; /**< auto hide mode triggered by ctxpopup policy*/
};


