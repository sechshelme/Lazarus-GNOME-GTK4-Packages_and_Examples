/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstTagSetter = record
  end;
  PGstTagSetter = ^TGstTagSetter;

  TGstTagSetterInterface = record
    g_iface: TGTypeInterface;
  end;
  PGstTagSetterInterface = ^TGstTagSetterInterface;

function gst_tag_setter_get_type: TGType; cdecl; external libgstreamer;
procedure gst_tag_setter_reset_tags(setter: PGstTagSetter); cdecl; external libgstreamer;
procedure gst_tag_setter_merge_tags(setter: PGstTagSetter; list: PGstTagList; mode: TGstTagMergeMode); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tags(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_values(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_valist(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_valist_values(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_tag_setter_add_tag_value(setter: PGstTagSetter; mode: TGstTagMergeMode; tag: Pgchar; Value: PGValue); cdecl; external libgstreamer;
function gst_tag_setter_get_tag_list(setter: PGstTagSetter): PGstTagList; cdecl; external libgstreamer;
procedure gst_tag_setter_set_tag_merge_mode(setter: PGstTagSetter; mode: TGstTagMergeMode); cdecl; external libgstreamer;
function gst_tag_setter_get_tag_merge_mode(setter: PGstTagSetter): TGstTagMergeMode; cdecl; external libgstreamer;

// === Konventiert am: 17-9-24 15:43:11 ===

function GST_TYPE_TAG_SETTER: TGType;
function GST_TAG_SETTER(obj: Pointer): PGstTagSetter;
function GST_IS_TAG_SETTER(obj: Pointer): Tgboolean;
function GST_TAG_SETTER_GET_INTERFACE(obj: Pointer): PGstTagSetterInterface;

{$ENDIF read_interface}


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
