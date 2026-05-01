program project1;

uses
  odeconfig,
  common,
  contact,
  collision_space,
  collision,
  collision_trimesh,
  threading,
  cooperative,

  error,
  export_dif,
  mass,
  matrix,
  matrix_coop,
  memory,
  misc,
  objects,
  odeinit,
  odemath,
  rotation,
  threading_impl,
  timer,
  version,



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

    if (b1 <> nil) and (b2 <> nil) and (dAreConnectedExcluding(b1, b2, dJointTypeContact) <> 0) then begin
      Exit;
    end;

    //    dContact contact;
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

  procedure main;
  var
    space: TdSpaceID;
    mass_: TdMass;
    ball_body: TdBodyID;
    ball_geom: TdGeomID;
    i: integer;
    pos_: PdReal;

    sim: TMySimulationData;
  begin
    dInitODE;

    sim.world := dWorldCreate;
    sim.contactgroup := dJointGroupCreate(0);

    space := dSimpleSpaceCreate(nil);

    dWorldSetGravity(sim.world, 0, 0, -9.81);

    dCreatePlane(space, 0, 0, 1, 0);

    ball_body := dBodyCreate(sim.world);
    dMassSetSphereTotal(@mass_, 1.0, 0.5);
    dBodySetMass(ball_body, @mass_);
    dBodySetPosition(ball_body, 0, 0, 10);

    ball_geom := dCreateSphere(space, 0.5);
    dGeomSetBody(ball_geom, ball_body);

    for i := 0 to 999 do begin
      dSpaceCollide(space, @sim, @nearCallback);
      dWorldStep(sim.world, 0.01);
      dJointGroupEmpty(sim.contactgroup);

      pos_ := dBodyGetPosition(ball_body);
      if i mod 5 = 0 then  begin
        WriteLn('Step ', i: 4, ' Ball Höhe = ', pos_[2]: 4: 2);
      end;

      if pos_[2] <= 0.5 then begin
        //        WriteLn('Aufschlag!');
        //        break;
      end;
    end;

    dJointGroupDestroy(sim.contactgroup);
    dSpaceDestroy(space);
    dWorldDestroy(sim.world);
    dCloseODE();
  end;

begin
  main;
end.
