unit adap_breakpoint;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta, adap_length_unit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAdapBreakpointConditionLengthType = ^TAdapBreakpointConditionLengthType;
  TAdapBreakpointConditionLengthType = longint;

const
  ADAP_BREAKPOINT_CONDITION_MIN_WIDTH = 0;
  ADAP_BREAKPOINT_CONDITION_MAX_WIDTH = 1;
  ADAP_BREAKPOINT_CONDITION_MIN_HEIGHT = 2;
  ADAP_BREAKPOINT_CONDITION_MAX_HEIGHT = 3;

type
  PAdapBreakpointConditionRatioType = ^TAdapBreakpointConditionRatioType;
  TAdapBreakpointConditionRatioType = longint;

const
  ADAP_BREAKPOINT_CONDITION_MIN_ASPECT_RATIO = 0;
  ADAP_BREAKPOINT_CONDITION_MAX_ASPECT_RATIO = 1;

type
  PAdapBreakpointCondition = type Pointer;

  TAdapBreakpoint = record
  end;
  PAdapBreakpoint = ^TAdapBreakpoint;

  TAdapBreakpointClass = record
    parent_class: TGObjectClass;
  end;
  PAdapBreakpointClass = ^TAdapBreakpointClass;

function adap_breakpoint_get_type: TGType; cdecl; external libadapta;
function adap_breakpoint_condition_get_type: TGType; cdecl; external libadapta;
function adap_breakpoint_condition_new_length(_type: TAdapBreakpointConditionLengthType; value: double; unit_: TAdapLengthUnit): PAdapBreakpointCondition; cdecl; external libadapta;
function adap_breakpoint_condition_new_ratio(_type: TAdapBreakpointConditionRatioType; width: longint; height: longint): PAdapBreakpointCondition; cdecl; external libadapta;
function adap_breakpoint_condition_new_and(condition_1: PAdapBreakpointCondition; condition_2: PAdapBreakpointCondition): PAdapBreakpointCondition; cdecl; external libadapta;
function adap_breakpoint_condition_new_or(condition_1: PAdapBreakpointCondition; condition_2: PAdapBreakpointCondition): PAdapBreakpointCondition; cdecl; external libadapta;
function adap_breakpoint_condition_copy(self: PAdapBreakpointCondition): PAdapBreakpointCondition; cdecl; external libadapta;
procedure adap_breakpoint_condition_free(self: PAdapBreakpointCondition); cdecl; external libadapta;
function adap_breakpoint_condition_parse(str: pchar): PAdapBreakpointCondition; cdecl; external libadapta;
function adap_breakpoint_condition_to_string(self: PAdapBreakpointCondition): pchar; cdecl; external libadapta;

function adap_breakpoint_new(condition: PAdapBreakpointCondition): PAdapBreakpoint; cdecl; external libadapta;
function adap_breakpoint_get_condition(self: PAdapBreakpoint): PAdapBreakpointCondition; cdecl; external libadapta;
procedure adap_breakpoint_set_condition(self: PAdapBreakpoint; condition: PAdapBreakpointCondition); cdecl; external libadapta;
procedure adap_breakpoint_add_setter(self: PAdapBreakpoint; obj: PGObject; _property: pchar; value: PGValue); cdecl; external libadapta;
procedure adap_breakpoint_add_setters(self: PAdapBreakpoint; first_object: PGObject; first_property: pchar; args: array of const); cdecl; external libadapta;
procedure adap_breakpoint_add_setters(self: PAdapBreakpoint; first_object: PGObject; first_property: pchar); cdecl; external libadapta;
procedure adap_breakpoint_add_settersv(self: PAdapBreakpoint; n_setters: longint; objects: PPGObject; names: PPchar; values: PPGValue); cdecl; external libadapta;
procedure adap_breakpoint_add_setters_valist(self: PAdapBreakpoint; first_object: PGObject; first_property: pchar; args: Tva_list); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:01:14 ===

function ADAP_TYPE_BREAKPOINT: TGType;
function ADAP_BREAKPOINT(obj: Pointer): PAdapBreakpoint;
function ADAP_IS_BREAKPOINT(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_BREAKPOINT: TGType;
begin
  Result := adap_breakpoint_get_type;
end;

function ADAP_BREAKPOINT(obj: Pointer): PAdapBreakpoint;
begin
  Result := PAdapBreakpoint(g_type_check_instance_cast(obj, ADAP_TYPE_BREAKPOINT));
end;

function ADAP_IS_BREAKPOINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_BREAKPOINT);
end;


end.
