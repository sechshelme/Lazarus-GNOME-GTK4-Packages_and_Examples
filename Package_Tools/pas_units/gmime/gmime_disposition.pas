unit gmime_disposition;

interface

uses
  fp_glib2, fp_gmime3, gmime_param, gmime_parser_options, gmime_format_options;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GMIME_DISPOSITION_ATTACHMENT = 'attachment';
  GMIME_DISPOSITION_INLINE = 'inline';

type
  TGMimeContentDisposition = record
    parent_object: TGObject;
    disposition: pchar;
    params: PGMimeParamList;
    changed: Tgpointer;
  end;
  PGMimeContentDisposition = ^TGMimeContentDisposition;

  TGMimeContentDispositionClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeContentDispositionClass = ^TGMimeContentDispositionClass;

function g_mime_content_disposition_get_type: TGType; cdecl; external libgmime3;
function g_mime_content_disposition_new: PGMimeContentDisposition; cdecl; external libgmime3;
function g_mime_content_disposition_parse(options: PGMimeParserOptions; str: pchar): PGMimeContentDisposition; cdecl; external libgmime3;
procedure g_mime_content_disposition_set_disposition(disposition: PGMimeContentDisposition; value: pchar); cdecl; external libgmime3;
function g_mime_content_disposition_get_disposition(disposition: PGMimeContentDisposition): pchar; cdecl; external libgmime3;
function g_mime_content_disposition_get_parameters(disposition: PGMimeContentDisposition): PGMimeParamList; cdecl; external libgmime3;
procedure g_mime_content_disposition_set_parameter(disposition: PGMimeContentDisposition; name: pchar; value: pchar); cdecl; external libgmime3;
function g_mime_content_disposition_get_parameter(disposition: PGMimeContentDisposition; name: pchar): pchar; cdecl; external libgmime3;
function g_mime_content_disposition_is_attachment(disposition: PGMimeContentDisposition): Tgboolean; cdecl; external libgmime3;
function g_mime_content_disposition_encode(disposition: PGMimeContentDisposition; options: PGMimeFormatOptions): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:26:38 ===

function GMIME_TYPE_CONTENT_DISPOSITION: TGType;
function GMIME_CONTENT_DISPOSITION(obj: Pointer): PGMimeContentDisposition;
function GMIME_CONTENT_DISPOSITION_CLASS(klass: Pointer): PGMimeContentDispositionClass;
function GMIME_IS_CONTENT_DISPOSITION(obj: Pointer): Tgboolean;
function GMIME_IS_CONTENT_DISPOSITION_CLASS(klass: Pointer): Tgboolean;
function GMIME_CONTENT_DISPOSITION_GET_CLASS(obj: Pointer): PGMimeContentDispositionClass;

implementation

function GMIME_TYPE_CONTENT_DISPOSITION: TGType;
begin
  GMIME_TYPE_CONTENT_DISPOSITION := g_mime_content_disposition_get_type;
end;

function GMIME_CONTENT_DISPOSITION(obj: Pointer): PGMimeContentDisposition;
begin
  Result := PGMimeContentDisposition(g_type_check_instance_cast(obj, GMIME_TYPE_CONTENT_DISPOSITION));
end;

function GMIME_CONTENT_DISPOSITION_CLASS(klass: Pointer): PGMimeContentDispositionClass;
begin
  Result := PGMimeContentDispositionClass(g_type_check_class_cast(klass, GMIME_TYPE_CONTENT_DISPOSITION));
end;

function GMIME_IS_CONTENT_DISPOSITION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_CONTENT_DISPOSITION);
end;

function GMIME_IS_CONTENT_DISPOSITION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_CONTENT_DISPOSITION);
end;

function GMIME_CONTENT_DISPOSITION_GET_CLASS(obj: Pointer): PGMimeContentDispositionClass;
begin
  Result := PGMimeContentDispositionClass(PGTypeInstance(obj)^.g_class);
end;



end.
