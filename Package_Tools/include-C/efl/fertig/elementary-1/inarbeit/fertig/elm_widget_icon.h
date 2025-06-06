#ifndef ELM_WIDGET_ICON_H
#define ELM_WIDGET_ICON_H

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
 * @section elm-icon-class The Elementary Icon Class
 *
 * This class defines a common interface for @b icon objects having
 * an icon as their basic graphics.
 */

typedef struct _Elm_Icon_Data Elm_Icon_Data;
struct _Elm_Icon_Data
{
   Evas_Object          *obj; // the object itself
   const char           *stdicon;

   struct
   {
      struct
      {
         const char *path;
         const char *key;
      } file, thumb;

      Ecore_Event_Handler *eeh;

      Ethumb_Thumb_Format  format;

      Ethumb_Client_Async *request;

      Eina_Bool            retry : 1;
   } thumb;

   struct
   {
      int       requested_size;
      Eina_Bool use : 1;
   } freedesktop;

   int        in_eval;

   /* WARNING: to be deprecated */
   Eina_List *edje_signals;

   Eina_Bool  is_video : 1;
};

/**
 * @}
 */


