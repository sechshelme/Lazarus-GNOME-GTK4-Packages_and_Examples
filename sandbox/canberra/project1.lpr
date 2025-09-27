program project1;

uses
  fp_canberra;

// Ort der Töne /usr/share/sounds/freedesktop/stereo

  procedure main;
  var
    context: Pca_context = nil;
    ret: longint;
  begin
    ca_context_create(@context);

    if context = nil then begin
      WriteLn('Fehler beim Erzeugen des libcanberra-Kontexts');
      Exit;
    end;

    ret := ca_context_play(context, 0, CA_PROP_EVENT_ID, 'phone-incoming-call', nil);
    if ret <> CA_SUCCESS then begin
      WriteLn('Fehler beim Abspielen des Sounds');
      ca_context_destroy(context);
      Exit;
    end;

    WriteLn('<ENTER> = Ende');
    ReadLn;

    ca_context_destroy(context);
  end;


begin
  main;
end.
