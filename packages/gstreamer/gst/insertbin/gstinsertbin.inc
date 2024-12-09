
{$IFDEF read_interface}

  {#warning "The GStreamer insertbin library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
type
  TGstInsertBinPrivate = record
  end;
  PGstInsertBinPrivate = ^TGstInsertBinPrivate;

  TGstInsertBin = record
    parent: TGstBin;
    priv: PGstInsertBinPrivate;
  end;
  PGstInsertBin = ^TGstInsertBin;

  TGstInsertBinClass = record
    parent_class: TGstBinClass;
  end;
  PGstInsertBinClass = ^TGstInsertBinClass;

  TGstInsertBinCallback = procedure(insertbin: PGstInsertBin; element: PGstElement; success: Tgboolean; user_data: Tgpointer); cdecl;

function gst_insert_bin_get_type: TGType; cdecl; external libgstinsertbin;
function gst_insert_bin_new(Name: Pgchar): PGstElement; cdecl; external libgstinsertbin;
procedure gst_insert_bin_prepend(self: PGstInsertBin; element: PGstElement; callback: TGstInsertBinCallback; user_data: Tgpointer); cdecl; external libgstinsertbin;
procedure gst_insert_bin_append(self: PGstInsertBin; element: PGstElement; callback: TGstInsertBinCallback; user_data: Tgpointer); cdecl; external libgstinsertbin;
procedure gst_insert_bin_insert_before(self: PGstInsertBin; element: PGstElement; sibling: PGstElement; callback: TGstInsertBinCallback; user_data: Tgpointer); cdecl; external libgstinsertbin;
procedure gst_insert_bin_insert_after(self: PGstInsertBin; element: PGstElement; sibling: PGstElement; callback: TGstInsertBinCallback; user_data: Tgpointer); cdecl; external libgstinsertbin;
procedure gst_insert_bin_remove(self: PGstInsertBin; element: PGstElement; callback: TGstInsertBinCallback; user_data: Tgpointer); cdecl; external libgstinsertbin;

// === Konventiert am: 3-10-24 19:42:01 ===

function GST_TYPE_INSERT_BIN: TGType;
function GST_INSERT_BIN(obj: Pointer): PGstInsertBin;
function GST_INSERT_BIN_CLASS(klass: Pointer): PGstInsertBinClass;
function GST_IS_INSERT_BIN(obj: Pointer): Tgboolean;
function GST_IS_INSERT_BIN_CLASS(klass: Pointer): Tgboolean;
function GST_INSERT_BIN_GET_CLASS(obj: Pointer): PGstInsertBinClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_INSERT_BIN: TGType;
begin
  GST_TYPE_INSERT_BIN := gst_insert_bin_get_type;
end;

function GST_INSERT_BIN(obj: Pointer): PGstInsertBin;
begin
  Result := PGstInsertBin(g_type_check_instance_cast(obj, GST_TYPE_INSERT_BIN));
end;

function GST_INSERT_BIN_CLASS(klass: Pointer): PGstInsertBinClass;
begin
  Result := PGstInsertBinClass(g_type_check_class_cast(klass, GST_TYPE_INSERT_BIN));
end;

function GST_IS_INSERT_BIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_INSERT_BIN);
end;

function GST_IS_INSERT_BIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_INSERT_BIN);
end;

function GST_INSERT_BIN_GET_CLASS(obj: Pointer): PGstInsertBinClass;
begin
  Result := PGstInsertBinClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
