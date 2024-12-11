program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4;

  // https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gac-u2Jm.NlQRfypk7YHPa0TxA

  procedure quit_activated(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  begin
    g_application_quit(G_APPLICATION(user_data));
  end;


  procedure hello_activated(action: PGSimpleAction; parameter: PGVariant; user_data: Tgpointer); cdecl;
  begin
    g_printf('Hello World !');
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    app_actions: array of TGActionEntry = (
      (Name: 'quit'; activate: @quit_activated; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0)),
      (Name: 'hello'; activate: @hello_activated; parameter_type: nil; state: nil; change_state: nil; padding: (0, 0, 0))
      );
    status: longint;

  begin
    app := gtk_application_new('org.example', G_APPLICATION_FLAGS_NONE);

    g_action_map_add_action_entries(G_ACTION_MAP(app), PGActionEntry(app_actions), Length(app_actions), app);

    status := g_application_run(G_APPLICATION(app), argc, argv);

    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
