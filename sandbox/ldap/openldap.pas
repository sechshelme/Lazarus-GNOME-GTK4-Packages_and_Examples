unit openldap;

interface

uses
  fp_ldap;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  LDAP_PROTO_TCP = 1;
  LDAP_PROTO_UDP = 2;
  LDAP_PROTO_IPC = 3;
  LDAP_PROTO_EXT = 4;

function ldap_init_fd(fd: Tber_socket_t; proto: longint; url: pchar; ldp: PPLDAP): longint; cdecl; external libldap;

// === Konventiert am: 10-12-25 16:58:27 ===


implementation



end.
