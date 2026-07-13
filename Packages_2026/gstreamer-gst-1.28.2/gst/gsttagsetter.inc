

  {$IFDEF read_struct}
type
  PGstTagSetter = type Pointer;

  PGstTagSetterInterface = ^TGstTagSetterInterface;
  TGstTagSetterInterface = record
    g_iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_tag_setter_get_type: TGType; cdecl; external libgstreamer;
procedure gst_tag_setter_reset_tags(setter: PGstTagSetter); cdecl; external libgstreamer;
procedure gst_tag_setter_merge_tags(setter: PGstTagSetter; list: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tags(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; args: array of const); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tags(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_values(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; args: array of const); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_values(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_valist(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_valist_values(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_value(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; value: PGValue); cdecl; external libgstreamer;
function gst_tag_setter_get_tag_list(setter: PGstTagSetter): PGstTagList; cdecl; external libgstreamer;
procedure gst_tag_setter_set_tag_merge_mode(setter: PGstTagSetter; mode: TGstTagMergeMode); cdecl; external libgstreamer;
function gst_tag_setter_get_tag_merge_mode(setter: PGstTagSetter): TGstTagMergeMode; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:33:39 ===

function GST_TYPE_TAG_SETTER: TGType;
function GST_TAG_SETTER(obj: Pointer): PGstTagSetter;
function GST_IS_TAG_SETTER(obj: Pointer): Tgboolean;
function GST_TAG_SETTER_GET_INTERFACE(obj: Pointer): PGstTagSetterInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_TAG_SETTER: TGType;
begin
  GST_TYPE_TAG_SETTER := gst_tag_setter_get_type;
end;

function GST_TAG_SETTER(obj: Pointer): PGstTagSetter;
begin
  Result := PGstTagSetter(g_type_check_instance_cast(obj, GST_TYPE_TAG_SETTER));
end;

function GST_IS_TAG_SETTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TAG_SETTER);
end;

function GST_TAG_SETTER_GET_INTERFACE(obj: Pointer): PGstTagSetterInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_TAG_SETTER);
end;



{$ENDIF read_implementation}
