
{$IFDEF read_interface}

function CreateProgram: TGLuint; cdecl; external libgstgl;
function CreateShader(shaderType: TGLenum): TGLuint; cdecl; external libgstgl;
procedure DeleteShader(shader: TGLuint); cdecl; external libgstgl;
procedure AttachShader(prog: TGLuint; shader: TGLuint); cdecl; external libgstgl;
procedure UseProgram(prog: TGLuint); cdecl; external libgstgl;
procedure DeleteProgram(prog: TGLuint); cdecl; external libgstgl;
procedure GetShaderInfoLog(shader: TGLuint; maxLength: TGLsizei; length: PGLsizei; infoLog: pansichar); cdecl; external libgstgl;
procedure GetProgramInfoLog(prom: TGLuint; bufSize: TGLsizei; length: PGLsizei; infoLog: pansichar); cdecl; external libgstgl;
procedure GetShaderiv(shader: TGLuint; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GetProgramiv(prog: TGLuint; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure DetachShader(prog: TGLuint; shader: TGLuint); cdecl; external libgstgl;
procedure GetAttachedShaders(prog: TGLuint; maxcount: TGLsizei; Count: PGLsizei; shaders: PGLuint); cdecl; external libgstgl;
function IsShader(shader: TGLuint): TGLboolean; cdecl; external libgstgl;
function IsProgram(prog: TGLuint): TGLboolean; cdecl; external libgstgl;
procedure ShaderSource(shader: TGLuint; Count: TGLsizei; _string: PPansichar; length: PGLint); cdecl; external libgstgl;
procedure CompileShader(shader: TGLuint); cdecl; external libgstgl;
procedure LinkProgram(prog: TGLuint); cdecl; external libgstgl;
function GetUniformLocation(prog: TGLuint; Name: pansichar): TGLint; cdecl; external libgstgl;
procedure Uniform1f(location: TGLint; v0: TGLfloat); cdecl; external libgstgl;
procedure Uniform2f(location: TGLint; v0: TGLfloat; v1: TGLfloat); cdecl; external libgstgl;
procedure Uniform3f(location: TGLint; v0: TGLfloat; v1: TGLfloat; v2: TGLfloat); cdecl; external libgstgl;
procedure Uniform4f(location: TGLint; v0: TGLfloat; v1: TGLfloat; v2: TGLfloat; v3: TGLfloat); cdecl; external libgstgl;
procedure Uniform1fv(location: TGLint; Count: TGLsizei; Value: PGLfloat); cdecl; external libgstgl;
procedure Uniform2fv(location: TGLint; Count: TGLsizei; Value: PGLfloat); cdecl; external libgstgl;
procedure Uniform3fv(location: TGLint; Count: TGLsizei; Value: PGLfloat); cdecl; external libgstgl;
procedure Uniform4fv(location: TGLint; Count: TGLsizei; Value: PGLfloat); cdecl; external libgstgl;
procedure Uniform1i(location: TGLint; v0: TGLint); cdecl; external libgstgl;
procedure Uniform2i(location: TGLint; v0: TGLint; v1: TGLint); cdecl; external libgstgl;
procedure Uniform3i(location: TGLint; v0: TGLint; v1: TGLint; v2: TGLint); cdecl; external libgstgl;
procedure Uniform4i(location: TGLint; v0: TGLint; v1: TGLint; v2: TGLint; v3: TGLint); cdecl; external libgstgl;
procedure Uniform1iv(location: TGLint; Count: TGLsizei; Value: PGLint); cdecl; external libgstgl;
procedure Uniform2iv(location: TGLint; Count: TGLsizei; Value: PGLint); cdecl; external libgstgl;
procedure Uniform3iv(location: TGLint; Count: TGLsizei; Value: PGLint); cdecl; external libgstgl;
procedure Uniform4iv(location: TGLint; Count: TGLsizei; Value: PGLint); cdecl; external libgstgl;
procedure UniformMatrix2fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix3fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix4fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure GetUniformfv(prog: TGLuint; location: TGLint; params: PGLfloat); cdecl; external libgstgl;
procedure GetUniformiv(prog: TGLuint; location: TGLint; params: PGLint); cdecl; external libgstgl;
procedure GetActiveUniform(prog: TGLuint; index: TGLuint; bufsize: TGLsizei; length: PGLsizei; size: PGLint;
  _type: PGLenum; Name: PGLchar); cdecl; external libgstgl;
procedure GetShaderSource(shader: TGLuint; bufsize: TGLsizei; length: PGLsizei; Source: PGLchar); cdecl; external libgstgl;
procedure ValidateProgram(prog: TGLuint); cdecl; external libgstgl;
procedure VertexAttribPointer(index: TGLuint; size: TGLint; _type: TGLenum; normalized: TGLboolean; stride: TGLsizei;
  pointer: PGLvoid); cdecl; external libgstgl;
procedure EnableVertexAttribArray(index: TGLuint); cdecl; external libgstgl;
procedure DisableVertexAttribArray(index: TGLuint); cdecl; external libgstgl;
procedure VertexAttrib1f(indx: TGLuint; x: TGLfloat); cdecl; external libgstgl;
procedure VertexAttrib1fv(indx: TGLuint; values: PGLfloat); cdecl; external libgstgl;
procedure VertexAttrib2f(indx: TGLuint; x: TGLfloat; y: TGLfloat); cdecl; external libgstgl;
procedure VertexAttrib2fv(indx: TGLuint; values: PGLfloat); cdecl; external libgstgl;
procedure VertexAttrib3f(indx: TGLuint; x: TGLfloat; y: TGLfloat; z: TGLfloat); cdecl; external libgstgl;
procedure VertexAttrib3fv(indx: TGLuint; values: PGLfloat); cdecl; external libgstgl;
procedure VertexAttrib4f(index: TGLuint; x: TGLfloat; y: TGLfloat; z: TGLfloat; w: TGLfloat); cdecl; external libgstgl;
procedure VertexAttrib4fv(indx: TGLuint; values: PGLfloat); cdecl; external libgstgl;
procedure GetVertexAttribfv(index: TGLuint; pname: TGLenum; params: PGLfloat); cdecl; external libgstgl;
procedure GetVertexAttribiv(index: TGLuint; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure GetVertexAttribPointerv(index: TGLuint; pname: TGLenum; pointer: PPGLvoid); cdecl; external libgstgl;
function GetAttribLocation(prog: TGLuint; Name: pansichar): TGLint; cdecl; external libgstgl;
procedure BindAttribLocation(prog: TGLuint; index: TGLuint; Name: PGLchar); cdecl; external libgstgl;
procedure GetActiveAttrib(prog: TGLuint; index: TGLuint; bufsize: TGLsizei; length: PGLsizei; size: PGLint;
  _type: PGLenum; Name: PGLchar); cdecl; external libgstgl;
function CreateprogObject: TGLuint; cdecl; external libgstgl;
function CreateShaderObject(shaderType: TGLenum): TGLuint; cdecl; external libgstgl;
procedure DeleteObject(obj: TGLuint); cdecl; external libgstgl;
procedure AttachObject(container: TGLuint; obj: TGLuint); cdecl; external libgstgl;
procedure UseprogObject(progObj: TGLuint); cdecl; external libgstgl;
procedure GetInfoLog(obj: TGLuint; maxLength: TGLsizei; length: PGLsizei; infoLog: pansichar); cdecl; external libgstgl;
procedure GetObjectParameteriv(obj: TGLuint; pname: TGLenum; params: PGLint); cdecl; external libgstgl;
procedure DetachObject(container: TGLuint; obj: TGLuint); cdecl; external libgstgl;
procedure GetAttachedObjects(prog: TGLuint; maxcount: TGLsizei; Count: PGLsizei; shaders: PGLuint); cdecl; external libgstgl;
procedure Genprogs(n: TGLsizei; progs: PGLuint); cdecl; external libgstgl;
procedure Deleteprogs(n: TGLsizei; progs: PGLuint); cdecl; external libgstgl;
procedure Bindprog(target: TGLenum; prog: TGLuint); cdecl; external libgstgl;
procedure progString(target: TGLenum; format: TGLenum; len: TGLsizei; prog: pointer); cdecl; external libgstgl;
procedure progLocalParameter4fv(target: TGLenum; index: TGLuint; params: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix2x3fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix3x2fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix2x4fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix4x2fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix3x4fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure UniformMatrix4x3fv(location: TGLint; Count: TGLsizei; transpose: TGLboolean; Value: PGLfloat); cdecl; external libgstgl;
procedure BindFragDataLocation(prog: TGLuint; index: TGLuint; Name: PGLchar); cdecl; external libgstgl;


// === Konventiert am: 9-10-24 17:18:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
