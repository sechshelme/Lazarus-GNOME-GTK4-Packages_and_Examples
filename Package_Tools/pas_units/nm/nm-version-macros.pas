unit nm_version_macros;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011, 2015 Red Hat, Inc.
  }
{$ifndef __NM_VERSION_MACROS_H__}
{$define __NM_VERSION_MACROS_H__}
{ This header must not include glib or libnm.  }
{*
 * NM_MAJOR_VERSION:
 *
 * Evaluates to the major version number of NetworkManager which this source
 * is compiled against.
  }

const
  NM_MAJOR_VERSION = 1;  
{*
 * NM_MINOR_VERSION:
 *
 * Evaluates to the minor version number of NetworkManager which this source
 * is compiled against.
  }
  NM_MINOR_VERSION = 46;  
{*
 * NM_MICRO_VERSION:
 *
 * Evaluates to the micro version number of NetworkManager which this source
 * compiled against.
  }
  NM_MICRO_VERSION = 0;  
{*
 * NM_CHECK_VERSION:
 * @major: major version (e.g. 1 for version 1.2.5)
 * @minor: minor version (e.g. 2 for version 1.2.5)
 * @micro: micro version (e.g. 5 for version 1.2.5)
 *
 * Returns: %TRUE if the version of the NetworkManager header files
 * is the same as or newer than the passed-in version.
  }
{ xxxxxxxx#define NM_CHECK_VERSION(major, minor, micro)                                                       \ }
{    (NM_MAJOR_VERSION > (major) ||                                                                  \ }
{   (NM_MAJOR_VERSION == (major) && NM_MINOR_VERSION > (minor)) ||                                 \ }
{     (NM_MAJOR_VERSION == (major) && NM_MINOR_VERSION == (minor) && NM_MICRO_VERSION >= (micro))) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function NM_ENCODE_VERSION(major,minor,micro : longint) : longint;

{ was #define dname def_expr }
function NM_VERSION_0_9_8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_0_9_10 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_0 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_6 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_10 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_12 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_14 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_16 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_18 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_20 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_22 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_24 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_26 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_28 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_30 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_32 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_34 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_36 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_38 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_40 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_42 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_44 : longint; { return type might be wrong }

{ was #define dname def_expr }
function NM_VERSION_1_46 : longint; { return type might be wrong }

{ For releases, NM_API_VERSION is equal to NM_VERSION.
 *
 * For development builds, NM_API_VERSION is the next
 * stable API after NM_VERSION. When you run a development
 * version, you are already using the future API, even if
 * it is not yet released. Hence, the currently used API
 * version is the future one.   }
{ deprecated.  }
const
  NM_VERSION_CUR_STABLE = NM_API_VERSION;  
{ deprecated.  }
  NM_VERSION_NEXT_STABLE = NM_API_VERSION;  

{ was #define dname def_expr }
function NM_VERSION : longint; { return type might be wrong }

{$endif}
{ __NM_VERSION_MACROS_H__  }

// === Konventiert am: 19-4-26 19:20:22 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_ENCODE_VERSION(major,minor,micro : longint) : longint;
begin
  NM_ENCODE_VERSION:=((major shl 16) or (minor shl 8)) or micro;
end;

{ was #define dname def_expr }
function NM_VERSION_0_9_8 : longint; { return type might be wrong }
  begin
    NM_VERSION_0_9_8:=NM_ENCODE_VERSION(0,9,8);
  end;

{ was #define dname def_expr }
function NM_VERSION_0_9_10 : longint; { return type might be wrong }
  begin
    NM_VERSION_0_9_10:=NM_ENCODE_VERSION(0,9,10);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_0 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_0:=NM_ENCODE_VERSION(1,0,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_2 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_2:=NM_ENCODE_VERSION(1,2,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_4 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_4:=NM_ENCODE_VERSION(1,4,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_6 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_6:=NM_ENCODE_VERSION(1,6,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_8 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_8:=NM_ENCODE_VERSION(1,8,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_10 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_10:=NM_ENCODE_VERSION(1,10,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_12 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_12:=NM_ENCODE_VERSION(1,12,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_14 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_14:=NM_ENCODE_VERSION(1,14,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_16 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_16:=NM_ENCODE_VERSION(1,16,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_18 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_18:=NM_ENCODE_VERSION(1,18,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_20 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_20:=NM_ENCODE_VERSION(1,20,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_22 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_22:=NM_ENCODE_VERSION(1,22,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_24 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_24:=NM_ENCODE_VERSION(1,24,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_26 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_26:=NM_ENCODE_VERSION(1,26,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_28 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_28:=NM_ENCODE_VERSION(1,28,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_30 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_30:=NM_ENCODE_VERSION(1,30,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_32 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_32:=NM_ENCODE_VERSION(1,32,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_34 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_34:=NM_ENCODE_VERSION(1,34,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_36 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_36:=NM_ENCODE_VERSION(1,36,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_38 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_38:=NM_ENCODE_VERSION(1,38,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_40 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_40:=NM_ENCODE_VERSION(1,40,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_42 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_42:=NM_ENCODE_VERSION(1,42,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_44 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_44:=NM_ENCODE_VERSION(1,44,0);
  end;

{ was #define dname def_expr }
function NM_VERSION_1_46 : longint; { return type might be wrong }
  begin
    NM_VERSION_1_46:=NM_ENCODE_VERSION(1,46,0);
  end;

{ was #define dname def_expr }
function NM_VERSION : longint; { return type might be wrong }
  begin
    NM_VERSION:=NM_ENCODE_VERSION(NM_MAJOR_VERSION,NM_MINOR_VERSION,NM_MICRO_VERSION);
  end;


end.
