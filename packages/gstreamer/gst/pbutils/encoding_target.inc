/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_ENCODING_CATEGORY_DEVICE = 'device';
  GST_ENCODING_CATEGORY_ONLINE_SERVICE = 'online-service';
  GST_ENCODING_CATEGORY_STORAGE_EDITING = 'storage-editing';
  GST_ENCODING_CATEGORY_CAPTURE = 'capture';
  GST_ENCODING_CATEGORY_FILE_EXTENSION = 'file-extension';

type
  TGstEncodingTarget = record
  end;
  PGstEncodingTarget = ^TGstEncodingTarget;

  PGstEncodingTargetClass = ^TGstEncodingTargetClass;
  TGstEncodingTargetClass = TGObjectClass;

function gst_encoding_target_get_type: TGType; cdecl; external libgstpbutils;
function gst_encoding_target_new(Name: Pgchar; category: Pgchar; description: Pgchar; profiles: PGList): PGstEncodingTarget; cdecl; external libgstpbutils;
function gst_encoding_target_get_name(target: PGstEncodingTarget): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_target_get_category(target: PGstEncodingTarget): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_target_get_description(target: PGstEncodingTarget): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_target_get_path(target: PGstEncodingTarget): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_target_get_profiles(target: PGstEncodingTarget): PGList; cdecl; external libgstpbutils;
function gst_encoding_target_get_profile(target: PGstEncodingTarget; Name: Pgchar): PGstEncodingProfile; cdecl; external libgstpbutils;
function gst_encoding_target_add_profile(target: PGstEncodingTarget; profile: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
function gst_encoding_target_save(target: PGstEncodingTarget; error: PPGError): Tgboolean; cdecl; external libgstpbutils;
function gst_encoding_target_save_to_file(target: PGstEncodingTarget; filepath: Pgchar; error: PPGError): Tgboolean; cdecl; external libgstpbutils;
function gst_encoding_target_load(Name: Pgchar; category: Pgchar; error: PPGError): PGstEncodingTarget; cdecl; external libgstpbutils;
function gst_encoding_target_load_from_file(filepath: Pgchar; error: PPGError): PGstEncodingTarget; cdecl; external libgstpbutils;
function gst_encoding_list_available_categories: PGList; cdecl; external libgstpbutils;
function gst_encoding_list_all_targets(categoryname: Pgchar): PGList; cdecl; external libgstpbutils;

procedure gst_encoding_target_unref(target: Pointer);
function gst_encoding_target_ref(target: Pointer): Pointer;

// === Konventiert am: 27-9-24 15:52:23 ===

function GST_TYPE_ENCODING_TARGET: TGType;
function GST_ENCODING_TARGET(obj: Pointer): PGstEncodingTarget;
function GST_IS_ENCODING_TARGET(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ENCODING_TARGET: TGType;
begin
  GST_TYPE_ENCODING_TARGET := gst_encoding_target_get_type;
end;

function GST_ENCODING_TARGET(obj: Pointer): PGstEncodingTarget;
begin
  Result := PGstEncodingTarget(g_type_check_instance_cast(obj, GST_TYPE_ENCODING_TARGET));
end;

function GST_IS_ENCODING_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ENCODING_TARGET);
end;

// ====

procedure gst_encoding_target_unref(target: Pointer);
begin
  g_object_unref(PGObject(target));
end;

function gst_encoding_target_ref(target: Pointer): Pointer;
begin
  gst_encoding_target_ref := g_object_ref(PGObject(target));
end;


{$ENDIF read_implementation}
