#ifndef ELM_WIDGET_POPUP_H
#define ELM_WIDGET_POPUP_H

#include "Elementary.h"
#include "elm_widget_layout.h"
#include "elm_notify_eo.h"
#include "elm_popup_item_eo.h"
#include "elm_popup_eo.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-popup-class The Elementary Popup Class
 *
 * Elementary, besides having the @ref Popup widget, exposes its
 * foundation -- the Elementary Popup Class -- in order to create other
 * widgets which are a popup with some more logic on top.
 */

#define ELM_POPUP_ACTION_BUTTON_MAX 3

typedef struct _Action_Area_Data Action_Area_Data;

/**
 * Base layout smart data extended with popup instance data.
 */
typedef struct _Elm_Popup_Data Elm_Popup_Data;
struct _Elm_Popup_Data
{
   Evas_Object          *notify;
   Evas_Object          *main_layout;
   Evas_Object          *title_icon;
   Evas_Object          *content_area;
   Evas_Object          *text_content_obj;
   Evas_Object          *action_area;
   Evas_Object          *box;
   Evas_Object          *tbl;
   Evas_Object          *spacer;
   Evas_Object          *scr;
   Evas_Object          *content;
   Evas_Object          *parent; /**< Pointer to remove _parent_resize_cb when popup is deleted. */
   Eina_List            *items;
   const char           *title_text;
   Action_Area_Data     *buttons[ELM_POPUP_ACTION_BUTTON_MAX];
   Elm_Wrap_Type         content_text_wrap_type;
   unsigned int          last_button_number;
   Evas_Coord            max_sc_h;

   Eina_Bool             visible : 1;
   Eina_Bool             scr_size_recalc : 1;
   Eina_Bool             scroll : 1;
   Eina_Bool             theme_scroll : 1;
};

typedef struct _Elm_Popup_Item_Data Elm_Popup_Item_Data;
struct _Elm_Popup_Item_Data
{
   Elm_Widget_Item_Data *base;

   const char     *label;
   Evas_Object    *icon;
   Evas_Smart_Cb   func;
   Eina_Bool       disabled : 1;
};

struct _Action_Area_Data
{
   Evas_Object *obj;
   Evas_Object *btn;
   Eina_Bool    delete_me;
};

/**
 * @}
 */


