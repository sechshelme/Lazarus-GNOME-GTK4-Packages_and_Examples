
unit chafa_version_macros;
interface

{
  Automatically converted by H2Pas 1.0.0 from chafa_version_macros.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    chafa_version_macros.h
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


{ -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*-  }
{ Copyright (C) 2019-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>.  }
{$ifndef __CHAFA_VERSION_MACROS_H__}
{$define __CHAFA_VERSION_MACROS_H__}
{$if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)}
{$error "Only <chafa.h> can be included directly."}
{$endif}
{ Our current version is defined here  }
{$include <chafaconfig.h>}
{ Exported symbol versioning/visibility. Similar to the versioning macros
 * used by GLib.  }

{ was #define dname def_expr }
function CHAFA_VERSION_1_0 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_2 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_6 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_8 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_10 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_12 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CHAFA_VERSION_1_14 : longint; { return type might be wrong }

{ Evaluates to the current stable version; for development cycles,
 * this means the next stable target.  }
{$if (CHAFA_MINOR_VERSION % 2)}

{ was #define dname def_expr }
function CHAFA_VERSION_CUR_STABLE : longint; { return type might be wrong }

{$else}

{ was #define dname def_expr }
function CHAFA_VERSION_CUR_STABLE : longint; { return type might be wrong }

{$endif}
{ Evaluates to the previous stable version  }
{$if (CHAFA_MINOR_VERSION % 2)}

{ was #define dname def_expr }
function CHAFA_VERSION_PREV_STABLE : longint; { return type might be wrong }

{$else}

{ was #define dname def_expr }
function CHAFA_VERSION_PREV_STABLE : longint; { return type might be wrong }

{$endif}
{*
 * CHAFA_VERSION_MIN_REQUIRED:
 *
 * A macro that can be defined by the user prior to including
 * the chafa.h header.
 * The definition should be one of the predefined Chafa version
 * macros: %CHAFA_VERSION_1_0, %CHAFA_VERSION_1_2,...
 *
 * This macro defines the earliest version of Chafa that the package is
 * required to be able to compile against.
 *
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions that were deprecated in version
 * %CHAFA_VERSION_MIN_REQUIRED or earlier will cause warnings (but
 * using functions deprecated in later releases will not).
 *
 * Since: 1.2
  }
{ Make sure all exportable symbols are made visible, even
 * deprecated ones.  }
{$ifdef CHAFA_COMPILATION}

const
  CHAFA_VERSION_MIN_REQUIRED = CHAFA_VERSION_1_0;  
{$endif}
{ If the package sets CHAFA_VERSION_MIN_REQUIRED to some future
 * CHAFA_VERSION_X_Y value that we don't know about, it will compare as
 * 0 in preprocessor tests.  }
{$ifndef CHAFA_VERSION_MIN_REQUIRED}

const
  CHAFA_VERSION_MIN_REQUIRED = CHAFA_VERSION_CUR_STABLE;  
(*** was #elif ****){$else CHAFA_VERSION_MIN_REQUIRED == 0}
{$undef  CHAFA_VERSION_MIN_REQUIRED}

const
  CHAFA_VERSION_MIN_REQUIRED = CHAFA_VERSION_CUR_STABLE+2;  
{$endif}
{*
 * CHAFA_VERSION_MAX_ALLOWED:
 *
 * A macro that can be defined by the user prior to including
 * the chafa.h header.
 * The definition should be one of the predefined Chafa version
 * macros: %CHAFA_VERSION_1_0, %CHAFA_VERSION_1_2,...
 *
 * This macro defines the latest version of the Chafa API that the
 * package is allowed to make use of.
 *
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions added after version
 * %CHAFA_VERSION_MAX_ALLOWED will cause warnings.
 *
 * This should normally be set to the same value as
 * %CHAFA_VERSION_MIN_REQUIRED.
 *
 * Since: 1.2
  }
{$if !defined (CHAFA_VERSION_MAX_ALLOWED) || (CHAFA_VERSION_MAX_ALLOWED == 0)}
{$undef CHAFA_VERSION_MAX_ALLOWED}

const
  CHAFA_VERSION_MAX_ALLOWED = CHAFA_VERSION_CUR_STABLE;  
{$endif}
{ Sanity checks  }
{$if CHAFA_VERSION_MIN_REQUIRED > CHAFA_VERSION_CUR_STABLE}
{$error "CHAFA_VERSION_MIN_REQUIRED must be <= CHAFA_VERSION_CUR_STABLE"}
{$endif}
{$if CHAFA_VERSION_MAX_ALLOWED < CHAFA_VERSION_MIN_REQUIRED}
{$error "CHAFA_VERSION_MAX_ALLOWED must be >= CHAFA_VERSION_MIN_REQUIRED"}
{$endif}
{$if CHAFA_VERSION_MIN_REQUIRED < CHAFA_VERSION_1_0}
{$error "CHAFA_VERSION_MIN_REQUIRED must be >= CHAFA_VERSION_1_0"}
{$endif}
{$endif}
{ __CHAFA_VERSION_MACROS_H__  }

implementation

{ was #define dname def_expr }
function CHAFA_VERSION_1_0 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_0:=G_ENCODE_VERSION(1,0);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_2 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_2:=G_ENCODE_VERSION(1,2);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_4 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_4:=G_ENCODE_VERSION(1,4);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_6 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_6:=G_ENCODE_VERSION(1,6);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_8 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_8:=G_ENCODE_VERSION(1,8);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_10 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_10:=G_ENCODE_VERSION(1,10);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_12 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_12:=G_ENCODE_VERSION(1,12);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_1_14 : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_1_14:=G_ENCODE_VERSION(1,14);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_CUR_STABLE : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_CUR_STABLE:=G_ENCODE_VERSION(CHAFA_MAJOR_VERSION,CHAFA_MINOR_VERSION+1);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_CUR_STABLE : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_CUR_STABLE:=G_ENCODE_VERSION(CHAFA_MAJOR_VERSION,CHAFA_MINOR_VERSION);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_PREV_STABLE : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_PREV_STABLE:=G_ENCODE_VERSION(CHAFA_MAJOR_VERSION,CHAFA_MINOR_VERSION-1);
  end;

{ was #define dname def_expr }
function CHAFA_VERSION_PREV_STABLE : longint; { return type might be wrong }
  begin
    CHAFA_VERSION_PREV_STABLE:=G_ENCODE_VERSION(CHAFA_MAJOR_VERSION,CHAFA_MINOR_VERSION-2);
  end;


end.
