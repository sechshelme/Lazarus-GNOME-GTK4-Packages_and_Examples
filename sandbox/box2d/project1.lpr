program project1;

uses
fp_box2d;


procedure main;
var
  worldDef: Tb2WorldDef;
  worldId: Tb2WorldId;
begin
worldDef := b2DefaultWorldDef;
worldDef.gravity.x :=0.0;
worldDef.gravity.y :=0.0;

   worldId := b2CreateWorld(@worldDef);

  if b2World_IsValid(worldId) then begin
      WriteLn('Box2D v3 erfolgreich verknüpft! Welt erstellt.');
  end else begin
      WriteLn('Fehler beim Erstellen der Welt.');
      Exit;
  end;

  b2DestroyWorld(worldId);
end;


begin
  main;
//  b2StoreWorldId(1,2);
  b2LoadWorldId(0);
//  b2CreateWorld(nil);
//  b2PrismaticJoint_GetTargetTranslation;
  WriteLn( b2MaxInt(1,3));
  WriteLn( b2MaxInt(3,1));
  WriteLn( b2MinInt(1,3));
  WriteLn( b2MinInt(3,1));
end.

















