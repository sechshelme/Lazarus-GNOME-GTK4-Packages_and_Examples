unit elm_thumb_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, fp_ethumb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Thumb_Animation_Setting = ^TElm_Thumb_Animation_Setting;
  TElm_Thumb_Animation_Setting = longint;

const
  ELM_THUMB_ANIMATION_START = 0;
  ELM_THUMB_ANIMATION_LOOP = 1;
  ELM_THUMB_ANIMATION_STOP = 2;
  ELM_THUMB_ANIMATION_LAST = 3;

function elm_thumb_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_thumb_file_set(obj: PEo; file_: pchar; key: pchar); cdecl; external libelementary;
procedure elm_thumb_file_get(obj: PEo; file_: PPchar; key: PPchar); cdecl; external libelementary;
function elm_thumb_editable_set(obj: PEvas_Object; edit: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_thumb_editable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_thumb_compress_set(obj: PEvas_Object; compress: longint); cdecl; external libelementary;
procedure elm_thumb_compress_get(obj: PEvas_Object; compress: Plongint); cdecl; external libelementary;
procedure elm_thumb_format_set(obj: PEvas_Object; format: TEthumb_Thumb_Format); cdecl; external libelementary;
function elm_thumb_format_get(obj: PEvas_Object): TEthumb_Thumb_Format; cdecl; external libelementary;
procedure elm_thumb_animate_set(obj: PEvas_Object; setting: TElm_Thumb_Animation_Setting); cdecl; external libelementary;
function elm_thumb_animate_get(obj: PEvas_Object): TElm_Thumb_Animation_Setting; cdecl; external libelementary;
procedure elm_thumb_fdo_size_set(obj: PEvas_Object; size: TEthumb_Thumb_FDO_Size); cdecl; external libelementary;
function elm_thumb_fdo_size_get(obj: PEvas_Object): TEthumb_Thumb_FDO_Size; cdecl; external libelementary;
procedure elm_thumb_orientation_set(obj: PEvas_Object; orient: TEthumb_Thumb_Orientation); cdecl; external libelementary;
function elm_thumb_orientation_get(obj: PEvas_Object): TEthumb_Thumb_Orientation; cdecl; external libelementary;
procedure elm_thumb_aspect_set(obj: PEvas_Object; aspect: TEthumb_Thumb_Aspect); cdecl; external libelementary;
function elm_thumb_aspect_get(obj: PEvas_Object): TEthumb_Thumb_Aspect; cdecl; external libelementary;
procedure elm_thumb_quality_set(obj: PEvas_Object; quality: longint); cdecl; external libelementary;
procedure elm_thumb_quality_get(obj: PEvas_Object; quality: Plongint); cdecl; external libelementary;
procedure elm_thumb_size_set(obj: PEvas_Object; tw: longint; th: longint); cdecl; external libelementary;
procedure elm_thumb_size_get(obj: PEvas_Object; tw: Plongint; th: Plongint); cdecl; external libelementary;
procedure elm_thumb_crop_align_set(obj: PEvas_Object; cropx: double; cropy: double); cdecl; external libelementary;
procedure elm_thumb_crop_align_get(obj: PEvas_Object; cropx: Pdouble; cropy: Pdouble); cdecl; external libelementary;
procedure elm_thumb_path_get(obj: PEvas_Object; file_: PPchar; key: PPchar); cdecl; external libelementary;
procedure elm_thumb_reload(obj: PEvas_Object); cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:40:43 ===


implementation



end.
