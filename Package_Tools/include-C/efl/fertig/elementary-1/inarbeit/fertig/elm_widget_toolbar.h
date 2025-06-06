#ifndef ELM_WIDGET_TOOLBAR_H
#define ELM_WIDGET_TOOLBAR_H

#include "elm_interface_scrollable.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-toolbar-class The Elementary Toolbar Class
 *
 * Elementary, besides having the @ref Toolbar widget, exposes its
 * foundation -- the Elementary Toolbar Class -- in order to create other
 * widgets which are a toolbar with some more logic on top.
 */

typedef struct _Elm_Toolbar_Item_Data Elm_Toolbar_Item_Data;

/**
 * Base widget smart data extended with toolbar instance data.
 */
typedef struct _Elm_Toolbar_Data Elm_Toolbar_Data;
struct _Elm_Toolbar_Data
{
   Evas_Object                          *hit_rect;

   Evas_Object                          *bx, *more, *bx_more, *bx_more2;
   Evas_Object                          *menu_parent;
   Eina_Inlist                          *items;
   Elm_Toolbar_Item_Data                *more_item;
   Elm_Object_Item                      *selected_item; /**< a selected item by mouse click, return key, api, and etc. */
   Elm_Object_Item                      *focused_item; /**< a focused item by keypad arrow or mouse. This is set to NULL if widget looses focus. */
   Elm_Object_Item                      *last_focused_item; /**< This records the last focused item when widget looses focus. This is required to set the focus on last focused item when widgets gets focus. */
   Elm_Toolbar_Item_Data                *reorder_empty, *reorder_item;
   Elm_Toolbar_Shrink_Mode               shrink_mode;
   int                                   theme_icon_size, priv_icon_size,
                                         icon_size;
   int                                   standard_priority;
   int                                   minw_bx, minh_bx;
   unsigned int                          item_count;
   unsigned int                          separator_count;
   double                                align;
   Elm_Object_Select_Mode                select_mode;
   Ecore_Timer                          *long_timer;
   Ecore_Job                            *resize_job;
   Efl_Ui_Layout_Orientation             dir;

   Eina_Bool                             long_press : 1;
   Eina_Bool                             homogeneous : 1;
   Eina_Bool                             delete_me : 1;
   Eina_Bool                             reorder_mode : 1;
   Eina_Bool                             transverse_expanded : 1;
   Eina_Bool                             mouse_down : 1; /**< a flag that mouse is down on the toolbar at the moment. This flag is set to true on mouse and reset to false on mouse up. */
};

struct _Elm_Toolbar_Item_Data
{
   Elm_Widget_Item_Data     *base;
   Eina_Inlist __in_list;

   const char   *label;
   const char   *icon_str;
   Evas_Object  *icon;
   Evas_Object  *object;
   Evas_Object  *o_menu;
   Evas_Object  *in_box;
   Evas_Object  *proxy;
   Evas_Smart_Cb func;
   Elm_Transit  *trans;
   Elm_Toolbar_Item_Data *reorder_to;
   struct
   {
      int       priority;
      Eina_Bool visible : 1;
   } prio;

   Eina_List    *states;
   Eina_List    *current_state;

   Eina_Bool     separator : 1;
   Eina_Bool     selected : 1;
   Eina_Bool     menu : 1;
   Eina_Bool     on_move : 1;
};


/**
 * @}
 */


