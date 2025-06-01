{$IFDEF read_interface}


type
  PEfl_Ui_Video = ^TEfl_Ui_Video;
  TEfl_Ui_Video = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_VIDEO_CLASS: PEfl_Class;

function efl_ui_video_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_video_remember_position_set(obj: PEo; remember: TEina_Bool); cdecl; external libelementary;
function efl_ui_video_remember_position_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_ui_video_emotion_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
function efl_ui_video_title_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:26:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_VIDEO_CLASS: PEfl_Class;
begin
  EFL_UI_VIDEO_CLASS := efl_ui_video_class_get;
end;
{$endif}


{$ENDIF read_implementation}
