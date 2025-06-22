{$IFDEF read_interface}

function eina_strlen_bounded(str: PChar; maxlen: Tsize_t): Tsize_t;
function eina_str_join(dst: PChar; size: Tsize_t; sep: char; a, b: PChar): Tsize_t;
function eina_strdup(str: PChar): PChar;
function eina_strndup(str: PChar; n: Tsize_t): PChar;
function eina_streq(a, b: PChar): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_strlen_bounded(str: PChar; maxlen: Tsize_t): Tsize_t;
var
  itr: PChar;
  str_maxend: PChar;
begin
  str_maxend := str + maxlen;
  itr := str;
  while (itr^ <> #0) do begin
    if itr = str_maxend then  begin
      Exit(Tsize_t(-1));
    end;
    Inc(itr);
  end;
  Result := itr - str;
end;

function eina_str_join(dst: PChar; size: Tsize_t; sep: char; a, b: PChar): Tsize_t;
begin
  Result := eina_str_join_len(dst, size, sep, a, strlen(a), b, StrLen(b));
end;

function eina_strdup(str: PChar): PChar;
begin
  if str = nil then begin
    Result := nil;
  end else begin
    Result := strdup(str);
  end;
end;

function eina_strndup(str: PChar; n: Tsize_t): PChar;
var
  p: PChar;
  slen: Tsize_t;
begin
  if str = nil then begin
    Exit(nil);
  end;

  slen := 0;
  p := str;
  while p^ <> #0 do begin
    slen := Tsize_t(p - str) + 1;
    if slen > n then begin
      slen := n;
      Break;
    end;
    Inc(p);
  end;

  Result := PChar(malloc(slen + 1));
  if Result = nil then begin
    Exit(nil);
  end;

  if slen > 0 then begin
    memcpy(Result, str, slen);
  end;

  Result[slen] := #0;

  Result := Result;
end;

function eina_streq(a, b: PChar): TEina_Bool;
begin
  if a = b then begin
    Exit(EINA_TRUE);
  end;
  if (a = nil) or (b = nil) then begin
    Exit(EINA_FALSE);
  end;
  Result := strcmp(a, b) = 0;
end;

{$ENDIF read_implementation}
