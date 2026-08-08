
unit nma_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_version.h
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


{ SPDX-License-Identifier: LGPL-2.1+ }
{ NetworkManager Applet -- allow user control over networking
 *
 * Copyright (C) 2011-2022 Red Hat, Inc.
  }
{$ifndef NMA_VERSION_H}
{$define NMA_VERSION_H}
{$include <glib.h>}
{*
 * NMA_MAJOR_VERSION:
 *
 * Evaluates to the major version number of NetworkManager which this source
 * is compiled against.
  }

const
  NMA_MAJOR_VERSION = 1;  
{*
 * NMA_MINOR_VERSION:
 *
 * Evaluates to the minor version number of NetworkManager which this source
 * is compiled against.
  }
  NMA_MINOR_VERSION = 10;  
{*
 * NMA_MICRO_VERSION:
 *
 * Evaluates to the micro version number of NetworkManager which this source
 * compiled against.
  }
  NMA_MICRO_VERSION = 6;  
{*xxxxxx
#define NMA_CHECK_VERSION(major,minor,micro)                         \
    (NMA_MAJOR_VERSION > (major) ||                                  \
     (NMA_MAJOR_VERSION == (major) && NMA_MINOR_VERSION > (minor)) || \
     (NMA_MAJOR_VERSION == (major) && NMA_MINOR_VERSION == (minor) && NMA_MICRO_VERSION >= (micro)))
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function NMA_ENCODE_VERSION(major,minor,micro : longint) : longint;

{ was #define dname def_expr }
function NMA_VERSION_1_2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_6 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_10 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_12 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_22 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_26 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_28 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_34 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_8_36 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NMA_VERSION_1_10_6 : longint; { return type might be wrong }

{ xxxx
#define NMA_API_VERSION \
    (((NMA_MINOR_VERSION % 2) == 1) \
        ? NMA_ENCODE_VERSION (NMA_MAJOR_VERSION, NMA_MINOR_VERSION + 1, 0                               ) \
        : NMA_ENCODE_VERSION (NMA_MAJOR_VERSION, NMA_MINOR_VERSION    , ((NMA_MICRO_VERSION + 1) / 2) * 2))
   }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  NMA_ENCODE_VERSION:=((major shl 16) or (minor shl 8)) or micro;
end;

{ was #define dname def_expr }
function NMA_VERSION_1_2 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_2:=NMA_ENCODE_VERSION(1,2,0);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_4 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_4:=NMA_ENCODE_VERSION(1,4,0);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8:=NMA_ENCODE_VERSION(1,8,0);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_2 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_2:=NMA_ENCODE_VERSION(1,8,2);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_4 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_4:=NMA_ENCODE_VERSION(1,8,4);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_6 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_6:=NMA_ENCODE_VERSION(1,8,6);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_8 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_8:=NMA_ENCODE_VERSION(1,8,8);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_10 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_10:=NMA_ENCODE_VERSION(1,8,10);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_12 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_12:=NMA_ENCODE_VERSION(1,8,12);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_22 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_22:=NMA_ENCODE_VERSION(1,8,22);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_26 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_26:=NMA_ENCODE_VERSION(1,8,26);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_28 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_28:=NMA_ENCODE_VERSION(1,8,28);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_34 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_34:=NMA_ENCODE_VERSION(1,8,34);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_8_36 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_8_36:=NMA_ENCODE_VERSION(1,8,36);
  end;

{ was #define dname def_expr }
function NMA_VERSION_1_10_6 : longint; { return type might be wrong }
  begin
    NMA_VERSION_1_10_6:=NMA_ENCODE_VERSION(1,10,6);
  end;


end.
