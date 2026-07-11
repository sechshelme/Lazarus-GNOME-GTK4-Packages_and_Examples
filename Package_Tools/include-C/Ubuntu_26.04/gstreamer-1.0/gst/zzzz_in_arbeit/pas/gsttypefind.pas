unit gsttypefind;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gsttypefind.h: typefinding subsystem
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
{$ifndef __GST_TYPE_FIND_H__}
{$define __GST_TYPE_FIND_H__}
{$include <gst/gstcaps.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}

type
{*
 * GstTypeFindFunction:
 * @find: A #GstTypeFind structure
 * @user_data: optional data to pass to the function
 *
 * A function that will be called by typefinding.
  }

  TGstTypeFindFunction = procedure (find:PGstTypeFind; user_data:Tgpointer);cdecl;
{*
 * GstTypeFindProbability:
 * @GST_TYPE_FIND_NONE: type undetected.
 * @GST_TYPE_FIND_MINIMUM: unlikely typefind.
 * @GST_TYPE_FIND_POSSIBLE: possible type detected.
 * @GST_TYPE_FIND_LIKELY: likely a type was detected.
 * @GST_TYPE_FIND_NEARLY_CERTAIN: nearly certain that a type was detected.
 * @GST_TYPE_FIND_MAXIMUM: very certain a type was detected.
 *
 * The probability of the typefind function. Higher values have more certainty
 * in doing a reliable typefind.
  }

  PGstTypeFindProbability = ^TGstTypeFindProbability;
  TGstTypeFindProbability =  Longint;
  Const
    GST_TYPE_FIND_NONE = 0;
    GST_TYPE_FIND_MINIMUM = 1;
    GST_TYPE_FIND_POSSIBLE = 50;
    GST_TYPE_FIND_LIKELY = 80;
    GST_TYPE_FIND_NEARLY_CERTAIN = 99;
    GST_TYPE_FIND_MAXIMUM = 100;
;
{*
 * GstTypeFind:
 * @peek: Method to peek data.
 * @suggest: Method to suggest #GstCaps with a given probability.
 * @data: The data used by the caller of the typefinding function.
 * @get_length: Returns the length of current data.
 *
 * Object that stores typefind callbacks. To use with #GstTypeFindFactory.
  }
{ private to the caller of the typefind function  }
{ optional  }
{ <private>  }
type
  PGstTypeFind = ^TGstTypeFind;
  TGstTypeFind = record
      peek : function (data:Tgpointer; offset:Tgint64; size:Tguint):Pguint8;cdecl;
      suggest : procedure (data:Tgpointer; probability:Tguint; caps:PGstCaps);cdecl;
      data : Tgpointer;
      get_length : function (data:Tgpointer):Tguint64;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * gst_type_find_get_type: (attributes doc.skip=true)
  }

function gst_type_find_get_type:TGType;cdecl;external libgstreamer;
{ typefind function interface  }
function gst_type_find_peek(find:PGstTypeFind; offset:Tgint64; size:Tguint):Pguint8;cdecl;external libgstreamer;
procedure gst_type_find_suggest(find:PGstTypeFind; probability:Tguint; caps:PGstCaps);cdecl;external libgstreamer;
procedure gst_type_find_suggest_empty_simple(find:PGstTypeFind; probability:Tguint; media_type:Pchar);cdecl;external libgstreamer;
procedure gst_type_find_suggest_simple(find:PGstTypeFind; probability:Tguint; media_type:Pchar; fieldname:Pchar; args:array of const);cdecl;external libgstreamer;
procedure gst_type_find_suggest_simple(find:PGstTypeFind; probability:Tguint; media_type:Pchar; fieldname:Pchar);cdecl;external libgstreamer;
function gst_type_find_get_length(find:PGstTypeFind):Tguint64;cdecl;external libgstreamer;
{ registration interface  }
function gst_type_find_register(plugin:PGstPlugin; name:Pgchar; rank:Tguint; func:TGstTypeFindFunction; extensions:Pgchar; 
           possible_caps:PGstCaps; data:Tgpointer; data_notify:TGDestroyNotify):Tgboolean;cdecl;external libgstreamer;
{$endif}
{ __GST_TYPE_FIND_H__  }

// === Konventiert am: 11-7-26 15:54:19 ===

function GST_TYPE_TYPE_FIND : TGType;

implementation

function GST_TYPE_TYPE_FIND : TGType;
  begin
    GST_TYPE_TYPE_FIND:=gst_type_find_get_type;
  end;



end.
