
unit soup_hsts_policy;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_hsts_policy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_hsts_policy.h
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
PGDateTime  = ^GDateTime;
PSoupHSTSPolicy  = ^SoupHSTSPolicy;
PSoupMessage  = ^SoupMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2016, 2017, 2018 Igalia S.L.
 * Copyright (C) 2017, 2018 Metrological Group B.V.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
type

function soup_hsts_policy_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_HSTS_POLICY : longint; { return type might be wrong }

{*
 * SOUP_HSTS_POLICY_MAX_AGE_PAST:
 *
 * An expiration date that is always in the past.
  }
const
  SOUP_HSTS_POLICY_MAX_AGE_PAST = 0;  
(* Const before type ignored *)

function soup_hsts_policy_new(domain:Pchar; max_age:dword; include_subdomains:Tgboolean):PSoupHSTSPolicy;cdecl;external;
(* Const before type ignored *)
function soup_hsts_policy_new_full(domain:Pchar; max_age:dword; expires:PGDateTime; include_subdomains:Tgboolean):PSoupHSTSPolicy;cdecl;external;
(* Const before type ignored *)
function soup_hsts_policy_new_session_policy(domain:Pchar; include_subdomains:Tgboolean):PSoupHSTSPolicy;cdecl;external;
function soup_hsts_policy_new_from_response(msg:PSoupMessage):PSoupHSTSPolicy;cdecl;external;
function soup_hsts_policy_copy(policy:PSoupHSTSPolicy):PSoupHSTSPolicy;cdecl;external;
function soup_hsts_policy_equal(policy1:PSoupHSTSPolicy; policy2:PSoupHSTSPolicy):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_hsts_policy_get_domain(policy:PSoupHSTSPolicy):Pchar;cdecl;external;
function soup_hsts_policy_is_expired(policy:PSoupHSTSPolicy):Tgboolean;cdecl;external;
function soup_hsts_policy_includes_subdomains(policy:PSoupHSTSPolicy):Tgboolean;cdecl;external;
function soup_hsts_policy_is_session_policy(policy:PSoupHSTSPolicy):Tgboolean;cdecl;external;
procedure soup_hsts_policy_free(policy:PSoupHSTSPolicy);cdecl;external;
function soup_hsts_policy_get_expires(policy:PSoupHSTSPolicy):PGDateTime;cdecl;external;
function soup_hsts_policy_get_max_age(policy:PSoupHSTSPolicy):Tgulong;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_HSTS_POLICY : longint; { return type might be wrong }
  begin
    SOUP_TYPE_HSTS_POLICY:=soup_hsts_policy_get_type;
  end;


end.
