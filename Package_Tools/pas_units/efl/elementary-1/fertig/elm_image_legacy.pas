unit elm_image_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_image_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

type
  TElm_Image_Progress = record
    now: double;
    total: double;
  end;
  PElm_Image_Progress = ^TElm_Image_Progress;

  TElm_Image_Error = record
    status: longint;
    open_error: TEina_Bool;
  end;
  PElm_Image_Error = ^TElm_Image_Error;

  PElm_Image = ^TElm_Image;
  TElm_Image = TEvas_Object;

function elm_image_file_set(obj: PEvas_Object; file_: pchar; group: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_image_file_get(obj: PEo; file_: PPchar; group: PPchar); cdecl; external libelementary;
procedure elm_image_prescale_set(obj: PEvas_Object; size: longint); cdecl; external libelementary;
function elm_image_prescale_get(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_image_mmap_set(obj: PEvas_Object; file_: PEina_File; group: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_image_smooth_set(obj: PEvas_Object; smooth: TEina_Bool); cdecl; external libelementary;
function elm_image_smooth_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_image_animated_play_set(obj: PEvas_Object; play: TEina_Bool); cdecl; external libelementary;
function elm_image_animated_play_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_image_animated_set(obj: PEvas_Object; anim: TEina_Bool); cdecl; external libelementary;
function elm_image_animated_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_image_animated_available_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_image_editable_set(obj: PEvas_Object; set_: TEina_Bool); cdecl; external libelementary;
function elm_image_editable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_image_memfile_set(obj: PEvas_Object; img: pointer; size: Tsize_t; format: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;
procedure elm_image_fill_outside_set(obj: PEvas_Object; fill_outside: TEina_Bool); cdecl; external libelementary;
function elm_image_fill_outside_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_image_preload_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary;

type
  PElm_Image_Orient_Type = ^TElm_Image_Orient_Type;
  TElm_Image_Orient_Type = longint;

const
  ELM_IMAGE_ORIENT_NONE = 0;
  ELM_IMAGE_ORIENT_0 = 0;
  ELM_IMAGE_ROTATE_90 = 1;
  ELM_IMAGE_ORIENT_90 = 1;
  ELM_IMAGE_ROTATE_180 = 2;
  ELM_IMAGE_ORIENT_180 = 2;
  ELM_IMAGE_ROTATE_270 = 3;
  ELM_IMAGE_ORIENT_270 = 3;
  ELM_IMAGE_FLIP_HORIZONTAL = 4;
  ELM_IMAGE_FLIP_VERTICAL = 5;
  ELM_IMAGE_FLIP_TRANSPOSE = 6;
  ELM_IMAGE_FLIP_TRANSVERSE = 7;

type
  TElm_Image_Orient = TElm_Image_Orient_Type;
  PElm_Image_Orient = ^TElm_Image_Orient;

procedure elm_image_orient_set(obj: PEvas_Object; orient: TElm_Image_Orient); cdecl; external libelementary;
function elm_image_orient_get(obj: PEvas_Object): TElm_Image_Orient; cdecl; external libelementary;
function elm_image_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_image_object_size_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_image_resizable_set(obj: PEvas_Object; up: TEina_Bool; down: TEina_Bool); cdecl; external libelementary;
procedure elm_image_resizable_get(obj: PEvas_Object; up: PEina_Bool; down: PEina_Bool); cdecl; external libelementary;
procedure elm_image_no_scale_set(obj: PEvas_Object; no_scale: TEina_Bool); cdecl; external libelementary;
function elm_image_no_scale_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_image_aspect_fixed_set(obj: PEvas_Object; fixed: TEina_Bool); cdecl; external libelementary;
function elm_image_aspect_fixed_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_image_async_open_set(obj: PEvas_Object; async: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 26-5-25 15:23:30 ===


implementation



end.
