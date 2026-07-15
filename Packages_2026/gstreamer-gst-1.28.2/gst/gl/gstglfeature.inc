

{$IFDEF read_struct}
function gst_gl_check_extension(name: pchar; ext: Pgchar): Tgboolean; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:02:17 ===

function GST_GL_CHECK_GL_VERSION(driver_major, driver_minor, target_major, target_minor: cardinal): boolean; inline;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_GL_CHECK_GL_VERSION(driver_major, driver_minor, target_major, target_minor: cardinal): boolean; inline;
begin
  Result := (driver_major > target_major) or ((driver_major = target_major) and (driver_minor >= target_minor));
end;

{$ENDIF read_implementation}
