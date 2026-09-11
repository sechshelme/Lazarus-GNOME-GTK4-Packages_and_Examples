unit apr_perms_set;

interface

uses
  fp_apr, apr_user, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tapr_perms_setfn_t = function(object_: Pointer; perms: longint; uid: Tapr_uid_t; gid: Tapr_gid_t): Tapr_status_t; cdecl;

  // === Konventiert am: 10-9-26 16:47:51 ===


implementation



end.
