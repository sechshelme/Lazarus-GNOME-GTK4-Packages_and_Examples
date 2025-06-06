unit efl_ui_layout_orientable_readonly_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Layout_Orientable_Readonly = ^TEfl_Ui_Layout_Orientable_Readonly;
  TEfl_Ui_Layout_Orientable_Readonly = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LAYOUT_ORIENTABLE_READONLY_MIXIN: PEfl_Class;

function efl_ui_layout_orientable_readonly_mixin_get: PEfl_Class; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 15:00:22 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LAYOUT_ORIENTABLE_READONLY_MIXIN: PEfl_Class;
begin
  EFL_UI_LAYOUT_ORIENTABLE_READONLY_MIXIN := efl_ui_layout_orientable_readonly_mixin_get;
end;
{$endif}


end.
