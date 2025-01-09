unit adw_spring_params;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function ADW_TYPE_SPRING_PARAMS: TGType;

type
  TAdwSpringParams = record
  end;
  PAdwSpringParams = ^TAdwSpringParams;

function adw_spring_params_get_type: TGType; cdecl; external libadwaita;
function adw_spring_params_new(damping_ratio: Tdouble; mass: Tdouble; stiffness: Tdouble): PAdwSpringParams; cdecl; external libadwaita;
function adw_spring_params_new_full(damping: Tdouble; mass: Tdouble; stiffness: Tdouble): PAdwSpringParams; cdecl; external libadwaita;
function adw_spring_params_ref(self: PAdwSpringParams): PAdwSpringParams; cdecl; external libadwaita;
procedure adw_spring_params_unref(self: PAdwSpringParams); cdecl; external libadwaita;
function adw_spring_params_get_damping(self: PAdwSpringParams): Tdouble; cdecl; external libadwaita;
function adw_spring_params_get_damping_ratio(self: PAdwSpringParams): Tdouble; cdecl; external libadwaita;
function adw_spring_params_get_mass(self: PAdwSpringParams): Tdouble; cdecl; external libadwaita;
function adw_spring_params_get_stiffness(self: PAdwSpringParams): Tdouble; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:23:34 ===


implementation


function ADW_TYPE_SPRING_PARAMS: TGType;
begin
  ADW_TYPE_SPRING_PARAMS := adw_spring_params_get_type;
end;


end.
