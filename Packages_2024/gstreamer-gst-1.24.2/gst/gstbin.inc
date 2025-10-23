
{$IFDEF read_interface}

type
  PGstBinFlags = ^TGstBinFlags;
  TGstBinFlags = longint;

const
  GST_BIN_FLAG_NO_RESYNC = GST_ELEMENT_FLAG_LAST shl 0;
  GST_BIN_FLAG_STREAMS_AWARE = GST_ELEMENT_FLAG_LAST shl 1;
  GST_BIN_FLAG_LAST = GST_ELEMENT_FLAG_LAST shl 5;

type
  TGstBinPrivate = record
  end;
  PGstBinPrivate = ^TGstBinPrivate;

  TGstBin = record
    element: TGstElement;
    numchildren: Tgint;
    children: PGList;
    children_cookie: Tguint32;
    child_bus: PGstBus;
    Messages: PGList;
    polling: Tgboolean;
    state_dirty: Tgboolean;
    clock_dirty: Tgboolean;
    provided_clock: PGstClock;
    clock_provider: PGstElement;
    priv: PGstBinPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstBin = ^TGstBin;

  TGstBinClass = record
    parent_class: TGstElementClass;
    pool: PGThreadPool;
    element_added: procedure(bin: PGstBin; child: PGstElement); cdecl;
    element_removed: procedure(bin: PGstBin; child: PGstElement); cdecl;
    add_element: function(bin: PGstBin; element: PGstElement): Tgboolean; cdecl;
    remove_element: function(bin: PGstBin; element: PGstElement): Tgboolean; cdecl;
    handle_message: procedure(bin: PGstBin; message: PGstMessage); cdecl;
    do_latency: function(bin: PGstBin): Tgboolean; cdecl;
    deep_element_added: procedure(bin: PGstBin; sub_bin: PGstBin; child: PGstElement); cdecl;
    deep_element_removed: procedure(bin: PGstBin; sub_bin: PGstBin; child: PGstElement); cdecl;
    _gst_reserved: array[0..(GST_PADDING - 2) - 1] of Tgpointer;
  end;
  PGstBinClass = ^TGstBinClass;


function gst_bin_get_type: TGType; cdecl; external libgstreamer;
function gst_bin_new(Name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_bin_add(bin: PGstBin; element: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_bin_remove(bin: PGstBin; element: PGstElement): Tgboolean; cdecl; external libgstreamer;
function gst_bin_get_by_name(bin: PGstBin; Name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_bin_get_by_name_recurse_up(bin: PGstBin; Name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_bin_get_by_interface(bin: PGstBin; iface: TGType): PGstElement; cdecl; external libgstreamer;
function gst_bin_iterate_elements(bin: PGstBin): PGstIterator; cdecl; external libgstreamer;
function gst_bin_iterate_sorted(bin: PGstBin): PGstIterator; cdecl; external libgstreamer;
function gst_bin_iterate_recurse(bin: PGstBin): PGstIterator; cdecl; external libgstreamer;
function gst_bin_iterate_sinks(bin: PGstBin): PGstIterator; cdecl; external libgstreamer;
function gst_bin_iterate_sources(bin: PGstBin): PGstIterator; cdecl; external libgstreamer;
function gst_bin_iterate_all_by_interface(bin: PGstBin; iface: TGType): PGstIterator; cdecl; external libgstreamer;
function gst_bin_iterate_all_by_element_factory_name(bin: PGstBin; factory_name: Pgchar): PGstIterator; cdecl; external libgstreamer;
function gst_bin_recalculate_latency(bin: PGstBin): Tgboolean; cdecl; external libgstreamer;
procedure gst_bin_set_suppressed_flags(bin: PGstBin; flags: TGstElementFlags); cdecl; external libgstreamer;
function gst_bin_get_suppressed_flags(bin: PGstBin): TGstElementFlags; cdecl; external libgstreamer;

function GST_BIN_IS_NO_RESYNC(bin: Pointer): Tgboolean;
function GST_BIN_NUMCHILDREN(bin: Pointer): Tgint;
function GST_BIN_CHILDREN(bin: Pointer): PGList;
function GST_BIN_CHILDREN_COOKIE(bin: Pointer): Tguint32;

// === Konventiert am: 15-9-24 19:39:20 ===

function GST_BIN_CAST(obj: Pointer): PGstBin;
function GST_TYPE_BIN: TGType;
function GST_BIN(obj: Pointer): PGstBin;
function GST_BIN_CLASS(klass: Pointer): PGstBinClass;
function GST_IS_BIN(obj: Pointer): Tgboolean;
function GST_IS_BIN_CLASS(klass: Pointer): Tgboolean;
function GST_BIN_GET_CLASS(obj: Pointer): PGstBinClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_BIN: TGType;
begin
  GST_TYPE_BIN := gst_bin_get_type;
end;

function GST_BIN(obj: Pointer): PGstBin;
begin
  Result := PGstBin(g_type_check_instance_cast(obj, GST_TYPE_BIN));
end;

function GST_BIN_CLASS(klass: Pointer): PGstBinClass;
begin
  Result := PGstBinClass(g_type_check_class_cast(klass, GST_TYPE_BIN));
end;

function GST_IS_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_BIN);
end;

function GST_IS_BIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_BIN);
end;

function GST_BIN_GET_CLASS(obj: Pointer): PGstBinClass;
begin
  Result := PGstBinClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_BIN_CAST(obj: Pointer): PGstBin;
begin
  GST_BIN_CAST := PGstBin(obj);
end;

function GST_BIN_IS_NO_RESYNC(bin: Pointer): Tgboolean;
begin
  GST_BIN_IS_NO_RESYNC := GST_OBJECT_FLAG_IS_SET(bin, GST_BIN_FLAG_NO_RESYNC);
end;

function GST_BIN_NUMCHILDREN(bin: Pointer): Tgint;
begin
  GST_BIN_NUMCHILDREN := (GST_BIN_CAST(bin))^.numchildren;
end;

function GST_BIN_CHILDREN(bin: Pointer): PGList;
begin
  GST_BIN_CHILDREN := (GST_BIN_CAST(bin))^.children;
end;

function GST_BIN_CHILDREN_COOKIE(bin: Pointer): Tguint32;
begin
  GST_BIN_CHILDREN_COOKIE := (GST_BIN_CAST(bin))^.children_cookie;
end;


{$ENDIF read_implementation}
