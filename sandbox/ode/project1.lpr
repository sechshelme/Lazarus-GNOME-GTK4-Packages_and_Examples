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
  //odemath,
  //precision,
  //rotation,
  //threading_impl,
  //timer,
  //version,



  fp_ode;

  procedure main;
  var
    world: TdWorldID;
    space: TdSpaceID;
    mass_: TdMass;
    contactgroup: TdJointGroupID;
    ball_body: TdBodyID;
    ball_geom: TdGeomID;
    i: integer;
    pos_: PdReal;
  begin
    dInitODE;
    world := dWorldCreate;
    space := dSimpleSpaceCreate(nil);
    contactgroup := dJointGroupCreate(0);

    dWorldSetGravity(world, 0, 0, -9.81);

    dCreatePlane(space, 0, 0, 1, 0);

    ball_body := dBodyCreate(world);
    dMassSetSphereTotal(@mass_, 1.0, 0.5);
    dBodySetMass(ball_body, @mass_);
    dBodySetPosition(ball_body, 0, 0, 10);

    ball_geom := dCreateSphere(space, 0.5);
    dGeomSetBody(ball_geom, ball_body);

    for i := 0 to 99 do begin
      dWorldStep(world, 0.05);
      pos_ := dBodyGetPosition(ball_body);
      WriteLn('Step ', i: 4, ' Ball Höhe = ', pos_[2]:4:2);

      if pos_[2] <= 0.5 then begin
        WriteLn('Aufschlag!');
        break;
      end;
    end;

    dJointGroupDestroy(contactgroup);
    dSpaceDestroy(space);
    dWorldDestroy(world);
    dCloseODE();
  end;

begin
  main;
end.
