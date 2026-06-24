unit gstrvbuilder;

interface

uses
  common_GLIB, gtypes, gstrfuncs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGStrvBuilder = type Pointer;

function g_strv_builder_new: PGStrvBuilder; cdecl; external libglib2;
procedure g_strv_builder_unref(builder: PGStrvBuilder); cdecl; external libglib2;
function g_strv_builder_unref_to_strv(builder: PGStrvBuilder): TGStrv; cdecl; external libglib2;
function g_strv_builder_ref(builder: PGStrvBuilder): PGStrvBuilder; cdecl; external libglib2;
procedure g_strv_builder_add(builder: PGStrvBuilder; value: pchar); cdecl; external libglib2;
procedure g_strv_builder_addv(builder: PGStrvBuilder; value: PPchar); cdecl; external libglib2;
procedure g_strv_builder_add_many(builder: PGStrvBuilder; args: array of const); cdecl; external libglib2;
procedure g_strv_builder_add_many(builder: PGStrvBuilder); cdecl; external libglib2;
procedure g_strv_builder_take(builder: PGStrvBuilder; value: pchar); cdecl; external libglib2;
function g_strv_builder_end(builder: PGStrvBuilder): TGStrv; cdecl; external libglib2;

// === Konventiert am: 22-6-26 19:40:16 ===


implementation



end.
