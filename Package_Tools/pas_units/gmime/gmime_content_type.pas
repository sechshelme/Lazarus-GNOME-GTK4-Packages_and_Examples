unit gmime_content_type;

interface

uses
  fp_glib2, fp_gmime3, gmime_param, gmime_parser_options, gmime_format_options;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeContentType = record
    parent_object: TGObject;
    _type: pchar;
    subtype: pchar;
    params: PGMimeParamList;
    changed: Tgpointer;
  end;
  PGMimeContentType = ^TGMimeContentType;

  TGMimeContentTypeClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeContentTypeClass = ^TGMimeContentTypeClass;

function g_mime_content_type_get_type: TGType; cdecl; external libgmime3;
function g_mime_content_type_new(_type: pchar; subtype: pchar): PGMimeContentType; cdecl; external libgmime3;
function g_mime_content_type_parse(options: PGMimeParserOptions; str: pchar): PGMimeContentType; cdecl; external libgmime3;
function g_mime_content_type_get_mime_type(content_type: PGMimeContentType): pchar; cdecl; external libgmime3;
function g_mime_content_type_encode(content_type: PGMimeContentType; options: PGMimeFormatOptions): pchar; cdecl; external libgmime3;
function g_mime_content_type_is_type(content_type: PGMimeContentType; _type: pchar; subtype: pchar): Tgboolean; cdecl; external libgmime3;
procedure g_mime_content_type_set_media_type(content_type: PGMimeContentType; _type: pchar); cdecl; external libgmime3;
function g_mime_content_type_get_media_type(content_type: PGMimeContentType): pchar; cdecl; external libgmime3;
procedure g_mime_content_type_set_media_subtype(content_type: PGMimeContentType; subtype: pchar); cdecl; external libgmime3;
function g_mime_content_type_get_media_subtype(content_type: PGMimeContentType): pchar; cdecl; external libgmime3;
function g_mime_content_type_get_parameters(content_type: PGMimeContentType): PGMimeParamList; cdecl; external libgmime3;
procedure g_mime_content_type_set_parameter(content_type: PGMimeContentType; name: pchar; value: pchar); cdecl; external libgmime3;
function g_mime_content_type_get_parameter(content_type: PGMimeContentType; name: pchar): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:26:08 ===

function GMIME_TYPE_CONTENT_TYPE: TGType;
function GMIME_CONTENT_TYPE(obj: Pointer): PGMimeContentType;
function GMIME_CONTENT_TYPE_CLASS(klass: Pointer): PGMimeContentTypeClass;
function GMIME_IS_CONTENT_TYPE(obj: Pointer): Tgboolean;
function GMIME_IS_CONTENT_TYPE_CLASS(klass: Pointer): Tgboolean;
function GMIME_CONTENT_TYPE_GET_CLASS(obj: Pointer): PGMimeContentTypeClass;

implementation

function GMIME_TYPE_CONTENT_TYPE: TGType;
begin
  GMIME_TYPE_CONTENT_TYPE := g_mime_content_type_get_type;
end;

function GMIME_CONTENT_TYPE(obj: Pointer): PGMimeContentType;
begin
  Result := PGMimeContentType(g_type_check_instance_cast(obj, GMIME_TYPE_CONTENT_TYPE));
end;

function GMIME_CONTENT_TYPE_CLASS(klass: Pointer): PGMimeContentTypeClass;
begin
  Result := PGMimeContentTypeClass(g_type_check_class_cast(klass, GMIME_TYPE_CONTENT_TYPE));
end;

function GMIME_IS_CONTENT_TYPE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_CONTENT_TYPE);
end;

function GMIME_IS_CONTENT_TYPE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_CONTENT_TYPE);
end;

function GMIME_CONTENT_TYPE_GET_CLASS(obj: Pointer): PGMimeContentTypeClass;
begin
  Result := PGMimeContentTypeClass(PGTypeInstance(obj)^.g_class);
end;



end.
