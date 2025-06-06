#ifndef ELM_WIDGET_NAVIFRAME_H
#define ELM_WIDGET_NAVIFRAME_H

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
 * @section elm-naviframe-class The Elementary Naviframe Class
 *
 * Elementary, besides having the @ref Naviframe widget, exposes its
 * foundation -- the Elementary Naviframe Class -- in order to create other
 * widgets which are a naviframe with some more logic on top.
 */

/**
 * Base layout smart data extended with naviframe instance data.
 */
typedef struct _Elm_Naviframe_Data Elm_Naviframe_Data;
struct _Elm_Naviframe_Data
{
   Evas_Object          *obj; /* the object itself */
   Eina_Inlist          *stack; /* top item is the list's LAST item */
   Eina_List            *popping;
   Eina_List            *ops;
   Evas_Object          *dummy_edje;
   Evas_Display_Mode     dispmode;

   Eina_Bool             preserve : 1;
   Eina_Bool             on_deletion : 1;
   Eina_Bool             auto_pushed : 1;
   Eina_Bool             freeze_events : 1;
};

typedef struct _Elm_Naviframe_Item_Data Elm_Naviframe_Item_Data;
struct _Elm_Naviframe_Item_Data
{
   Elm_Widget_Item_Data *base;
   Eina_Inlist __in_list;

   Eina_Inlist *content_list;
   Eina_Inlist *text_list;
   Evas_Object *content;
   Evas_Object *title_prev_btn;
   Evas_Object *title_next_btn;
   Evas_Object *title_icon;
   Evas_Object *auto_pushed_btn;
   Evas_Display_Mode dispmode;
   Elm_Naviframe_Item_Pop_Cb pop_cb;
   void        *pop_data;
   const char  *title_label;
   const char  *subtitle_label;

   Evas_Coord   minw;
   Evas_Coord   minh;

   Eina_Bool    title_enabled : 1;
   Eina_Bool    pushing : 1; /**< a flag to notify the item is on pushing. This flag is set true at the start of item push. */
   Eina_Bool    popping : 1; /**< a flag to notify the item is on poping. this flag is set true at the start of item pop. */
   Eina_Bool    delete_me : 1; /**< a flag to notify the item is on deletion. this flag is set true at the start of item deletion. */
};

typedef struct _Elm_Naviframe_Op Elm_Naviframe_Op;
struct _Elm_Naviframe_Op
{
   Elm_Naviframe_Item_Data *self;
   Elm_Naviframe_Item_Data *related;

   Eina_Bool push : 1;
};

typedef struct _Elm_Naviframe_Content_Item_Pair Elm_Naviframe_Content_Item_Pair;
struct _Elm_Naviframe_Content_Item_Pair
{
   Eina_Inlist __in_list;
   const char *part;
   Evas_Object *content;
   Elm_Naviframe_Item_Data *it;
};

typedef struct _Elm_Naviframe_Text_Item_Pair Elm_Naviframe_Text_Item_Pair;
struct _Elm_Naviframe_Text_Item_Pair
{
   Eina_Inlist __in_list;
   const char *part;
};

/**
 * @}
 */

