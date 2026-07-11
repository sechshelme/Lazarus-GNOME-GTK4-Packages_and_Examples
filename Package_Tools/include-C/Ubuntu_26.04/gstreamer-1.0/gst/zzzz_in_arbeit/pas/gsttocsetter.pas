unit gsttocsetter;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2010, 2012 Alexander Saprykin <xelfium@gmail.com>
 *
 * gsttocsetter.h: Interfaces for TOC
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
{$ifndef __GST_TOC_SETTER_H__}
{$define __GST_TOC_SETTER_H__}
{$include <gst/gst.h>}

{*
 * GstTocSetter:
 *
 * Opaque #GstTocSetter data structure.
  }
type
{*
 * GstTocSetterInterface:
 * @g_iface: parent interface type.
 *
 * #GstTocSetterInterface interface.
  }
{ signals  }
{ virtual table  }
  PGstTocSetterInterface = ^TGstTocSetterInterface;
  TGstTocSetterInterface = record
      g_iface : TGTypeInterface;
    end;


function gst_toc_setter_get_type:TGType;cdecl;external libgstreamer;
procedure gst_toc_setter_reset(setter:PGstTocSetter);cdecl;external libgstreamer;
function gst_toc_setter_get_toc(setter:PGstTocSetter):PGstToc;cdecl;external libgstreamer;
procedure gst_toc_setter_set_toc(setter:PGstTocSetter; toc:PGstToc);cdecl;external libgstreamer;
{$endif}
{ __GST_TOC_SETTER_H__  }

// === Konventiert am: 11-7-26 15:33:05 ===

function GST_TYPE_TOC_SETTER : TGType;
function GST_TOC_SETTER(obj : Pointer) : PGstTocSetter;
function GST_IS_TOC_SETTER(obj : Pointer) : Tgboolean;
function GST_TOC_SETTER_GET_IFACE(obj : Pointer) : PGstTocSetterInterface;

implementation

function GST_TYPE_TOC_SETTER : TGType;
  begin
    GST_TYPE_TOC_SETTER:=gst_toc_setter_get_type;
  end;

function GST_TOC_SETTER(obj : Pointer) : PGstTocSetter;
begin
  Result := PGstTocSetter(g_type_check_instance_cast(obj, GST_TYPE_TOC_SETTER));
end;

function GST_IS_TOC_SETTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_TOC_SETTER);
end;

function GST_TOC_SETTER_GET_IFACE(obj : Pointer) : PGstTocSetterInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_TOC_SETTER);
end;



end.
