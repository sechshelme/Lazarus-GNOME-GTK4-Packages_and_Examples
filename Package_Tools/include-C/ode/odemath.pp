
unit odemath;
interface

{
  Automatically converted by H2Pas 1.0.0 from odemath.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    odemath.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{$ifndef _ODE_ODEMATH_H_}
{$define _ODE_ODEMATH_H_}
{$include <ode/common.h>}
{
 * macro to access elements i,j in an NxM matrix A, independent of the
 * matrix storage convention.
  }
(* error 
#define dACCESS33(A,i,j) ((A)[(i)*4+(j)])
in define line 32 *)
    {
     * Macro to test for valid floating point values
      }
(* error 
#define dVALIDVEC3(v) (!(dIsNan(v[0]) || dIsNan(v[1]) || dIsNan(v[2])))
in define line 37 *)
(* error 
#define dVALIDVEC4(v) (!(dIsNan(v[0]) || dIsNan(v[1]) || dIsNan(v[2]) || dIsNan(v[3])))
in define line 38 *)
(* error 
#define dVALIDMAT3(m) (!(dIsNan(m[0]) || dIsNan(m[1]) || dIsNan(m[2]) || dIsNan(m[3]) || dIsNan(m[4]) || dIsNan(m[5]) || dIsNan(m[6]) || dIsNan(m[7]) || dIsNan(m[8]) || dIsNan(m[9]) || dIsNan(m[10]) || dIsNan(m[11])))
in define line 39 *)
(* error 
#define dVALIDMAT4(m) (!(dIsNan(m[0]) || dIsNan(m[1]) || dIsNan(m[2]) || dIsNan(m[3]) || dIsNan(m[4]) || dIsNan(m[5]) || dIsNan(m[6]) || dIsNan(m[7]) || dIsNan(m[8]) || dIsNan(m[9]) || dIsNan(m[10]) || dIsNan(m[11]) || dIsNan(m[12]) || dIsNan(m[13]) || dIsNan(m[14]) || dIsNan(m[15]) ))
in define line 40 *)
(* error 
ODE_PURE_INLINE void dZeroVector3(dVector3 res)
in declaration at line 45 *)
(* error 
    res[dV3E_Y] = REAL(0.0);
in declaration at line 46 *)
(* error 
    res[dV3E_Z] = REAL(0.0);
in declaration at line 47 *)
(* error 
}
in declaration at line 52 *)
(* error 
    res[dV3E_Y] = y;
in declaration at line 53 *)
(* error 
    res[dV3E_Z] = z;
in declaration at line 54 *)
(* error 
}
in declaration at line 59 *)
(* error 
    res[dM3E_XX] = REAL(0.0); res[dM3E_XY] = REAL(0.0); res[dM3E_XZ] = REAL(0.0);
in declaration at line 59 *)
(* error 
    res[dM3E_XX] = REAL(0.0); res[dM3E_XY] = REAL(0.0); res[dM3E_XZ] = REAL(0.0);
in declaration at line 59 *)
(* error 
    res[dM3E_YX] = REAL(0.0); res[dM3E_YY] = REAL(0.0); res[dM3E_YZ] = REAL(0.0);
in declaration at line 60 *)
(* error 
    res[dM3E_YX] = REAL(0.0); res[dM3E_YY] = REAL(0.0); res[dM3E_YZ] = REAL(0.0);
in declaration at line 60 *)
(* error 
    res[dM3E_YX] = REAL(0.0); res[dM3E_YY] = REAL(0.0); res[dM3E_YZ] = REAL(0.0);
in declaration at line 60 *)
(* error 
    res[dM3E_ZX] = REAL(0.0); res[dM3E_ZY] = REAL(0.0); res[dM3E_ZZ] = REAL(0.0);
in declaration at line 61 *)
(* error 
    res[dM3E_ZX] = REAL(0.0); res[dM3E_ZY] = REAL(0.0); res[dM3E_ZZ] = REAL(0.0);
in declaration at line 61 *)
(* error 
    res[dM3E_ZX] = REAL(0.0); res[dM3E_ZY] = REAL(0.0); res[dM3E_ZZ] = REAL(0.0);
in declaration at line 61 *)
(* error 
}
in declaration at line 66 *)
(* error 
    res[dM4E_XX] = REAL(0.0); res[dM4E_XY] = REAL(0.0); res[dM4E_XZ] = REAL(0.0); res[dM4E_XO] = REAL(0.0);
in declaration at line 66 *)
(* error 
    res[dM4E_XX] = REAL(0.0); res[dM4E_XY] = REAL(0.0); res[dM4E_XZ] = REAL(0.0); res[dM4E_XO] = REAL(0.0);
in declaration at line 66 *)
(* error 
    res[dM4E_XX] = REAL(0.0); res[dM4E_XY] = REAL(0.0); res[dM4E_XZ] = REAL(0.0); res[dM4E_XO] = REAL(0.0);
in declaration at line 66 *)
(* error 
    res[dM4E_YX] = REAL(0.0); res[dM4E_YY] = REAL(0.0); res[dM4E_YZ] = REAL(0.0); res[dM4E_YO] = REAL(0.0);
in declaration at line 67 *)
(* error 
    res[dM4E_YX] = REAL(0.0); res[dM4E_YY] = REAL(0.0); res[dM4E_YZ] = REAL(0.0); res[dM4E_YO] = REAL(0.0);
in declaration at line 67 *)
(* error 
    res[dM4E_YX] = REAL(0.0); res[dM4E_YY] = REAL(0.0); res[dM4E_YZ] = REAL(0.0); res[dM4E_YO] = REAL(0.0);
in declaration at line 67 *)
(* error 
    res[dM4E_YX] = REAL(0.0); res[dM4E_YY] = REAL(0.0); res[dM4E_YZ] = REAL(0.0); res[dM4E_YO] = REAL(0.0);
in declaration at line 67 *)
(* error 
    res[dM4E_ZX] = REAL(0.0); res[dM4E_ZY] = REAL(0.0); res[dM4E_ZZ] = REAL(0.0); res[dM4E_ZO] = REAL(0.0);
in declaration at line 68 *)
(* error 
    res[dM4E_ZX] = REAL(0.0); res[dM4E_ZY] = REAL(0.0); res[dM4E_ZZ] = REAL(0.0); res[dM4E_ZO] = REAL(0.0);
in declaration at line 68 *)
(* error 
    res[dM4E_ZX] = REAL(0.0); res[dM4E_ZY] = REAL(0.0); res[dM4E_ZZ] = REAL(0.0); res[dM4E_ZO] = REAL(0.0);
in declaration at line 68 *)
(* error 
    res[dM4E_ZX] = REAL(0.0); res[dM4E_ZY] = REAL(0.0); res[dM4E_ZZ] = REAL(0.0); res[dM4E_ZO] = REAL(0.0);
in declaration at line 68 *)
(* error 
    res[dM4E_OX] = REAL(0.0); res[dM4E_OY] = REAL(0.0); res[dM4E_OZ] = REAL(0.0); res[dM4E_OO] = REAL(0.0);
in declaration at line 69 *)
(* error 
    res[dM4E_OX] = REAL(0.0); res[dM4E_OY] = REAL(0.0); res[dM4E_OZ] = REAL(0.0); res[dM4E_OO] = REAL(0.0);
in declaration at line 69 *)
(* error 
    res[dM4E_OX] = REAL(0.0); res[dM4E_OY] = REAL(0.0); res[dM4E_OZ] = REAL(0.0); res[dM4E_OO] = REAL(0.0);
in declaration at line 69 *)
(* error 
    res[dM4E_OX] = REAL(0.0); res[dM4E_OY] = REAL(0.0); res[dM4E_OZ] = REAL(0.0); res[dM4E_OO] = REAL(0.0);
in declaration at line 69 *)
(* error 
}
    { Some vector math  }
