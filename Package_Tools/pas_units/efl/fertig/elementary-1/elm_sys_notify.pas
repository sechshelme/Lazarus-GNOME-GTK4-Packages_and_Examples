unit elm_sys_notify;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Sys_Notify_Urgency = ^TElm_Sys_Notify_Urgency;
  TElm_Sys_Notify_Urgency = longint;

const
  ELM_SYS_NOTIFY_URGENCY_LOW = 0;
  ELM_SYS_NOTIFY_URGENCY_NORMAL = 1;
  ELM_SYS_NOTIFY_URGENCY_CRITICAL = 2;

type
  PElm_Sys_Notify_Interface = ^TElm_Sys_Notify_Interface;
  TElm_Sys_Notify_Interface = TEo;

type
  TElm_Sys_Notify_Send_Cb = procedure(data: pointer; id: dword); cdecl;

var
  ELM_EVENT_SYS_NOTIFY_NOTIFICATION_CLOSED: longint; cvar;external libelementary;
  ELM_EVENT_SYS_NOTIFY_ACTION_INVOKED: longint; cvar;external libelementary;

procedure elm_sys_notify_simple_send(icon, summary, body: pchar);

procedure elm_sys_notify_send(replaces_id: dword; icon: pchar; summary: pchar; body: pchar; urgency: TElm_Sys_Notify_Urgency;
  timeout: longint; cb: TElm_Sys_Notify_Send_Cb; cb_data: pointer); cdecl; external libelementary;
procedure elm_sys_notify_close(id: dword); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:20 ===


implementation


procedure elm_sys_notify_simple_send(icon, summary, body: pchar);
begin
  elm_sys_notify_send(0, icon, summary, body, ELM_SYS_NOTIFY_URGENCY_NORMAL, -(1), nil, nil);
end;


end.
