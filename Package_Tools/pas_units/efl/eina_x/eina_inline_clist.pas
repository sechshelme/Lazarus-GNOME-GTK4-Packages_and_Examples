unit eina_inline_clist;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

procedure eina_clist_add_after(elem, to_add: PEina_Clist);
procedure eina_clist_add_before(elem, to_add: PEina_Clist);
procedure eina_clist_add_head(list, elem: PEina_Clist);
procedure eina_clist_add_tail(list, elem: PEina_Clist);
procedure eina_clist_element_init(elem: PEina_Clist);
function eina_clist_element_is_linked(elem: PEina_Clist): boolean;
procedure eina_clist_remove(elem: PEina_Clist);
function eina_clist_next(list, elem: PEina_Clist): PEina_Clist;
function eina_clist_prev(list, elem: PEina_Clist): PEina_Clist;
function eina_clist_head(list: PEina_Clist): PEina_Clist;
function eina_clist_tail(list: PEina_Clist): PEina_Clist;
function eina_clist_empty(list: PEina_Clist): boolean;
procedure eina_clist_init(list: PEina_Clist);
function eina_clist_count(list: PEina_Clist): cardinal;
procedure eina_clist_move_tail(dst, src: PEina_Clist);
procedure eina_clist_move_head(dst, src: PEina_Clist);

implementation

procedure eina_clist_add_after(elem, to_add: PEina_Clist);
begin
  to_add^.next := elem^.next;
  to_add^.prev := elem;
  elem^.next^.prev := to_add;
  elem^.next := to_add;
end;

procedure eina_clist_add_before(elem, to_add: PEina_Clist);
begin
  to_add^.next := elem;
  to_add^.prev := elem^.prev;
  elem^.prev^.next := to_add;
  elem^.prev := to_add;
end;

procedure eina_clist_add_head(list, elem: PEina_Clist);
begin
  eina_clist_add_after(list, elem);
end;

procedure eina_clist_add_tail(list, elem: PEina_Clist);
begin
  eina_clist_add_before(list, elem);
end;

procedure eina_clist_element_init(elem: PEina_Clist);
begin
  elem^.next := nil;
  elem^.prev := nil;
end;

function eina_clist_element_is_linked(elem: PEina_Clist): boolean;
begin
  Result := (elem^.next <> nil) and (elem^.prev <> nil);
end;

procedure eina_clist_remove(elem: PEina_Clist);
begin
  elem^.next^.prev := elem^.prev;
  elem^.prev^.next := elem^.next;
  eina_clist_element_init(elem);
end;

function eina_clist_next(list, elem: PEina_Clist): PEina_Clist;
begin
  Result := elem^.next;
  if Result = list then begin
    Result := nil;
  end;
end;

function eina_clist_prev(list, elem: PEina_Clist): PEina_Clist;
begin
  Result := elem^.prev;
  if Result = list then begin
    Result := nil;
  end;
end;

function eina_clist_head(list: PEina_Clist): PEina_Clist;
begin
  Result := eina_clist_next(list, list);
end;

function eina_clist_tail(list: PEina_Clist): PEina_Clist;
begin
  Result := eina_clist_prev(list, list);
end;

function eina_clist_empty(list: PEina_Clist): boolean;
begin
  Result := list^.next = list;
end;

procedure eina_clist_init(list: PEina_Clist);
begin
  list^.next := list;
  list^.prev := list;
end;

function eina_clist_count(list: PEina_Clist): cardinal;
var
  ptr: PEina_Clist;
  count: cardinal;
begin
  count := 0;
  ptr := list^.next;
  while ptr <> list do begin
    Inc(count);
    ptr := ptr^.next;
  end;
  Result := count;
end;

procedure eina_clist_move_tail(dst, src: PEina_Clist);
begin
  if eina_clist_empty(src) then begin
    Exit;
  end;

  dst^.prev^.next := src^.next;
  src^.next^.prev := dst^.prev;
  dst^.prev := src^.prev;
  src^.prev^.next := dst;
  eina_clist_init(src);
end;

procedure eina_clist_move_head(dst, src: PEina_Clist);
begin
  if eina_clist_empty(src) then begin
    Exit;
  end;

  dst^.next^.prev := src^.prev;
  src^.prev^.next := dst^.next;
  dst^.next := src^.next;
  src^.next^.prev := dst;
  eina_clist_init(src);
end;

end.
