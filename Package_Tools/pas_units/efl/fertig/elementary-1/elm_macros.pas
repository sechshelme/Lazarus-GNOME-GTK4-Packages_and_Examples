unit elm_macros;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELM_PI = 3.14159265358979323846;

function ELM_RECTS_INTERSECT(x, y, w, h, xx, yy, ww, hh: integer): boolean;
function ELM_SCALE_SIZE(x: integer): integer;
function ELM_RECTS_POINT_OUT(x, y, w, h, xx, yy: integer): boolean;
function ELM_RECTS_INCLUDE(x, y, w, h, xx, yy, ww, hh: integer): boolean;
function ELM_RECTS_X_AXIS_OUT(x, y, w, h, xx, yy, ww, hh: integer): boolean;
function ELM_RECTS_Y_AXIS_OUT(x, y, w, h, xx, yy, ww, hh: integer): boolean;

// === Konventiert am: 1-6-25 13:41:40 ===


implementation


function ELM_RECTS_INTERSECT(x, y, w, h, xx, yy, ww, hh: integer): boolean;
begin
  Result := (x < (xx + ww)) and (y < (yy + hh)) and ((x + w) > xx) and ((y + h) > yy);
end;

function ELM_SCALE_SIZE(x: integer): integer;
begin
  Result := Round((x * elm_config_scale_get) / elm_app_base_scale_get);
end;

function ELM_RECTS_POINT_OUT(x, y, w, h, xx, yy: integer): boolean;
begin
  Result := (xx < x) or (yy < y) or (xx > (x + w)) or (yy > (y + h));
end;

function ELM_RECTS_INCLUDE(x, y, w, h, xx, yy, ww, hh: integer): boolean;
begin
  Result := (x <= xx) and ((x + w) >= (xx + ww)) and (y <= yy) and ((y + h) >= (yy + hh));
end;

function ELM_RECTS_X_AXIS_OUT(x, y, w, h, xx, yy, ww, hh: integer): boolean;
begin
  Result := (x < xx) or ((x + w) > (xx + ww)) or ((y + h) > (yy + hh));
end;

function ELM_RECTS_Y_AXIS_OUT(x, y, w, h, xx, yy, ww, hh: integer): boolean;
begin
  Result := (y < yy) or ((x + w) > (xx + ww)) or ((y + h) > (yy + hh));
end;

end.
