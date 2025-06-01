#ifndef ELM_WIDGET_HOVER_H
#define ELM_WIDGET_HOVER_H

#include "Elementary.h"
#include "elm_widget_layout.h"
#include "elm_hover_eo.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-hover-class The Elementary Hover Class
 *
 * Elementary, besides having the @ref Hover widget, exposes its
 * foundation -- the Elementary Hover Class -- in order to create other
 * widgets which are a hover with some more logic on top.
 */

/**
 * Base widget smart data extended with hover instance data.
 */
typedef struct _Elm_Hover_Data       Elm_Hover_Data;
typedef struct _Content_Info         Content_Info;

struct _Content_Info
{
   const char  *swallow;
   Evas_Object *obj;
};

/* WARNING: sync size with actual declaration, always */
extern const Elm_Layout_Part_Alias_Description _content_aliases[10];

struct _Elm_Hover_Data
{
   Evas_Object          *offset, *size;
   Evas_Object          *parent, *target;

   Content_Info         *smt_sub;  /* 'smart placement' sub object */
   Content_Info          subs[sizeof(_content_aliases) /
                              sizeof(_content_aliases[0]) - 1];

   Eina_Bool             on_del : 1;
};

/**
 * @}
 */


