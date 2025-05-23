{$IFDEF read_interface}


type
  PEdje_Edit = ^TEdje_Edit;
  TEdje_Edit = TEo;

function EDJE_EDIT_CLASS: PEfl_Class;

function edje_edit_class_get: PEfl_Class; cdecl; external libedje;

// === Konventiert am: 22-5-25 19:56:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EDJE_EDIT_CLASS: PEfl_Class;
begin
  EDJE_EDIT_CLASS := edje_edit_class_get;
end;


{$ENDIF read_implementation}
