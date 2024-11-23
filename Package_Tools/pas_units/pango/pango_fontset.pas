unit pango_fontset;

interface

uses
  fp_cairo, fp_glib2, pango_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function pango_fontset_get_type: TGType; cdecl; external libpango;

type
  TPangoFontsetForeachFunc = function(fontset: PPangoFontset; font: PPangoFont; user_data: Tgpointer): Tgboolean; cdecl;

  TPangoFontsetClass = record
    parent_class: TGObjectClass;
    get_font: function(fontset: PPangoFontset; wc: Tguint): PPangoFont; cdecl;
    get_metrics: function(fontset: PPangoFontset): PPangoFontMetrics; cdecl;
    get_language: function(fontset: PPangoFontset): PPangoLanguage; cdecl;
    foreach: procedure(fontset: PPangoFontset; func: TPangoFontsetForeachFunc; Data: Tgpointer); cdecl;
    _pango_reserved1: procedure; cdecl;
    _pango_reserved2: procedure; cdecl;
    _pango_reserved3: procedure; cdecl;
    _pango_reserved4: procedure; cdecl;
  end;
  PPangoFontsetClass = ^TPangoFontsetClass;


function pango_fontset_get_font(fontset: PPangoFontset; wc: Tguint): PPangoFont; cdecl; external libpango;
function pango_fontset_get_metrics(fontset: PPangoFontset): PPangoFontMetrics; cdecl; external libpango;
procedure pango_fontset_foreach(fontset: PPangoFontset; func: TPangoFontsetForeachFunc; Data: Tgpointer); cdecl; external libpango;

// === Konventiert am: 23-11-24 19:16:33 ===

function PANGO_TYPE_FONTSET: TGType;
function PANGO_FONTSET(obj: Pointer): PPangoFontset;
function PANGO_FONTSET_CLASS(klass: Pointer): PPangoFontsetClass;
function PANGO_IS_FONTSET(obj: Pointer): Tgboolean;
function PANGO_IS_FONTSET_CLASS(klass: Pointer): Tgboolean;
function PANGO_FONTSET_GET_CLASS(obj: Pointer): PPangoFontsetClass;

implementation

function PANGO_TYPE_FONTSET: TGType;
begin
  PANGO_TYPE_FONTSET := pango_fontset_get_type;
end;

function PANGO_FONTSET(obj: Pointer): PPangoFontset;
begin
  Result := PPangoFontset(g_type_check_instance_cast(obj, PANGO_TYPE_FONTSET));
end;

function PANGO_FONTSET_CLASS(klass: Pointer): PPangoFontsetClass;
begin
  Result := PPangoFontsetClass(g_type_check_class_cast(klass, PANGO_TYPE_FONTSET));
end;

function PANGO_IS_FONTSET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FONTSET);
end;

function PANGO_IS_FONTSET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PANGO_TYPE_FONTSET);
end;

function PANGO_FONTSET_GET_CLASS(obj: Pointer): PPangoFontsetClass;
begin
  Result := PPangoFontsetClass(PGTypeInstance(obj)^.g_class);
end;



end.
