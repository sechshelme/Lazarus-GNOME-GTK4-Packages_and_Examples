{$IFDEF read_interface}

type
  PAdwBreakpointConditionLengthType = ^TAdwBreakpointConditionLengthType;
  TAdwBreakpointConditionLengthType = longint;

const
  ADW_BREAKPOINT_CONDITION_MIN_WIDTH = 0;
  ADW_BREAKPOINT_CONDITION_MAX_WIDTH = 1;
  ADW_BREAKPOINT_CONDITION_MIN_HEIGHT = 2;
  ADW_BREAKPOINT_CONDITION_MAX_HEIGHT = 3;

type
  PAdwBreakpointConditionRatioType = ^TAdwBreakpointConditionRatioType;
  TAdwBreakpointConditionRatioType = longint;

const
  ADW_BREAKPOINT_CONDITION_MIN_ASPECT_RATIO = 0;
  ADW_BREAKPOINT_CONDITION_MAX_ASPECT_RATIO = 1;

type
  TAdwBreakpointCondition = record
  end;
  PAdwBreakpointCondition = ^TAdwBreakpointCondition;

function adw_breakpoint_condition_get_type: TGType; cdecl; external libadwaita;
function adw_breakpoint_condition_new_length(_type: TAdwBreakpointConditionLengthType; Value: double; unit_: TAdwLengthUnit): PAdwBreakpointCondition; cdecl; external libadwaita;
function adw_breakpoint_condition_new_ratio(_type: TAdwBreakpointConditionRatioType; Width: longint; Height: longint): PAdwBreakpointCondition; cdecl; external libadwaita;
function adw_breakpoint_condition_new_and(condition_1: PAdwBreakpointCondition; condition_2: PAdwBreakpointCondition): PAdwBreakpointCondition; cdecl; external libadwaita;
function adw_breakpoint_condition_new_or(condition_1: PAdwBreakpointCondition; condition_2: PAdwBreakpointCondition): PAdwBreakpointCondition; cdecl; external libadwaita;
function adw_breakpoint_condition_copy(self: PAdwBreakpointCondition): PAdwBreakpointCondition; cdecl; external libadwaita;
procedure adw_breakpoint_condition_free(self: PAdwBreakpointCondition); cdecl; external libadwaita;
function adw_breakpoint_condition_parse(str: pchar): PAdwBreakpointCondition; cdecl; external libadwaita;
function adw_breakpoint_condition_to_string(self: PAdwBreakpointCondition): pchar; cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwBreakpoint, adw_breakpoint, ADW, BREAKPOINT, GObject) }
type
  TAdwBreakpoint = record
  end;
  PAdwBreakpoint = ^TAdwBreakpoint;

  TAdwBreakpointClass = record
    parent_class: TGObjectClass;
  end;
  PAdwBreakpointClass = ^TAdwBreakpointClass;

function adw_breakpoint_get_type: TGType; cdecl; external libadwaita;
function adw_breakpoint_new(condition: PAdwBreakpointCondition): PAdwBreakpoint; cdecl; external libadwaita;
function adw_breakpoint_get_condition(self: PAdwBreakpoint): PAdwBreakpointCondition; cdecl; external libadwaita;
procedure adw_breakpoint_set_condition(self: PAdwBreakpoint; condition: PAdwBreakpointCondition); cdecl; external libadwaita;
procedure adw_breakpoint_add_setter(self: PAdwBreakpoint; obj: PGObject; _property: pchar; Value: PGValue); cdecl; external libadwaita;
procedure adw_breakpoint_add_setters(self: PAdwBreakpoint; first_object: PGObject; first_property: pchar; args: array of const); cdecl; external libadwaita;
procedure adw_breakpoint_add_setters(self: PAdwBreakpoint; first_object: PGObject; first_property: pchar); cdecl; external libadwaita;
procedure adw_breakpoint_add_settersv(self: PAdwBreakpoint; n_setters: longint; objects: PPGObject; names: PPchar; values: PPGValue); cdecl; external libadwaita;
procedure adw_breakpoint_add_setters_valist(self: PAdwBreakpoint; first_object: PGObject; first_property: pchar; args: Tva_list); cdecl; external libadwaita;

// === Konventiert am: 7-1-25 19:50:51 ===

function ADW_TYPE_BREAKPOINT: TGType;
function ADW_BREAKPOINT(obj: Pointer): PAdwBreakpoint;
function ADW_IS_BREAKPOINT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_BREAKPOINT: TGType;
begin
  Result := adw_breakpoint_get_type;
end;

function ADW_BREAKPOINT(obj: Pointer): PAdwBreakpoint;
begin
  Result := PAdwBreakpoint(g_type_check_instance_cast(obj, ADW_TYPE_BREAKPOINT));
end;

function ADW_IS_BREAKPOINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_BREAKPOINT);
end;


{$ENDIF read_implementation}
