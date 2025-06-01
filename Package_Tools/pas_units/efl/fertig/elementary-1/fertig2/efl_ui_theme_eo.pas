unit efl_ui_theme_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PEfl_Ui_Theme = ^TEfl_Ui_Theme;
  TEfl_Ui_Theme = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_THEME_CLASS: PEfl_Class;

function efl_ui_theme_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_theme_default_get: PEfl_Ui_Theme; cdecl; external libelementary;
procedure efl_ui_theme_extension_add(obj: PEo; item: pchar); cdecl; external libelementary;
procedure efl_ui_theme_extension_del(obj: PEo; item: pchar); cdecl; external libelementary;
procedure efl_ui_theme_overlay_add(obj: PEo; item: pchar); cdecl; external libelementary;
procedure efl_ui_theme_overlay_del(obj: PEo; item: pchar); cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 19:28:04 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_THEME_CLASS: PEfl_Class;
begin
  EFL_UI_THEME_CLASS := efl_ui_theme_class_get;
end;
{$endif}


end.