in declaration at line 75 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[1] + b[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[2] + b[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 79 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 79 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 79 *)
(* error 
}
in declaration at line 84 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[1] - b[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[2] - b[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 88 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 88 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 88 *)
(* error 
}
in declaration at line 93 *)
(* Const before type ignored *)
(* error 
    const dReal res_1 = a[1] + b_scale * b[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
    const dReal res_2 = a[2] + b_scale * b[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
    res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 97 *)
(* error 
    res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 97 *)
(* error 
    res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 97 *)
(* error 
}
in declaration at line 102 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a_scale * a[1] + b_scale * b[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a_scale * a[2] + b_scale * b[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 106 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 106 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 106 *)
(* error 
}
in declaration at line 111 *)
(* Const before type ignored *)
(* error 
    const dReal res_1 = a_scale * a[1] + b_scale * b[1] + c_scale * c[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
    const dReal res_2 = a_scale * a[2] + b_scale * b[2] + c_scale * c[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
    res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 115 *)
(* error 
    res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 115 *)
(* error 
    res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 115 *)
(* error 
}
in declaration at line 120 *)
(* error 
  res[1] *= nScale ;
in declaration at line 121 *)
(* error 
  res[2] *= nScale ;
in declaration at line 122 *)
(* error 
}
in declaration at line 127 *)
(* error 
  res[1] = -res[1];
in declaration at line 128 *)
(* error 
  res[2] = -res[2];
in declaration at line 129 *)
(* error 
}
in declaration at line 134 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 138 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 138 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 138 *)
(* error 
}
in declaration at line 143 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[1] * nScale;
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[2] * nScale;
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 147 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 147 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 147 *)
(* error 
}
in declaration at line 152 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = -a[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = -a[2];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 156 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 156 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 156 *)
(* error 
}
in declaration at line 161 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[1];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[2];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_3 = a[3];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2; res[3] = res_3;
in declaration at line 166 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2; res[3] = res_3;
in declaration at line 166 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2; res[3] = res_3;
in declaration at line 166 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2; res[3] = res_3;
in declaration at line 166 *)
(* error 
}
in declaration at line 171 *)
(* error 
  dCopyVector4(res + 4, a + 4);
(* error 
  dCopyVector4(res + 4, a + 4);
 in declarator_list *)
 in declarator_list *)
