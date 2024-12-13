unit ges_pitivi_formatter;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_formatter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (PitiviFormatter, pitivi_formatter, PITIVI_FORMATTER); }
type
  TGESPitiviFormatterPrivate = record
  end;
  PGESPitiviFormatterPrivate = ^TGESPitiviFormatterPrivate;

  TGESPitiviFormatter = record
    parent: TGESFormatter;
    priv: PGESPitiviFormatterPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESPitiviFormatter = ^TGESPitiviFormatter;

  TGESPitiviFormatterClass = record
    parent_class: TGESFormatterClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESPitiviFormatterClass = ^TGESPitiviFormatterClass;

function ges_pitivi_formatter_get_type: TGType; cdecl; external libges;

function ges_pitivi_formatter_new: PGESPitiviFormatter; cdecl; external libges;

// === Konventiert am: 13-12-24 16:55:03 ===

function GES_TYPE_PITIVI_FORMATTER: TGType;
function GES_PITIVI_FORMATTER(obj: Pointer): PGESPitiviFormatter;
function GES_IS_PITIVI_FORMATTER(obj: Pointer): Tgboolean;
function GES_PITIVI_FORMATTER_CLASS(klass: Pointer): PGESPitiviFormatterClass;
function GES_IS_PITIVI_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_PITIVI_FORMATTER_GET_CLASS(obj: Pointer): PGESPitiviFormatterClass;

implementation

function GES_TYPE_PITIVI_FORMATTER: TGType;
begin
  Result := ges_pitivi_formatter_get_type;
end;

function GES_PITIVI_FORMATTER(obj: Pointer): PGESPitiviFormatter;
begin
  Result := PGESPitiviFormatter(g_type_check_instance_cast(obj, GES_TYPE_PITIVI_FORMATTER));
end;

function GES_IS_PITIVI_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_PITIVI_FORMATTER);
end;

function GES_PITIVI_FORMATTER_CLASS(klass: Pointer): PGESPitiviFormatterClass;
begin
  Result := PGESPitiviFormatterClass(g_type_check_class_cast(klass, GES_TYPE_PITIVI_FORMATTER));
end;

function GES_IS_PITIVI_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_PITIVI_FORMATTER);
end;

function GES_PITIVI_FORMATTER_GET_CLASS(obj: Pointer): PGESPitiviFormatterClass;
begin
  Result := PGESPitiviFormatterClass(PGTypeInstance(obj)^.g_class);
end;




end.
