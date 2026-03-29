program project1;




uses
  fp_jolt;


  //type
  //  PHello_ObjectLayers = ^THello_ObjectLayers;
  //  THello_ObjectLayers = longint;
const
  HELLO_OL_NON_MOVING = 0;
  HELLO_OL_MOVING = 1;
  HELLO_OL_COUNT = 2;

  //type
  //  PHello_BroadPhaseLayers = ^THello_BroadPhaseLayers;
  //  THello_BroadPhaseLayers = longint;
const
  HELLO_BPL_NON_MOVING = 0;
  HELLO_BPL_MOVING = 1;
  HELLO_BPL_COUNT = 2;

  function Hello_BPL_GetNumBroadPhaseLayers(self: pointer): Tuint; cdecl;
  begin
    Result := HELLO_BPL_COUNT;
  end;

  function Hello_BPL_GetBroadPhaseLayer(self: pointer; inLayer: TJPC_ObjectLayer): TJPC_BroadPhaseLayer; cdecl;
  begin
    if inLayer = HELLO_OL_NON_MOVING then begin
      Result := HELLO_BPL_NON_MOVING;
    end else begin
      Result := HELLO_BPL_MOVING;
    end;
  end;

const
  Hello_BPL: TJPC_BroadPhaseLayerInterfaceFns =
  (GetNumBroadPhaseLayers: @Hello_BPL_GetNumBroadPhaseLayers; GetBroadPhaseLayer: @Hello_BPL_GetBroadPhaseLayer);

  function Hello_OVB_ShouldCollide(self: pointer; inLayer1: TJPC_ObjectLayer; inLayer2: TJPC_BroadPhaseLayer): Tbool; cdecl;
  begin
    if inLayer1 = HELLO_OL_NON_MOVING then begin
      Result := inLayer2 = HELLO_BPL_MOVING;
    end else begin
      Result := True;
    end;
  end;

const
  Hello_OVB: TJPC_ObjectVsBroadPhaseLayerFilterFns = (ShouldCollide: @Hello_OVB_ShouldCollide);

  function Hello_OVO_ShouldCollide(self: pointer; inLayer1: TJPC_ObjectLayer; inLayer2: TJPC_ObjectLayer): Tbool; cdecl;
  begin
    if inLayer1 = HELLO_OL_NON_MOVING then begin
      Result := inLayer2 = HELLO_OL_MOVING;
    end else begin
      Result := True;
    end;
  end;

