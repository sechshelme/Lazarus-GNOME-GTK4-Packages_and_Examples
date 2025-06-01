unit elm_sys_notify_interface_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, elm_sys_notify;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_sys_notify_interface_send(obj: PElm_Sys_Notify_Interface; replaces_id: dword; icon: pchar; summary: pchar; body: pchar;
  urgency: TElm_Sys_Notify_Urgency; timeout: longint; cb: TElm_Sys_Notify_Send_Cb; cb_data: pointer); cdecl; external libelementary;
procedure elm_sys_notify_interface_simple_send(obj: PElm_Sys_Notify_Interface; icon: pchar; summary: pchar; body: pchar); cdecl; external libelementary;
procedure elm_sys_notify_interface_close(obj: PElm_Sys_Notify_Interface; id: dword); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:26 ===


implementation



end.
