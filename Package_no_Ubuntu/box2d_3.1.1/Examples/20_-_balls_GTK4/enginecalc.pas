unit EngineCalc;

{$modeswitch arrayoperators on}

interface

uses
  fp_box2d;

type
  TColor = record
    r, g, b: single;
  end;
  PColor = ^TColor;

  Tb2BodyIds = array of Tb2BodyId;
  TSceneBodyIds = array of Tb2BodyIds;

type

  { TEngine }

  TEngine = class(TObject)
  private
    worldId: Tb2WorldId;
    staticBoxIds, dynamicBoxIds, dynamicBallIds, staticBallIds, dynamicDumbbellIds: Tb2BodyIds;
    function GetSceneBodyIds: Tb2BodyIds;
  public
    property SceneBodyIds: Tb2BodyIds read GetSceneBodyIds;
    constructor Create;
    destructor Destroy; override;
    procedure NextScene;
  end;

implementation

const
  clRed: TColor = (r: 1.0; g: 0.0; b: 0.0);
  clGreen: TColor = (r: 0.0; g: 1.0; b: 0.0);
  clBlue: TColor = (r: 0.0; g: 0.0; b: 1.0);

  clLightRed: TColor = (r: 1.0; g: 0.5; b: 0.5);
  clLightGreen: TColor = (r: 0.5; g: 1.0; b: 0.5);
  clLightBlue: TColor = (r: 0.5; g: 0.5; b: 1.0);

  clLightYellow: TColor = (r: 1.0; g: 1.0; b: 0.5);
  clLightMagenta: TColor = (r: 1.0; g: 0.5; b: 1.0);
  clLightCyan: TColor = (r: 0.5; g: 1.0; b: 1.0);

type
  TBoxData = record
    size, ofs: Tb2Vec2;
    angele: single;
  end;

  Tb2Circles = array of Tb2Circle;

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

  StaticBallData: Tb2Circles = (
    (center: (x: 90.0; y: -40.0); radius: 15),
    (center: (x: 185.0; y: -80.0); radius: 20),
    (center: (x: 180.0; y: -170.0); radius: 20)
    );

constructor TEngine.Create;
var
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
  shapeDef.enableContactEvents := True;   // ???

  SetLength(staticBoxIds, 1);
  staticBoxIds[0] := b2CreateBody(worldId, @bodyDef);
  b2Body_SetUserData(staticBoxIds[0], @clLightBlue);
  for i := 0 to Length(StaticBoxDatas) - 1 do begin
    with StaticBoxDatas[i] do begin
      polygon := b2MakeOffsetBox(size.x, size.y, ofs, b2MakeRot(angele));
      b2CreatePolygonShape(staticBoxIds[0], @shapeDef, @polygon);
    end;
  end;

  // ===== Static Ball
  bodyDef := b2DefaultBodyDef;
  shapeDef := b2DefaultShapeDef;

  SetLength(staticBallIds, 1);
  staticBallIds[0] := b2CreateBody(worldId, @bodyDef);
  b2Body_SetUserData(staticBallIds[0], @clLightCyan);
  for i := 0 to Length(StaticBallData) - 1 do begin;
    circle := StaticBallData[i];
    b2CreateCircleShape(staticBallIds[0], @shapeDef, @circle);
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
      b2Body_SetUserData(dynamicBoxIds[i], @clLightRed);
      polygon := b2MakeOffsetBox(size.x, size.y, b2Vec2_zero, b2MakeRot(angele));
      b2CreatePolygonShape(dynamicBoxIds[i], @shapeDef, @polygon);
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
    b2Body_SetUserData(dynamicBallIds[i], @clRed);
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
    bodyDef.position.SetItems(80.0 + (i * 40.0), -120.0);
    bodyDef.angularVelocity := 0.8 * (i + 1);

    dynamicDumbbellIds[i] := b2CreateBody(worldId, @bodyDef);
    b2Body_SetUserData(dynamicDumbbellIds[i], @clLightGreen);

    circle.SetItems(-7.0, 0.0, 4.5);
    b2CreateCircleShape(dynamicDumbbellIds[i], @shapeDef, @circle);

    circle.SetItems(7.0, 0.0, 2.5);
    b2CreateCircleShape(dynamicDumbbellIds[i], @shapeDef, @circle);

    polygon := b2MakeOffsetBox(7.0, 1.0, b2Vec2_zero, b2Rot_identity);
    b2CreatePolygonShape(dynamicDumbbellIds[i], @shapeDef, @polygon);
  end;
end;

destructor TEngine.Destroy;
begin
  b2DestroyWorld(worldId);
  inherited Destroy;
end;

procedure TEngine.NextScene;
var
  event: Tb2ContactEvents;
begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  event := b2World_GetContactEvents(worldId);
  WriteLn('begin: ', event.beginCount: 5, '   end:   ', event.endCount: 5);
end;

function TEngine.GetSceneBodyIds: Tb2BodyIds;
var
  i: integer;
  p, v: Tb2Vec2;
begin
  Result := nil;
  SetLength(Result, 5);


  Result :=
    staticBoxIds +
    dynamicBoxIds +
    staticBallIds +
    dynamicBallIds +
    dynamicDumbbellIds;

  for i := 0 to Length(Result) - 1 do begin
    p := b2Body_GetPosition(Result[i]);
    if p.y < -250.0 then begin
      v.SetItems(50.0, 50.0);
      b2Body_SetTransform(Result[i], v, b2Rot_identity);
      b2Body_SetLinearVelocity(Result[i], b2Vec2_zero);
      b2Body_SetAngularVelocity(Result[i], 0.0);
    end;
  end;
end;

end.
