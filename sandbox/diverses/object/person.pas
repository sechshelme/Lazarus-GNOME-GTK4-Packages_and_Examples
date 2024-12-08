unit Person;

interface

{$modeswitch advancedrecords on}

type
  TPerson = record
    private
    Age: integer;
  end;
  PPerson = ^TPerson;

function Person_new(age: integer): PPerson;
function Person_get_age(per: PPerson): Integer;
procedure Person_dispose(per: PPerson);

implementation

function Person_new(age: integer): PPerson;
begin
  Getmem(Result, SizeOf(PPerson^));
  Result^.Age := age;
end;

function Person_get_age(per: PPerson): Integer;
begin
  Result := per^.Age;
end;

procedure Person_dispose(per: PPerson);
begin
  Freemem(per);
end;

end.
