unit socket;

interface

uses
  fp_socket, fp_gnutls, gnutls;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure gnutls_transport_set_fastopen(session: Tgnutls_session_t; fd: longint; connect_addr: Psockaddr; connect_addrlen: Tsocklen_t; flags: dword); cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:58 ===


implementation



end.
