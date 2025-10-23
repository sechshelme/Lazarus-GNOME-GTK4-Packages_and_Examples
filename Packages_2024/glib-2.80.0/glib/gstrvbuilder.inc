
{$IFDEF read_interface}

type
  TGStrvBuilder = record
  end;
  PGStrvBuilder = ^TGStrvBuilder;

function g_strv_builder_new: PGStrvBuilder; cdecl; external libglib2;
procedure g_strv_builder_unref(builder: PGStrvBuilder); cdecl; external libglib2;
function g_strv_builder_ref(builder: PGStrvBuilder): PGStrvBuilder; cdecl; external libglib2;
procedure g_strv_builder_add(builder: PGStrvBuilder; Value: PChar); cdecl; external libglib2;
procedure g_strv_builder_addv(builder: PGStrvBuilder; Value: PPchar); cdecl; external libglib2;
procedure g_strv_builder_add_many(builder: PGStrvBuilder); varargs; cdecl; external libglib2;
procedure g_strv_builder_take(builder: PGStrvBuilder; Value: PChar); cdecl; external libglib2;
function g_strv_builder_end(builder: PGStrvBuilder): TGStrv; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:33:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
