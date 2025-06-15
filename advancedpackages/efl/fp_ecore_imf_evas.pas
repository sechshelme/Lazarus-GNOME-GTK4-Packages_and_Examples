unit fp_ecore_imf_evas;

interface

uses
  efl, fp_evas, fp_ecore_imf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure ecore_imf_evas_event_mouse_in_wrap(evas_event: PEvas_Event_Mouse_In; imf_event: PEcore_IMF_Event_Mouse_In); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_mouse_out_wrap(evas_event: PEvas_Event_Mouse_Out; imf_event: PEcore_IMF_Event_Mouse_Out); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_mouse_move_wrap(evas_event: PEvas_Event_Mouse_Move; imf_event: PEcore_IMF_Event_Mouse_Move); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_mouse_down_wrap(evas_event: PEvas_Event_Mouse_Down; imf_event: PEcore_IMF_Event_Mouse_Down); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_mouse_up_wrap(evas_event: PEvas_Event_Mouse_Up; imf_event: PEcore_IMF_Event_Mouse_Up); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_mouse_wheel_wrap(evas_event: PEvas_Event_Mouse_Wheel; imf_event: PEcore_IMF_Event_Mouse_Wheel); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_key_down_wrap(evas_event: PEvas_Event_Key_Down; imf_event: PEcore_IMF_Event_Key_Down); cdecl; external libecore_imf_evas;
procedure ecore_imf_evas_event_key_up_wrap(evas_event: PEvas_Event_Key_Up; imf_event: PEcore_IMF_Event_Key_Up); cdecl; external libecore_imf_evas;

// === Konventiert am: 15-6-25 13:16:03 ===


implementation



end.
