#ifndef ELM_WIDGET_SEGMENT_CONTROL_H
#define ELM_WIDGET_SEGMENT_CONTROL_H

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
 * @section elm-segment-control-class The Elementary Segment control Class
 *
 * Elementary, besides having the @ref Elm_Segment_Control widget, exposes
 * its foundation -- the Elementary Segment control Class -- in order
 * to create other widgets which are a segment control with some more
 * logic on top.
 */
/**
 * Base layout smart data extended with segment control instance data.
 */
typedef struct _Elm_Segment_Control_Data       Elm_Segment_Control_Data;
typedef struct _Elm_Segment_Control_Item_Data       Elm_Segment_Control_Item_Data;

struct _Elm_Segment_Control_Data
{
   Evas_Object          *obj;
   Eina_List            *items;
   Elm_Segment_Control_Item_Data     *selected_item;

   int                   item_width;
};

struct _Elm_Segment_Control_Item_Data
{
   Elm_Widget_Item_Data *base;

   Evas_Object *icon;
   const char  *label;
   int          seg_index;
};


