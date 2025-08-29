program project1;

uses
  types,
  portal_enums,
  account,
  background,
  camera,
  dynamic_launcher,
  email,
  filechooser,
  inhibit,
  location,
  notification,
  openuri,
  parent,
  portal_helpers,
  print,
  remote,
  screenshot,
  spawn,
  trash,
  updates,
  wallpaper,

  fp_glib2,
  fp_portal;


  procedure main;
  var
    portal: PXdpPortal;
    status: Tgboolean;
  begin
    portal := xdp_portal_new;
    status := xdp_portal_is_camera_present(portal);
    g_printf('Kamera vorhanden: %b'#10, status);

    g_object_unref(portal);

  end;


begin
  main;
end.
