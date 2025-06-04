unit eina_inline_mempool;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Mempool_Backend = record
    name: pchar;
    init: function(context: pchar; options: pchar; args: Tva_list): pointer; cdecl;
    free: procedure(data: pointer; element: pointer); cdecl;
    alloc: function(data: pointer; size: dword): pointer; cdecl;
    realloc: function(data: pointer; element: pointer; size: dword): pointer; cdecl;
    garbage_collect: procedure(data: pointer); cdecl;
    statistics: procedure(data: pointer); cdecl;
    shutdown: procedure(data: pointer); cdecl;
    repack: procedure(data: pointer; cb: TEina_Mempool_Repack_Cb; cb_data: pointer); cdecl;
    from: function(data: pointer; element: pointer): TEina_Bool; cdecl;
    iterator: function(data: pointer): PEina_Iterator; cdecl;
    alloc_near: function(data: pointer; after: pointer; before: pointer; size: dword): pointer; cdecl;
  end;
  PEina_Mempool_Backend = ^TEina_Mempool_Backend;

  TEina_Mempool_Backend_ABI1 = record
    name: pchar;
    init: function(context: pchar; options: pchar; args: Tva_list): pointer; cdecl;
    free: procedure(data: pointer; element: pointer); cdecl;
    alloc: function(data: pointer; size: dword): pointer; cdecl;
    realloc: function(data: pointer; element: pointer; size: dword): pointer; cdecl;
    garbage_collect: procedure(data: pointer); cdecl;
    statistics: procedure(data: pointer); cdecl;
    shutdown: procedure(data: pointer); cdecl;
  end;
  PEina_Mempool_Backend_ABI1 = ^TEina_Mempool_Backend_ABI1;

  TEina_Mempool_Backend_ABI2 = record
    repack: procedure(data: pointer; cb: TEina_Mempool_Repack_Cb; cb_data: pointer); cdecl;
    from: function(data: pointer; element: pointer): TEina_Bool; cdecl;
    iterator: function(data: pointer): PEina_Iterator; cdecl;
    alloc_near: function(data: pointer; after: pointer; before: pointer; size: dword): pointer; cdecl;
  end;
  PEina_Mempool_Backend_ABI2 = ^TEina_Mempool_Backend_ABI2;

  TEina_Mempool = record
    backend: TEina_Mempool_Backend_ABI1;
    backend_data: pointer;
    backend2: PEina_Mempool_Backend_ABI2;
  end;
  PEina_Mempool = ^TEina_Mempool;


function eina_mempool_realloc(mp: PEina_Mempool; element: Pointer; size: cardinal): Pointer;
function eina_mempool_malloc(mp: PEina_Mempool; size: cardinal): Pointer;
function eina_mempool_malloc_near(mp: PEina_Mempool; after, before: Pointer; size: cardinal): Pointer;
function eina_mempool_calloc(mp: PEina_Mempool; size: cardinal): Pointer;
procedure eina_mempool_free(mp: PEina_Mempool; element: Pointer);
function eina_mempool_from(mp: PEina_Mempool; element: Pointer): boolean;
function eina_mempool_iterator_new(mp: PEina_Mempool): Pointer;
function eina_mempool_alignof(size: cardinal): cardinal;

implementation

function eina_mempool_realloc(mp: PEina_Mempool; element: Pointer; size: cardinal): Pointer;
begin
  Result := mp^.backend.realloc(mp^.backend_data, element, size);
end;

function eina_mempool_malloc(mp: PEina_Mempool; size: cardinal): Pointer;
begin
  Result := mp^.backend.alloc(mp^.backend_data, size);
end;

function eina_mempool_malloc_near(mp: PEina_Mempool; after, before: Pointer; size: cardinal): Pointer;
begin
  if (mp^.backend2 <> nil) and Assigned(mp^.backend2^.alloc_near) and
    ((after <> nil) or (before <> nil)) then begin
    Result := mp^.backend2^.alloc_near(mp^.backend_data, after, before, size);
  end else begin
    Result := mp^.backend.alloc(mp^.backend_data, size);
  end;
end;

function eina_mempool_calloc(mp: PEina_Mempool; size: cardinal): Pointer;
begin
  Result := mp^.backend.alloc(mp^.backend_data, size);
  if Result <> nil then begin
    memset(Result, 0, size);
  end;
end;

procedure eina_mempool_free(mp: PEina_Mempool; element: Pointer);
begin
  if element <> nil then begin
    mp^.backend.free(mp^.backend_data, element);
  end;
end;

function eina_mempool_from(mp: PEina_Mempool; element: Pointer): boolean;
begin
  if element = nil then begin
    Result := False;
  end else begin
    Result := mp^.backend2^.from(mp^.backend_data, element);
  end;
end;

function eina_mempool_iterator_new(mp: PEina_Mempool): Pointer;
begin
  if not Assigned(mp^.backend2^.iterator) then begin
    Result := nil;
  end else begin
    Result := mp^.backend2^.iterator(mp^.backend_data);
  end;
end;

function eina_mempool_alignof(size: cardinal): cardinal;
var
  align: cardinal;
begin
  {$IFDEF CPU32}
  if size >= 8 then begin
    align := 8;
  end else{$ELSE}
  if size >= 16 then begin
    align := 16;
  end else if size >= 8 then begin
    align := 8;
  end else{$ENDIF}
  if size >= 4 then begin
    align := 4;
  end else begin
    align := 2;
  end;

  Result := ((size div align) + Ord(size mod align <> 0)) * align;
end;

end.
