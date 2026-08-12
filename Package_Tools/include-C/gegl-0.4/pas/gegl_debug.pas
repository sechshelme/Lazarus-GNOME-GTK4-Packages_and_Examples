unit gegl_debug;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GEGL_DEBUG_H__}
{$define __GEGL_DEBUG_H__}
{$include <glib.h>}
  var
    gegl_debug_flags : Tguint;cvar;external libgegl;
type
  PGeglDebugFlag = ^TGeglDebugFlag;
  TGeglDebugFlag =  Longint;
  Const
    GEGL_DEBUG_PROCESS = 1 shl 0;
    GEGL_DEBUG_BUFFER_LOAD = 1 shl 1;
    GEGL_DEBUG_BUFFER_SAVE = 1 shl 2;
    GEGL_DEBUG_TILE_BACKEND = 1 shl 3;
    GEGL_DEBUG_PROCESSOR = 1 shl 4;
    GEGL_DEBUG_CACHE = 1 shl 5;
    GEGL_DEBUG_MISC = 1 shl 6;
    GEGL_DEBUG_INVALIDATION = 1 shl 7;
    GEGL_DEBUG_OPENCL = 1 shl 8;
    GEGL_DEBUG_BUFFER_ALLOC = 1 shl 9;
    GEGL_DEBUG_LICENSE = 1 shl 10;
;
{ only compiled in from gegl-init.c but kept here to
 * make it easier to update and keep in sync with the
 * flags
  }
{$ifdef __GEGL_INIT_C}
{$else}
  var
    gegl_debug_keys : PGDebugKey;cvar;external libgegl;
{$endif}
{ __GEGL_INIT_C  }
{$ifdef GEGL_ENABLE_DEBUG}
{$endif}
{$endif}
{ GEGL_ENABLE_DEBUG  }
{$endif}
{ __GEGL_DEBUG_H__   }

// === Konventiert am: 12-8-26 14:47:22 ===


implementation



end.