const
  Hello_OVO: TJPC_ObjectLayerPairFilterFns = (ShouldCollide: @Hello_OVO_ShouldCollide);

  procedure main;
  {$CODEALIGN LOCALMIN=64}
  var
    temp_alloc: PJPC_TempAllocatorImpl;
    job_sys: PJPC_JobSystemThreadPool;
    bpl_iface: PJPC_BroadPhaseLayerInterface;
    ovb_filter: PJPC_ObjectVsBroadPhaseLayerFilter;
    ovo_filter: PJPC_ObjectLayerPairFilter;
    physics_system: PJPC_PhysicsSystem;
    body_iface: PJPC_BodyInterface;
    floor_shape_settings: TJPC_BoxShapeSettings;
    floor_shape, sphere_shape: PJPC_Shape;
    err: PJPC_String;
    floor_settings, sphere_settings: TJPC_BodyCreationSettings;
    floor_id, sphere_id: TJPC_BodyID;
    sphere_shape_settings: TJPC_SphereShapeSettings;
    v: TJPC_Vec3;
    i: integer;
    p: TJPC_RVec3;
  begin
    WriteLn('Size of Settings: ', SizeOf(TJPC_BodyCreationSettings));

    JPC_RegisterDefaultAllocator;
    JPC_FactoryInit;
    JPC_RegisterTypes;

    temp_alloc := JPC_TempAllocatorImpl_new(10 * 1024 * 1024);
    job_sys := JPC_JobSystemThreadPool_new2(JPC_MAX_PHYSICS_JOBS, JPC_MAX_PHYSICS_BARRIERS);

    bpl_iface := JPC_BroadPhaseLayerInterface_new(nil, Hello_BPL);
    ovb_filter := JPC_ObjectVsBroadPhaseLayerFilter_new(nil, Hello_OVB);
    ovo_filter := JPC_ObjectLayerPairFilter_new(nil, Hello_OVO);

    physics_system := JPC_PhysicsSystem_new;
    JPC_PhysicsSystem_Init(physics_system, 1024, 0, 1024, 1024, bpl_iface, ovb_filter, ovo_filter);

    body_iface := JPC_PhysicsSystem_GetBodyInterface(physics_system);

    JPC_BoxShapeSettings_default(@floor_shape_settings);
    floor_shape_settings.HalfExtent.x := 100.0;
    floor_shape_settings.HalfExtent.y := 1.0;
    floor_shape_settings.HalfExtent.z := 100.0;

    JPC_BoxShapeSettings_Create(@floor_shape_settings, @floor_shape, @err);

    JPC_BodyCreationSettings_default(@floor_settings);
    floor_settings.Position.x := 0.0;
    floor_settings.Position.y := -1.0;
    floor_settings.Position.z := 0.0;
    floor_settings.MotionType := JPC_MOTION_TYPE_STATIC;
    floor_settings.ObjectLayer := HELLO_OL_NON_MOVING;
    floor_settings.Shape := floor_shape;

    //    floor_settings.Restitution := 0.8;

    floor_id := JPC_Body_GetID(JPC_BodyInterface_CreateBody(body_iface, @floor_settings));
    JPC_BodyInterface_AddBody(body_iface, floor_id, JPC_ACTIVATION_DONT_ACTIVATE);

    JPC_SphereShapeSettings_default(@sphere_shape_settings);
    sphere_shape_settings.Radius := 0.5;

    JPC_SphereShapeSettings_Create(@sphere_shape_settings, @sphere_shape, @err);

    JPC_BodyCreationSettings_default(@sphere_settings);
    sphere_settings.Position.x := 0.0;
    sphere_settings.Position.y := 2.0;
    sphere_settings.Position.z := -0.0;

    sphere_settings.Position.x := 123.45;
    sphere_settings.Position.y := 67.89;
    sphere_settings.Position.z := 99.99;


    sphere_settings.MotionType := JPC_MOTION_TYPE_DYNAMIC;
    sphere_settings.ObjectLayer := HELLO_OL_MOVING;
    sphere_settings.Shape := sphere_shape;
    //    sphere_settings.Restitution := 0.8;
    //    sphere_settings.AllowSleeping := False; // Kugel darf nicht einschlafen



    sphere_id := JPC_Body_GetID(JPC_BodyInterface_CreateBody(body_iface, @sphere_settings));
    JPC_BodyInterface_AddBody(body_iface, sphere_id, JPC_ACTIVATION_ACTIVATE);
    v.x := 0.0;
    v.y := -5.0;
    v.z := 0.0;
    JPC_BodyInterface_SetLinearVelocity(body_iface, sphere_id, v);

    for  i := 0 to 49 do begin
      JPC_PhysicsSystem_Update(physics_system, 1.0 / 60.0, 1, temp_alloc, PJPC_JobSystem(job_sys));
      p := JPC_BodyInterface_GetCenterOfMassPosition(body_iface, sphere_id);
      WriteLn(i: 4, '   X = ', p.x: 4: 2, '   Y = ', p.y: 4: 2, '   Z = ', p.z: 4: 2);
    end;
  end;

begin
  main;

  WriteLn('size: ', SizeOf(boolean));   //   > 1
  WriteLn('size: ', SizeOf(bytebool));  //   > 1

  WriteLn(word(bytebool(False)));  //   > 0
  WriteLn(word(bytebool(True)));   //   > 65535

  WriteLn(word(boolean(False)));  //   > 0
  WriteLn(word(boolean(True)));   //   > 1

  WriteLn(word(Boolean8(False))); //   > 0
  WriteLn(word(Boolean8(True)));  //   > 1

  WriteLn(word(Boolean32(False))); //   > 0
  WriteLn(word(Boolean32(True)));  //   > 1

end.
