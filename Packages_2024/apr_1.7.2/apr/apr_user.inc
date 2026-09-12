{$IFDEF read_interface}


type
  Papr_uid_t = ^Tapr_uid_t;
  Tapr_uid_t = uint32;

  Papr_gid_t = ^Tapr_gid_t;
  Tapr_gid_t = uint32;

function apr_uid_current(userid: Papr_uid_t; groupid: Papr_gid_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_uid_name_get(username: PPchar; userid: Tapr_uid_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_uid_get(userid: Papr_uid_t; groupid: Papr_gid_t; username: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_uid_homepath_get(dirname: PPchar; username: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

{$ifdef windows}
function apr_uid_compare(left: Tapr_uid_t; right: Tapr_uid_t): Tapr_status_t; cdecl; external libapr;
function apr_gid_compare(left: Tapr_gid_t; right: Tapr_gid_t): Tapr_status_t; cdecl; external libapr;
{$else}
function apr_uid_compare(left: Tapr_uid_t; right: Tapr_uid_t): Tapr_status_t; inline;
function apr_gid_compare(left: Tapr_gid_t; right: Tapr_gid_t): Tapr_status_t; inline;
{$endif}

function apr_gid_name_get(groupname: PPchar; groupid: Tapr_gid_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_gid_get(groupid: Papr_gid_t; groupname: pchar; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function apr_uid_compare(left: Tapr_uid_t; right: Tapr_uid_t): Tapr_status_t; inline;
begin
  if left = right then begin
    Result := 0;
  end else begin
    Result := 1;
  end;
end;

function apr_gid_compare(left: Tapr_gid_t; right: Tapr_gid_t): Tapr_status_t; inline;
begin
  if left = right then begin
    Result := 0;
  end else begin
    Result := 1;
  end;
end;

{$ENDIF read_implementation}
