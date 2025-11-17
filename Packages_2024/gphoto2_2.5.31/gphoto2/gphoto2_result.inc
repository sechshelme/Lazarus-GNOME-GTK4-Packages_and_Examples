{$IFDEF read_interface}


const
  GP_ERROR_CORRUPTED_DATA = -(102);
  GP_ERROR_FILE_EXISTS = -(103);
  GP_ERROR_MODEL_NOT_FOUND = -(105);
  GP_ERROR_DIRECTORY_NOT_FOUND = -(107);
  GP_ERROR_FILE_NOT_FOUND = -(108);
  GP_ERROR_DIRECTORY_EXISTS = -(109);
  GP_ERROR_CAMERA_BUSY = -(110);
  GP_ERROR_PATH_NOT_ABSOLUTE = -(111);
  GP_ERROR_CANCEL = -(112);
  GP_ERROR_CAMERA_ERROR = -(113);
  GP_ERROR_OS_FAILURE = -(114);
  GP_ERROR_NO_SPACE = -(115);

function gp_result_as_string(result: longint): pchar; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
