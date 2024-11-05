/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

procedure BindTexture(target: TGLenum; texture: TGLuint); cdecl; external libgstgl;
procedure BlendFunc(sfactor: TGLenum; dfactor: TGLenum); cdecl; external libgstgl;
procedure Clear(mask: TGLbitfield); cdecl; external libgstgl;
procedure ClearColor(red: TGLclampf; green: TGLclampf; blue: TGLclampf; alpha: TGLclampf); cdecl; external libgstgl;
procedure ClearStencil(s: TGLint); cdecl; external libgstgl;
procedure ColorMask(red: TGLboolean; green: TGLboolean; blue: TGLboolean; alpha: TGLboolean); cdecl; external libgstgl;
procedure CopyTexSubImage2D(target: TGLenum; level: TGLint; xoffset: TGLint; yoffset: TGLint; x: TGLint;
  y: TGLint; Width: TGLsizei; Height: TGLsizei); cdecl; external libgstgl;
procedure DeleteTextures(n: TGLsizei; textures: PGLuint); cdecl; external libgstgl;
procedure DepthFunc(func: TGLenum); cdecl; external libgstgl;
procedure DepthMask(flag: TGLboolean); cdecl; external libgstgl;
procedure Disable(cap: TGLenum); cdecl; external libgstgl;
procedure DrawArrays(mode: TGLenum; First: TGLint; Count: TGLsizei); cdecl; external libgstgl;
procedure DrawElements(mode: TGLenum; Count: TGLsizei; _type: TGLenum; indices: PGLvoid); cdecl; external libgstgl;
procedure Enable(cap: TGLenum); cdecl; external libgstgl;
procedure Finish; cdecl; external libgstgl;
procedure Flush; cdecl; external libgstgl;
procedure FrontFace(mode: TGLenum); cdecl; external libgstgl;
procedure CullFace(mode: TGLenum); cdecl; external libgstgl;
procedure GenTextures(n: TGLsizei; textures: PGLuint); cdecl; external libgstgl;
function GetError: TGLenum; cdecl; external libgstgl;
procedure GetIntegerv(pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GetBooleanv(pname: TGLenum; params: PGLboolean); cdecl; external libgstgl;
procedure GetFloatv(pname: TGLenum; params: PGLfloat); cdecl; external libgstgl;
function GetString(Name: TGLenum): PGLubyte; cdecl; external libgstgl;
procedure Hint(target: TGLenum; mode: TGLenum); cdecl; external libgstgl;
function IsTexture(texture: TGLuint): TGLboolean; cdecl; external libgstgl;
procedure PixelStorei(pname: TGLenum; param: TGLint); cdecl; external libgstgl;
procedure ReadPixels(x: TGLint; y: TGLint; Width: TGLsizei; Height: TGLsizei; format: TGLenum;
  _type: TGLenum; pixels: PGLvoid); cdecl; external libgstgl;
procedure Scissor(x: TGLint; y: TGLint; Width: TGLsizei; Height: TGLsizei); cdecl; external libgstgl;
procedure StencilFunc(func: TGLenum; ref: TGLint; mask: TGLuint); cdecl; external libgstgl;
procedure StencilMask(mask: TGLuint); cdecl; external libgstgl;
procedure StencilOp(fail: TGLenum; zfail: TGLenum; zpass: TGLenum); cdecl; external libgstgl;
procedure TexImage2D(target: TGLenum; level: TGLint; internalformat: TGLint; Width: TGLsizei; Height: TGLsizei;
  border: TGLint; format: TGLenum; _type: TGLenum; pixels: PGLvoid); cdecl; external libgstgl;
procedure TexParameterfv(target: TGLenum; pname: TGLenum; params: PGLfloat); cdecl; external libgstgl;
procedure TexParameteri(target: TGLenum; pname: TGLenum; param: TGLint); cdecl; external libgstgl;
procedure TexParameteriv(target: TGLenum; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GetTexParameterfv(target: TGLenum; pname: TGLenum; params: PGLfloat); cdecl; external libgstgl;
procedure GetTexParameteriv(target: TGLenum; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure TexSubImage2D(target: TGLenum; level: TGLint; xoffset: TGLint; yoffset: TGLint; Width: TGLsizei;
  Height: TGLsizei; format: TGLenum; _type: TGLenum; pixels: PGLvoid); cdecl; external libgstgl;
procedure CopyTexImage2D(target: TGLenum; level: TGLint; internalformat: TGLenum; x: TGLint; y: TGLint;
  Width: TGLsizei; Height: TGLsizei; border: TGLint); cdecl; external libgstgl;
procedure Viewport(x: TGLint; y: TGLint; Width: TGLsizei; Height: TGLsizei); cdecl; external libgstgl;
function IsEnabled(cap: TGLenum): TGLboolean; cdecl; external libgstgl;
procedure LineWidth(Width: TGLfloat); cdecl; external libgstgl;
procedure PolygonOffset(factor: TGLfloat; units: TGLfloat); cdecl; external libgstgl;
procedure TexParameterf(target: TGLenum; pname: TGLenum; param: TGLfloat); cdecl; external libgstgl;
procedure TexImage3D(target: TGLenum; level: TGLint; internalFormat: TGLint; Width: TGLsizei; Height: TGLsizei;
  depth: TGLsizei; border: TGLint; format: TGLenum; _type: TGLenum; pixels: PGLvoid); cdecl; external libgstgl;
procedure TexSubImage3D(target: TGLenum; level: TGLint; xoffset: TGLint; yoffset: TGLint; zoffset: TGLint;
  Width: TGLsizei; Height: TGLsizei; depth: TGLsizei; format: TGLenum; _type: TGLenum;
  pixels: PGLvoid); cdecl; external libgstgl;
procedure CompressedTexImage2D(target: TGLenum; level: TGLint; internalformat: TGLenum; Width: TGLsizei; Height: TGLsizei;
  border: TGLint; imageSize: TGLsizei; Data: PGLvoid); cdecl; external libgstgl;
procedure CompressedTexSubImage2D(target: TGLenum; level: TGLint; xoffset: TGLint; yoffset: TGLint; Width: TGLsizei;
  Height: TGLsizei; format: TGLenum; imageSize: TGLsizei; Data: PGLvoid); cdecl; external libgstgl;
procedure SampleCoverage(Value: TGLclampf; invert: TGLboolean); cdecl; external libgstgl;
procedure GetBufferParameteriv(target: TGLenum; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GenBuffers(n: TGLsizei; buffers: PGLuint); cdecl; external libgstgl;
procedure BindBuffer(target: TGLenum; buffer: TGLuint); cdecl; external libgstgl;
procedure BufferData(target: TGLenum; size: TGLsizeiptr; Data: PGLvoid; usage: TGLenum); cdecl; external libgstgl;
procedure BufferSubData(target: TGLenum; offset: TGLintptr; size: TGLsizeiptr; Data: PGLvoid); cdecl; external libgstgl;
procedure DeleteBuffers(n: TGLsizei; buffers: PGLuint); cdecl; external libgstgl;
function IsBuffer(buffer: TGLuint): TGLboolean; cdecl; external libgstgl;
procedure ActiveTexture(texture: TGLenum); cdecl; external libgstgl;
function MapBuffer(target: TGLenum; access: TGLenum): pointer; cdecl; external libgstgl;
function UnmapBuffer(target: TGLenum): TGLboolean; cdecl; external libgstgl;
function GetStringi(Name: TGLenum; index: TGLint): PGLubyte; cdecl; external libgstgl;
function MapBufferRange(target: TGLenum; offset: TGLintptr; length: TGLsizeiptr; access: TGLbitfield): pointer; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 17:17:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