(* error 
  dCopyVector4(res + 8, a + 8);
(* error 
  dCopyVector4(res + 8, a + 8);
 in declarator_list *)
 in declarator_list *)
(* error 
}
in declaration at line 178 *)
(* error 
  dCopyVector3(res + 4, a + 4);
(* error 
  dCopyVector3(res + 4, a + 4);
 in declarator_list *)
 in declarator_list *)
(* error 
  dCopyVector3(res + 8, a + 8);
(* error 
  dCopyVector3(res + 8, a + 8);
 in declarator_list *)
 in declarator_list *)
(* error 
}
in declaration at line 185 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[n + 4];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[n + 8];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 189 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 189 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 189 *)
(* error 
}
in declaration at line 194 *)
(* error 
}
in declaration at line 199 *)
(* error 
}
in declaration at line 204 *)
(* error 
}
    {
    * 3-way dot product. _dCalcVectorDot3 means that elements of `a' and `b' are spaced
    * step_a and step_b indexes apart respectively. dCalcVectorDot3() means dDot311.
     }
in declaration at line 215 *)
(* error 
}
in declaration at line 219 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3    (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,1,1); }
in declaration at line 220 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3_13 (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,1,3); }
in declaration at line 221 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3_31 (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,3,1); }
in declaration at line 222 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3_33 (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,3,3); }
in declaration at line 223 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3_14 (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,1,4); }
in declaration at line 224 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3_41 (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,4,1); }
in declaration at line 225 *)
(* error 
ODE_PURE_INLINE dReal dCalcVectorDot3_44 (const dReal *a, const dReal *b) { return _dCalcVectorDot3(a,b,4,4); }
    {
     * cross product, set res = a x b. _dCalcVectorCross3 means that elements of `res', `a'
     * and `b' are spaced step_res, step_a and step_b indexes apart respectively.
     * dCalcVectorCross3() means dCross3111. 
      }
in declaration at line 236 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = a[2*step_a]*b[       0] - a[       0]*b[2*step_b];
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = a[       0]*b[  step_b] - a[  step_a]*b[       0];
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[         0] = res_0;
in declaration at line 240 *)
(* error 
  res[  step_res] = res_1;
in declaration at line 241 *)
(* error 
  res[2*step_res] = res_2;
in declaration at line 242 *)
(* error 
}
in declaration at line 245 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3    (dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 1, 1, 1); }
in declaration at line 246 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_114(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 1, 1, 4); }
in declaration at line 247 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_141(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 1, 4, 1); }
in declaration at line 248 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_144(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 1, 4, 4); }
in declaration at line 249 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_411(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 4, 1, 1); }
in declaration at line 250 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_414(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 4, 1, 4); }
in declaration at line 251 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_441(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 4, 4, 1); }
in declaration at line 252 *)
(* error 
ODE_PURE_INLINE void dCalcVectorCross3_444(dReal *res, const dReal *a, const dReal *b) { _dCalcVectorCross3(res, a, b, 4, 4, 4); }
in declaration at line 256 *)
(* error 
  dCalcVectorCross3(tmp, a, b);
 in declarator_list *)
(* error 
  dCalcVectorCross3(tmp, a, b);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
}
in declaration at line 263 *)
(* error 
  dCalcVectorCross3(tmp, a, b);
 in declarator_list *)
(* error 
  dCalcVectorCross3(tmp, a, b);
 in declarator_list *)
(* error 
  dSubtractVectors3(res, res, tmp);
 in declarator_list *)
(* error 
  dSubtractVectors3(res, res, tmp);
 in declarator_list *)
(* error 
}
    {
     * set a 3x3 submatrix of A to a matrix such that submatrix(A)*b = a x b.
     * A is stored by rows, and has `skip' elements per row. the matrix is
     * assumed to be already zero, so this does not write zero elements!
     * if (plus,minus) is (+,-) then a positive version will be written.
     * if (plus,minus) is (-,+) then a negative version will be written.
      }
in declaration at line 279 *)
(* error 
  res[1] = -a_2;
in declaration at line 280 *)
(* error 
  res[2] = +a_1;
in declaration at line 281 *)
(* error 
  res[skip+0] = +a_2;
in declaration at line 282 *)
(* error 
  res[skip+2] = -a_0;
in declaration at line 283 *)
(* error 
  res[2*skip+0] = -a_1;
in declaration at line 284 *)
(* error 
  res[2*skip+1] = +a_0;
in declaration at line 285 *)
(* error 
}
in declaration at line 290 *)
(* error 
  res[1] = +a_2;
in declaration at line 291 *)
(* error 
  res[2] = -a_1;
in declaration at line 292 *)
(* error 
  res[skip+0] = -a_2;
in declaration at line 293 *)
(* error 
  res[skip+2] = +a_0;
in declaration at line 294 *)
(* error 
  res[2*skip+0] = +a_1;
in declaration at line 295 *)
(* error 
  res[2*skip+1] = -a_0;
in declaration at line 296 *)
(* error 
}
    {
     * compute the distance between two 3D-vectors
      }
