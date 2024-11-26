/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 26-11-2024   16:54                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TPangoFontsetSimple = record
  end;
  PPangoFontsetSimple = ^TPangoFontsetSimple;

function pango_fontset_simple_get_type: TGType; cdecl; external libpango;
function pango_fontset_simple_new(language: PPangoLanguage): PPangoFontsetSimple; cdecl; external libpango;
procedure pango_fontset_simple_append(fontset: PPangoFontsetSimple; font: PPangoFont); cdecl; external libpango;
function pango_fontset_simple_size(fontset: PPangoFontsetSimple): longint; cdecl; external libpango;

// === Konventiert am: 26-11-24 15:50:27 ===

function PANGO_TYPE_FONTSET_SIMPLE: TGType;
function PANGO_FONTSET_SIMPLE(obj: Pointer): PPangoFontsetSimple;
function PANGO_IS_FONTSET_SIMPLE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_TYPE_FONTSET_SIMPLE: TGType;
begin
  PANGO_TYPE_FONTSET_SIMPLE := pango_fontset_simple_get_type;
end;

function PANGO_FONTSET_SIMPLE(obj: Pointer): PPangoFontsetSimple;
begin
  Result := PPangoFontsetSimple(g_type_check_instance_cast(obj, PANGO_TYPE_FONTSET_SIMPLE));
end;

function PANGO_IS_FONTSET_SIMPLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PANGO_TYPE_FONTSET_SIMPLE);
end;



{$ENDIF read_implementation}
