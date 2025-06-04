unit eina_inline_log;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function eina_log_level_check(level: integer): TEina_Bool;
function eina_log_domain_level_check(domain, level: integer): TEina_Bool;
function eina_log_level_name_get(level: integer; name: pchar): pchar;
function eina_log_level_color_get(level: integer): pchar;
function eina_log_level_color_if_enabled_get(level: integer): pchar;

implementation

function eina_log_level_check(level: integer): TEina_Bool;
begin
  Result := eina_log_level_get >= level;
end;

function eina_log_domain_level_check(domain, level: integer): TEina_Bool;
var
  dom_level: integer;
begin
  dom_level := eina_log_domain_registered_level_get(domain);
  if dom_level <> EINA_LOG_LEVEL_UNKNOWN then begin
    Result := dom_level >= level;
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_log_level_name_get(level: integer; name: pchar): pchar;
begin
  if level < 0 then begin
    name[0] := '-';
    name[1] := Chr(Ord('0') + ((-level div 10) mod 10));
    name[2] := Chr(Ord('0') + ((-level) mod 10));
  end else if level >= EINA_LOG_LEVELS then begin
    name[0] := Chr(Ord('0') + ((level div 100) mod 10));
    name[1] := Chr(Ord('0') + ((level div 10) mod 10));
    name[2] := Chr(Ord('0') + (level mod 10));
  end else begin
    case level of
      0: begin
        name := 'CRI';
      end;
      1: begin
        name := 'ERR';
      end;
      2: begin
        name := 'WRN';
      end;
      3: begin
        name := 'INF';
      end;
      4: begin
        name := 'DBG';
      end;
      else begin
        name := '???';
      end;
    end;
  end;
  name[4] := #0;
  Result := name;
end;

function eina_log_level_color_get(level: integer): pchar;
begin
  if level <= 0 then begin
    Result := EINA_COLOR_LIGHTRED;
  end else if level = 1 then begin
    Result := EINA_COLOR_RED;
  end else if level = 2 then begin
    Result := EINA_COLOR_YELLOW;
  end else if level = 3 then begin
    Result := EINA_COLOR_GREEN;
  end else if level = 4 then begin
    Result := EINA_COLOR_LIGHTBLUE;
  end else begin
    Result := EINA_COLOR_BLUE;
  end;
end;

function eina_log_level_color_if_enabled_get(level: integer): pchar;
begin
  if eina_log_color_disable_get then begin
    Result := '';
  end else begin
    Result := eina_log_level_color_get(level);
  end;
end;

end.
