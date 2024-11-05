/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   17:02                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstVaDisplayDrm = record
  end;
  PGstVaDisplayDrm = ^TGstVaDisplayDrm;

  TGstVaDisplayDrmClass = record
  end;
  PGstVaDisplayDrmClass = ^TGstVaDisplayDrmClass;

function gst_va_display_drm_get_type: TGType; cdecl; external libgstva;
function gst_va_display_drm_new_from_path(path: Pgchar): PGstVaDisplay; cdecl; external libgstva;

// === Konventiert am: 8-10-24 16:13:58 ===

function GST_TYPE_VA_DISPLAY_DRM: TGType;
function GST_VA_DISPLAY_DRM(obj: Pointer): PGstVaDisplayDrm;
function GST_VA_DISPLAY_DRM_CLASS(klass: Pointer): PGstVaDisplayDrmClass;
function GST_IS_VA_DISPLAY_DRM(obj: Pointer): Tgboolean;
function GST_IS_VA_DISPLAY_DRM_CLASS(klass: Pointer): Tgboolean;
function GST_VA_DISPLAY_DRM_GET_CLASS(obj: Pointer): PGstVaDisplayDrmClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VA_DISPLAY_DRM: TGType;
begin
  GST_TYPE_VA_DISPLAY_DRM := gst_va_display_drm_get_type;
end;

function GST_VA_DISPLAY_DRM(obj: Pointer): PGstVaDisplayDrm;
begin
  Result := PGstVaDisplayDrm(g_type_check_instance_cast(obj, GST_TYPE_VA_DISPLAY_DRM));
end;

function GST_VA_DISPLAY_DRM_CLASS(klass: Pointer): PGstVaDisplayDrmClass;
begin
  Result := PGstVaDisplayDrmClass(g_type_check_class_cast(klass, GST_TYPE_VA_DISPLAY_DRM));
end;

function GST_IS_VA_DISPLAY_DRM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VA_DISPLAY_DRM);
end;

function GST_IS_VA_DISPLAY_DRM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VA_DISPLAY_DRM);
end;

function GST_VA_DISPLAY_DRM_GET_CLASS(obj: Pointer): PGstVaDisplayDrmClass;
begin
  Result := PGstVaDisplayDrmClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
