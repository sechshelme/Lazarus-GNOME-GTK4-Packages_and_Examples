unit efl_ui_video_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Video = ^TEfl_Ui_Video;
  TEfl_Ui_Video = TEo;

procedure elm_video_remember_position_set(obj: PEfl_Ui_Video; remember: TEina_Bool); cdecl; external libelementary;
function elm_video_remember_position_get(obj: PEfl_Ui_Video): TEina_Bool; cdecl; external libelementary;
function elm_video_emotion_get(obj: PEfl_Ui_Video): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_video_title_get(obj: PEfl_Ui_Video): pchar; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:26:02 ===


implementation



end.
