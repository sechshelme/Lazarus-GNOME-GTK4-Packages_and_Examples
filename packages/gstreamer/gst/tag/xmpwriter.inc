/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   19:37                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstTagXmpWriter = record
  end;
  PGstTagXmpWriter = ^TGstTagXmpWriter;

  TGstTagXmpWriterInterface = record
    parent: TGTypeInterface;
  end;
  PGstTagXmpWriterInterface = ^TGstTagXmpWriterInterface;

function gst_tag_xmp_writer_get_type: TGType; cdecl; external libgsttag;
procedure gst_tag_xmp_writer_add_all_schemas(config: PGstTagXmpWriter); cdecl; external libgsttag;
procedure gst_tag_xmp_writer_add_schema(config: PGstTagXmpWriter; schema: Pgchar); cdecl; external libgsttag;
function gst_tag_xmp_writer_has_schema(config: PGstTagXmpWriter; schema: Pgchar): Tgboolean; cdecl; external libgsttag;
procedure gst_tag_xmp_writer_remove_schema(config: PGstTagXmpWriter; schema: Pgchar); cdecl; external libgsttag;
procedure gst_tag_xmp_writer_remove_all_schemas(config: PGstTagXmpWriter); cdecl; external libgsttag;
function gst_tag_xmp_writer_tag_list_to_xmp_buffer(config: PGstTagXmpWriter; taglist: PGstTagList; read_only: Tgboolean): PGstBuffer; cdecl; external libgsttag;

// === Konventiert am: 6-10-24 19:21:43 ===

function GST_TYPE_TAG_XMP_WRITER: TGType;
function GST_TAG_XMP_WRITER(obj: Pointer): PGstTagXmpWriter;
function GST_IS_TAG_XMP_WRITER(obj: Pointer): Tgboolean;
function GST_TAG_XMP_WRITER_GET_INTERFACE(obj: Pointer): PGstTagXmpWriterInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TAG_XMP_WRITER: TGType;
begin
  GST_TYPE_TAG_XMP_WRITER := gst_tag_xmp_writer_get_type;
end;

function GST_TAG_XMP_WRITER(obj: Pointer): PGstTagXmpWriter;
begin
  Result := PGstTagXmpWriter(g_type_check_instance_cast(obj, GST_TYPE_TAG_XMP_WRITER));
end;

function GST_IS_TAG_XMP_WRITER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TAG_XMP_WRITER);
end;

function GST_TAG_XMP_WRITER_GET_INTERFACE(obj: Pointer): PGstTagXmpWriterInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_TAG_XMP_WRITER);
end;



{$ENDIF read_implementation}
