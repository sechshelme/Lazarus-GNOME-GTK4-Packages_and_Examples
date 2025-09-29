
unit soup_hsts_enforcer;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_hsts_enforcer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_hsts_enforcer.h
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
PGList  = ^GList;
PSoupHSTSEnforcer  = ^SoupHSTSEnforcer;
PSoupHSTSEnforcerClass  = ^SoupHSTSEnforcerClass;
PSoupHSTSPolicy  = ^SoupHSTSPolicy;
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

{ was #define dname def_expr }
function SOUP_TYPE_HSTS_ENFORCER : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupHSTSEnforcer, soup_hsts_enforcer, SOUP, HSTS_ENFORCER, GObject) }
{*
 * SoupHSTSEnforcerClass:
 * @parent_class: The parent class.
 * @is_persistent: The @is_persistent function advertises whether the enforcer is persistent or
 * whether changes made to it will be lost when the underlying [class@Session] is finished.
 * @has_valid_policy: The @has_valid_policy function is called to check whether there is a valid
 * policy for the given domain. This method should return %TRUE for #SoupHSTSEnforcer to
 * change the scheme of the #GUri in the #SoupMessage to HTTPS. Implementations might want to
 * chain up to the @has_valid_policy in the parent class to check, for instance, for runtime
 * policies.
 * @changed: The class closure for the #SoupHSTSEnforcer::changed signal.
 *
 * Class structure for #SoupHSTSEnforcer.
 * }
(* Const before type ignored *)
{ signals  }
{ <private>  }
type
  PSoupHSTSEnforcerClass = ^TSoupHSTSEnforcerClass;
  TSoupHSTSEnforcerClass = record
      parent_class : TGObjectClass;
      is_persistent : function (hsts_enforcer:PSoupHSTSEnforcer):Tgboolean;cdecl;
      has_valid_policy : function (hsts_enforcer:PSoupHSTSEnforcer; domain:Pchar):Tgboolean;cdecl;
      changed : procedure (enforcer:PSoupHSTSEnforcer; old_policy:PSoupHSTSPolicy; new_policy:PSoupHSTSPolicy);cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function soup_hsts_enforcer_new:PSoupHSTSEnforcer;cdecl;external;
function soup_hsts_enforcer_is_persistent(hsts_enforcer:PSoupHSTSEnforcer):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_hsts_enforcer_has_valid_policy(hsts_enforcer:PSoupHSTSEnforcer; domain:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure soup_hsts_enforcer_set_session_policy(hsts_enforcer:PSoupHSTSEnforcer; domain:Pchar; include_subdomains:Tgboolean);cdecl;external;
procedure soup_hsts_enforcer_set_policy(hsts_enforcer:PSoupHSTSEnforcer; policy:PSoupHSTSPolicy);cdecl;external;
function soup_hsts_enforcer_get_domains(hsts_enforcer:PSoupHSTSEnforcer; session_policies:Tgboolean):PGList;cdecl;external;
function soup_hsts_enforcer_get_policies(hsts_enforcer:PSoupHSTSEnforcer; session_policies:Tgboolean):PGList;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_HSTS_ENFORCER : longint; { return type might be wrong }
  begin
    SOUP_TYPE_HSTS_ENFORCER:=soup_hsts_enforcer_get_type;
  end;


end.
