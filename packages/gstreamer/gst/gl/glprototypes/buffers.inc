/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


procedure CopyBufferSubData(readTarget: TGLenum; writeTarget: TGLenum; readOffset: TGLintptr; writeOffset: TGLintptr; size: TGLsizeiptr); cdecl; external libgstgl;
procedure GetBufferSubData(target: TGLenum; offset: TGLintptr; size: TGLsizeiptr; Data: pointer); cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:17:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
