unit adap_version;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2017-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include <glib.h>}
{*
 * ADAP_MAJOR_VERSION:
 *
 * Adapta major version component (e.g. 1 if the version is 1.2.3).
  }

const
  ADAP_MAJOR_VERSION = 1;  
{*
 * ADAP_MINOR_VERSION:
 *
 * Adapta minor version component (e.g. 2 if the version is 1.2.3).
  }
  ADAP_MINOR_VERSION = 5;  
{*
 * ADAP_MICRO_VERSION:
 *
 * Adapta micro version component (e.g. 3 if the version is 1.2.3).
  }
  ADAP_MICRO_VERSION = 0;  
{*
 * ADAP_VERSION:
 *
 * Adapta version (e.g. 1.2.3).
  }
  ADAP_VERSION = 1.5.0;  
{*
 * ADAP_VERSION_S:
 *
 * Adapta version, encoded as a string, useful for printing and
 * concatenation.
  }
  ADAP_VERSION_S = '1.5.0';  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ADAP_ENCODE_VERSION(major,minor,micro : longint) : longint;

{*
 * ADAP_VERSION_HEX:
 *
 * Adapta version, encoded as an hexadecimal number, useful for
 * integer comparisons.
  }
{ was #define dname def_expr }
function ADAP_VERSION_HEX : longint; { return type might be wrong }

{*
 * ADAP_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to `TRUE` if the version
 * of Adapta is greater than the required one.
  }
{xxxxxxxxxxxx
#define ADAP_CHECK_VERSION(major,minor,micro)   \
        (ADAP_MAJOR_VERSION > (major) || \
         (ADAP_MAJOR_VERSION == (major) && ADAP_MINOR_VERSION > (minor)) || \
         (ADAP_MAJOR_VERSION == (major) && ADAP_MINOR_VERSION == (minor) && \
          ADAP_MICRO_VERSION >= (micro)))
 }
{*
 * ADAP_VERSION_1_1:
 *
 * A macro that evaluates to the 1.2 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.1
  }
{ was #define dname def_expr }
function ADAP_VERSION_1_1 : longint; { return type might be wrong }

{*
 * ADAP_VERSION_1_2:
 *
 * A macro that evaluates to the 1.2 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.2
  }
{ was #define dname def_expr }
function ADAP_VERSION_1_2 : longint; { return type might be wrong }

{*
 * ADAP_VERSION_1_3:
 *
 * A macro that evaluates to the 1.3 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.3
  }
{ was #define dname def_expr }
function ADAP_VERSION_1_3 : longint; { return type might be wrong }

{*
 * ADAP_VERSION_1_4:
 *
 * A macro that evaluates to the 1.4 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.4
  }
{ was #define dname def_expr }
function ADAP_VERSION_1_4 : longint; { return type might be wrong }

{*
 * ADAP_VERSION_1_5:
 *
 * A macro that evaluates to the 1.5 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.5
  }
{ was #define dname def_expr }
function ADAP_VERSION_1_5 : longint; { return type might be wrong }

function adap_get_major_version:Tguint;cdecl;external libadapta;
function adap_get_minor_version:Tguint;cdecl;external libadapta;
function adap_get_micro_version:Tguint;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:35 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ADAP_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  ADAP_ENCODE_VERSION:=((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

{ was #define dname def_expr }
function ADAP_VERSION_HEX : longint; { return type might be wrong }
  begin
    ADAP_VERSION_HEX:=ADAP_ENCODE_VERSION(ADAP_MAJOR_VERSION,ADAP_MINOR_VERSION,ADAP_MICRO_VERSION);
  end;

{ was #define dname def_expr }
function ADAP_VERSION_1_1 : longint; { return type might be wrong }
  begin
    ADAP_VERSION_1_1:=ADAP_ENCODE_VERSION(1,1,0);
  end;

{ was #define dname def_expr }
function ADAP_VERSION_1_2 : longint; { return type might be wrong }
  begin
    ADAP_VERSION_1_2:=ADAP_ENCODE_VERSION(1,2,0);
  end;

{ was #define dname def_expr }
function ADAP_VERSION_1_3 : longint; { return type might be wrong }
  begin
    ADAP_VERSION_1_3:=ADAP_ENCODE_VERSION(1,3,0);
  end;

{ was #define dname def_expr }
function ADAP_VERSION_1_4 : longint; { return type might be wrong }
  begin
    ADAP_VERSION_1_4:=ADAP_ENCODE_VERSION(1,4,0);
  end;

{ was #define dname def_expr }
function ADAP_VERSION_1_5 : longint; { return type might be wrong }
  begin
    ADAP_VERSION_1_5:=ADAP_ENCODE_VERSION(1,5,0);
  end;


end.
