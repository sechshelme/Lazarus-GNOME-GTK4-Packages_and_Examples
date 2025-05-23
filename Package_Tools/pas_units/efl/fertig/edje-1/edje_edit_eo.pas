unit edje_edit_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEdje_Edit = ^TEdje_Edit;
  TEdje_Edit = TEo;

function EDJE_EDIT_CLASS: PEfl_Class;

function edje_edit_class_get: PEfl_Class; cdecl; external libedje;

// === Konventiert am: 22-5-25 19:56:17 ===


implementation


function EDJE_EDIT_CLASS: PEfl_Class;
begin
  EDJE_EDIT_CLASS := edje_edit_class_get;
end;


end.
