unit efl_ui_image_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Image = ^TEfl_Ui_Image;
  TEfl_Ui_Image = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Image_Progress = ^TEfl_Ui_Image_Progress;

  TEfl_Ui_Image_Progress = record
    now: double;
    total: double;
  end;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Image_Error = ^TEfl_Ui_Image_Error;

  TEfl_Ui_Image_Error = record
    status: longint;
    open_error: TEina_Bool;
  end;
  {$endif}

function EFL_UI_IMAGE_CLASS: PEfl_Class;

function efl_ui_image_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_image_icon_set(obj: PEo; name: pchar): TEina_Bool; cdecl; external libelementary;
function efl_ui_image_icon_get(obj: PEo): pchar; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_IMAGE_EVENT_DROP: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_IMAGE_EVENT_DROP: PEfl_Event_Description;
{$endif}

// === Konventiert am: 30-5-25 14:00:27 ===


implementation


function EFL_UI_IMAGE_CLASS: PEfl_Class;
begin
  EFL_UI_IMAGE_CLASS := efl_ui_image_class_get;
end;

function EFL_UI_IMAGE_EVENT_DROP: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_EVENT_DROP := @(_EFL_UI_IMAGE_EVENT_DROP);
end;


end.
