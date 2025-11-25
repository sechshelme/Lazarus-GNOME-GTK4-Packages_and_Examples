program project1;

uses
  fp_vlc;

  procedure main;
  var
    inst: Plibvlc_instance_t;
    m: Plibvlc_media_t;
    mp: Plibvlc_media_player_t;
  begin
    inst := libvlc_new(0, nil);
    m := libvlc_media_new_location(inst, 'https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm');

    mp := libvlc_media_player_new_from_media(m);

    libvlc_media_release(m);
    libvlc_media_player_play(mp);

    WriteLn('Drücke ENTER zum Beenden ...');
    ReadLn;

    libvlc_media_player_stop(mp);
    libvlc_media_player_release(mp);
    libvlc_release(inst);
  end;

begin
  main;
end.
