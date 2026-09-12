{$IFDEF read_interface}


type
  Tapr_perms_setfn_t = function(object_: Pointer; perms: longint; uid: Tapr_uid_t; gid: Tapr_gid_t): Tapr_status_t; cdecl;

  // === Konventiert am: 10-9-26 16:47:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
