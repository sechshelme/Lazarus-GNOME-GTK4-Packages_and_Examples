
unit gstcpuid;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstcpuid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstcpuid.h
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


{ SPDX-FileCopyrightText: 2025 L. E. Segovia <amy@centricular.com> }
{ SPDX-License-Identifier: BSD-3-Clause }
{$ifndef __GST_CPUID_H__}
{$define __GST_CPUID_H__}
{$include <gst/gstconfig.h>}
{$include <glib.h>}

function gst_cpuid_supports_x86_mmx:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_mmxext:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_3dnow:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_sse2:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_sse3:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_ssse3:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_sse4_1:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_sse4_2:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_avx:Tgboolean;cdecl;external;
function gst_cpuid_supports_x86_avx2:Tgboolean;cdecl;external;
function gst_cpuid_supports_arm_neon:Tgboolean;cdecl;external;
function gst_cpuid_supports_arm_neon64:Tgboolean;cdecl;external;
{$endif}

implementation


end.
