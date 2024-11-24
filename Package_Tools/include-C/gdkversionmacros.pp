
unit gdkversionmacros;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkversionmacros.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkversionmacros.h
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


{ gdkversionmacros.h - version boundaries checks
 * Copyright (C) 2012 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.▸ See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{ These macros are used to mark deprecated symbols in GLib headers,
 * and thus have to be exposed in installed headers. But please
 * do *not* use them in other projects. Instead define your own wrappers
 * around it.
  }
{*
 * GDK_MAJOR_VERSION:
 *
 * The major version component of the library's version, e.g. "1" for "1.2.3".
  }

const
  GDK_MAJOR_VERSION = 4;  
{*
 * GDK_MINOR_VERSION:
 *
 * The minor version component of the library's version, e.g. "2" for "1.2.3".
  }
  GDK_MINOR_VERSION = 14;  
{*
 * GDK_MICRO_VERSION:
 *
 * The micro version component of the library's version, e.g. "3" for "1.2.3".
  }
  GDK_MICRO_VERSION = 2;  
{*
 * GDK_VERSION_4_0:
 *
 * A macro that evaluates to the 4.0 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.0
  }

{ was #define dname def_expr }
function GDK_VERSION_4_0 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_2:
 *
 * A macro that evaluates to the 4.2 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.2
  }
{ was #define dname def_expr }
function GDK_VERSION_4_2 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_4:
 *
 * A macro that evaluates to the 4.4 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.4
  }
{ was #define dname def_expr }
function GDK_VERSION_4_4 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_6:
 *
 * A macro that evaluates to the 4.6 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.6
  }
{ was #define dname def_expr }
function GDK_VERSION_4_6 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_8:
 *
 * A macro that evaluates to the 4.8 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.8
  }
{ was #define dname def_expr }
function GDK_VERSION_4_8 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_10:
 *
 * A macro that evaluates to the 4.10 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.10
  }
{ was #define dname def_expr }
function GDK_VERSION_4_10 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_12:
 *
 * A macro that evaluates to the 4.12 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.12
  }
{ was #define dname def_expr }
function GDK_VERSION_4_12 : longint; { return type might be wrong }

{*
 * GDK_VERSION_4_14:
 *
 * A macro that evaluates to the 4.14 version of GTK, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 4.14
  }
{ was #define dname def_expr }
function GDK_VERSION_4_14 : longint; { return type might be wrong }

{ evaluates to the current stable version; for development cycles,
 * this means the next stable target, with a hard backstop to the
 * beginning of the stable series
  }
{$if GDK_MAJOR_VERSION >= 4 && (GDK_MINOR_VERSION % 2)}

{ was #define dname def_expr }
function GDK_VERSION_CUR_STABLE : longint; { return type might be wrong }

(*** was #elif ****){$else G_ENCODE_VERSION (GDK_MAJOR_VERSION, GDK_MINOR_VERSION) > GDK_VERSION_4_0}

{ was #define dname def_expr }
function GDK_VERSION_CUR_STABLE : longint; { return type might be wrong }

{$else}

const
  GDK_VERSION_CUR_STABLE = GDK_VERSION_4_0;  
{$endif}
{ evaluates to the previous stable version, with a hard backstop
 * to the beginning of the stable series
  }
{$if GDK_MAJOR_VERSION >= 4 && (GDK_MINOR_VERSION % 2)}

{ was #define dname def_expr }
function GDK_VERSION_PREV_STABLE : longint; { return type might be wrong }

(*** was #elif ****){$else GDK_MAJOR_VERSION >= 4 && GDK_MINOR_VERSION > 2}

{ was #define dname def_expr }
function GDK_VERSION_PREV_STABLE : longint; { return type might be wrong }

{$else}

const
  GDK_VERSION_PREV_STABLE = GDK_VERSION_4_0;  
{$endif}
{*
 * GDK_VERSION_MIN_REQUIRED:
 *
 * A macro that should be defined by the user prior to including
 * the `gdk.h` header.
 *
 * The definition should be one of the predefined GDK version
 * macros: %GDK_VERSION_4_0, %GDK_VERSION_4_2,...
 *
 * This macro defines the lower bound for the GDK API to use.
 *
 * If a function has been deprecated in a newer version of GDK,
 * it is possible to use this symbol to avoid the compiler warnings
 * without disabling warning for every deprecated function.
  }
{$ifndef GDK_VERSION_MIN_REQUIRED}

const
  GDK_VERSION_MIN_REQUIRED = GDK_VERSION_CUR_STABLE;  
{$endif}
{*
 * GDK_VERSION_MAX_ALLOWED:
 *
 * A macro that should be defined by the user prior to including
 * the `gdk.h` header.
 *
 * The definition should be one of the predefined GDK version
 * macros: %GDK_VERSION_4_0, %GDK_VERSION_4_2,...
 *
 * This macro defines the upper bound for the GDK API to use.
 *
 * If a function has been introduced in a newer version of GDK,
 * it is possible to use this symbol to get compiler warnings when
 * trying to use that function.
  }
{$ifndef GDK_VERSION_MAX_ALLOWED}
{$if GDK_VERSION_MIN_REQUIRED > GDK_VERSION_PREV_STABLE}

const
  GDK_VERSION_MAX_ALLOWED = GDK_VERSION_MIN_REQUIRED;  
{$else}

const
  GDK_VERSION_MAX_ALLOWED = GDK_VERSION_CUR_STABLE;  
{$endif}
{$endif}
{ sanity checks  }
{$if GDK_VERSION_MAX_ALLOWED < GDK_VERSION_MIN_REQUIRED}
{$error "GDK_VERSION_MAX_ALLOWED must be >= GDK_VERSION_MIN_REQUIRED"}
{$endif}
{$if GDK_VERSION_MIN_REQUIRED < GDK_VERSION_4_0}
{$error "GDK_VERSION_MIN_REQUIRED must be >= GDK_VERSION_4_0"}
{$endif}
{$include <gdk/version/gdk-visibility.h>}

implementation

{ was #define dname def_expr }
function GDK_VERSION_4_0 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_0:=G_ENCODE_VERSION(4,0);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_2 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_2:=G_ENCODE_VERSION(4,2);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_4 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_4:=G_ENCODE_VERSION(4,4);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_6 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_6:=G_ENCODE_VERSION(4,6);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_8 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_8:=G_ENCODE_VERSION(4,8);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_10 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_10:=G_ENCODE_VERSION(4,10);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_12 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_12:=G_ENCODE_VERSION(4,12);
  end;

{ was #define dname def_expr }
function GDK_VERSION_4_14 : longint; { return type might be wrong }
  begin
    GDK_VERSION_4_14:=G_ENCODE_VERSION(4,14);
  end;

{ was #define dname def_expr }
function GDK_VERSION_CUR_STABLE : longint; { return type might be wrong }
  begin
    GDK_VERSION_CUR_STABLE:=G_ENCODE_VERSION(GDK_MAJOR_VERSION,GDK_MINOR_VERSION+1);
  end;

{ was #define dname def_expr }
function GDK_VERSION_CUR_STABLE : longint; { return type might be wrong }
  begin
    GDK_VERSION_CUR_STABLE:=G_ENCODE_VERSION(GDK_MAJOR_VERSION,GDK_MINOR_VERSION);
  end;

{ was #define dname def_expr }
function GDK_VERSION_PREV_STABLE : longint; { return type might be wrong }
  begin
    GDK_VERSION_PREV_STABLE:=G_ENCODE_VERSION(GDK_MAJOR_VERSION,GDK_MINOR_VERSION-1);
  end;

{ was #define dname def_expr }
function GDK_VERSION_PREV_STABLE : longint; { return type might be wrong }
  begin
    GDK_VERSION_PREV_STABLE:=G_ENCODE_VERSION(GDK_MAJOR_VERSION,GDK_MINOR_VERSION-2);
  end;


end.
