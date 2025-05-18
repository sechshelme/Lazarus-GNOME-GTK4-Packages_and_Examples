unit eina_bezier;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Bezier = record
    start: record
      x: double;
      y: double;
      end;
    ctrl_start: record
      x: double;
      y: double;
      end;
    ctrl_end: record
      x: double;
      y: double;
      end;
    end_: record
      x: double;
      y: double;
      end;
  end;
  PEina_Bezier = ^TEina_Bezier;


procedure eina_bezier_values_set(b: PEina_Bezier; start_x: double; start_y: double; ctrl_start_x: double; ctrl_start_y: double;
  ctrl_end_x: double; ctrl_end_y: double; end_x: double; end_y: double); cdecl; external libeina;
procedure eina_bezier_values_get(b: PEina_Bezier; start_x: Pdouble; start_y: Pdouble; ctrl_start_x: Pdouble; ctrl_start_y: Pdouble;
  ctrl_end_x: Pdouble; ctrl_end_y: Pdouble; end_x: Pdouble; end_y: Pdouble); cdecl; external libeina;
function eina_bezier_length_get(b: PEina_Bezier): double; cdecl; external libeina;
function eina_bezier_t_at(b: PEina_Bezier; len: double): double; cdecl; external libeina;
procedure eina_bezier_point_at(b: PEina_Bezier; t: double; px: Pdouble; py: Pdouble); cdecl; external libeina;
function eina_bezier_angle_at(b: PEina_Bezier; t: double): double; cdecl; external libeina;
procedure eina_bezier_split_at_length(b: PEina_Bezier; len: double; left: PEina_Bezier; right: PEina_Bezier); cdecl; external libeina;
procedure eina_bezier_bounds_get(b: PEina_Bezier; x: Pdouble; y: Pdouble; w: Pdouble; h: Pdouble); cdecl; external libeina;
procedure eina_bezier_on_interval(b: PEina_Bezier; t0: double; t1: double; result: PEina_Bezier); cdecl; external libeina;

// === Konventiert am: 17-5-25 13:52:07 ===


implementation



end.
