{$IFDEF read_interface}


type
  PEfl_Ui_Image_Factory = ^TEfl_Ui_Image_Factory;
  TEfl_Ui_Image_Factory = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_IMAGE_FACTORY_CLASS: PEfl_Class;

function efl_ui_image_factory_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:27:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_IMAGE_FACTORY_CLASS: PEfl_Class;
begin
  EFL_UI_IMAGE_FACTORY_CLASS := efl_ui_image_factory_class_get;
end;
{$endif}


{$ENDIF read_implementation}
