
unit adw_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_version.h
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


{
 * Copyright (C) 2017-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
{*
 * ADW_MAJOR_VERSION:
 *
 * Adwaita major version component (e.g. 1 if the version is 1.2.3).
  }

const
  ADW_MAJOR_VERSION = 1;  
{*
 * ADW_MINOR_VERSION:
 *
 * Adwaita minor version component (e.g. 2 if the version is 1.2.3).
  }
  ADW_MINOR_VERSION = 5;  
{*
 * ADW_MICRO_VERSION:
 *
 * Adwaita micro version component (e.g. 3 if the version is 1.2.3).
  }
  ADW_MICRO_VERSION = 0;  
{*
 * ADW_VERSION:
 *
 * Adwaita version (e.g. 1.2.3).
  }
  ADW_VERSION = 1.5.0;  
{*
 * ADW_VERSION_S:
 *
 * Adwaita version, encoded as a string, useful for printing and
 * concatenation.
  }
  ADW_VERSION_S = '1.5.0';  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ADW_ENCODE_VERSION(major,minor,micro : longint) : longint;

{*
 * ADW_VERSION_HEX:
 *
 * Adwaita version, encoded as an hexadecimal number, useful for
 * integer comparisons.
  }
{ was #define dname def_expr }
function ADW_VERSION_HEX : longint; { return type might be wrong }

{*
 * ADW_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to `TRUE` if the version
 * of Adwaita is greater than the required one.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ADW_CHECK_VERSION(major,minor,micro : longint) : longint;

{*
 * ADW_VERSION_1_1:
 *
 * A macro that evaluates to the 1.2 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.1
  }
{ was #define dname def_expr }
function ADW_VERSION_1_1 : longint; { return type might be wrong }

{*
 * ADW_VERSION_1_2:
 *
 * A macro that evaluates to the 1.2 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.2
  }
{ was #define dname def_expr }
function ADW_VERSION_1_2 : longint; { return type might be wrong }

{*
 * ADW_VERSION_1_3:
 *
 * A macro that evaluates to the 1.3 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.3
  }
{ was #define dname def_expr }
function ADW_VERSION_1_3 : longint; { return type might be wrong }

{*
 * ADW_VERSION_1_4:
 *
 * A macro that evaluates to the 1.4 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.4
  }
{ was #define dname def_expr }
function ADW_VERSION_1_4 : longint; { return type might be wrong }

{*
 * ADW_VERSION_1_5:
 *
 * A macro that evaluates to the 1.5 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.5
  }
{ was #define dname def_expr }
function ADW_VERSION_1_5 : longint; { return type might be wrong }

function adw_get_major_version:Tguint;cdecl;external;
function adw_get_minor_version:Tguint;cdecl;external;
function adw_get_micro_version:Tguint;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ADW_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  ADW_ENCODE_VERSION:=((major shl 24) or (minor shl 16)) or (micro shl 8);
end;

{ was #define dname def_expr }
function ADW_VERSION_HEX : longint; { return type might be wrong }
  begin
    ADW_VERSION_HEX:=ADW_ENCODE_VERSION(ADW_MAJOR_VERSION,ADW_MINOR_VERSION,ADW_MICRO_VERSION);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ADW_CHECK_VERSION(major,minor,micro : longint) : longint;
begin
  ADW_CHECK_VERSION:=ADW_MAJOR_VERSION>((major or ((ADW_MAJOR_VERSION=(Tmajor(@(@(ADW_MINOR_VERSION)))))>minor)) or (((ADW_MAJOR_VERSION=(Tmajor(@(@(ADW_MINOR_VERSION)))))=(Tminor(@(@(ADW_MICRO_VERSION)))))>=micro));
end;

{ was #define dname def_expr }
function ADW_VERSION_1_1 : longint; { return type might be wrong }
  begin
    ADW_VERSION_1_1:=ADW_ENCODE_VERSION(1,1,0);
  end;

{ was #define dname def_expr }
function ADW_VERSION_1_2 : longint; { return type might be wrong }
  begin
    ADW_VERSION_1_2:=ADW_ENCODE_VERSION(1,2,0);
  end;

{ was #define dname def_expr }
function ADW_VERSION_1_3 : longint; { return type might be wrong }
  begin
    ADW_VERSION_1_3:=ADW_ENCODE_VERSION(1,3,0);
  end;

{ was #define dname def_expr }
function ADW_VERSION_1_4 : longint; { return type might be wrong }
  begin
    ADW_VERSION_1_4:=ADW_ENCODE_VERSION(1,4,0);
  end;

{ was #define dname def_expr }
function ADW_VERSION_1_5 : longint; { return type might be wrong }
  begin
    ADW_VERSION_1_5:=ADW_ENCODE_VERSION(1,5,0);
  end;


end.