in declaration at line 306 *)
      var
        tmp : array[0..2] of TdReal;cvar;public;
(* error 
  dSubtractVectors3(tmp, a, b);
 in declarator_list *)
(* error 
  dSubtractVectors3(tmp, a, b);
 in declarator_list *)
(* error 
  res = dCalcVectorLength3(tmp);
in declaration at line 309 *)
        res : Treturn;cvar;public;
(* error 
}
    {
     * special case matrix multiplication, with operator selection
      }
in declaration at line 319 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = dCalcVectorDot3(a + 4, b);
(* error 
  const dReal res_1 = dCalcVectorDot3(a + 4, b);
 in declarator_list *)
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = dCalcVectorDot3(a + 8, b);
(* error 
  const dReal res_2 = dCalcVectorDot3(a + 8, b);
 in declarator_list *)
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 323 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 323 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 323 *)
(* error 
}
in declaration at line 328 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = dCalcVectorDot3_41(a + 1, b);
(* error 
  const dReal res_1 = dCalcVectorDot3_41(a + 1, b);
 in declarator_list *)
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = dCalcVectorDot3_41(a + 2, b);
(* error 
  const dReal res_2 = dCalcVectorDot3_41(a + 2, b);
 in declarator_list *)
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 332 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 332 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 332 *)
(* error 
}
in declaration at line 337 *)
(* error 
}
in declaration at line 342 *)
(* Const before type ignored *)
(* error 
  const dReal res_1 = dCalcVectorDot3_44(a + 1, b);
(* error 
  const dReal res_1 = dCalcVectorDot3_44(a + 1, b);
 in declarator_list *)
 in declarator_list *)
