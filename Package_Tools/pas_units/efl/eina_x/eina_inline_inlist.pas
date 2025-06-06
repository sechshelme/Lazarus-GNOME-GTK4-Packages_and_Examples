unit eina_inline_inlist;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function eina_inlist_first(list: PEina_Inlist): PEina_Inlist;
function eina_inlist_last(list: PEina_Inlist): PEina_Inlist;

implementation

function eina_inlist_first(list: PEina_Inlist): PEina_Inlist;
var
  l: PEina_Inlist;
begin
  if list <> nil then begin
    l := list;
    while l^.prev <> nil do begin
      l := l^.prev;
    end;
    Result := l;
  end else begin
    Result := nil;
  end;
end;

function eina_inlist_last(list: PEina_Inlist): PEina_Inlist;
var
  l: PEina_Inlist;
begin
  if list <> nil then begin
    l := list;
    while l^.next <> nil do begin
      l := l^.next;
    end;
    Result := l;
  end else begin
    Result := nil;
  end;
end;

end.
