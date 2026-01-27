program project1;

uses
fp_raylib;

function vec3(x, y, z: Single): TVector3; inline;
begin
  Result.x := x;
  Result.y := y;
  Result.z := z;
end;

procedure main;
var
  camera:TCamera3D;
  rotation: Single;
begin
  InitWindow(800, 600, 'Rotierender Würfel');

  FillChar(camera,SizeOf(camera),0);
  camera.position := vec3( 5.0, 5.0, 5.0 );
  camera.target := vec3( 0.0, 0.0, 0.0 );
  camera.up := vec3( 0.0, 1.0, 0.0 );
  camera.fovy := 45.0;
  camera.projection := CAMERA_PERSPECTIVE;

  SetTargetFPS(60);

   rotation := 0.0;

  while not WindowShouldClose do begin
      UpdateCamera(@camera, CAMERA_FREE);

      rotation += 1.0;

      BeginDrawing;
      ClearBackground(RAYWHITE);

      BeginMode3D(camera);
      DrawCube(vec3(0, 0, 0), 2.0, 2.0, 2.0, RED);
      DrawCubeWires(vec3(0, 0, 0), 2.0, 2.0, 2.0, BLACK);

      EndMode3D;
      DrawFPS(10, 10);
      EndDrawing;
  end;

  CloseWindow;
end;

begin
main;
end.

