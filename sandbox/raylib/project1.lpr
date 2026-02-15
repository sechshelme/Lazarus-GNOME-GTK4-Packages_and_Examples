program project1;

uses
  fp_raymath,
  fp_rlgl,
  fp_raylib;

  function vec3(x, y, z: single): TVector3; inline;
  begin
    Result.x := x;
    Result.y := y;
    Result.z := z;
  end;

procedure glmc_vec3_lerpc; cdecl; external 'cglm';
  procedure glmc_vec3_mix; cdecl; external 'cglm';


  procedure main;
  var
    camera: TCamera3D;
    rotation: single = 0.0;
  begin
    glmc_vec3_lerpc;
    glmc_vec3_mix;
    InitWindow(800, 600, 'Rotierender Würfel');

    FillChar(camera, SizeOf(camera), 0);
    camera.position := vec3(5.0, 5.0, 5.0);
    camera.target := vec3(0.0, 0.0, 0.0);
    camera.up := vec3(0.0, 1.0, 0.0);
    camera.fovy := 45.0;
    camera.projection := CAMERA_PERSPECTIVE;

    SetTargetFPS(60);

    while not WindowShouldClose do begin
      UpdateCamera(@camera, CAMERA_FREE);

      rotation += 90.0 * GetFrameTime();

      BeginDrawing;
      ClearBackground(RAYWHITE);
      DrawText('Der Würfel dreht sich!', 190, 50, 20, DARKGRAY);

      BeginMode3D(camera);

      rlPushMatrix();
      rlRotatef(rotation, 0, 1, 0);
      DrawCube(vec3(0, 0, 0), 2.0, 2.0, 2.0, RED);
      DrawCubeWires(vec3(0, 0, 0), 2.0, 2.0, 2.0, BLACK);
      rlPopMatrix();

      EndMode3D;

      DrawFPS(10, 10);
      EndDrawing;
    end;
    CloseWindow;
  end;

begin
  main;
end.
