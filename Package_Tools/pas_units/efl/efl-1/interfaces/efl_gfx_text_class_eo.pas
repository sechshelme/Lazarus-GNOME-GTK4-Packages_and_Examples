unit efl_gfx_text_class_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_gfx_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Gfx_Text_Class = ^TEfl_Gfx_Text_Class;
  TEfl_Gfx_Text_Class = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_TEXT_CLASS_INTERFACE: PEfl_Class;

function efl_gfx_text_class_interface_get: PEfl_Class; cdecl; external libefl;
function efl_gfx_text_class_set(obj: PEo; text_class: pchar; font: pchar; size: TEfl_Font_Size): TEina_Bool; cdecl; external libefl;
function efl_gfx_text_class_get(obj: PEo; text_class: pchar; font: PPchar; size: PEfl_Font_Size): TEina_Bool; cdecl; external libefl;
procedure efl_gfx_text_class_del(obj: PEo; text_class: pchar); cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:30:35 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_GFX_TEXT_CLASS_INTERFACE: PEfl_Class;
begin
  EFL_GFX_TEXT_CLASS_INTERFACE := efl_gfx_text_class_interface_get;
end;
{$endif}


end.
