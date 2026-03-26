program project1;

uses
  SysUtils,
  crt,
  fp_box2d;


  procedure print(p: Tb2Vec2);
  var
    x, y: integer;
  begin
    Sleep(10);
    ClrScr;

    x := 60 + Trunc(p.x * 35);
    y := Trunc((5.0 - p.y) * 12);

    if (x > 1) and (x < 160) and (y > 1) and (y < 60) then begin
      GotoXY(x, y);
      Write('X');
    end;
  end;

  procedure main;
  var
    worldDef: Tb2WorldDef;
    worldId: Tb2WorldId;
    pivotDef, bodyDef: Tb2BodyDef;
    pivotId, bodyId: Tb2BodyId;
    shapeDef: Tb2ShapeDef;
    box: Tb2Polygon;
    worldAnchor, p: Tb2Vec2;
    jointDef: Tb2RevoluteJointDef;
    rot: Tb2Rot;
    angle: single;
  begin
    ClrScr;

    worldDef := b2DefaultWorldDef;
    worldDef.gravity.SetItems(0.0, -9.81);
    worldId := b2CreateWorld(@worldDef);

    // Pivot
    pivotDef := b2DefaultBodyDef;
    pivotDef.position.SetItems(0.0, 4.0);
    pivotId := b2CreateBody(worldId, @pivotDef);

    // Pendel
    bodyDef := b2DefaultBodyDef();
    bodyDef._type := b2_dynamicBody;
    bodyDef.angularDamping := 0.5; // Verhindert ewiges Hin- und Herschwingen
    bodyDef.linearDamping := 0.1;
    bodyDef.position.SetItems(1.5, 3.5);
    bodyId := b2CreateBody(worldId, @bodyDef);

    shapeDef := b2DefaultShapeDef;
    box := b2MakeBox(0.1, 1.0);
    b2CreatePolygonShape(bodyId, @shapeDef, @box);

    // Gelenk
    worldAnchor.SetItems(0.0, 4.0);

    jointDef := b2DefaultRevoluteJointDef();
    jointDef.base.bodyIdA := pivotId;
    jointDef.base.bodyIdB := bodyId;

    jointDef.base.localFrameA.p := b2Body_GetLocalPoint(pivotId, worldAnchor);
    jointDef.base.localFrameA.q.SetItems(1.0, 0.0);

    jointDef.base.localFrameB.p := b2Body_GetLocalPoint(bodyId, worldAnchor);
    jointDef.base.localFrameB.q.SetItems(1.0, 0.0);

    jointDef.enableLimit := False;
    jointDef.lowerAngle := -0.5 * PI;
    jointDef.upperAngle := 0.5 * PI;

    b2CreateRevoluteJoint(worldId, @jointDef);

    WriteLn('Simulation läuft...');
    repeat
      b2World_Step(worldId, 1.0 / 60.0, 4);
      p := b2Body_GetPosition(bodyId);
      rot := b2Body_GetRotation(bodyId);
      angle := b2Rot_GetAngle(rot);
      print(p);
    until KeyPressed;

    b2DestroyWorld(worldId);

    GotoXY(1, 1);

  end;

begin
  main;
end.
