unit ges_formatter;

interface

uses
  fp_glib2, fp_gst, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (Formatter, formatter, FORMATTER); }
type
  TGESFormatterPrivate = record
  end;
  PGESFormatterPrivate = ^TGESFormatterPrivate;

  TGESFormatter = record
    parent: TGInitiallyUnowned;
    priv: PGESFormatterPrivate;
    project: PGESProject;
    timeline: PGESTimeline;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESFormatter = ^TGESFormatter;

  TGESFormatterCanLoadURIMethod = function(dummy_instance: PGESFormatter; uri: Pgchar; error: PPGError): Tgboolean; cdecl;
  TGESFormatterLoadFromURIMethod = function(formatter: PGESFormatter; timeline: PGESTimeline; uri: Pgchar; error: PPGError): Tgboolean; cdecl;
  TGESFormatterSaveToURIMethod = function(formatter: PGESFormatter; timeline: PGESTimeline; uri: Pgchar; overwrite: Tgboolean; error: PPGError): Tgboolean; cdecl;

  TGESFormatterClass = record
    parent_class: TGInitiallyUnownedClass;
    can_load_uri: TGESFormatterCanLoadURIMethod;
    load_from_uri: TGESFormatterLoadFromURIMethod;
    save_to_uri: TGESFormatterSaveToURIMethod;
    Name: Pgchar;
    description: Pgchar;
    extension: Pgchar;
    mimetype: Pgchar;
    version: Tgdouble;
    rank: TGstRank;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESFormatterClass = ^TGESFormatterClass;

function ges_formatter_get_type: TGType; cdecl; external libges;
procedure ges_formatter_class_register_metas(klass: PGESFormatterClass; Name: Pgchar; description: Pgchar; extensions: Pgchar; caps: Pgchar;
  version: Tgdouble; rank: TGstRank); cdecl; external libges;
function ges_formatter_can_load_uri(uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libges;
function ges_formatter_can_save_uri(uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libges;
function ges_formatter_load_from_uri(formatter: PGESFormatter; timeline: PGESTimeline; uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libges;
function ges_formatter_save_to_uri(formatter: PGESFormatter; timeline: PGESTimeline; uri: Pgchar; overwrite: Tgboolean; error: PPGError): Tgboolean; cdecl; external libges;
function ges_formatter_get_default: PGESAsset; cdecl; external libges;
function ges_find_formatter_for_uri(uri: Pgchar): PGESAsset; cdecl; external libges;

// === Konventiert am: 12-12-24 19:45:51 ===

function GES_TYPE_FORMATTER: TGType;
function GES_FORMATTER(obj: Pointer): PGESFormatter;
function GES_IS_FORMATTER(obj: Pointer): Tgboolean;
function GES_FORMATTER_CLASS(klass: Pointer): PGESFormatterClass;
function GES_IS_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_FORMATTER_GET_CLASS(obj: Pointer): PGESFormatterClass;

implementation

function GES_TYPE_FORMATTER: TGType;
begin
  Result := ges_formatter_get_type;
end;

function GES_FORMATTER(obj: Pointer): PGESFormatter;
begin
  Result := PGESFormatter(g_type_check_instance_cast(obj, GES_TYPE_FORMATTER));
end;

function GES_IS_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_FORMATTER);
end;

function GES_FORMATTER_CLASS(klass: Pointer): PGESFormatterClass;
begin
  Result := PGESFormatterClass(g_type_check_class_cast(klass, GES_TYPE_FORMATTER));
end;

function GES_IS_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_FORMATTER);
end;

function GES_FORMATTER_GET_CLASS(obj: Pointer): PGESFormatterClass;
begin
  Result := PGESFormatterClass(PGTypeInstance(obj)^.g_class);
end;




end.
