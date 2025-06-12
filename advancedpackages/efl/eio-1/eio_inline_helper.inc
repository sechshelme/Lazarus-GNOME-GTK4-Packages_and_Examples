{$IFDEF read_interface}


function eio_file_atime(st: PEina_Stat): double;
function eio_file_mtime(st: PEina_Stat): double;
function eio_file_size(st: PEina_Stat): int64;
function eio_file_is_dir(st: PEina_Stat): TEina_Bool;
function eio_file_is_lnk(st: PEina_Stat): TEina_Bool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

const
  S_IFDIR = 16384;
  S_IFLNK = 40960;
  S_IFMT = 61440;


function S_ISDIR(mode: Tmode_t): boolean;
begin
  Result := ((mode and S_IFMT) = S_IFDIR);
end;

function S_ISLNK(mode: Tmode_t): boolean;
begin
  Result := ((mode and S_IFMT) = S_IFLNK);
end;

function eio_file_atime(st: PEina_Stat): double;
begin
  if st = nil then begin
    Result := 0.0;
  end else begin
    Result := double(st^.atime);
  end;
end;

function eio_file_mtime(st: PEina_Stat): double;
begin
  if st = nil then begin
    Result := 0.0;
  end else begin
    Result := double(st^.mtime);
  end;
end;

function eio_file_size(st: PEina_Stat): int64;
begin
  if st = nil then begin
    Result := 0;
  end else begin
    Result := st^.size;
  end;
end;

function eio_file_is_dir(st: PEina_Stat): TEina_Bool;
begin
  if st = nil then begin
    Result := False;
  end else begin
    Result := S_ISDIR(st^.mode);
  end;
end;

function eio_file_is_lnk(st: PEina_Stat): TEina_Bool;
begin
  {$IFDEF WINDOWS}
  Result := False;
  {$ELSE}
  if st = nil then begin
    Result := False;
  end else begin
    Result := S_ISLNK(st^.mode);
  end;
  {$ENDIF}
end;

{$ENDIF read_implementation}
