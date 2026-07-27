
unit ges_frame_composition_meta;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_frame_composition_meta.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_frame_composition_meta.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PGESFrameCompositionMeta  = ^GESFrameCompositionMeta;
PGstBuffer  = ^GstBuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2013 Mathieu Duponchelle <mduponchelle1@gmail.com>
 * Copyright (C) 2013 Thibault Saunier <thibault.saunier@collabora.com>
 * Copyright (C) 2020 Thibault Saunier <tsaunier@igalia.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Suite 500,
 * Boston, MA 02110-1335, USA.
  }
(** unsupported pragma#pragma once*)
{$include <ges/ges-types.h>}
{$include <glib-object.h>}
{$include <gst/gst.h>}
{*
 * ges_frame_composition_meta_api_get_type: (attributes doc.skip=true)
  }

function ges_frame_composition_meta_api_get_type:TGType;cdecl;external;
{*
 * GES_TYPE_META_FRAME_COMPOSITION: (attributes doc.skip=true)
  }
{ was #define dname def_expr }
function GES_TYPE_META_FRAME_COMPOSITION : longint; { return type might be wrong }

{*
 * GESFrameCompositionMeta:
 * @meta: the parent #GstMeta.
 * @posx: The desired x position.
 * @posy: The desired y position.
 * @height: The desired height of the video. -1 means that no scaling should be
 * applied.
 * @width: The desired width of the video. -1 means that no scaling should beapplied
 * applied.
 * @zorder: The desired z order.
 * @operator:The blending operator for the source.
 *
 * Metadata type that holds information about the positioning, size,
 * transparency and composition operator of a video frame in the timeline
 * composition.
 *
 * Since: 1.24
  }
type
  PGESFrameCompositionMeta = ^TGESFrameCompositionMeta;
  TGESFrameCompositionMeta = record
      meta : TGstMeta;
      alpha : Tgdouble;
      posx : Tgdouble;
      posy : Tgdouble;
      height : Tgdouble;
      width : Tgdouble;
      zorder : Tguint;
      operator : Tgint;
    end;


function ges_buffer_add_frame_composition_meta(buffer:PGstBuffer):PGESFrameCompositionMeta;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_META_FRAME_COMPOSITION : longint; { return type might be wrong }
  begin
    GES_TYPE_META_FRAME_COMPOSITION:=ges_frame_composition_meta_api_get_type;
  end;


end.
