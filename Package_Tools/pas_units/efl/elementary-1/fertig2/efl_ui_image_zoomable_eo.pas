unit efl_ui_image_zoomable_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Image_Zoomable = ^TEfl_Ui_Image_Zoomable;
  TEfl_Ui_Image_Zoomable = TEo;

function EFL_UI_IMAGE_ZOOMABLE_CLASS: PEfl_Class;

function efl_ui_image_zoomable_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_image_zoomable_gesture_enabled_set(obj: PEo; gesture: TEina_Bool); cdecl; external libelementary;
function efl_ui_image_zoomable_gesture_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_image_zoomable_image_region_set(obj: PEo; region: TEina_Rect); cdecl; external libelementary;
function efl_ui_image_zoomable_image_region_get(obj: PEo): TEina_Rect; cdecl; external libelementary;

var
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE: PEfl_Event_Description;
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR: PEfl_Event_Description;

// === Konventiert am: 29-5-25 19:46:59 ===


implementation


function EFL_UI_IMAGE_ZOOMABLE_CLASS: PEfl_Class;
begin
  EFL_UI_IMAGE_ZOOMABLE_CLASS := efl_ui_image_zoomable_class_get;
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE);
end;

function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR: PEfl_Event_Description;
begin
  EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR := @(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR);
end;


end.
