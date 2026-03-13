unit EngineCalc;

interface

uses Classes, fp_box2d;

const
  // ==========================================================
  // OBJEKT-EINSTELLUNGEN
  // ==========================================================

  // Startposition des Balls
  BALL_START_X = 0.0;
  BALL_START_Y = 40.0;

  // Horizontale Geschwindigkeit
  BALL_VELOCITY_X = 5.0;

  // Radius des Balls: 0.5 Meter
  BALL_RADIUS = 3.0;

  // Dichte: Bestimmt das Gewicht (kg/m²)
  BALL_DENSITY = 1.0;

  // Bounciness: 0.7 (70% Energieerhalt)
  BALL_RESTITUTION = 0.7;

  // Boden-Position
  GROUND_Y = -2.0;

  // Box2D nutzt "halbe Ausdehnung"
  GROUND_HALF_WIDTH = 50.0;
  GROUND_HALF_HEIGHT = 2.5;

type
  TCoord = array[0..3] of Tb2Vec2;
  TCoords = array of TCoord;

  Tb2Vec2s = array of Tb2Vec2;

type

  { TEngine }

  TEngine = class(TObject)
  private
    worldDef: Tb2WorldDef;
    worldId: Tb2WorldId;
    groundBodyDef, bodyDef: Tb2BodyDef;
    groundId: Tb2BodyId;
    bodyIds: array of Tb2BodyId;
    groundBox: array of Tb2Polygon;
    groundShapeDef, shapeDef: Tb2ShapeDef;
    circle: Tb2Circle;
    shapeId: Tb2ShapeId;
    function GetBallCoords: Tb2Vec2s;
    function GetBoxCoords: TCoords;
  public
    property BoxCoords: TCoords read GetBoxCoords;
    property BallCord: Tb2Vec2s read GetBallCoords;
    constructor Create;
    destructor Destroy; override;
    procedure Goto0(ball: integer);
  end;

implementation

type
  TBoxData = record
    ofs: Tb2Vec2;
    angele: single;
  end;

const
  BoxDatas: array of TBoxData = (
    (ofs: (x: 0.0; y: 0.0); angele: 0.0),
    (ofs: (x: 75.0; y: -10); angele: 0.3),
    (ofs: (x: 20.0; y: -40); angele: -0.3),
    (ofs: (x: 90.0; y: -80); angele: 0.3),
    (ofs: (x: 0.0; y: -120.0); angele: 0.0),
    (ofs: (x: -60.0; y: -100.0); angele: pi / 2),
    (ofs: (x: 100.0; y: -150.0); angele: -0.2)
    );

function TEngine.GetBoxCoords: TCoords;
var
  worldPoint, localPoint: Tb2Vec2;
  i, j: integer;
  transform: Tb2Transform;
begin
  Result := nil;
  transform := b2Body_GetTransform(groundId);
  SetLength(Result, Length(groundBox));
  for i := 0 to Length(groundBox) - 1 do begin
    for j := 0 to groundBox[i].count - 1 do begin
      localPoint := groundBox[i].vertices[j];
      worldPoint := b2TransformPoint(transform, localPoint);

      Result[i, j].X := worldPoint.x;
      Result[i, j].Y := worldPoint.y;
    end;
  end;
end;

function TEngine.GetBallCoords: Tb2Vec2s;
var
  i: integer;
begin
  b2World_Step(worldId, 1.0 / 60.0, 4);

  Result := nil;
  SetLength(Result, Length(bodyIds));
  for i := 0 to Length(bodyIds) - 1 do begin
    Result[i] := b2Body_GetPosition(bodyIds[i]);
  end;
end;

constructor TEngine.Create;
var
  r: Tb2Rot = (c: cos(0.3); s: sin(0.3));
  i: integer;
begin
  // 1. Welt erstellen (Gravitation: 10m/s² nach unten)
  worldDef := b2DefaultWorldDef;
  worldDef.gravity.SetItems(0.0, -10.0);
  worldId := b2CreateWorld(@worldDef);

  // 2. Boden erstellen (Statisch)
  groundBodyDef := b2DefaultBodyDef();
  groundBodyDef.position.SetItems(0.0, 0.0);
  //    groundBodyDef.rotation.SetItems(Cos(0.05), Sin(-0.05)); // Boden liegt bei y = -2
  groundId := b2CreateBody(worldId, @groundBodyDef);
  groundShapeDef := b2DefaultShapeDef;

  SetLength(groundBox, Length(BoxDatas));
  for i := 0 to Length(BoxDatas) - 1 do begin
    r.c := Cos(BoxDatas[i].angele);
    r.s := Sin(BoxDatas[i].angele);
    groundBox[i] := b2MakeOffsetBox(GROUND_HALF_WIDTH, GROUND_HALF_HEIGHT, BoxDatas[i].ofs, r);
    b2CreatePolygonShape(groundId, @groundShapeDef, @groundBox[i]);
  end;

  // =====
  SetLength(bodyIds, 1000);
  circle.SetItems(0.0, 0.0, BALL_RADIUS);
  shapeDef := b2DefaultShapeDef();
  shapeDef.density := BALL_DENSITY;
  shapeDef.material.friction := 0.05;
  shapeDef.material.restitution := 0.2;

  for i := 0 to Length(bodyIds) - 1 do begin
    bodyDef := b2DefaultBodyDef;
    bodyDef._type := b2_dynamicBody;
    bodyDef.position.SetItems(BALL_START_X + (i mod 10) * BALL_RADIUS, BALL_START_Y + (i div 10) * BALL_RADIUS);
    bodyDef.linearVelocity.SetItems(BALL_VELOCITY_X, 0.0);

    bodyIds[i] := b2CreateBody(worldId, @bodyDef);

    shapeId := b2CreateCircleShape(bodyIds[i], @shapeDef, @circle);
    b2Shape_SetRestitution(shapeId, BALL_RESTITUTION);
  end;
end;

destructor TEngine.Destroy;
begin
  b2DestroyWorld(worldId);
  inherited Destroy;
end;

procedure TEngine.Goto0(ball: integer);
var
  zeroVel: Tb2Vec2 = (x: 0.0; y: 0.0);
  v: Tb2Vec2;
begin
  if ball < Length(bodyIds) then begin
    v.SetItems(BALL_START_X, BALL_START_Y);
    b2Body_SetTransform(bodyIds[ball], v, b2Rot_identity);

    b2Body_SetLinearVelocity(bodyIds[ball], zeroVel);
    b2Body_SetAngularVelocity(bodyIds[ball], 0.0);
  end;
end;

end.
