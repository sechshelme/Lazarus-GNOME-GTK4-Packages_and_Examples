#ifndef __GEGL_DEBUG_H__
#define __GEGL_DEBUG_H__

#include <glib.h>



extern guint gegl_debug_flags;

typedef enum {
  GEGL_DEBUG_PROCESS         = 1 << 0,
  GEGL_DEBUG_BUFFER_LOAD     = 1 << 1,
  GEGL_DEBUG_BUFFER_SAVE     = 1 << 2,
  GEGL_DEBUG_TILE_BACKEND    = 1 << 3,
  GEGL_DEBUG_PROCESSOR       = 1 << 4,
  GEGL_DEBUG_CACHE           = 1 << 5,
  GEGL_DEBUG_MISC            = 1 << 6,
  GEGL_DEBUG_INVALIDATION    = 1 << 7,
  GEGL_DEBUG_OPENCL          = 1 << 8,
  GEGL_DEBUG_BUFFER_ALLOC    = 1 << 9,
  GEGL_DEBUG_LICENSE         = 1 << 10
} GeglDebugFlag;

/* only compiled in from gegl-init.c but kept here to
 * make it easier to update and keep in sync with the
 * flags
 */
#ifdef __GEGL_INIT_C
#else
extern GDebugKey gegl_debug_keys[];
#endif /* __GEGL_INIT_C */


#ifdef GEGL_ENABLE_DEBUG


#endif


#endif /* GEGL_ENABLE_DEBUG */



#endif /* __GEGL_DEBUG_H__  */
