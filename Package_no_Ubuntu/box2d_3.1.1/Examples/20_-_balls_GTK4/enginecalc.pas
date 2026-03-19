unit EngineCalc;

interface

uses
  fp_box2d;

type
  TBoxCoord = array of Tb2Vec2;
  TBoxCoords = array of TBoxCoord;

  TBallCoord = record
    p: Tb2Vec2;
    r: single;
  end;
  TBallCoords = array of TBallCoord;

  TSceneCoords = record
    staticBox, dynamicBox: TBoxCoords;
    staticBall, dynamicBall: TBallCoords;
  end;

  Tb2BodyIds=array of Tb2BodyId;
  TSceneBodyIds=array of Tb2BodyIds;

type

  { TEngine }

  TEngine = class(TObject)
  private
    worldId: Tb2WorldId;
    staticBoxIds, dynamicBoxIds, dynamicBallIds, staticBallIds, dynamicDumbbellIds: Tb2BodyIds;
    function GetSceneBodyIds: TSceneBodyIds;
    function GetSceneCords: TSceneCoords;   // muss weg
  public
    property SceneCoords: TSceneCoords read GetSceneCords;   // muss weg
    property SceneBodyIds: TSceneBodyIds read GetSceneBodyIds;
    constructor Create;
    destructor Destroy; override;
    procedure BallRest(ball: integer);
  end;

implementation

type
  TBoxData = record
    size, ofs: Tb2Vec2;
    angele: single;
  end;

const
  StaticBoxDatas: array of TBoxData = (
    (size: (x: 50.0; y: 2.5); ofs: (x: 0.0; y: 0.0); angele: 0.0),
    (size: (x: 50.0; y: 2.5); ofs: (x: 75.0; y: -10.0); angele: 0.3),
    (size: (x: 50.0; y: 2.5); ofs: (x: 20.0; y: -40.0); angele: -0.3),
    (size: (x: 50.0; y: 2.5); ofs: (x: 90.0; y: -80.0); angele: 0.3),
    (size: (x: 50.0; y: 2.5); ofs: (x: 0.0; y: -120.0); angele: 0.0),
    (size: (x: 50.0; y: 2.5); ofs: (x: -65.0; y: -100.0); angele: pi / 2),
    (size: (x: 50.0; y: 2.5); ofs: (x: 100.0; y: -150.0); angele: -0.2)
    );

  DynamicBoxDatas: array of TBoxData = (
    (size: (x: 20.0; y: 2.5); ofs: (x: 180.0; y: -10.0); angele: 0.0),
    (size: (x: 20.0; y: 2.5); ofs: (x: 220.0; y: -30.0); angele: 0.3)
    );

  StaticBallData: TBallCoords = (
    (p: (x: 90.0; y: -40.0); r: 15),
    (p: (x: 185.0; y: -80.0); r: 20),
    (p: (x: 180.0; y: -170.0); r: 20)
    );

constructor TEngine.Create;
var
  r: Tb2Rot;
  i: integer;
  worldDef: Tb2WorldDef;
  bodyDef: Tb2BodyDef;
  shapeDef: Tb2ShapeDef;
  circle: Tb2Circle;
  polygon: Tb2Polygon;
  shapeId: Tb2ShapeId;

