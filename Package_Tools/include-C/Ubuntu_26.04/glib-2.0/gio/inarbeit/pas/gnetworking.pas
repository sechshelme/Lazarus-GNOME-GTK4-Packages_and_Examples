unit gnetworking;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  T_SRV = 33;

const
  _PATH_RESCONF = '/etc/resolv.conf';

procedure g_networking_init; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:43:45 ===


implementation


end.
