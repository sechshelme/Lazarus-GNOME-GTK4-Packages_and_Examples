/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   17:02                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstVaImplementation = ^TGstVaImplementation;
  TGstVaImplementation = longint;

const
  GST_VA_IMPLEMENTATION_MESA_GALLIUM = 0;
  GST_VA_IMPLEMENTATION_INTEL_I965 = 1;
  GST_VA_IMPLEMENTATION_INTEL_IHD = 2;
  GST_VA_IMPLEMENTATION_OTHER = 3;
  GST_VA_IMPLEMENTATION_INVALID = 4;

const
  GST_VA_DISPLAY_HANDLE_CONTEXT_TYPE_STR = 'gst.va.display.handle';
  GST_CAPS_FEATURE_MEMORY_VA = 'memory:VAMemory';

type
  TGstVaDisplay = record
    parent: TGstObject;
  end;
  PGstVaDisplay = ^TGstVaDisplay;
  PPGstVaDisplay = ^PGstVaDisplay;

  TGstVaDisplayClass = record
    parent_class: TGstObjectClass;
    create_va_display: function(self: PGstVaDisplay): Tgpointer; cdecl;
  end;
  PGstVaDisplayClass = ^TGstVaDisplayClass;

function gst_va_display_get_type: TGType; cdecl; external libgstva;
function gst_va_display_initialize(self: PGstVaDisplay): Tgboolean; cdecl; external libgstva;
function gst_va_display_get_va_dpy(self: PGstVaDisplay): Tgpointer; cdecl; external libgstva;
function gst_va_display_get_implementation(self: PGstVaDisplay): TGstVaImplementation; cdecl; external libgstva;
function gst_va_display_check_version(self: PGstVaDisplay; major: Tguint; minor: Tguint): Tgboolean; cdecl; external libgstva;

function gst_va_display_is_implementation(display: PGstVaDisplay; impl: TGstVaImplementation): Tgboolean;


// === Konventiert am: 8-10-24 16:13:28 ===

function GST_TYPE_VA_DISPLAY: TGType;
function GST_VA_DISPLAY(obj: Pointer): PGstVaDisplay;
function GST_VA_DISPLAY_CLASS(klass: Pointer): PGstVaDisplayClass;
function GST_IS_VA_DISPLAY(obj: Pointer): Tgboolean;
function GST_IS_VA_DISPLAY_CLASS(klass: Pointer): Tgboolean;
function GST_VA_DISPLAY_GET_CLASS(obj: Pointer): PGstVaDisplayClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VA_DISPLAY: TGType;
begin
  GST_TYPE_VA_DISPLAY := gst_va_display_get_type;
end;

function GST_VA_DISPLAY(obj: Pointer): PGstVaDisplay;
begin
  Result := PGstVaDisplay(g_type_check_instance_cast(obj, GST_TYPE_VA_DISPLAY));
end;

function GST_VA_DISPLAY_CLASS(klass: Pointer): PGstVaDisplayClass;
begin
  Result := PGstVaDisplayClass(g_type_check_class_cast(klass, GST_TYPE_VA_DISPLAY));
end;

function GST_IS_VA_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VA_DISPLAY);
end;

function GST_IS_VA_DISPLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VA_DISPLAY);
end;

function GST_VA_DISPLAY_GET_CLASS(obj: Pointer): PGstVaDisplayClass;
begin
  Result := PGstVaDisplayClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function gst_va_display_is_implementation(display: PGstVaDisplay; impl: TGstVaImplementation): Tgboolean;
begin
  Result := gst_va_display_get_implementation(display) = impl;
end;


{$ENDIF read_implementation}
