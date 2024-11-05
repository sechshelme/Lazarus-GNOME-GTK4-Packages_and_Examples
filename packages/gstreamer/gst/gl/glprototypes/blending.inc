/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


procedure BlendEquation(mode:TGLenum);cdecl;external libgstgl;
procedure BlendColor(red:TGLclampf; green:TGLclampf; blue:TGLclampf; alpha:TGLclampf);cdecl;external libgstgl;
procedure BlendFuncSeparate(srcRGB:TGLenum; dstRGB:TGLenum; srcAlpha:TGLenum; dstAlpha:TGLenum);cdecl;external libgstgl;
procedure BlendEquationSeparate(modeRGB:TGLenum; modeAlpha:TGLenum);cdecl;external libgstgl;
procedure StencilFuncSeparate(face:TGLenum; func:TGLenum; ref:TGLint; mask:TGLuint);cdecl;external libgstgl;
procedure StencilMaskSeparate(face:TGLenum; mask:TGLuint);cdecl;external libgstgl;
procedure StencilOpSeparate(face:TGLenum; fail:TGLenum; zfail:TGLenum; zpass:TGLenum);cdecl;external libgstgl;

// === Konventiert am: 9-10-24 17:17:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
