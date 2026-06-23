unit gpoll;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGPollFD = ^TGPollFD;

  TGPollFunc = function(ufds: PGPollFD; nfsd: Tguint; timeout_: Tgint): Tgint; cdecl;

  TGPollFD = record
    {$IFDEF windows}
    fd: Tgint64;
    {$ELSE}
    fd: Tgint;
    {$ENDIF}
    events: Tgushort;
    revents: Tgushort;
  end;

function g_poll(fds: PGPollFD; nfds: Tguint; timeout: Tgint): Tgint; cdecl; external libglib2;

// === Konventiert am: 22-6-26 17:16:42 ===


implementation



end.
