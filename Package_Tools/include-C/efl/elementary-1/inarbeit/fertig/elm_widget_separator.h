#ifndef ELM_WIDGET_SEPARATOR_H
#define ELM_WIDGET_SEPARATOR_H

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
 * @section elm-separator-class The Elementary Separator Class
 *
 * Elementary, besides having the @ref Separator widget, exposes its
 * foundation -- the Elementary Separator Class -- in order to create other
 * widgets which are a separator with some more logic on top.
 */

/**
 * Base layout smart data extended with separator instance data.
 */
typedef struct _Elm_Separator_Data Elm_Separator_Data;
struct _Elm_Separator_Data
{
   Eina_Bool             horizontal : 1;
};

/**
 * @}
 */


