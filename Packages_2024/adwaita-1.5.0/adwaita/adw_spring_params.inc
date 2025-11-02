{$IFDEF read_interface}

function ADW_TYPE_SPRING_PARAMS: TGType;

type
  TAdwSpringParams = record
  end;
  PAdwSpringParams = ^TAdwSpringParams;

function adw_spring_params_get_type: TGType; cdecl; external libadwaita;
function adw_spring_params_new(damping_ratio: double; mass: double; stiffness: double): PAdwSpringParams; cdecl; external libadwaita;
function adw_spring_params_new_full(damping: double; mass: double; stiffness: double): PAdwSpringParams; cdecl; external libadwaita;
function adw_spring_params_ref(self: PAdwSpringParams): PAdwSpringParams; cdecl; external libadwaita;
procedure adw_spring_params_unref(self: PAdwSpringParams); cdecl; external libadwaita;
function adw_spring_params_get_damping(self: PAdwSpringParams): double; cdecl; external libadwaita;
function adw_spring_params_get_damping_ratio(self: PAdwSpringParams): double; cdecl; external libadwaita;
function adw_spring_params_get_mass(self: PAdwSpringParams): double; cdecl; external libadwaita;
function adw_spring_params_get_stiffness(self: PAdwSpringParams): double; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:23:34 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}


function ADW_TYPE_SPRING_PARAMS: TGType;
begin
  ADW_TYPE_SPRING_PARAMS := adw_spring_params_get_type;
end;


{$ENDIF read_implementation}
