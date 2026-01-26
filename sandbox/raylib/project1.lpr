program project1;
uses
fp_raylib;

procedure main;
begin
  InitWindow(800, 600, 'Rotierender Würfel');

  Camera3D camera = { 0 };
  camera.position = (Vector3){ 5.0f, 5.0f, 5.0f };
  camera.target = (Vector3){ 0.0f, 0.0f, 0.0f };
  camera.up = (Vector3){ 0.0f, 1.0f, 0.0f };
  camera.fovy = 45.0f;
  camera.projection = CAMERA_PERSPECTIVE;

  SetTargetFPS(60);

  float rotation = 0.0f;

  while (!WindowShouldClose()) {
      // Kamera-Update mit MODE (das fehlte!)
      UpdateCamera(&camera, CAMERA_FREE);  // oder CAMERA_ORBITAL

      rotation += 1.0f;

      BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode3D(camera);
      DrawCube((Vector3){0, 0, 0}, 2.0f, 2.0f, 2.0f, RED);
      DrawCubeWires((Vector3){0, 0, 0}, 2.0f, 2.0f, 2.0f, BLACK);

      // Einfache Rotation via Matrix (alternative zu UpdateCamera)
      // DrawCubeEx((Vector3){2,0,0}, (Vector3){1,1,1}, rotation*RAD2DEG, 2, RED);

      EndMode3D();
      DrawFPS(10, 10);
      EndDrawing();
  }

  CloseWindow();
end;

begin

end.

