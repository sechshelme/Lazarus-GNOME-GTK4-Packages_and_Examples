unit Shader;

interface

uses
  fp_sfml, Config, InputStream, Color, Vector2, Vector3, Transform, Glsl, Graphics_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function sfShader_createFromFile(vertexShaderFilename: pchar; geometryShaderFilename: pchar; fragmentShaderFilename: pchar): PsfShader; cdecl; external libsfml_graphics;
function sfShader_createFromMemory(vertexShader: pchar; geometryShader: pchar; fragmentShader: pchar): PsfShader; cdecl; external libsfml_graphics;
function sfShader_createFromStream(vertexShaderStream: PsfInputStream; geometryShaderStream: PsfInputStream; fragmentShaderStream: PsfInputStream): PsfShader; cdecl; external libsfml_graphics;
procedure sfShader_destroy(shader: PsfShader); cdecl; external libsfml_graphics;
procedure sfShader_setFloatUniform(shader: PsfShader; name: pchar; x: single); cdecl; external libsfml_graphics;
procedure sfShader_setVec2Uniform(shader: PsfShader; name: pchar; vector: TsfGlslVec2); cdecl; external libsfml_graphics;
procedure sfShader_setVec3Uniform(shader: PsfShader; name: pchar; vector: TsfGlslVec3); cdecl; external libsfml_graphics;
procedure sfShader_setVec4Uniform(shader: PsfShader; name: pchar; vector: TsfGlslVec4); cdecl; external libsfml_graphics;
procedure sfShader_setColorUniform(shader: PsfShader; name: pchar; color: TsfColor); cdecl; external libsfml_graphics;
procedure sfShader_setIntUniform(shader: PsfShader; name: pchar; x: longint); cdecl; external libsfml_graphics;
procedure sfShader_setIvec2Uniform(shader: PsfShader; name: pchar; vector: TsfGlslIvec2); cdecl; external libsfml_graphics;
procedure sfShader_setIvec3Uniform(shader: PsfShader; name: pchar; vector: TsfGlslIvec3); cdecl; external libsfml_graphics;
procedure sfShader_setIvec4Uniform(shader: PsfShader; name: pchar; vector: TsfGlslIvec4); cdecl; external libsfml_graphics;
procedure sfShader_setIntColorUniform(shader: PsfShader; name: pchar; color: TsfColor); cdecl; external libsfml_graphics;
procedure sfShader_setBoolUniform(shader: PsfShader; name: pchar; x: TsfBool); cdecl; external libsfml_graphics;
procedure sfShader_setBvec2Uniform(shader: PsfShader; name: pchar; vector: TsfGlslBvec2); cdecl; external libsfml_graphics;
procedure sfShader_setBvec3Uniform(shader: PsfShader; name: pchar; vector: TsfGlslBvec3); cdecl; external libsfml_graphics;
procedure sfShader_setBvec4Uniform(shader: PsfShader; name: pchar; vector: TsfGlslBvec4); cdecl; external libsfml_graphics;
procedure sfShader_setMat3Uniform(shader: PsfShader; name: pchar; matrix: PsfGlslMat3); cdecl; external libsfml_graphics;
procedure sfShader_setMat4Uniform(shader: PsfShader; name: pchar; matrix: PsfGlslMat4); cdecl; external libsfml_graphics;
procedure sfShader_setTextureUniform(shader: PsfShader; name: pchar; texture: PsfTexture); cdecl; external libsfml_graphics;
procedure sfShader_setCurrentTextureUniform(shader: PsfShader; name: pchar); cdecl; external libsfml_graphics;
procedure sfShader_setFloatUniformArray(shader: PsfShader; name: pchar; scalarArray: Psingle; length: Tsize_t); cdecl; external libsfml_graphics;
procedure sfShader_setVec2UniformArray(shader: PsfShader; name: pchar; vectorArray: PsfGlslVec2; length: Tsize_t); cdecl; external libsfml_graphics;
procedure sfShader_setVec3UniformArray(shader: PsfShader; name: pchar; vectorArray: PsfGlslVec3; length: Tsize_t); cdecl; external libsfml_graphics;
procedure sfShader_setVec4UniformArray(shader: PsfShader; name: pchar; vectorArray: PsfGlslVec4; length: Tsize_t); cdecl; external libsfml_graphics;
procedure sfShader_setMat3UniformArray(shader: PsfShader; name: pchar; matrixArray: PsfGlslMat3; length: Tsize_t); cdecl; external libsfml_graphics;
procedure sfShader_setMat4UniformArray(shader: PsfShader; name: pchar; matrixArray: PsfGlslMat4; length: Tsize_t); cdecl; external libsfml_graphics;
procedure sfShader_setFloatParameter(shader: PsfShader; name: pchar; x: single); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setFloat2Parameter(shader: PsfShader; name: pchar; x: single; y: single); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setFloat3Parameter(shader: PsfShader; name: pchar; x: single; y: single; z: single); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setFloat4Parameter(shader: PsfShader; name: pchar; x: single; y: single; z: single; w: single); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setVector2Parameter(shader: PsfShader; name: pchar; vector: TsfVector2f); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setVector3Parameter(shader: PsfShader; name: pchar; vector: TsfVector3f); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setColorParameter(shader: PsfShader; name: pchar; color: TsfColor); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setTransformParameter(shader: PsfShader; name: pchar; transform: TsfTransform); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setTextureParameter(shader: PsfShader; name: pchar; texture: PsfTexture); cdecl; external libsfml_graphics; deprecated;
procedure sfShader_setCurrentTextureParameter(shader: PsfShader; name: pchar); cdecl; external libsfml_graphics; deprecated;
function sfShader_getNativeHandle(shader: PsfShader): dword; cdecl; external libsfml_graphics;
procedure sfShader_bind(shader: PsfShader); cdecl; external libsfml_graphics;
function sfShader_isAvailable: TsfBool; cdecl; external libsfml_graphics;
function sfShader_isGeometryAvailable: TsfBool; cdecl; external libsfml_graphics;

// === Konventiert am: 24-9-25 16:55:07 ===


implementation



end.
