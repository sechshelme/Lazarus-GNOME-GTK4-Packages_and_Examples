unit shumate_user_agent;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function shumate_get_user_agent: pchar; cdecl; external libshumate;
procedure shumate_set_user_agent(new_user_agent: pchar); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:25 ===


implementation



end.
