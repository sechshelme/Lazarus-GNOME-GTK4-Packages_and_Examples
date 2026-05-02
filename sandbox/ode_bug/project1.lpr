program project1;

type
  TdBodyID = Pointer;

  function CreateBalls: TdBodyID;
  begin
    Result := nil;
  end;

const
  COUNT = 3;

var
  ball: array of TdBodyID = nil;
begin
  ball := CreateBalls;  // Wieso geht dies
end.
