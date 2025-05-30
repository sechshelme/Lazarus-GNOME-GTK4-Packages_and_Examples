unit elm_label_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Label = ^TElm_Label;
  TElm_Label = TEo;

type
  PElm_Label_Slide_Mode = ^TElm_Label_Slide_Mode;
  TElm_Label_Slide_Mode = longint;

const
  ELM_LABEL_SLIDE_MODE_NONE = 0;
  ELM_LABEL_SLIDE_MODE_AUTO = 1;
  ELM_LABEL_SLIDE_MODE_ALWAYS = 2;

procedure elm_label_wrap_width_set(obj: PElm_Label; w: longint); cdecl; external libelementary;
function elm_label_wrap_width_get(obj: PElm_Label): longint; cdecl; external libelementary;
procedure elm_label_slide_speed_set(obj: PElm_Label; speed: double); cdecl; external libelementary;
function elm_label_slide_speed_get(obj: PElm_Label): double; cdecl; external libelementary;
procedure elm_label_slide_mode_set(obj: PElm_Label; mode: TElm_Label_Slide_Mode); cdecl; external libelementary;
function elm_label_slide_mode_get(obj: PElm_Label): TElm_Label_Slide_Mode; cdecl; external libelementary;
procedure elm_label_slide_duration_set(obj: PElm_Label; duration: double); cdecl; external libelementary;
function elm_label_slide_duration_get(obj: PElm_Label): double; cdecl; external libelementary;
procedure elm_label_line_wrap_set(obj: PElm_Label; wrap: TElm_Wrap_Type); cdecl; external libelementary;
function elm_label_line_wrap_get(obj: PElm_Label): TElm_Wrap_Type; cdecl; external libelementary;
procedure elm_label_ellipsis_set(obj: PElm_Label; ellipsis: TEina_Bool); cdecl; external libelementary;
function elm_label_ellipsis_get(obj: PElm_Label): TEina_Bool; cdecl; external libelementary;
procedure elm_label_slide_go(obj: PElm_Label); cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:40:34 ===


implementation



end.
