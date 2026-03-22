program project1;

const
  {$IFDEF Linux}
  libsokol = 'sokol';
  {$ENDIF}
  {$IFDEF Windows}
  libsokol = 'libsokol.dll';
  {$ENDIF}

  function sg_isvalid: boolean; cdecl; external libsokol;
  procedure sapp_run(const desc: Pointer); cdecl; external libsokol;

  type
    Tsapp_desc = record
      init_cb: procedure; cdecl;
      frame_cb: procedure; cdecl;
      // ... (vereinfacht für den Test)
      pad: array[0..2000] of byte;
    end;

  procedure init; cdecl; begin WriteLn('Sokol: Fenster initialisiert!'); end;
  procedure frame; cdecl; begin end;

  procedure main;

  var desc: Tsapp_desc;
  begin
    if sg_isvalid then begin
      WriteLn('Sokol Gfx ist bereit!');
    end else begin
      WriteLn('Sokol Library geladen (Setup noch nicht gerufen).');
    end;

    FillChar(desc, SizeOf(desc), 0);
    desc.init_cb := @init;
    desc.frame_cb := @frame;
    sapp_run(@desc);
  end;

begin
   main;
end.
