
unit types;
interface

{
  Automatically converted by H2Pas 1.0.0 from types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    types.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pivec2  = ^ivec2;
Pivec3  = ^ivec3;
Pivec4  = ^ivec4;
Pmat2  = ^mat2;
Pmat2x3  = ^mat2x3;
Pmat2x4  = ^mat2x4;
Pmat3  = ^mat3;
Pmat3x2  = ^mat3x2;
Pmat3x4  = ^mat3x4;
Pmat4  = ^mat4;
Pmat4x2  = ^mat4x2;
Pmat4x3  = ^mat4x3;
Pvec2  = ^vec2;
Pvec3  = ^vec3;
Pvec4  = ^vec4;
Pversor  = ^versor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglm_types_h}
{$define cglm_types_h}
type
  Pivec2 = ^Tivec2;
  Tivec2 = array[0..1] of longint;

  Pivec3 = ^Tivec3;
  Tivec3 = array[0..2] of longint;

  Pivec4 = ^Tivec4;
  Tivec4 = array[0..3] of longint;

  Pvec2 = ^Tvec2;
  Tvec2 = array[0..1] of single;

  Pvec3 = ^Tvec3;
  Tvec3 = array[0..2] of single;

  Pvec4 = ^Tvec4;
  Tvec4 = array[0..3] of single;

  Pversor = ^Tversor;
  Tversor = Tvec4;
{ |x, y, z, w| -> w is the last  }

  Pmat3 = ^Tmat3;
  Tmat3 = array[0..2] of Tvec3;

  Pmat3x2 = ^Tmat3x2;
  Tmat3x2 = array[0..2] of Tvec2;
{ [col (3), row (2)]  }

  Pmat3x4 = ^Tmat3x4;
  Tmat3x4 = array[0..2] of Tvec4;
{ [col (3), row (4)]  }

  Pmat2 = ^Tmat2;
  Tmat2 = array[0..1] of Tvec2;

  Pmat2x3 = ^Tmat2x3;
  Tmat2x3 = array[0..1] of Tvec3;
{ [col (2), row (3)]  }

  Pmat2x4 = ^Tmat2x4;
  Tmat2x4 = array[0..1] of Tvec4;
{ [col (2), row (4)]  }

  Pmat4 = ^Tmat4;
  Tmat4 = array[0..3] of Tvec4;

  Pmat4x2 = ^Tmat4x2;
  Tmat4x2 = array[0..3] of Tvec2;
{ [col (4), row (2)]  }

  Pmat4x3 = ^Tmat4x3;
  Tmat4x3 = array[0..3] of Tvec3;
{ [col (4), row (3)]  }
{
  Important: cglm stores quaternion as [x, y, z, w] in memory since v0.4.0 
  it was [w, x, y, z] before v0.4.0 ( v0.3.5 and earlier ). w is real part.
 }
{ e            }

const
  GLM_E = 2.71828182845904523536028747135266250;  
{ log2(e)      }
  GLM_LOG2E = 1.44269504088896340735992468100189214;  
{ log10(e)     }
  GLM_LOG10E = 0.434294481903251827651128918916605082;  
{ loge(2)      }
  GLM_LN2 = 0.693147180559945309417232121458176568;  
{ loge(10)     }
  GLM_LN10 = 2.30258509299404568401799145468436421;  
{ pi           }
  GLM_PI = 3.14159265358979323846264338327950288;  
{ pi/2         }
  GLM_PI_2 = 1.57079632679489661923132169163975144;  
{ pi/4         }
  GLM_PI_4 = 0.785398163397448309615660845819875721;  
{ 1/pi         }
  GLM_1_PI = 0.318309886183790671537767526745028724;  
{ 2/pi         }
  GLM_2_PI = 0.636619772367581343075535053490057448;  
{ 2/sqrt(pi)   }
  GLM_2_SQRTPI = 1.12837916709551257389615890312154517;  
{ sqrt(2)      }
  GLM_SQRT2 = 1.41421356237309504880168872420969808;  
{ 1/sqrt(2)    }
  GLM_SQRT1_2 = 0.707106781186547524400844362104849039;  

{ was #define dname def_expr }
function GLM_Ef : single;  

{ was #define dname def_expr }
function GLM_LOG2Ef : single;  

{ was #define dname def_expr }
function GLM_LOG10Ef : single;  

{ was #define dname def_expr }
function GLM_LN2f : single;  

{ was #define dname def_expr }
function GLM_LN10f : single;  

{ was #define dname def_expr }
function GLM_PIf : single;  

{ was #define dname def_expr }
function GLM_PI_2f : single;  

{ was #define dname def_expr }
function GLM_PI_4f : single;  

{ was #define dname def_expr }
function GLM_1_PIf : single;  

{ was #define dname def_expr }
function GLM_2_PIf : single;  

{ was #define dname def_expr }
function GLM_2_SQRTPIf : single;  

{ was #define dname def_expr }
function GLM_SQRT2f : single;  

{ was #define dname def_expr }
function GLM_SQRT1_2f : single;  

{ DEPRECATED! use GLM_PI and friends  }
const
  CGLM_PI = GLM_PIf;  
  CGLM_PI_2 = GLM_PI_2f;  
  CGLM_PI_4 = GLM_PI_4f;  
{$endif}
{ cglm_types_h  }

implementation

{ was #define dname def_expr }
function GLM_Ef : single;
  begin
    GLM_Ef:=single(GLM_E);
  end;

{ was #define dname def_expr }
function GLM_LOG2Ef : single;
  begin
    GLM_LOG2Ef:=single(GLM_LOG2E);
  end;

{ was #define dname def_expr }
function GLM_LOG10Ef : single;
  begin
    GLM_LOG10Ef:=single(GLM_LOG10E);
  end;

{ was #define dname def_expr }
function GLM_LN2f : single;
  begin
    GLM_LN2f:=single(GLM_LN2);
  end;

{ was #define dname def_expr }
function GLM_LN10f : single;
  begin
    GLM_LN10f:=single(GLM_LN10);
  end;

{ was #define dname def_expr }
function GLM_PIf : single;
  begin
    GLM_PIf:=single(GLM_PI);
  end;

{ was #define dname def_expr }
function GLM_PI_2f : single;
  begin
    GLM_PI_2f:=single(GLM_PI_2);
  end;

{ was #define dname def_expr }
function GLM_PI_4f : single;
  begin
    GLM_PI_4f:=single(GLM_PI_4);
  end;

{ was #define dname def_expr }
function GLM_1_PIf : single;
  begin
    GLM_1_PIf:=single(GLM_1_PI);
  end;

{ was #define dname def_expr }
function GLM_2_PIf : single;
  begin
    GLM_2_PIf:=single(GLM_2_PI);
  end;

{ was #define dname def_expr }
function GLM_2_SQRTPIf : single;
  begin
    GLM_2_SQRTPIf:=single(GLM_2_SQRTPI);
  end;

{ was #define dname def_expr }
function GLM_SQRT2f : single;
  begin
    GLM_SQRT2f:=single(GLM_SQRT2);
  end;

{ was #define dname def_expr }
function GLM_SQRT1_2f : single;
  begin
    GLM_SQRT1_2f:=single(GLM_SQRT1_2);
  end;


end.
