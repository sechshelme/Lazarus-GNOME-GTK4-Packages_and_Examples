/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 12-10-2024   19:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstFragmentPrivate = record
  end;
  PGstFragmentPrivate = ^TGstFragmentPrivate;

  TGstFragment = record
    parent: TGObject;
    uri: Pgchar;
    redirect_uri: Pgchar;
    redirect_permanent: Tgboolean;
    range_start: Tgint64;
    range_end: Tgint64;
    Name: Pgchar;
    completed: Tgboolean;
    download_start_time: Tguint64;
    download_stop_time: Tguint64;
    start_time: Tguint64;
    stop_time: Tguint64;
    index: Tgboolean;
    discontinuous: Tgboolean;
    headers: PGstStructure;
    priv: PGstFragmentPrivate;
  end;
  PGstFragment = ^TGstFragment;

  TGstFragmentClass = record
    parent_class: TGObjectClass;
  end;
  PGstFragmentClass = ^TGstFragmentClass;

function gst_fragment_get_type: TGType; cdecl; external libgsturidownloader;
function gst_fragment_get_buffer(fragment: PGstFragment): PGstBuffer; cdecl; external libgsturidownloader;
procedure gst_fragment_set_caps(fragment: PGstFragment; caps: PGstCaps); cdecl; external libgsturidownloader;
function gst_fragment_get_caps(fragment: PGstFragment): PGstCaps; cdecl; external libgsturidownloader;
function gst_fragment_add_buffer(fragment: PGstFragment; buffer: PGstBuffer): Tgboolean; cdecl; external libgsturidownloader;
function gst_fragment_new: PGstFragment; cdecl; external libgsturidownloader;

// === Konventiert am: 12-10-24 19:27:08 ===

function GST_TYPE_FRAGMENT: TGType;
function GST_FRAGMENT(obj: Pointer): PGstFragment;
function GST_FRAGMENT_CLASS(klass: Pointer): PGstFragmentClass;
function GST_IS_FRAGMENT(obj: Pointer): Tgboolean;
function GST_IS_FRAGMENT_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_FRAGMENT: TGType;
begin
  GST_TYPE_FRAGMENT := gst_fragment_get_type;
end;

function GST_FRAGMENT(obj: Pointer): PGstFragment;
begin
  Result := PGstFragment(g_type_check_instance_cast(obj, GST_TYPE_FRAGMENT));
end;

function GST_FRAGMENT_CLASS(klass: Pointer): PGstFragmentClass;
begin
  Result := PGstFragmentClass(g_type_check_class_cast(klass, GST_TYPE_FRAGMENT));
end;

function GST_IS_FRAGMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_FRAGMENT);
end;

function GST_IS_FRAGMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_FRAGMENT);
end;



{$ENDIF read_implementation}
