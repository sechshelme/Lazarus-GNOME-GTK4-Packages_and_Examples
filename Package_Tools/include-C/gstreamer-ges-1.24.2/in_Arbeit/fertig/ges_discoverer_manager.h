#pragma once

#include <ges/ges-types.h>
#include <gst/gst.h>
#include <gst/pbutils/pbutils.h>
#include <glib-object.h>



/**
 * GES_TYPE_DISCOVERER_MANAGER:
 *
 * Since: 1.24
 */
#define GES_TYPE_DISCOVERER_MANAGER ges_discoverer_manager_get_type ()

typedef struct _GESDiscovererManagerClass
{
  GObjectClass parent_class;
}ffff ;

//GES_DECLARE_TYPE( DiscovererManager, discoverer_manager, DISCOVERER_MANAGER);

extern GstClockTime            ges_discoverer_manager_get_timeout    (GESDiscovererManager * self);
extern void                    ges_discoverer_manager_set_timeout    (GESDiscovererManager * self,
                                                                       GstClockTime timeout);
extern GESDiscovererManager *  ges_discoverer_manager_get_default    (void);
extern void                    ges_discoverer_manager_set_use_cache  (GESDiscovererManager *self,
                                                                       gboolean use_cache);
extern gboolean                ges_discoverer_manager_get_use_cache  (GESDiscovererManager *self);


