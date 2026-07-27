{$IFDEF read_interface}


{
 * GStreamer
 *
 *  Copyright 2013 Collabora Ltd
 *   @author: Olivier Crete <olivier.crete@collabora.com>
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 *
  }
{$ifndef __GST_INSERT_BIN_H__}
{$define __GST_INSERT_BIN_H__}

type
{*
 * GstInsertBinCallback:
 * @insertbin: A #GstInsertBin
 * @element: The #GstElement on which the operation was performed
 * @success: %TRUE if the operation was successful
 * @user_data: The user data passed
 *
 * This is the prototype of callbacks to be called when the operation completes.
 * It could be called at any time, including as a re-entrant call while the
 * operation is requested.
 *
 * Since: 1.2
  }

  TGstInsertBinCallback = procedure (insertbin:PGstInsertBin; element:PGstElement; success:Tgboolean; user_data:Tgpointer);cdecl;
{*
 * GstInsertBin:
 *
 * The object structure.
 *
 * Since: 1.2
  }
{< private > }
  PGstInsertBin = ^TGstInsertBin;
  TGstInsertBin = record
      parent : TGstBin;cdecl;
      priv : PGstInsertBinPrivate;
    end;

{*
 * GstInsertBinClass:
 *
 * The object class structure.
 *
 * Since: 1.2
  }
  PGstInsertBinClass = ^TGstInsertBinClass;
  TGstInsertBinClass = record
      parent_class : TGstBinClass;
    end;


function gst_insert_bin_get_type:TGType;cdecl;external libgstinsertbin;
function gst_insert_bin_new(name:Pgchar):PGstElement;cdecl;external libgstinsertbin;
procedure gst_insert_bin_prepend(self:PGstInsertBin; element:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external libgstinsertbin;
procedure gst_insert_bin_append(self:PGstInsertBin; element:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external libgstinsertbin;
procedure gst_insert_bin_insert_before(self:PGstInsertBin; element:PGstElement; sibling:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external libgstinsertbin;
procedure gst_insert_bin_insert_after(self:PGstInsertBin; element:PGstElement; sibling:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external libgstinsertbin;
procedure gst_insert_bin_remove(self:PGstInsertBin; element:PGstElement; callback:TGstInsertBinCallback; user_data:Tgpointer);cdecl;external libgstinsertbin;
{//////////////////////////////////////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                                  (GstInsertBin, gst_object_unref) }
{$endif}
{ __GST_INSERT_BIN_H__  }

// === Konventiert am: 27-7-26 13:11:39 ===

function GST_TYPE_INSERT_BIN : TGType;
function GST_INSERT_BIN(obj : Pointer) : PGstInsertBin;
function GST_INSERT_BIN_CLASS(klass : Pointer) : PGstInsertBinClass;
function GST_IS_INSERT_BIN(obj : Pointer) : Tgboolean;
function GST_IS_INSERT_BIN_CLASS(klass : Pointer) : Tgboolean;
function GST_INSERT_BIN_GET_CLASS(obj : Pointer) : PGstInsertBinClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_INSERT_BIN : TGType;
  begin
    GST_TYPE_INSERT_BIN:=gst_insert_bin_get_type;
  end;

function GST_INSERT_BIN(obj : Pointer) : PGstInsertBin;
begin
  Result := PGstInsertBin(g_type_check_instance_cast(obj, GST_TYPE_INSERT_BIN));
end;

function GST_INSERT_BIN_CLASS(klass : Pointer) : PGstInsertBinClass;
begin
  Result := PGstInsertBinClass(g_type_check_class_cast(klass, GST_TYPE_INSERT_BIN));
end;

function GST_IS_INSERT_BIN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_INSERT_BIN);
end;

function GST_IS_INSERT_BIN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_INSERT_BIN);
end;

function GST_INSERT_BIN_GET_CLASS(obj : Pointer) : PGstInsertBinClass;
begin
  Result := PGstInsertBinClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