(* Const before type ignored *)
(* error 
  const dReal res_2 = dCalcVectorDot3_44(a + 2, b);
(* error 
  const dReal res_2 = dCalcVectorDot3_44(a + 2, b);
 in declarator_list *)
 in declarator_list *)
    { Only assign after all the calculations are over to avoid incurring memory aliasing }
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 346 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 346 *)
(* error 
  res[0] = res_0; res[1] = res_1; res[2] = res_2;
in declaration at line 346 *)
(* error 
}
    { 
    Note: NEVER call any of these functions/macros with the same variable for A and C, 
    it is not equivalent to A*=B.
     }
in declaration at line 356 *)
(* error 
}
in declaration at line 361 *)
(* error 
}
in declaration at line 366 *)
(* error 
}
in declaration at line 371 *)
(* error 
  dMultiplyHelper0_133(res + 4, a + 4, b);
(* error 
  dMultiplyHelper0_133(res + 4, a + 4, b);
(* error 
  dMultiplyHelper0_133(res + 4, a + 4, b);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper0_133(res + 8, a + 8, b);
(* error 
  dMultiplyHelper0_133(res + 8, a + 8, b);
(* error 
  dMultiplyHelper0_133(res + 8, a + 8, b);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
}
in declaration at line 378 *)
(* error 
  dMultiplyHelper1_133(res + 4, b, a + 1);
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(res + 4, b, a + 1);
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(res + 8, b, a + 2);
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(res + 8, b, a + 2);
 in declarator_list *)
(* error 
}
in declaration at line 385 *)
(* error 
  dMultiplyHelper0_331(res + 4, b, a + 4);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(res + 4, b, a + 4);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(res + 8, b, a + 8);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(res + 8, b, a + 8);
 in declarator_list *)
(* error 
}
in declaration at line 392 *)
(* error 
  dMultiplyHelper0_331(tmp, a, b);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(tmp, a, b);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
}
in declaration at line 399 *)
(* error 
  dMultiplyHelper1_331(tmp, a, b);
 in declarator_list *)
(* error 
  dMultiplyHelper1_331(tmp, a, b);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
}
in declaration at line 406 *)
(* error 
  dMultiplyHelper0_133(tmp, a, b);
 in declarator_list *)
(* error 
  dMultiplyHelper0_133(tmp, a, b);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
  dAddVectors3(res, res, tmp);
 in declarator_list *)
