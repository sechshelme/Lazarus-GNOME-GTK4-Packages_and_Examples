unit soup_session_feature;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

{G_DECLARE_INTERFACE (SoupSessionFeature, soup_session_feature, SOUP, SESSION_FEATURE, GObject) }

// === Konventiert am: 29-9-25 19:44:02 ===

function SOUP_TYPE_SESSION_FEATURE: TGType;
function SOUP_SESSION_FEATURE(obj: Pointer): PSoupSessionFeature;
function SOUP_IS_SESSION_FEATURE(obj: Pointer): Tgboolean;
function SOUP_SESSION_FEATURE_GET_IFACE(obj: Pointer): PSoupSessionFeatureInterface;

implementation

function SOUP_TYPE_SESSION_FEATURE: TGType;
begin
  Result := soup_session_feature_get_type;
end;

function SOUP_SESSION_FEATURE(obj: Pointer): PSoupSessionFeature;
begin
  Result := PSoupSessionFeature(g_type_check_instance_cast(obj, SOUP_TYPE_SESSION_FEATURE));
end;

function SOUP_IS_SESSION_FEATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_SESSION_FEATURE);
end;

function SOUP_SESSION_FEATURE_GET_IFACE(obj: Pointer): PSoupSessionFeatureInterface;
begin
  Result := g_type_interface_peek(obj, SOUP_TYPE_SESSION_FEATURE);
end;

type 
  TSoupSessionFeature = record
  end;
  PSoupSessionFeature = ^TSoupSessionFeature;

  TSoupSessionFeatureInterface = record
  end;
  PSoupSessionFeatureInterface = ^TSoupSessionFeatureInterface;

function soup_session_feature_get_type: TGType; cdecl; external libgxxxxxxx;



end.
