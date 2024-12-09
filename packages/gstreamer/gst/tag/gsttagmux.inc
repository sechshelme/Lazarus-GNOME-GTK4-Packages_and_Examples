
{$IFDEF read_interface}


type
  TGstTagMuxPrivate = record
  end;
  PGstTagMuxPrivate = ^TGstTagMuxPrivate;

  TGstTagMux = record
    element: TGstElement;
    priv: PGstTagMuxPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTagMux = ^TGstTagMux;

  TGstTagMuxClass = record
    parent_class: TGstElementClass;
    render_start_tag: function(mux: PGstTagMux; tag_list: PGstTagList): PGstBuffer; cdecl;
    render_end_tag: function(mux: PGstTagMux; tag_list: PGstTagList): PGstBuffer; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTagMuxClass = ^TGstTagMuxClass;


function gst_tag_mux_get_type: TGType; cdecl; external libgsttag;

// === Konventiert am: 6-10-24 19:20:57 ===

function GST_TYPE_TAG_MUX: TGType;
function GST_TAG_MUX(obj: Pointer): PGstTagMux;
function GST_TAG_MUX_CLASS(klass: Pointer): PGstTagMuxClass;
function GST_IS_TAG_MUX(obj: Pointer): Tgboolean;
function GST_IS_TAG_MUX_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TAG_MUX: TGType;
begin
  GST_TYPE_TAG_MUX := gst_tag_mux_get_type;
end;

function GST_TAG_MUX(obj: Pointer): PGstTagMux;
begin
  Result := PGstTagMux(g_type_check_instance_cast(obj, GST_TYPE_TAG_MUX));
end;

function GST_TAG_MUX_CLASS(klass: Pointer): PGstTagMuxClass;
begin
  Result := PGstTagMuxClass(g_type_check_class_cast(klass, GST_TYPE_TAG_MUX));
end;

function GST_IS_TAG_MUX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TAG_MUX);
end;

function GST_IS_TAG_MUX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TAG_MUX);
end;



{$ENDIF read_implementation}
