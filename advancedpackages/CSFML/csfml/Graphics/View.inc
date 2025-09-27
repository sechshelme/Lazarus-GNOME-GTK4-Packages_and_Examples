{$IFDEF read_interface}


function sfView_create: PsfView; cdecl; external libcsfml_graphics;
function sfView_createFromRect(rectangle: TsfFloatRect): PsfView; cdecl; external libcsfml_graphics;
function sfView_copy(view: PsfView): PsfView; cdecl; external libcsfml_graphics;
procedure sfView_destroy(view: PsfView); cdecl; external libcsfml_graphics;
procedure sfView_setCenter(view: PsfView; center: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfView_setSize(view: PsfView; size: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfView_setRotation(view: PsfView; angle: single); cdecl; external libcsfml_graphics;
procedure sfView_setViewport(view: PsfView; viewport: TsfFloatRect); cdecl; external libcsfml_graphics;
procedure sfView_reset(view: PsfView; rectangle: TsfFloatRect); cdecl; external libcsfml_graphics;
function sfView_getCenter(view: PsfView): TsfVector2f; cdecl; external libcsfml_graphics;
function sfView_getSize(view: PsfView): TsfVector2f; cdecl; external libcsfml_graphics;
function sfView_getRotation(view: PsfView): single; cdecl; external libcsfml_graphics;
function sfView_getViewport(view: PsfView): TsfFloatRect; cdecl; external libcsfml_graphics;
procedure sfView_move(view: PsfView; offset: TsfVector2f); cdecl; external libcsfml_graphics;
procedure sfView_rotate(view: PsfView; angle: single); cdecl; external libcsfml_graphics;
procedure sfView_zoom(view: PsfView; factor: single); cdecl; external libcsfml_graphics;

// === Konventiert am: 24-9-25 16:54:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
