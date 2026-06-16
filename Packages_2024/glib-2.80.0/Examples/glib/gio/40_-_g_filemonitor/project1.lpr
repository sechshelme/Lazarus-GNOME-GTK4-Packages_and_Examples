program project1;

uses
  fp_glib2;

  procedure on_file_changed(monitor: PGFileMonitor; f: PGFile; other_file: PGFile; event_type: TGFileMonitorEvent; user_data: Tgpointer); cdecl;
  const
    EventStrings: array of pansichar = (
      'G_FILE_MONITOR_EVENT_CHANGED',
      'G_FILE_MONITOR_EVENT_CHANGES_DONE_HINT',
      'G_FILE_MONITOR_EVENT_DELETED',
      'G_FILE_MONITOR_EVENT_CREATED',
      'G_FILE_MONITOR_EVENT_ATTRIBUTE_CHANGED',
      'G_FILE_MONITOR_EVENT_PRE_UNMOUNT',
      'G_FILE_MONITOR_EVENT_UNMOUNTED',
      'G_FILE_MONITOR_EVENT_MOVED',
      'G_FILE_MONITOR_EVENT_RENAMED',
      'G_FILE_MONITOR_EVENT_MOVED_IN',
      'G_FILE_MONITOR_EVENT_MOVED_OUT');
  var
    event_str: pansichar;
    file_name: pansichar;
  begin
    file_name := g_file_get_basename(f);

    if event_type >= Length(EventStrings) then begin
      event_str := '<Unknow>';
    end;
    event_str := EventStrings[event_type];

    g_print('Ereignis: ''%s'' auf Datei: ''%s'''#10, event_str, file_name);
    g_free(file_name);
  end;

  procedure main;
  const
    path = '/tmp';
  var
    f: PGFile;
    monitor: PGFileMonitor;
    loop: PGMainLoop;
  begin
    f := g_file_new_for_path(path);
    monitor := g_file_monitor_directory(f, 0, nil, nil);
    if monitor = nil then begin
      g_printerr('Fehler: Konnte Verzeichnis ''%s'' nicht überwachen.'#10, path);
      Exit;
    end;

    g_signal_connect(monitor, 'changed', G_CALLBACK(@on_file_changed), nil);

    g_print('Überwache das Verzeichnis: %s'#10, path);
    g_print('Ändere, erstelle oder lösche eine Datei in diesem Ordner, um eine Ausgabe zu sehen.'#10);
    g_print('Zum Beenden des Programms, drücken Sie Ctrl+C.'#10#10);

    loop := g_main_loop_new(nil, gFalse);
    g_main_loop_run(loop);
    g_printf('programm abgewürgt'#10);

    g_main_loop_unref(loop);
    g_object_unref(monitor);
    g_object_unref(f);
  end;


begin
  main;
end.
