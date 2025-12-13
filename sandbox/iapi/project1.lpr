program project1;
uses
fp_iapi;

procedure main;
const
  pdf_in=  '/home/tux/Downloads/Ei.pdf';
var
  code: LongInt;
  gs_instance: Pointer=nil;
begin

//  void *gs_instance = NULL;
  code := gsapi_new_instance(@gs_instance, nil);
  if code < 0 then begin
      WriteLn('Failed to create Ghostscript instance');
      Exit;
  end;

  // Init arguments similar to CLI usage
  const char *gs_argv[] = {
      "gs",                 // argv[0], Program name placeholder
      "-dNOPAUSE",          // Ohne Pause nach jedem Seite
      "-dBATCH",            // Nach Verarbeitung alle beenden
      "-sDEVICE=png16m",    // Ausgabe als PNG (Beispiel)
      "-sOutputFile=out.png", // Ausgabe-PNG Datei
      argv[1],              // Eingabedatei, z.B. PDF
  };
  int gs_argc = sizeof(gs_argv) / sizeof(gs_argv[0]);

  code = gsapi_init_with_args(gs_instance, gs_argc, (char **)gs_argv);
  if (code < 0) {
      fprintf(stderr, "Ghostscript initialization failed\n");
      gsapi_exit(gs_instance);
      gsapi_delete_instance(gs_instance);
      return 1;
  }

  // Clean up libgs10 instance
  gsapi_exit(gs_instance);
  gsapi_delete_instance(gs_instance);

  printf("Rendering done. Output: out.png\n");
  return 0;
}

end;

begin
    main;
end.