begin
  worldDef := b2DefaultWorldDef;
  worldDef.gravity.SetItems(0.0, -10.0);
  worldId := b2CreateWorld(@worldDef);

  // ===== Static polygon
  bodyDef := b2DefaultBodyDef;
  shapeDef := b2DefaultShapeDef;

  SetLength(staticBoxIds, Length(StaticBoxDatas));
  for i := 0 to Length(StaticBoxDatas) - 1 do begin
    with StaticBoxDatas[i] do begin
      staticBoxIds[i] := b2CreateBody(worldId, @bodyDef);
      r.c := Cos(angele);
      r.s := Sin(angele);
      polygon := b2MakeOffsetBox(size.x, size.y, ofs, r);
      b2CreatePolygonShape(staticBoxIds[i], @shapeDef, @polygon);
    end;
  end;

  // ===== Dynamic polygon
  shapeDef := b2DefaultShapeDef;

  SetLength(dynamicBoxIds, Length(DynamicBoxDatas));
  for i := 0 to Length(DynamicBoxDatas) - 1 do begin
    with DynamicBoxDatas[i] do begin
      bodyDef := b2DefaultBodyDef;
      bodyDef._type := b2_kinematicBody;
      bodyDef.position := ofs;
      bodyDef.angularVelocity := 0.5 * (i + 1);

      dynamicBoxIds[i] := b2CreateBody(worldId, @bodyDef);
      r.c := Cos(angele);
      r.s := Sin(angele);
      polygon := b2MakeOffsetBox(size.x, size.y, b2Vec2_zero, r);
      b2CreatePolygonShape(dynamicBoxIds[i], @shapeDef, @polygon);
    end;
  end;

  // ===== Static Ball
  shapeDef := b2DefaultShapeDef;

  SetLength(staticBallIds, Length(StaticBallData));
  for i := 0 to Length(staticBallIds) - 1 do begin;
    with StaticBallData[i] do begin
      bodyDef := b2DefaultBodyDef;
      bodyDef.position := p;

      staticBallIds[i] := b2CreateBody(worldId, @bodyDef);
      circle.SetItems(0.0, 0.0, r);
      b2CreateCircleShape(staticBallIds[i], @shapeDef, @circle);
    end;
  end;

  // ===== Dynamic Ball
  shapeDef := b2DefaultShapeDef;
  shapeDef.density := 1.0;
  shapeDef.material.friction := 0.05;
  shapeDef.material.restitution := 0.2;

  SetLength(dynamicBallIds, 1000);
  for i := 0 to Length(dynamicBallIds) - 1 do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_dynamicBody;
    bodyDef.position.SetItems(50.0, 50.0 + i * 10);
    bodyDef.linearVelocity.SetItems(5.0, 0.0);

    dynamicBallIds[i] := b2CreateBody(worldId, @bodyDef);
    circle.SetItems(0.0, 0.0, Random * 4);
    shapeId := b2CreateCircleShape(dynamicBallIds[i], @shapeDef, @circle);
    b2Shape_SetRestitution(shapeId, 0.7);
  end;

  // ===== Kinematische Hanteln
  shapeDef := b2DefaultShapeDef;

  SetLength(dynamicDumbbellIds, 3);
  for i := 0 to Length(dynamicDumbbellIds) - 1 do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_kinematicBody;
    bodyDef.position.SetItems(60.0 + (i * 40.0), -50.0);
    bodyDef.angularVelocity := 0.8 * (i + 1);

    dynamicDumbbellIds[i] := b2CreateBody(worldId, @bodyDef);

    circle.SetItems(-7.0, 0.0, 4.5);
    b2CreateCircleShape(dynamicDumbbellIds[i], @shapeDef, @circle);

    circle.SetItems(7.0, 0.0, 2.5);
    b2CreateCircleShape(dynamicDumbbellIds[i], @shapeDef, @circle);

    polygon := b2MakeOffsetBox(7.0, 0.5, b2Vec2_zero, b2Rot_identity);
    b2CreatePolygonShape(dynamicDumbbellIds[i], @shapeDef, @polygon);

//    circle.SetItems(7.0, 0.0, 1.5);
//    b2CreateCircleShape(dynamicDumbbellIds[i], @shapeDef, @circle);
  end;
end;

destructor TEngine.Destroy;
begin
  b2DestroyWorld(worldId);
  inherited Destroy;
end;

function TEngine.GetSceneCords: TSceneCoords;
var
  i, j: integer;
  transform: Tb2Transform;
  shapesId: Tb2ShapeId;
  circle: Tb2Circle;
  polygon: Tb2Polygon;
  cnt: longint;
  shapes: array[0..3] of Tb2ShapeId;
  hp1, hp2, p: Tb2Vec2;
begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  // ===== Static Box
  Result.staticBox := nil;
  SetLength(Result.staticBox, Length(staticBoxIds));
  for i := 0 to Length(staticBoxIds) - 1 do begin
    b2Body_GetShapes(staticBoxIds[i], @shapesId, 1);
    polygon := b2Shape_GetPolygon(shapesId);
    cnt := polygon.count;
    SetLength(Result.staticBox[i], cnt);
    for j := 0 to cnt - 1 do begin
      Result.staticBox[i, j] := polygon.vertices[j];
    end;
  end;

  // ===== Dynamic Box
  Result.dynamicBox := nil;
  SetLength(Result.dynamicBox, Length(dynamicBoxIds));
  for i := 0 to Length(dynamicBoxIds) - 1 do begin
    transform := b2Body_GetTransform(dynamicBoxIds[i]);
    b2Body_GetShapes(dynamicBoxIds[i], @shapesId, 1);
    polygon := b2Shape_GetPolygon(shapesId);
    cnt := polygon.count;
    SetLength(Result.dynamicBox[i], cnt);
    for j := 0 to cnt - 1 do begin
      Result.dynamicBox[i, j] := b2TransformPoint(transform, polygon.vertices[j]);
    end;
  end;

  // ===== Static Ball
  Result.staticBall := nil;
  SetLength(Result.staticBall, Length(staticBallIds));
  for i := 0 to Length(staticBallIds) - 1 do begin
    Result.staticBall[i].p := b2Body_GetPosition(staticBallIds[i]);

    b2Body_GetShapes(staticBallIds[i], @shapesId, 1);
    circle := b2Shape_GetCircle(shapesId);
    Result.staticBall[i].r := circle.radius;
  end;

  // ===== Dynamic Ball
  Result.dynamicBall := nil;
  SetLength(Result.dynamicBall, Length(dynamicBallIds));
  for i := 0 to Length(dynamicBallIds) - 1 do begin
    Result.dynamicBall[i].p := b2Body_GetPosition(dynamicBallIds[i]);

    b2Body_GetShapes(dynamicBallIds[i], @shapesId, 1);
    circle := b2Shape_GetCircle(shapesId);
    Result.dynamicBall[i].r := circle.radius;
  end;


  // ===== Kinematische Hanteln
  for i := 0 to Length(dynamicDumbbellIds) - 1 do begin
    transform := b2Body_GetTransform(dynamicDumbbellIds[i]);
    b2Body_GetShapes(dynamicDumbbellIds[i], @shapes, 3);

    //circle := b2Shape_GetCircle(shapes[0]);
    //hp2 := b2TransformPoint(transform, circle.center);
    //WriteLn('r1: ', circle.radius: 4: 2, '  x:', hp2.x: 4: 2, '  y:', hp2.y: 4: 2);
    //
    polygon := b2Shape_GetPolygon(shapes[0]);
    Write('count: ', polygon.count, '   ');
    for j := 0 to polygon.count - 1 do begin
      p := b2TransformPoint(transform, polygon.vertices[j]);
      Write('  x:', p.x: 4: 2, '  y:', p.y: 4: 2);
    end;
    WriteLn();

    circle := b2Shape_GetCircle(shapes[1]);
    hp2 := b2TransformPoint(transform, circle.center);
    WriteLn('r2: ', circle.radius: 4: 2, '  x:', hp2.x: 4: 2, '  y:', hp2.y: 4: 2);

    circle := b2Shape_GetCircle(shapes[2]);
    hp1 := b2TransformPoint(transform, circle.center);
    WriteLn('r3: ', circle.radius: 4: 2, '  x:', hp1.x: 4: 2, '  y:', hp1.y: 4: 2);
    WriteLn(#10);
  end;
  WriteLn(#10);
end;

function TEngine.GetSceneBodyIds: TSceneBodyIds;
begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  Result:=nil;
  SetLength(Result, 5);
  Result[0]:=staticBoxIds;
  Result[1]:=dynamicBoxIds;
  Result[2]:=staticBallIds;
  Result[3]:=dynamicBallIds;
  Result[4]:=dynamicDumbbellIds;
end;

procedure TEngine.BallRest(ball: integer);
var
  v: Tb2Vec2;
begin
  if ball < Length(dynamicBallIds) then begin
    v.SetItems(50.0, 50.0);
    b2Body_SetTransform(dynamicBallIds[ball], v, b2Rot_identity);
    b2Body_SetLinearVelocity(dynamicBallIds[ball], b2Vec2_zero);
    b2Body_SetAngularVelocity(dynamicBallIds[ball], 0.0);
  end;
end;

end.
