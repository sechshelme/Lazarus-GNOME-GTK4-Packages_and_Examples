program project1;

// https://www.freedesktop.org/software/colord/
// https://github.com/hughsie/colord-gtk

uses
  SysUtils,
  fp_glib2,
  fp_GTK4,
  fp_colord_gtk4,
  fp_colord;

  procedure main;
  const
    path = '/usr/share/color/icc/colord/sRGB.icc';
  var
    icc: PCdIcc;
    f: PGFile;
    err: PGError = nil;
    ret: Tgboolean;
    locale: Pgchar;
  begin
    //  setlocale (LC_ALL, "");

    //  g_type_init ();

    icc := cd_icc_new;
    f := g_file_new_for_path(path);
    ret := cd_icc_load_file(icc, f,
      CD_ICC_LOAD_FLAGS_METADATA,
      nil,
      @err);
    if not ret then begin
      g_print('failed to parse %s: %s'#10, path, err^.message);
      g_error_free(err);
    end else begin
      g_print('Filename:%s'#10, cd_icc_get_filename(icc));
      g_print('License:%s'#10, cd_icc_get_metadata_item(icc, 'License'));
      g_print('LCMS hProfile:%p'#10, cd_icc_get_handle(icc));

      locale := g_getenv('LANG');
      g_print('Description:%s'#10, cd_icc_get_description(icc, locale, nil));
      g_print('Model:%s'#10, cd_icc_get_model(icc, locale, nil));
      g_print('Copyright:%s'#10, cd_icc_get_copyright(icc, locale, nil));
    end;
    if f <> nil then  begin
      g_object_unref(f);
    end;
    if icc <> nil then  begin
      g_object_unref(icc);
    end;
  end;

begin
  main;
end.
