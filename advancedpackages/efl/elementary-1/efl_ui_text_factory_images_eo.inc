{$IFDEF read_interface}


type
  PEfl_Ui_Text_Factory_Images = ^TEfl_Ui_Text_Factory_Images;
  TEfl_Ui_Text_Factory_Images = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXT_FACTORY_IMAGES_CLASS: PEfl_Config;

function efl_ui_text_factory_images_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_text_factory_images_matches_add(obj: PEo; name: pchar; path: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;
function efl_ui_text_factory_images_matches_del(obj: PEo; key: pchar): TEina_Bool; cdecl; external libelementary;
function efl_ui_text_factory_images_matches_mmap_add(obj: PEo; name: pchar; file_: PEina_File; key: pchar): TEina_Bool; cdecl; external libelementary;
function efl_ui_text_factory_images_matches_mmap_del(obj: PEo; key: pchar): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 17:54:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXT_FACTORY_IMAGES_CLASS: PEfl_Config;
begin
  EFL_UI_TEXT_FACTORY_IMAGES_CLASS := efl_ui_text_factory_images_class_get;
end;
{$endif}


{$ENDIF read_implementation}
