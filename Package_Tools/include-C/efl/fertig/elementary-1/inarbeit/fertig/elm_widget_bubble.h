#ifndef ELM_WIDGET_BUBBLE_H
#define ELM_WIDGET_BUBBLE_H

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
 * @section elm-bubble-class The Elementary Bubble Class
 *
 * Elementary, besides having the @ref Bubble widget, exposes its
 * foundation -- the Elementary Bubble Class -- in order to create other
 * widgets which are a bubble with some more logic on top.
 */


/**
 * Base layout smart data extended with bubble instance data.
 */
typedef struct _Elm_Bubble_Data Elm_Bubble_Data;
struct _Elm_Bubble_Data
{
   Elm_Bubble_Pos        pos;
};

/**
 * @}
 */


