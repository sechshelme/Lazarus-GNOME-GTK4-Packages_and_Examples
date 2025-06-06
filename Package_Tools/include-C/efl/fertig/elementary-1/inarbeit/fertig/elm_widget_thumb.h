#ifndef ELM_WIDGET_THUMB_H
#define ELM_WIDGET_THUMB_H

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
 * @section elm-thumb-class The Elementary Thumb Class
 *
 * Elementary, besides having the @ref Thumb widget, exposes its
 * foundation -- the Elementary Thumb Class -- in order to create
 * other widgets which are a thumb with some more logic on top.
 */

/**
 * Base widget smart data extended with thumb instance data.
 */
typedef struct _Elm_Thumb_Data Elm_Thumb_Data;
struct _Elm_Thumb_Data
{
   Evas_Object          *obj; // the object itself
   Evas_Object          *view;  /* actual thumbnail, to be swallowed
                                 * at the thumb frame */

   /* original object's file/key pair */
   const char           *file;
   const char           *key;

   struct
   {
      /* object's thumbnail file/key pair */
      const char          *file;
      const char          *key;
      const char          *thumb_path;
      const char          *thumb_key;
      Ethumb_Client_Async *request;

      double                cropx;
      double                cropy;
      int                  compress;
      int                  quality;
      int                  tw;
      int                  th;

      Ethumb_Thumb_Aspect  aspect;
      Ethumb_Thumb_FDO_Size size;
      Ethumb_Thumb_Format  format;
      Ethumb_Thumb_Orientation orient;

      Eina_Bool            retry : 1;
   } thumb;

   Ecore_Event_Handler        *eeh;
   Elm_Thumb_Animation_Setting anim_setting;

   Eina_Bool                   edit : 1;
   Eina_Bool                   on_hold : 1;
   Eina_Bool                   is_video : 1;
   Eina_Bool                   was_video : 1;
   Eina_Bool                   loaded : 1;
};


