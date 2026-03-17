program project1;

uses
  crt,
  fp_box2d,
  EngineCalc;



  procedure main;
  var
    engine: TEngine;
    x, y: int64;
    position: Tb2Vec2;
    i: integer;
  begin
    engine := TEngine.Create;

    WriteLn('Simuliere Flugkurve und Bodenkontakt...');

    for  i := 0 to 6400 do begin
      position := engine.GetPos;


      x := Trunc(position.x * 7);
      y := 80 - Trunc((position.y * 4) + 30);

      if (x > 1) and (x < 160) and (y > 1) and (y < 60) then begin
                GotoXY(x, y);
                Write('x');
      end;

//      WriteLn(i: 4, '  ', x, ' x ', y);
//      WriteLn(i: 4, '  ', position.x: 4: 2, ' x ', position.y: 4: 2);
    end;

    engine.Free;
  end;

begin
  main;
  //WriteLn(b2MaxInt(1, 3));
  //WriteLn(b2MaxInt(3, 1));
  //WriteLn(b2MinInt(1, 3));
  //WriteLn(b2MinInt(3, 1));
end.
