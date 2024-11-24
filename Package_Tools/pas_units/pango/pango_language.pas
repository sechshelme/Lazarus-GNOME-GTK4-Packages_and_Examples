unit pango_language;

interface

uses
  fp_glib2, pango_script, pango_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function pango_language_get_type: TGType; cdecl; external libpango;
function pango_language_get_default: PPangoLanguage; cdecl; external libpango;
function pango_language_get_preferred: PPPangoLanguage; cdecl; external libpango;
function pango_language_from_string(language: pchar): PPangoLanguage; cdecl; external libpango;
function pango_language_to_string(language: PPangoLanguage): pchar; cdecl; external libpango;

function pango_language_get_sample_string(language: PPangoLanguage): pchar; cdecl; external libpango;
function pango_language_matches(language: PPangoLanguage; range_list: pchar): Tgboolean; cdecl; external libpango;
function pango_language_includes_script(language: PPangoLanguage; script: TPangoScript): Tgboolean; cdecl; external libpango;
function pango_language_get_scripts(language: PPangoLanguage; num_scripts: Plongint): PPangoScript; cdecl; external libpango;

// === Konventiert am: 23-11-24 16:59:23 ===

function PANGO_TYPE_LANGUAGE: TGType;

implementation

function PANGO_TYPE_LANGUAGE: TGType;
begin
  PANGO_TYPE_LANGUAGE := pango_language_get_type;
end;


end.
