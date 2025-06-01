#ifndef ELM_WIDGET_WEB_H
#define ELM_WIDGET_WEB_H

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-web-class The Elementary Web Class
 *
 * Elementary, besides having the @ref Web widget, exposes its
 * foundation -- the Elementary Web Class -- in order to create other
 * widgets which are a web view with some more logic on top.
 */

/**
 * Base widget smart data extended with web instance data.
 */
typedef struct _Elm_Web_Data Elm_Web_Data;
struct _Elm_Web_Data
{
   Evas_Object *obj;
};

struct _Elm_Web_Callback_Proxy_Context
{
   const char  *name;
   Evas_Object *obj;
};
typedef struct _Elm_Web_Callback_Proxy_Context Elm_Web_Callback_Proxy_Context;

