program project1;

uses
  stdio,
  newt;


  procedure main;
  var
    res: longint;
  begin
    newtInit;
    newtCls;

    res := newtWinChoice('Frage', 'Ja', 'Nein', 'Möchten Sie fortfahren?');

    newtFinished;

    case res of
      1: begin
        printf('Sie haben ''Ja'' gewählt.'#10);
      end;
      2: begin
        printf('Sie haben ''Nein'' gewählt.'#10);
      end;
    end;

  end;

begin
  main;
end.
