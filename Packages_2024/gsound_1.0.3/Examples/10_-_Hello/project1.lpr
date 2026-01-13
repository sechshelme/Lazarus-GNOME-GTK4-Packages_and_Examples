program project1;

uses
  fp_gsound,
  fp_glib2;

  procedure main;
  var
    cancellable: PGCancellable;
    err: PGError = nil;
    context: PGSoundContext;
    ret: Tgboolean;
  begin
    cancellable := g_cancellable_new;
    context := gsound_context_new(cancellable, @err);
    if err <> nil then begin
      g_printf('Fehler beim Erstellen des GSound-Kontexts: %s'#10, err^.message);
      g_error_free(err);
      Exit;
    end;

    ret := gsound_context_play_simple(context, cancellable, @err, GSOUND_ATTR_EVENT_ID, 'phone-incoming-call', nil);
    if err <> nil then begin
      g_printf('Fehler beim Abspielen des Sounds: %s', err^.message);
      g_error_free(err);
      g_object_unref(context);
      g_object_unref(cancellable);
      Exit;
    end;

    g_usleep(2000000);

    g_object_unref(context);
    g_object_unref(cancellable);
  end;

begin
  main;
end.
