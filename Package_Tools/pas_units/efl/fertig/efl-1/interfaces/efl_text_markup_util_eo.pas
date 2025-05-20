unit efl_text_markup_util_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Text_Markup_Util = ^TEfl_Text_Markup_Util;
  TEfl_Text_Markup_Util = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_TEXT_MARKUP_UTIL_CLASS: PEfl_Class;

function efl_text_markup_util_class_get: PEfl_Class; cdecl; external libefl;
function efl_text_markup_util_text_to_markup(text: pchar): pchar; cdecl; external libefl;
function efl_text_markup_util_markup_to_text(text: pchar): pchar; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 14:43:53 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_TEXT_MARKUP_UTIL_CLASS: PEfl_Class;
begin
  EFL_TEXT_MARKUP_UTIL_CLASS := efl_text_markup_util_class_get;
end;
{$endif}


end.
