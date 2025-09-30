
unit soup_session_feature;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_session_feature.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_session_feature.h
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


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

{ was #define dname def_expr }
function SOUP_TYPE_SESSION_FEATURE : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (SoupSessionFeature, soup_session_feature, SOUP, SESSION_FEATURE, GObject) }

implementation

{ was #define dname def_expr }
function SOUP_TYPE_SESSION_FEATURE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_SESSION_FEATURE:=soup_session_feature_get_type;
  end;


end.
