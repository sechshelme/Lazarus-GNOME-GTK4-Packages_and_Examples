unit gphoto2_port_result;

interface

uses
  fp_glib2, fp_gphoto2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GP_OK = 0;
  GP_ERROR = -(1);
  GP_ERROR_BAD_PARAMETERS = -(2);
  GP_ERROR_NO_MEMORY = -(3);
  GP_ERROR_LIBRARY = -(4);
  GP_ERROR_UNKNOWN_PORT = -(5);
  GP_ERROR_NOT_SUPPORTED = -(6);
  GP_ERROR_IO = -(7);
  GP_ERROR_FIXED_LIMIT_EXCEEDED = -(8);
  GP_ERROR_TIMEOUT = -(10);
  GP_ERROR_IO_SUPPORTED_SERIAL = -(20);
  GP_ERROR_IO_SUPPORTED_USB = -(21);
  GP_ERROR_IO_INIT = -(31);
  GP_ERROR_IO_READ = -(34);
  GP_ERROR_IO_WRITE = -(35);
  GP_ERROR_IO_UPDATE = -(37);
  GP_ERROR_IO_SERIAL_SPEED = -(41);
  GP_ERROR_IO_USB_CLEAR_HALT = -(51);
  GP_ERROR_IO_USB_FIND = -(52);
  GP_ERROR_IO_USB_CLAIM = -(53);
  GP_ERROR_IO_LOCK = -(60);
  GP_ERROR_HAL = -(70);

function gp_port_result_as_string(result: longint): pchar; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:10 ===


implementation



end.
