program project1;

uses
  fp_ode;

type
  TMySimulationData = record
    world: TdWorldID;
    contactgroup: TdJointGroupID;
  end;
  PMySimulationData = ^TMySimulationData;

  procedure nearCallback(data: pointer; o1: TdGeomID; o2: TdGeomID); cdecl;
  var
    sim: PMySimulationData absolute data;
    b1, b2: TdBodyID;
    c: TdJointID;
    contact: TdContact;
  begin
    b1 := dGeomGetBody(o1);
    b2 := dGeomGetBody(o2);

    if (b1 <> nil) or (b2 <> nil) or (dAreConnectedExcluding(b1, b2, dJointTypeContact) = 0) then begin
      contact.surface.mode := dContactBounce or dContactSoftCFM;
      contact.surface.mu := dInfinity;
      contact.surface.bounce := 0.7;
      contact.surface.bounce_vel := 0.1;
      contact.surface.soft_cfm := 0.001;

      if dCollide(o1, o2, 1, @contact.geom, sizeof(TdContact)) <> 0 then begin
        c := dJointCreateContact(sim^.world, sim^.contactgroup, @contact);
        dJointAttach(c, b1, b2);
      end;
    end;
  end;

  function CreateBalls(world: TdWorldID; space: TdSpaceID; x, y, z, r: TdReal): TdBodyID;
  var
    mass: TdMass;
    ball_geom: TdGeomID;
  begin
    Result := dBodyCreate(world);
    dMassSetSphereTotal(@mass, 1.0, r);
    dBodySetMass(Result, @mass);
    dBodySetPosition(Result, x, y, z);

    ball_geom := dCreateSphere(space, r);
    dGeomSetBody(ball_geom, Result);
  end;

const
  BALL_COUNT = 3;

  procedure main;
  var
    space: TdSpaceID;
    ball_body: array of TdBodyID = nil;
    i, j: integer;
    p: PdReal;

    sim: TMySimulationData;
    geo: TdGeomID;
    r: TdReal;
  begin
    dInitODE;

    sim.world := dWorldCreate;
    sim.contactgroup := dJointGroupCreate(0);
    dWorldSetGravity(sim.world, 0, 0, -9.81);

    space := dSimpleSpaceCreate(nil);
    dCreatePlane(space, 0, 0, 1, 0);

    SetLength(ball_body, BALL_COUNT);
    for i := 0 to BALL_COUNT - 1 do begin
      ball_body[i] := CreateBalls(sim.world, space, 0.0, 0.0, 10.0 + i * 5, 0.5 + i * 0.2);
    end;

    for i := 0 to 999 do begin
      dSpaceCollide(space, @sim, @nearCallback);
      dWorldStep(sim.world, 0.01);
      dJointGroupEmpty(sim.contactgroup);

      if i mod 5 = 0 then  begin
        Write(i: 3, '. ');
        for j := 0 to BALL_COUNT - 1 do begin
          p := dBodyGetPosition(ball_body[j]);

          geo := dBodyGetFirstGeom(ball_body[j]);
          r := dGeomSphereGetRadius(geo);
          Write('X: ', p[0]: 4: 2, ' Y: ', p[1]: 4: 2, ' Z: ', p[2]: 4: 2, ' R: ', r: 4: 2, '    ');
        end;
        WriteLn();
      end;
    end;

    dJointGroupDestroy(sim.contactgroup);
    dSpaceDestroy(space);
    dWorldDestroy(sim.world);

    dCloseODE;
  end;

begin
  main;
end.
