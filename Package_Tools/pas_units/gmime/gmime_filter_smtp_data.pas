unit gmime_filter_smtp_data;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGMimeFilterSmtpData = record
    parent_object: TGMimeFilter;
    bol: Tgboolean;
  end;
  PGMimeFilterSmtpData = ^TGMimeFilterSmtpData;

  TGMimeFilterSmtpDataClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterSmtpDataClass = ^TGMimeFilterSmtpDataClass;

function g_mime_filter_smtp_data_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_smtp_data_new: PGMimeFilter; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:04 ===

function GMIME_TYPE_FILTER_SMTP_DATA: TGType;
function GMIME_FILTER_SMTP_DATA(obj: Pointer): PGMimeFilterSmtpData;
function GMIME_FILTER_SMTP_DATA_CLASS(klass: Pointer): PGMimeFilterSmtpDataClass;
function GMIME_IS_FILTER_SMTP_DATA(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_SMTP_DATA_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_SMTP_DATA_GET_CLASS(obj: Pointer): PGMimeFilterSmtpDataClass;

implementation

function GMIME_TYPE_FILTER_SMTP_DATA: TGType;
begin
  GMIME_TYPE_FILTER_SMTP_DATA := g_mime_filter_smtp_data_get_type;
end;

function GMIME_FILTER_SMTP_DATA(obj: Pointer): PGMimeFilterSmtpData;
begin
  Result := PGMimeFilterSmtpData(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_SMTP_DATA));
end;

function GMIME_FILTER_SMTP_DATA_CLASS(klass: Pointer): PGMimeFilterSmtpDataClass;
begin
  Result := PGMimeFilterSmtpDataClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_SMTP_DATA));
end;

function GMIME_IS_FILTER_SMTP_DATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_SMTP_DATA);
end;

function GMIME_IS_FILTER_SMTP_DATA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_SMTP_DATA);
end;

function GMIME_FILTER_SMTP_DATA_GET_CLASS(obj: Pointer): PGMimeFilterSmtpDataClass;
begin
  Result := PGMimeFilterSmtpDataClass(PGTypeInstance(obj)^.g_class);
end;



end.
