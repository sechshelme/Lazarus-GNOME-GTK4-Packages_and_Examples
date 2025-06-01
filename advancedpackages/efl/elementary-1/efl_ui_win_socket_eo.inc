{$IFDEF read_interface}


type
  PEfl_Ui_Win_Socket = ^TEfl_Ui_Win_Socket;
  TEfl_Ui_Win_Socket = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_WIN_SOCKET_CLASS: PEfl_Class;

function efl_ui_win_socket_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_win_socket_listen(obj: PEo; svcname: pchar; svcnum: longint; svcsys: TEina_Bool): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:39:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_WIN_SOCKET_CLASS: PEfl_Class;
begin
  EFL_UI_WIN_SOCKET_CLASS := efl_ui_win_socket_class_get;
end;
{$endif}


{$ENDIF read_implementation}
