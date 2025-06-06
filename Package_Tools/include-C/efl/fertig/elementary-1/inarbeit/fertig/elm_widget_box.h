#ifndef ELM_WIDGET_BOX_H
#define ELM_WIDGET_BOX_H

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
 * @section elm-box-class The Elementary Box Class
 *
 * Elementary, besides having the @ref Box widget, exposes its
 * foundation -- the Elementary Box Class -- in order to create
 * other widgets which are a box with some more logic on top.
 */

/**
 * Base widget smart data extended with box instance data.
 */
typedef struct _Elm_Box_Data        Elm_Box_Data;
struct _Elm_Box_Data
{
   Eina_Bool             homogeneous : 1;
   Eina_Bool             delete_me : 1;
   Eina_Bool             horizontal : 1;
   Eina_Bool             recalc : 1;
};

struct _Elm_Box_Transition
{
   double          initial_time;
   double          duration;
   Ecore_Animator *animator;

   struct
   {
      Evas_Object_Box_Layout layout;
      void                  *data;
      void                   (*free_data)(void *data);
   } start, end;

   void            (*transition_end_cb)(void *data);
   void           *transition_end_data;
   void            (*transition_end_free_data)(void *data);
   Eina_List      *objs;
   Evas_Object    *box;

   Eina_Bool       animation_ended : 1;
   Eina_Bool       recalculate : 1;
};

typedef struct _Transition_Animation_Data Transition_Animation_Data;
struct _Transition_Animation_Data
{
   Evas_Object *obj;
   struct
   {
      Evas_Coord x, y, w, h;
   } start, end;
};

/**
 * @}
 */

