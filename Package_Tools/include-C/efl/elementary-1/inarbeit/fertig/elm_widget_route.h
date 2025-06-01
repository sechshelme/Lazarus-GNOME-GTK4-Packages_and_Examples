#ifndef ELM_WIDGET_ROUTE_H
#define ELM_WIDGET_ROUTE_H

#include "elm_route_eo.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-route-class The Elementary Route Class
 *
 * Elementary, besides having the @ref Route widget, exposes its
 * foundation -- the Elementary Route Class -- in order to create other
 * widgets which are a route with some more logic on top.
 */

/**
 * Base widget smart data extended with route instance data.
 */
typedef struct _Elm_Route_Data       Elm_Route_Data;
typedef struct Segment               Segment;

struct _Elm_Route_Data
{
#ifdef ELM_EMAP
   EMap_Route           *emap;
#endif

   double                lon_min, lon_max;
   double                lat_min, lat_max;

   Eina_List            *segments; //list of *Segment

   Eina_Bool             must_calc_segments : 1;
};

struct Segment
{
   Evas_Object     *obj;

#ifdef ELM_EMAP
   EMap_Route_Node *node_start;
   EMap_Route_Node *node_end;
#endif

   double           start_x, start_y;
   double           end_x, end_y;

   Eina_Bool        must_calc : 1;
};
/**
 * @}
 */


