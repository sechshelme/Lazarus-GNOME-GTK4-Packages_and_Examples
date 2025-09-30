
unit soup_hsts_enforcer_db;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_hsts_enforcer_db.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_hsts_enforcer_db.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PSoupHSTSEnforcer  = ^SoupHSTSEnforcer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2016, 2017, 2018 Igalia S.L.
 * Copyright (C) 2017, 2018 Metrological Group B.V.
  }
(** unsupported pragma#pragma once*)
{$include "soup-hsts-enforcer.h"}

{ was #define dname def_expr }
function SOUP_TYPE_HSTS_ENFORCER_DB : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupHSTSEnforcerDB, soup_hsts_enforcer_db, SOUP, HSTS_ENFORCER_DB, SoupHSTSEnforcer) }
(* Const before type ignored *)
function soup_hsts_enforcer_db_new(filename:Pchar):PSoupHSTSEnforcer;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_HSTS_ENFORCER_DB : longint; { return type might be wrong }
  begin
    SOUP_TYPE_HSTS_ENFORCER_DB:=soup_hsts_enforcer_db_get_type;
  end;


end.
