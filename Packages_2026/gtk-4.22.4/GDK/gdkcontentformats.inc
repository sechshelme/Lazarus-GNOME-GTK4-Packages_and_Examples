{$IFDEF read_interface}


function gdk_intern_mime_type(_string: pchar): pchar; cdecl; external libgtk4;
function gdk_content_formats_get_type: TGType; cdecl; external libgtk4;
function gdk_content_formats_new(mime_types: PPchar; n_mime_types: Tguint): PGdkContentFormats; cdecl; external libgtk4;
function gdk_content_formats_new_for_gtype(_type: TGType): PGdkContentFormats; cdecl; external libgtk4;
function gdk_content_formats_parse(_string: pchar): PGdkContentFormats; cdecl; external libgtk4;
function gdk_content_formats_ref(formats: PGdkContentFormats): PGdkContentFormats; cdecl; external libgtk4;
procedure gdk_content_formats_unref(formats: PGdkContentFormats); cdecl; external libgtk4;
procedure gdk_content_formats_print(formats: PGdkContentFormats; _string: PGString); cdecl; external libgtk4;
function gdk_content_formats_to_string(formats: PGdkContentFormats): pchar; cdecl; external libgtk4;
function gdk_content_formats_get_gtypes(formats: PGdkContentFormats; n_gtypes: Pgsize): PGType; cdecl; external libgtk4;
function gdk_content_formats_get_mime_types(formats: PGdkContentFormats; n_mime_types: Pgsize): PPchar; cdecl; external libgtk4;
function gdk_content_formats_union(first: PGdkContentFormats; second: PGdkContentFormats): PGdkContentFormats; cdecl; external libgtk4;
function gdk_content_formats_match(first: PGdkContentFormats; second: PGdkContentFormats): Tgboolean; cdecl; external libgtk4;
function gdk_content_formats_match_gtype(first: PGdkContentFormats; second: PGdkContentFormats): TGType; cdecl; external libgtk4;
function gdk_content_formats_match_mime_type(first: PGdkContentFormats; second: PGdkContentFormats): pchar; cdecl; external libgtk4;
function gdk_content_formats_contain_gtype(formats: PGdkContentFormats; _type: TGType): Tgboolean; cdecl; external libgtk4;
function gdk_content_formats_contain_mime_type(formats: PGdkContentFormats; mime_type: pchar): Tgboolean; cdecl; external libgtk4;
function gdk_content_formats_is_empty(formats: PGdkContentFormats): Tgboolean; cdecl; external libgtk4;

type
  PGdkContentFormatsBuilder = type Pointer;

function gdk_content_formats_builder_get_type: TGType; cdecl; external libgtk4;
function gdk_content_formats_builder_new: PGdkContentFormatsBuilder; cdecl; external libgtk4;
function gdk_content_formats_builder_ref(builder: PGdkContentFormatsBuilder): PGdkContentFormatsBuilder; cdecl; external libgtk4;
procedure gdk_content_formats_builder_unref(builder: PGdkContentFormatsBuilder); cdecl; external libgtk4;
function gdk_content_formats_builder_free_to_formats(builder: PGdkContentFormatsBuilder): PGdkContentFormats; cdecl; external libgtk4;
function gdk_content_formats_builder_to_formats(builder: PGdkContentFormatsBuilder): PGdkContentFormats; cdecl; external libgtk4;
procedure gdk_content_formats_builder_add_formats(builder: PGdkContentFormatsBuilder; formats: PGdkContentFormats); cdecl; external libgtk4;
procedure gdk_content_formats_builder_add_mime_type(builder: PGdkContentFormatsBuilder; mime_type: pchar); cdecl; external libgtk4;
procedure gdk_content_formats_builder_add_gtype(builder: PGdkContentFormatsBuilder; _type: TGType); cdecl; external libgtk4;

function GDK_TYPE_CONTENT_FORMATS: TGType;
function GDK_TYPE_CONTENT_FORMATS_BUILDER: TGType;
function GDK_TYPE_FILE_LIST: TGType;

function gdk_file_list_get_type: TGType; cdecl; external libgtk4;

type
  PGdkFileList = type Pointer;

function gdk_file_list_get_files(file_list: PGdkFileList): PGSList; cdecl; external libgtk4;
function gdk_file_list_new_from_list(files: PGSList): PGdkFileList; cdecl; external libgtk4;
function gdk_file_list_new_from_array(files: PPGFile; n_files: Tgsize): PGdkFileList; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 17:34:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GDK_TYPE_CONTENT_FORMATS: TGType;
begin
  GDK_TYPE_CONTENT_FORMATS := gdk_content_formats_get_type;
end;

function GDK_TYPE_CONTENT_FORMATS_BUILDER: TGType;
begin
  GDK_TYPE_CONTENT_FORMATS_BUILDER := gdk_content_formats_builder_get_type;
end;

function GDK_TYPE_FILE_LIST: TGType;
begin
  GDK_TYPE_FILE_LIST := gdk_file_list_get_type;
end;


{$ENDIF read_implementation}
