{$IFDEF read_interface}


type
  PEfl_Io_Sizer_Fd = ^TEfl_Io_Sizer_Fd;
  TEfl_Io_Sizer_Fd = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_SIZER_FD_MIXIN: PEfl_Class;

function efl_io_sizer_fd_mixin_get: PEfl_Class; cdecl; external libecore;
procedure efl_io_sizer_fd_set(obj: PEo; fd: longint); cdecl; external libecore;
function efl_io_sizer_fd_get(obj: PEo): longint; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:19:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_IO_SIZER_FD_MIXIN: PEfl_Class;
begin
  EFL_IO_SIZER_FD_MIXIN := efl_io_sizer_fd_mixin_get;
end;
{$endif}


{$ENDIF read_implementation}
