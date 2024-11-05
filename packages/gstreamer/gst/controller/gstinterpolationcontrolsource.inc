/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   15:16                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstInterpolationMode = ^TGstInterpolationMode;
  TGstInterpolationMode = longint;

const
  GST_INTERPOLATION_MODE_NONE = 0;
  GST_INTERPOLATION_MODE_LINEAR = 1;
  GST_INTERPOLATION_MODE_CUBIC = 2;
  GST_INTERPOLATION_MODE_CUBIC_MONOTONIC = 3;

type
  TGstInterpolationControlSourcePrivate = record
  end;
  PGstInterpolationControlSourcePrivate = ^TGstInterpolationControlSourcePrivate;

  TGstInterpolationControlSource = record
    parent: TGstTimedValueControlSource;
    priv: PGstInterpolationControlSourcePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstInterpolationControlSource = ^TGstInterpolationControlSource;

  TGstInterpolationControlSourceClass = record
    parent_class: TGstTimedValueControlSourceClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstInterpolationControlSourceClass = ^TGstInterpolationControlSourceClass;


function gst_interpolation_control_source_get_type: TGType; cdecl; external libgstcontroller;
function gst_interpolation_control_source_new: PGstControlSource; cdecl; external libgstcontroller;

// === Konventiert am: 7-10-24 14:52:09 ===

function GST_TYPE_INTERPOLATION_CONTROL_SOURCE: TGType;
function GST_INTERPOLATION_CONTROL_SOURCE(obj: Pointer): PGstInterpolationControlSource;
function GST_INTERPOLATION_CONTROL_SOURCE_CLASS(klass: Pointer): PGstInterpolationControlSourceClass;
function GST_IS_INTERPOLATION_CONTROL_SOURCE(obj: Pointer): Tgboolean;
function GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstInterpolationControlSourceClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_INTERPOLATION_CONTROL_SOURCE: TGType;
begin
  GST_TYPE_INTERPOLATION_CONTROL_SOURCE := gst_interpolation_control_source_get_type;
end;

function GST_INTERPOLATION_CONTROL_SOURCE(obj: Pointer): PGstInterpolationControlSource;
begin
  Result := PGstInterpolationControlSource(g_type_check_instance_cast(obj, GST_TYPE_INTERPOLATION_CONTROL_SOURCE));
end;

function GST_INTERPOLATION_CONTROL_SOURCE_CLASS(klass: Pointer): PGstInterpolationControlSourceClass;
begin
  Result := PGstInterpolationControlSourceClass(g_type_check_class_cast(klass, GST_TYPE_INTERPOLATION_CONTROL_SOURCE));
end;

function GST_IS_INTERPOLATION_CONTROL_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_INTERPOLATION_CONTROL_SOURCE);
end;

function GST_IS_INTERPOLATION_CONTROL_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_INTERPOLATION_CONTROL_SOURCE);
end;

function GST_INTERPOLATION_CONTROL_SOURCE_GET_CLASS(obj: Pointer): PGstInterpolationControlSourceClass;
begin
  Result := PGstInterpolationControlSourceClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
