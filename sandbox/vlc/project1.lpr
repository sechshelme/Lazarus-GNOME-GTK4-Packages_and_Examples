program project1;
uses
fp_vlc;


//libvlc_,
//libvlc_version,
//libvlc_renderer_discoverer,
//libvlc_media_list,
//libvlc_media,
//libvlc_events,
//libvlc_media_player,
//libvlc_media_list_player,
//libvlc_media_library,
//libvlc_media_discoverer,
//libvlc_dialog,
//libvlc_vlm,
//deprecated;

procedure main;
var
  inst: Plibvlc_instance_t;
  m: Plibvlc_media_t;
  mp: Plibvlc_media_player_t;
begin
  inst := libvlc_new(0, nil);

  // Media-Objekt für die Webcam erstellen
//    m = libvlc_media_new_location(inst, "v4l2:///dev/video0"); // Linux
//    m = libvlc_media_new_location(inst, "file:///home/tux/Schreibtisch/sound/test.mp3"); // Linux
  m := libvlc_media_new_location(inst, 'file:///home/tux/Schreibtisch/sound/CANYON.mid');

  // MediaPlayer erzeugen
  mp := libvlc_media_player_new_from_media(m);

  // Media-Objekt kann freigegeben werden
  libvlc_media_release(m);

  // Videowiedergabe starten
  libvlc_media_player_play(mp);

  WriteLn('Drücke ENTER zum Beenden ...');
  ReadLn;

  // Aufräumen
  libvlc_media_player_stop(mp);
  libvlc_media_player_release(mp);
  libvlc_release(inst);
end;

begin
  main;
end.

