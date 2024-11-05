/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   17:02                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstVaDisplayWrapped = record
  end;
  PGstVaDisplayWrapped = ^TGstVaDisplayWrapped;

  TGstVaDisplayWrappedClass = record
  end;
  PGstVaDisplayWrappedClass = ^TGstVaDisplayWrappedClass;

function gst_va_display_wrapped_get_type: TGType; cdecl; external libgstva;
function gst_va_display_wrapped_new(handle: Tgpointer): PGstVaDisplay; cdecl; external libgstva;

// === Konventiert am: 8-10-24 16:14:04 ===

function GST_TYPE_VA_DISPLAY_WRAPPED: TGType;
function GST_VA_DISPLAY_WRAPPED(obj: Pointer): PGstVaDisplayWrapped;
function GST_VA_DISPLAY_WRAPPED_CLASS(klass: Pointer): PGstVaDisplayWrappedClass;
function GST_IS_VA_DISPLAY_WRAPPED(obj: Pointer): Tgboolean;
function GST_IS_VA_DISPLAY_WRAPPED_CLASS(klass: Pointer): Tgboolean;
function GST_VA_DISPLAY_WRAPPED_GET_CLASS(obj: Pointer): PGstVaDisplayWrappedClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VA_DISPLAY_WRAPPED: TGType;
begin
  GST_TYPE_VA_DISPLAY_WRAPPED := gst_va_display_wrapped_get_type;
end;

function GST_VA_DISPLAY_WRAPPED(obj: Pointer): PGstVaDisplayWrapped;
begin
  Result := PGstVaDisplayWrapped(g_type_check_instance_cast(obj, GST_TYPE_VA_DISPLAY_WRAPPED));
end;

function GST_VA_DISPLAY_WRAPPED_CLASS(klass: Pointer): PGstVaDisplayWrappedClass;
begin
  Result := PGstVaDisplayWrappedClass(g_type_check_class_cast(klass, GST_TYPE_VA_DISPLAY_WRAPPED));
end;

function GST_IS_VA_DISPLAY_WRAPPED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VA_DISPLAY_WRAPPED);
end;

function GST_IS_VA_DISPLAY_WRAPPED_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VA_DISPLAY_WRAPPED);
end;

function GST_VA_DISPLAY_WRAPPED_GET_CLASS(obj: Pointer): PGstVaDisplayWrappedClass;
begin
  Result := PGstVaDisplayWrappedClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
