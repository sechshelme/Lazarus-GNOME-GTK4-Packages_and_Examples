unit gstflowcombiner;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2014 Samsung Electronics. All rights reserved.
 *   Author: Thiago Santos <ts.santos@sisa.samsung.com>
 *
 * gstflowcombiner.h: utility to combine multiple flow returns into a single one
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
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_FLOW_COMBINER_H__}
{$define __GST_FLOW_COMBINER_H__}
{$include <glib.h>}
{$include <gst/gst.h>}
{$include <gst/base/base-prelude.h>}

{*
 * GstFlowCombiner:
 *
 * Opaque helper structure to aggregate flow returns.
 *
 * Since: 1.4
  }
type

function gst_flow_combiner_new:PGstFlowCombiner;cdecl;external libgstbase;
function gst_flow_combiner_ref(combiner:PGstFlowCombiner):PGstFlowCombiner;cdecl;external libgstbase;
procedure gst_flow_combiner_unref(combiner:PGstFlowCombiner);cdecl;external libgstbase;
procedure gst_flow_combiner_free(combiner:PGstFlowCombiner);cdecl;external libgstbase;
function gst_flow_combiner_update_flow(combiner:PGstFlowCombiner; fret:TGstFlowReturn):TGstFlowReturn;cdecl;external libgstbase;
function gst_flow_combiner_update_pad_flow(combiner:PGstFlowCombiner; pad:PGstPad; fret:TGstFlowReturn):TGstFlowReturn;cdecl;external libgstbase;
procedure gst_flow_combiner_add_pad(combiner:PGstFlowCombiner; pad:PGstPad);cdecl;external libgstbase;
procedure gst_flow_combiner_remove_pad(combiner:PGstFlowCombiner; pad:PGstPad);cdecl;external libgstbase;
procedure gst_flow_combiner_clear(combiner:PGstFlowCombiner);cdecl;external libgstbase;
procedure gst_flow_combiner_reset(combiner:PGstFlowCombiner);cdecl;external libgstbase;
function gst_flow_combiner_get_type:TGType;cdecl;external libgstbase;
{////////G_DEFINE_AUTOPTR_CLEANUP_FUNC     (GstFlowCombiner, gst_flow_combiner_free) }
{$endif}
{ __GST_FLOW_COMBINER_H__  }

// === Konventiert am: 13-7-26 19:20:39 ===

function GST_TYPE_FLOW_COMBINER : TGType;

implementation

function GST_TYPE_FLOW_COMBINER : TGType;
  begin
    GST_TYPE_FLOW_COMBINER:=gst_flow_combiner_get_type;
  end;



end.
