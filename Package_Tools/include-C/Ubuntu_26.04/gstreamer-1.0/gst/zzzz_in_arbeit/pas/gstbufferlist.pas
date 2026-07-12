unit gstbufferlist;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstminiobject, gstbuffer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstBufferList = type Pointer;
  PPGstBufferList = ^PGstBufferList;

  TGstBufferListFunc = function(buffer: PPGstBuffer; idx: Tguint; user_data: Tgpointer): Tgboolean; cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_function}
var
  _gst_buffer_list_type: TGType; cvar;external libgstreamer;

function gst_buffer_list_ref(list: PGstBufferList): PGstBufferList; cdecl; external libgstreamer;
procedure gst_buffer_list_unref(list: PGstBufferList); cdecl; external libgstreamer;
procedure gst_clear_buffer_list(list_ptr: PPGstBufferList); cdecl; external libgstreamer;
function gst_buffer_list_copy(list: PGstBufferList): PGstBufferList; cdecl; external libgstreamer;
function gst_buffer_list_replace(old_list: PPGstBufferList; new_list: PGstBufferList): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_list_take(old_list: PPGstBufferList; new_list: PGstBufferList): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_list_steal(old_list: PPGstBufferList): PGstBufferList; cdecl; external libgstreamer;
function gst_buffer_list_make_writable(list: PGstBufferList): PGstBufferList; cdecl; external libgstreamer;
function gst_buffer_list_is_writable(list: PGstBufferList): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_list_get_type: TGType; cdecl; external libgstreamer;

function gst_buffer_list_new: PGstBufferList; cdecl; external libgstreamer;
function gst_buffer_list_new_sized(size: Tguint): PGstBufferList; cdecl; external libgstreamer;
function gst_buffer_list_length(list: PGstBufferList): Tguint; cdecl; external libgstreamer;
function gst_buffer_list_get(list: PGstBufferList; idx: Tguint): PGstBuffer; cdecl; external libgstreamer;
function gst_buffer_list_get_writable(list: PGstBufferList; idx: Tguint): PGstBuffer; cdecl; external libgstreamer;
procedure gst_buffer_list_insert(list: PGstBufferList; idx: Tgint; buffer: PGstBuffer); cdecl; external libgstreamer;
procedure gst_buffer_list_remove(list: PGstBufferList; idx: Tguint; length: Tguint); cdecl; external libgstreamer;
function gst_buffer_list_foreach(list: PGstBufferList; func: TGstBufferListFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_buffer_list_copy_deep(list: PGstBufferList): PGstBufferList; cdecl; external libgstreamer;
function gst_buffer_list_calculate_size(list: PGstBufferList): Tgsize; cdecl; external libgstreamer;

function GST_TYPE_BUFFER_LIST: TGType;
function GST_IS_BUFFER_LIST(obj: Pointer): Tgboolean;
function GST_BUFFER_LIST_CAST(obj: Pointer): PGstBufferList;
function GST_BUFFER_LIST(obj: Pointer): PGstBufferList;

function gst_buffer_list_is_writable(list: Pointer): Tgboolean;
function gst_buffer_list_make_writable(list: Pointer): PGstBufferList;

procedure gst_buffer_list_add(l: PGstBufferList; b: PGstBuffer);
{$ENDIF read_function}

// === Konventiert am: 10-7-26 19:47:09 ===


implementation

function GST_TYPE_BUFFER_LIST: TGType;
begin
  Result := _gst_buffer_list_type;
end;

function GST_IS_BUFFER_LIST(obj: Pointer): Tgboolean;
begin
  GST_IS_BUFFER_LIST := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_BUFFER_LIST);
end;

function GST_BUFFER_LIST_CAST(obj: Pointer): PGstBufferList;
begin
  GST_BUFFER_LIST_CAST := PGstBufferList(obj);
end;

function GST_BUFFER_LIST(obj: Pointer): PGstBufferList;
begin
  GST_BUFFER_LIST := GST_BUFFER_LIST_CAST(obj);
end;

function gst_buffer_list_is_writable(list: Pointer): Tgboolean;
begin
  gst_buffer_list_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(list));
end;

function gst_buffer_list_make_writable(list: Pointer): PGstBufferList;
begin
  gst_buffer_list_make_writable := GST_BUFFER_LIST_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(list)));
end;

procedure gst_buffer_list_add(l: PGstBufferList; b: PGstBuffer);
begin
  gst_buffer_list_insert(l, -1, b);
end;

end.
