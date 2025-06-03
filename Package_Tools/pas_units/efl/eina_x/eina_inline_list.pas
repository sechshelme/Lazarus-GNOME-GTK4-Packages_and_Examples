unit eina_inline_list;

interface

uses
  fp_eina;


//type
//  PEina_List = ^Eina_List;
//  PEina_List_Accounting = ^Eina_List_Accounting;
//
//  Eina_List_Accounting = record
//    count: Cardinal;
//    last: PEina_List;
//  end;
//
//  Eina_List = record
//    next: PEina_List;
//    prev: PEina_List;
//    data: Pointer;
//    accounting: PEina_List_Accounting;
//  end;

function eina_list_last(const list: PEina_List): PEina_List;
function eina_list_next(const list: PEina_List): PEina_List;
function eina_list_prev(const list: PEina_List): PEina_List;
function eina_list_data_get(const list: PEina_List): Pointer;
function eina_list_data_set(list: PEina_List; const data: Pointer): Pointer;
function eina_list_count(const list: PEina_List): Cardinal;
function eina_list_last_data_get(const list: PEina_List): Pointer;

implementation

function eina_list_last(const list: PEina_List): PEina_List;
begin
  if (list <> nil) then
    Result := list^.accounting^.last
  else
    Result := nil;
end;

function eina_list_next(const list: PEina_List): PEina_List;
begin
  if (list <> nil) then
    Result := list^.next
  else
    Result := nil;
end;

function eina_list_prev(const list: PEina_List): PEina_List;
begin
  if (list <> nil) then
    Result := list^.prev
  else
    Result := nil;
end;

function eina_list_data_get(const list: PEina_List): Pointer;
begin
  if (list <> nil) then
    Result := list^.data
  else
    Result := nil;
end;

function eina_list_data_set(list: PEina_List; const data: Pointer): Pointer;
var
  tmp: Pointer;
begin
  if (list <> nil) then
  begin
    tmp := list^.data;
    list^.data := data;
    Result := tmp;
  end
  else
    Result := nil;
end;

function eina_list_count(const list: PEina_List): Cardinal;
begin
  if (list <> nil) then
    Result := list^.accounting^.count
  else
    Result := 0;
end;

function eina_list_last_data_get(const list: PEina_List): Pointer;
begin
  if (list <> nil) then
    Result := eina_list_data_get(eina_list_last(list))
  else
    Result := nil;
end;

end.

