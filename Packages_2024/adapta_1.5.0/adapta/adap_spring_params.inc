{$IFDEF read_interface}


function ADAP_TYPE_SPRING_PARAMS: TGType;

type
  PAdapSpringParams = type Pointer;

function adap_spring_params_get_type: TGType; cdecl; external libadapta;
function adap_spring_params_new(damping_ratio: double; mass: double; stiffness: double): PAdapSpringParams; cdecl; external libadapta;
function adap_spring_params_new_full(damping: double; mass: double; stiffness: double): PAdapSpringParams; cdecl; external libadapta;
function adap_spring_params_ref(self: PAdapSpringParams): PAdapSpringParams; cdecl; external libadapta;
procedure adap_spring_params_unref(self: PAdapSpringParams); cdecl; external libadapta;
function adap_spring_params_get_damping(self: PAdapSpringParams): double; cdecl; external libadapta;
function adap_spring_params_get_damping_ratio(self: PAdapSpringParams): double; cdecl; external libadapta;
function adap_spring_params_get_mass(self: PAdapSpringParams): double; cdecl; external libadapta;
function adap_spring_params_get_stiffness(self: PAdapSpringParams): double; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ADAP_TYPE_SPRING_PARAMS: TGType;
begin
  ADAP_TYPE_SPRING_PARAMS := adap_spring_params_get_type;
end;


{$ENDIF read_implementation}
