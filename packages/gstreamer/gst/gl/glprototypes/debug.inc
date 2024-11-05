/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

procedure DebugMessageControl(Source: TGLenum; _type: TGLenum; severity: TGLenum; Count: TGLsizei; ids: PGLuint;
  Enabled: Tgboolean); cdecl; external libgstgl;
procedure DebugMessageInsert(Source: TGLenum; _type: TGLenum; id: TGLuint; severity: TGLenum; length: TGLsizei;
  message: Pgchar); cdecl; external libgstgl;
procedure DebugMessageCallback(callback: Pointer; user_data: Tgpointer); cdecl; external libgstgl;
function GetDebugMessageLog(Count: TGLuint; bufSize: TGLsizei; sources: PGLenum; types: PGLenum; ids: PGLuint;
  severities: PGLenum; lengths: PGLsizei; messageLog: Pgchar): TGLuint; cdecl; external libgstgl;
procedure GetPointerv(pname: TGLenum; params: Pgpointer); cdecl; external libgstgl;
procedure PushDebugGroup(Source: TGLenum; id: TGLuint; length: TGLsizei; message: Pgchar); cdecl; external libgstgl;
procedure PopDebugGroup; cdecl; external libgstgl;
procedure ObjectLabel(identifier: TGLenum; Name: TGLuint; length: TGLsizei; _label: Pgchar); cdecl; external libgstgl;
procedure GetObjectLabel(identifier: TGLenum; Name: TGLuint; bufSize: TGLsizei; length: PGLsizei; _label: Pgchar); cdecl; external libgstgl;
procedure ObjectPtrLabel(ptr: Tgpointer; length: TGLsizei; _label: Pgchar); cdecl; external libgstgl;
procedure GetObjectPtrLabel(ptr: Tgpointer; bufSize: TGLsizei; length: PGLsizei; _label: Pgchar); cdecl; external libgstgl;
procedure InsertEventMarker(length: TGLsizei; message: Pgchar); cdecl; external libgstgl;
procedure PushGroupMarker(length: TGLsizei; message: Pgchar); cdecl; external libgstgl;
procedure PopGroupMarker; cdecl; external libgstgl;
procedure StringMarker(length: TGLsizei; message: Pgchar); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:17:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
