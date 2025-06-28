unit mpi;

interface

uses
  mgl_command, define, abstract;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure mgl_mpi_send(gr: THMGL; id: longint); cdecl; external libmglmpi;
procedure mgl_mpi_recv(gr: THMGL; id: longint); cdecl; external libmglmpi;

// === Konventiert am: 27-6-25 17:58:27 ===


implementation



end.
