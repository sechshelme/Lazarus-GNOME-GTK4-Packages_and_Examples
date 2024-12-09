
{$IFDEF read_interface}

type
  TGstTocSetter = record
  end;
  PGstTocSetter = ^TGstTocSetter;

  TGstTocSetterInterface = record
    g_iface: TGTypeInterface;
  end;
  PGstTocSetterInterface = ^TGstTocSetterInterface;

function gst_toc_setter_get_type: TGType; cdecl; external libgstreamer;
procedure gst_toc_setter_reset(setter: PGstTocSetter); cdecl; external libgstreamer;
function gst_toc_setter_get_toc(setter: PGstTocSetter): PGstToc; cdecl; external libgstreamer;
procedure gst_toc_setter_set_toc(setter: PGstTocSetter; toc: PGstToc); cdecl; external libgstreamer;

// === Konventiert am: 18-9-24 15:52:13 ===

function GST_TYPE_TOC_SETTER: TGType;
function GST_TOC_SETTER(obj: Pointer): PGstTocSetter;
function GST_IS_TOC_SETTER(obj: Pointer): Tgboolean;
function GST_TOC_SETTER_GET_IFACE(obj: Pointer): PGstTocSetterInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TOC_SETTER: TGType;
begin
  GST_TYPE_TOC_SETTER := gst_toc_setter_get_type;
end;

function GST_TOC_SETTER(obj: Pointer): PGstTocSetter;
begin
  Result := PGstTocSetter(g_type_check_instance_cast(obj, GST_TYPE_TOC_SETTER));
end;

function GST_IS_TOC_SETTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TOC_SETTER);
end;

function GST_TOC_SETTER_GET_IFACE(obj: Pointer): PGstTocSetterInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_TOC_SETTER);
end;



{$ENDIF read_implementation}