(* error 
}
in declaration at line 413 *)
(* error 
  dMultiplyHelper0_133(tmp, a + 0, b);
(* error 
  dMultiplyHelper0_133(tmp, a + 0, b);
(* error 
  dMultiplyHelper0_133(tmp, a + 0, b);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dAddVectors3(res+ 0, res + 0, tmp);
(* error 
  dAddVectors3(res+ 0, res + 0, tmp);
(* error 
  dAddVectors3(res+ 0, res + 0, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper0_133(tmp, a + 4, b);
(* error 
  dMultiplyHelper0_133(tmp, a + 4, b);
(* error 
  dMultiplyHelper0_133(tmp, a + 4, b);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper0_133(tmp, a + 8, b);
(* error 
  dMultiplyHelper0_133(tmp, a + 8, b);
(* error 
  dMultiplyHelper0_133(tmp, a + 8, b);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
}
in declaration at line 424 *)
(* error 
  dMultiplyHelper1_133(tmp, b, a + 0);
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(tmp, b, a + 0);
 in declarator_list *)
(* error 
  dAddVectors3(res + 0, res + 0, tmp);
(* error 
  dAddVectors3(res + 0, res + 0, tmp);
(* error 
  dAddVectors3(res + 0, res + 0, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(tmp, b, a + 1);
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(tmp, b, a + 1);
 in declarator_list *)
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(tmp, b, a + 2);
 in declarator_list *)
(* error 
  dMultiplyHelper1_133(tmp, b, a + 2);
 in declarator_list *)
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
}
in declaration at line 435 *)
(* error 
  dMultiplyHelper0_331(tmp, b, a + 0);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(tmp, b, a + 0);
 in declarator_list *)
(* error 
  dAddVectors3(res + 0, res + 0, tmp);
(* error 
  dAddVectors3(res + 0, res + 0, tmp);
(* error 
  dAddVectors3(res + 0, res + 0, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(tmp, b, a + 4);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(tmp, b, a + 4);
 in declarator_list *)
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
(* error 
  dAddVectors3(res + 4, res + 4, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(tmp, b, a + 8);
 in declarator_list *)
(* error 
  dMultiplyHelper0_331(tmp, b, a + 8);
 in declarator_list *)
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
(* error 
  dAddVectors3(res + 8, res + 8, tmp);
 in declarator_list *)
 in declarator_list *)
 in declarator_list *)
(* error 
}
in declaration at line 446 *)
(* error 
    det = mat[0] * ( mat[5]*mat[10] - mat[9]*mat[6] )
in declaration at line 450 *)
        det : Treturn;cvar;public;
(* error 
}
    {*
      Closed form matrix inversion, copied from 
      collision_util.h for use in the stepper.
    
      Returns the determinant.  
      returns 0 and does nothing
      if the matrix is singular.
     }
in declaration at line 465 *)
        detRecip : TdReal;cvar;public;
(* error 
    det = dCalcMatrix3Det( ma );
in declaration at line 468 *)
    { Setting an arbitrary non-zero threshold 
           for the determinant doesn't do anyone 
           any favors.  The condition number is the
           important thing.  If all the eigen-values 
           of the matrix are small, so is the 
           determinant, but it can still be well
           conditioned.  
           A single extremely large eigen-value could
           push the determinant over threshold, but 
           produce a very unstable result if the other
           eigen-values are small.  So we just say that
           the determinant must be non-zero and trust the
           caller to provide well-conditioned matrices.
            }
(* error 
    if ( det == 0 )
 in declarator_list *)
(* error 
        return 0;
 in declarator_list *)
(* error 
    }
in declaration at line 490 *)
(* error 
    dst[0] =  ( ma[5]*ma[10] - ma[6]*ma[9]  ) * detRecip;
in declaration at line 492 *)
(* error 
    dst[1] =  ( ma[9]*ma[2]  - ma[1]*ma[10] ) * detRecip;
in declaration at line 493 *)
(* error 
    dst[2] =  ( ma[1]*ma[6]  - ma[5]*ma[2]  ) * detRecip;
in declaration at line 494 *)
(* error 
    dst[4] =  ( ma[6]*ma[8]  - ma[4]*ma[10] ) * detRecip;
in declaration at line 496 *)
(* error 
    dst[5] =  ( ma[0]*ma[10] - ma[8]*ma[2]  ) * detRecip;
in declaration at line 497 *)
(* error 
    dst[6] =  ( ma[4]*ma[2]  - ma[0]*ma[6]  ) * detRecip;
in declaration at line 498 *)
(* error 
    dst[8] =  ( ma[4]*ma[9]  - ma[8]*ma[5]  ) * detRecip;
in declaration at line 500 *)
(* error 
    dst[9] =  ( ma[8]*ma[1]  - ma[0]*ma[9]  ) * detRecip;
in declaration at line 501 *)
(* error 
    dst[10] = ( ma[0]*ma[5]  - ma[1]*ma[4]  ) * detRecip;
in declaration at line 502 *)
        det : Treturn;cvar;public;
(* error 
}
    { Include legacy macros here  }
{$include <ode/odemath_legacy.h>}
{ C++ extern C conditionnal removed }
    {
     * normalize 3x1 and 4x1 vectors (i.e. scale them to unit length)
      }
    { For DLL export }
in declaration at line 521 *)

function dSafeNormalize4(a:TdVector4):longint;cdecl;external;
procedure dNormalize3(a:TdVector3);cdecl;external;
    { Potentially asserts on zero vec }
procedure dNormalize4(a:TdVector4);cdecl;external;
    { Potentially asserts on zero vec }
    {
     * given a unit length "normal" vector n, generate vectors p and q vectors
     * that are an orthonormal basis for the plane space perpendicular to n.
     * i.e. this makes p,q such that n,p,q are all perpendicular to each other.
     * q will equal n x p. if n is not unit length then p will be unit length but
     * q wont be.
      }
(* Const before type ignored *)
procedure dPlaneSpace(n:TdVector3; p:TdVector3; q:TdVector3);cdecl;external;
    { Makes sure the matrix is a proper rotation, returns a boolean status  }
function dOrthogonalizeR(m:TdMatrix3):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
