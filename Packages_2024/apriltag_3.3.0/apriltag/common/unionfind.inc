{$IFDEF read_interface}


type
  Pufrec = ^Tufrec;
  Tufrec = record
    parent: Tuint32_t;
    size: Tuint32_t;
  end;

  Punionfind_t = ^Tunionfind_t;
  Tunionfind_t = record
    maxid: Tuint32_t;
    data: Pufrec;
  end;

function unionfind_create(maxid: Tuint32_t): Punionfind_t;
procedure unionfind_destroy(uf: Punionfind_t);
function unionfind_get_representative(uf: Punionfind_t; id: Tuint32_t): Tuint32_t;
function unionfind_get_set_size(uf: Punionfind_t; id: Tuint32_t): Tuint32_t;
function unionfind_connect(uf: Punionfind_t; aid, bid: Tuint32_t): Tuint32_t;

// === Konventiert am: 12-9-26 17:28:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function unionfind_create(maxid: Tuint32_t): Punionfind_t;
var
  uf: Punionfind_t;
  i: Tuint32_t;
begin
  uf := Punionfind_t(calloc(1, SizeOf(Tunionfind_t)));
  uf^.maxid := maxid;
  uf^.data := Pufrec(malloc((maxid + 1) * SizeOf(Tufrec)));
  for i := 0 to maxid - 1 do begin
    uf^.data[i].size := 1;
    uf^.data[i].parent := i;
  end;
  Result := uf;
end;

procedure unionfind_destroy(uf: Punionfind_t);
begin
  free(uf^.data);
  free(uf);
end;

function unionfind_get_representative(uf: Punionfind_t; id: Tuint32_t): Tuint32_t;
var
  root: Tuint32_t;
  tmp: Tuint32_t;
begin
  root := id;

  while uf^.data[root].parent <> root do begin
    root := uf^.data[root].parent;
  end;

  while uf^.data[id].parent <> root do begin
    tmp := uf^.data[id].parent;
    uf^.data[id].parent := root;
    id := tmp;
  end;

  Result := root;
end;

function unionfind_get_set_size(uf: Punionfind_t; id: Tuint32_t): Tuint32_t;
var
  repid: Tuint32_t;
begin
  repid := unionfind_get_representative(uf, id);
  Result := uf^.data[repid].size;
end;

function unionfind_connect(uf: Punionfind_t; aid, bid: Tuint32_t): Tuint32_t;
var
  aroot, broot: Tuint32_t;
  asize, bsize: Tuint32_t;
begin
  aroot := unionfind_get_representative(uf, aid);
  broot := unionfind_get_representative(uf, bid);

  if aroot = broot then  begin
    Exit(aroot);
  end;

  asize := uf^.data[aroot].size;
  bsize := uf^.data[broot].size;

  if asize > bsize then  begin
    uf^.data[broot].parent := aroot;
    uf^.data[aroot].size := uf^.data[aroot].size + bsize;
    Result := aroot;
  end else begin
    uf^.data[aroot].parent := broot;
    uf^.data[broot].size := uf^.data[broot].size + asize;
    Result := broot;
  end;
end;


{$ENDIF read_implementation}
