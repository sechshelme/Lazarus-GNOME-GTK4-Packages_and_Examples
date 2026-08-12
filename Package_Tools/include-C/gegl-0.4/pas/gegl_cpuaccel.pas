unit gegl_cpuaccel;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ LIBGEGL - The GEGL Library
 * Copyright (C) 1995-1997 Peter Mattis and Spencer Kimball
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GEGL_CPU_ACCEL_H__}
{$define __GEGL_CPU_ACCEL_H__}
{ x86 accelerations  }
{ powerpc accelerations  }
{ arm accelerations  }
type
  PGeglCpuAccelFlags = ^TGeglCpuAccelFlags;
  TGeglCpuAccelFlags =  Longint;
  Const
    GEGL_CPU_ACCEL_NONE = $0;
    GEGL_CPU_ACCEL_X86_MMX = $80000000;
    GEGL_CPU_ACCEL_X86_3DNOW = $40000000;
    GEGL_CPU_ACCEL_X86_MMXEXT = $20000000;
    GEGL_CPU_ACCEL_X86_SSE = $10000000;
    GEGL_CPU_ACCEL_X86_SSE2 = $08000000;
    GEGL_CPU_ACCEL_X86_SSE3 = $04000000;
    GEGL_CPU_ACCEL_X86_SSSE3 = $02000000;
    GEGL_CPU_ACCEL_X86_SSE4_1 = $01000000;
    GEGL_CPU_ACCEL_X86_SSE4_2 = $00800000;
    GEGL_CPU_ACCEL_X86_AVX = $00400000;
    GEGL_CPU_ACCEL_X86_POPCNT = $00200000;
    GEGL_CPU_ACCEL_X86_FMA = $00100000;
    GEGL_CPU_ACCEL_X86_MOVBE = $00080000;
    GEGL_CPU_ACCEL_X86_F16C = $00040000;
    GEGL_CPU_ACCEL_X86_XSAVE = $00020000;
    GEGL_CPU_ACCEL_X86_OSXSAVE = $00010000;
    GEGL_CPU_ACCEL_X86_BMI1 = $00008000;
    GEGL_CPU_ACCEL_X86_BMI2 = $00004000;
    GEGL_CPU_ACCEL_X86_AVX2 = $00002000;
    GEGL_CPU_ACCEL_X86_64_V2 = ((GEGL_CPU_ACCEL_X86_POPCNT or GEGL_CPU_ACCEL_X86_SSE4_1) or GEGL_CPU_ACCEL_X86_SSE4_2) or GEGL_CPU_ACCEL_X86_SSSE3;
    GEGL_CPU_ACCEL_X86_64_V3 = (((((((GEGL_CPU_ACCEL_X86_64_V2 or GEGL_CPU_ACCEL_X86_BMI1) or GEGL_CPU_ACCEL_X86_BMI2) or GEGL_CPU_ACCEL_X86_AVX) or GEGL_CPU_ACCEL_X86_FMA) or GEGL_CPU_ACCEL_X86_F16C) or GEGL_CPU_ACCEL_X86_AVX2) or GEGL_CPU_ACCEL_X86_OSXSAVE) or GEGL_CPU_ACCEL_X86_MOVBE;
    GEGL_CPU_ACCEL_PPC_ALTIVEC = $00000010;
    GEGL_CPU_ACCEL_ARM_NEON = $00000020;
;

function gegl_cpu_accel_get_support:TGeglCpuAccelFlags;cdecl;external libgegl;
{$endif}
{ __GEGL_CPU_ACCEL_H__  }

// === Konventiert am: 12-8-26 14:47:41 ===


implementation



end.
