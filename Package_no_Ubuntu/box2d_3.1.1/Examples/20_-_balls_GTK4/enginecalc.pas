unit EngineCalc;

interface

uses fp_box2d;

type
  TBoxData = record
    size, ofs: Tb2Vec2;
    angele: single;
  end;

  TBallWorldData = record
    p: Tb2Vec2;
    r: single;
  end;
  TBallWorldDatas = array of TBallWorldData;

type
  TCoord = array[0..3] of Tb2Vec2;
  TCoords = array of TCoord;

  Tb2Vec2s = array of Tb2Vec2;

type

  { TEngine }

  TEngine = class(TObject)
  private
    worldId: Tb2WorldId;
    staticBoxIds: array of Tb2Polygon;
    dynamicBoxIds: array of record
      Body: Tb2BodyId;
      Box: Tb2Polygon
      end;
    dynamicBallIds, staticBallIds: array of Tb2BodyId;
    shapeId: Tb2ShapeId;
    function GetStaticBoxCoords: TCoords;
    function GetDynamicBoxCoords: TCoords;
    function GetStaticBallCoords: TBallWorldDatas;
    function GetDynamicBallCoords: TBallWorldDatas;
  public
    property BoxStaticCoords: TCoords read GetStaticBoxCoords;
    property BoxDynamicCoords: TCoords read GetDynamicBoxCoords;
    property BallStaticCoord: TBallWorldDatas read GetStaticBallCoords;
    property BalDynamiclCoord: TBallWorldDatas read GetDynamicBallCoords;
    constructor Create;
    destructor Destroy; override;
    procedure Goto0(ball: integer);
  end;

implementation

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

  StaticBallData: TBallWorldDatas = (
    (p: (x: 90.0; y: -40.0); r: 15),
    (p: (x: 185.0; y: -80.0); r: 20),
    (p: (x: 180.0; y: -170.0); r: 20)
    );

function TEngine.GetStaticBoxCoords: TCoords;
var
  i, j: integer;
begin
  Result := nil;
  SetLength(Result, Length(staticBoxIds));
  for i := 0 to Length(staticBoxIds) - 1 do begin
    for j := 0 to staticBoxIds[i].count - 1 do begin
      Result[i, j] := staticBoxIds[i].vertices[j];
    end;
  end;
end;

function TEngine.GetDynamicBoxCoords: TCoords;
var
  i, j: integer;
  transform: Tb2Transform;
begin
  Result := nil;
  SetLength(Result, Length(dynamicBoxIds));
  for i := 0 to Length(dynamicBoxIds) - 1 do begin
    transform := b2Body_GetTransform(dynamicBoxIds[i].Body);
    for j := 0 to dynamicBoxIds[i].Box.count - 1 do begin
      Result[i, j] := b2TransformPoint(transform, dynamicBoxIds[i].Box.vertices[j]);
    end;
  end;
end;

function TEngine.GetStaticBallCoords: TBallWorldDatas;
var
  i: integer;
  shapesId: Tb2ShapeId;
  circle: Tb2Circle;
begin
  Result := nil;
  SetLength(Result, Length(staticBallIds));
  for i := 0 to Length(staticBallIds) - 1 do begin
    Result[i].p := b2Body_GetPosition(staticBallIds[i]);

    b2Body_GetShapes(staticBallIds[i], @shapesId, 1);
    circle := b2Shape_GetCircle(shapesId);
    Result[i].r := circle.radius;
  end;
end;

function TEngine.GetDynamicBallCoords: TBallWorldDatas;
var
  i: integer;
  shapesId: Tb2ShapeId;
  circle: Tb2Circle;
begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  Result := nil;
  SetLength(Result, Length(dynamicBallIds));
  for i := 0 to Length(dynamicBallIds) - 1 do begin
    Result[i].p := b2Body_GetPosition(dynamicBallIds[i]);

    b2Body_GetShapes(dynamicBallIds[i], @shapesId, 1);
    circle := b2Shape_GetCircle(shapesId);
    Result[i].r := circle.radius;
  end;
end;

constructor TEngine.Create;
var
  r: Tb2Rot;
  i: integer;
  worldDef: Tb2WorldDef;
  bodyDef: Tb2BodyDef;
  circle: Tb2Circle;
  shapeDef: Tb2ShapeDef;
  groundId: Tb2BodyId;
begin
  worldDef := b2DefaultWorldDef;
  worldDef.gravity.SetItems(0.0, -10.0);
  worldId := b2CreateWorld(@worldDef);


  // ===== Static Box

  bodyDef := b2DefaultBodyDef;
  bodyDef.position.SetItems(0.0, 0.0);
  groundId := b2CreateBody(worldId, @bodyDef);
  shapeDef := b2DefaultShapeDef;

  SetLength(staticBoxIds, Length(StaticBoxDatas));
  for i := 0 to Length(StaticBoxDatas) - 1 do begin
    r.c := Cos(StaticBoxDatas[i].angele);
    r.s := Sin(StaticBoxDatas[i].angele);
    staticBoxIds[i] := b2MakeOffsetBox(StaticBoxDatas[i].size.x, StaticBoxDatas[i].size.y, StaticBoxDatas[i].ofs, r);
    b2CreatePolygonShape(groundId, @shapeDef, @staticBoxIds[i]);
  end;

  // ===== Dynamic Box

  SetLength(dynamicBoxIds, Length(DynamicBoxDatas));

  for i := 0 to Length(DynamicBoxDatas) - 1 do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_kinematicBody;
    bodyDef.position := DynamicBoxDatas[i].ofs;
    bodyDef.angularVelocity := 0.5 * (i + 1);

    dynamicBoxIds[i].Body := b2CreateBody(worldId, @bodyDef);

    shapeDef := b2DefaultShapeDef;
    r.c := Cos(DynamicBoxDatas[i].angele);
    r.s := Sin(DynamicBoxDatas[i].angele);

    dynamicBoxIds[i].Box := b2MakeOffsetBox(DynamicBoxDatas[i].size.x, DynamicBoxDatas[i].size.y, b2Vec2_zero, r);

    b2CreatePolygonShape(dynamicBoxIds[i].Body, @shapeDef, @dynamicBoxIds[i].Box);
  end;


  // ===== Static Ball

  SetLength(staticBallIds, Length(StaticBallData));
  shapeDef := b2DefaultShapeDef;
  for i := 0 to Length(staticBallIds) - 1 do begin;
    bodyDef := b2DefaultBodyDef;
    bodyDef.position.SetItems(StaticBallData[i].p.x, StaticBallData[i].p.y);
    staticBallIds[i] := b2CreateBody(worldId, @bodyDef);

    circle.SetItems(0.0, 0.0, StaticBallData[i].r);
    b2CreateCircleShape(staticBallIds[i], @shapeDef, @circle);
  end;

  // ===== Dynamic Ball

  SetLength(dynamicBallIds, 1000);
  shapeDef := b2DefaultShapeDef();
  shapeDef.density := 1.0;
  shapeDef.material.friction := 0.05;
  shapeDef.material.restitution := 0.2;

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
end;

destructor TEngine.Destroy;
begin
  b2DestroyWorld(worldId);
  inherited Destroy;
end;

procedure TEngine.Goto0(ball: integer);
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
