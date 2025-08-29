program project1;

uses
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
