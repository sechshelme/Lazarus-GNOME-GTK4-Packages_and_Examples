unit efl_text_markup_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Text_Markup = ^TEfl_Text_Markup;
  TEfl_Text_Markup = TEo;

function EFL_TEXT_MARKUP_INTERFACE: PEfl_Class;

function efl_text_markup_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_text_markup_set(obj: PEo; markup: pchar); cdecl; external libefl;
function efl_text_markup_get(obj: PEo): pchar; cdecl; external libefl;

// === Konventiert am: 20-5-25 15:00:11 ===


implementation


function EFL_TEXT_MARKUP_INTERFACE: PEfl_Class;
begin
  EFL_TEXT_MARKUP_INTERFACE := efl_text_markup_interface_get;
end;


end.
