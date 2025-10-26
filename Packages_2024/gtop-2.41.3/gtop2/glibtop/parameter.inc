{$IFDEF read_interface}


const
  GLIBTOP_PARAM_METHOD = 1;
  GLIBTOP_PARAM_FEATURES = 2;
  GLIBTOP_PARAM_COMMAND = 3;
  GLIBTOP_PARAM_HOST = 4;
  GLIBTOP_PARAM_PORT = 5;
  GLIBTOP_PARAM_ERROR_METHOD = 6;
  GLIBTOP_PARAM_REQUIRED = 7;

function glibtop_get_parameter(parameter: dword; data_ptr: pointer; data_size: Tsize_t): Tsize_t;
procedure glibtop_set_parameter(parameter: dword; data_ptr: pointer; data_size: Tsize_t);

function glibtop_get_parameter_l(server: Pglibtop; parameter: dword; data_ptr: pointer; data_size: Tsize_t): Tsize_t; cdecl; external libgtop2;
procedure glibtop_set_parameter_l(server: Pglibtop; parameter: dword; data_ptr: pointer; data_size: Tsize_t); cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:04:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function glibtop_get_parameter(parameter: dword; data_ptr: pointer; data_size: Tsize_t): Tsize_t;
begin
  glibtop_get_parameter := glibtop_get_parameter_l(glibtop_global_server, parameter, data_ptr, data_size);
end;

procedure glibtop_set_parameter(parameter: dword; data_ptr: pointer; data_size: Tsize_t);
begin
  glibtop_set_parameter_l(glibtop_global_server, parameter, data_ptr, data_size);
end;


{$ENDIF read_implementation}
