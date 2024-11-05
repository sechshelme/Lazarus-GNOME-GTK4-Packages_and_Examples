/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

procedure GenQueries(n:TGLsizei; ids:PGLuint);cdecl;external libgstgl;
procedure DeleteQueries(n:TGLsizei; ids:PGLuint);cdecl;external libgstgl;
function IsQuery(id:TGLuint):TGLboolean;cdecl;external libgstgl;
procedure BeginQuery(target:TGLenum; id:TGLuint);cdecl;external libgstgl;
procedure EndQuery(target:TGLenum);cdecl;external libgstgl;
procedure QueryCounter(id:TGLuint; target:TGLenum);cdecl;external libgstgl;
procedure GetQueryiv(target:TGLenum; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetQueryObjectiv(id:TGLuint; pname:TGLenum; params:PGLint);cdecl;external libgstgl;
procedure GetQueryObjectuiv(id:TGLuint; pname:TGLenum; params:PGLuint);cdecl;external libgstgl;
procedure GetQueryObjecti64v(id:TGLuint; pname:TGLenum; params:PGLint64);cdecl;external libgstgl;
procedure GetQueryObjectui64v(id:TGLuint; pname:TGLenum; params:PGLuint64);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:18:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
