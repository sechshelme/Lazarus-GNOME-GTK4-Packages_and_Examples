unit as_relation;

interface

uses
  fp_glib2, fp_appstream;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2018-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_RELATION_H}
{$define __AS_RELATION_H}
{$include <glib-object.h>}
{ forward declarations  }
type

{G_DECLARE_DERIVABLE_TYPE (AsRelation, as_relation, AS, RELATION, GObject) }
{< private > }
type
  PAsRelationClass = ^TAsRelationClass;
  TAsRelationClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsRelationKind:
 * @AS_RELATION_KIND_UNKNOWN:		Unknown kind
 * @AS_RELATION_KIND_REQUIRES:		The referenced item is required by the component
 * @AS_RELATION_KIND_RECOMMENDS:	The referenced item is recommended
 * @AS_RELATION_KIND_SUPPORTS:		The referenced item is supported
 *
 * Type of a component's relation to other items.
 * }
{< private > }

  PAsRelationKind = ^TAsRelationKind;
  TAsRelationKind =  Longint;
  Const
    AS_RELATION_KIND_UNKNOWN = 0;
    AS_RELATION_KIND_REQUIRES = 1;
    AS_RELATION_KIND_RECOMMENDS = 2;
    AS_RELATION_KIND_SUPPORTS = 3;
    AS_RELATION_KIND_LAST = 4;
;
{*
 * AsRelationItemKind:
 * @AS_RELATION_ITEM_KIND_UNKNOWN:		Unknown kind
 * @AS_RELATION_ITEM_KIND_ID:			A component ID
 * @AS_RELATION_ITEM_KIND_MODALIAS:		A hardware modalias
 * @AS_RELATION_ITEM_KIND_KERNEL:		An operating system kernel (like Linux)
 * @AS_RELATION_ITEM_KIND_MEMORY:		A system RAM requirement
 * @AS_RELATION_ITEM_KIND_FIRMWARE:		A device firmware requirement (used by fwupd)
 * @AS_RELATION_ITEM_KIND_CONTROL:		An input method for users to control software
 * @AS_RELATION_ITEM_KIND_DISPLAY_LENGTH:	Display edge length
 * @AS_RELATION_ITEM_KIND_HARDWARE:		A Computer Hardware ID (CHID) to depend on system hardware
 * @AS_RELATION_ITEM_KIND_INTERNET:		Internet connectivity (Since: 0.15.5)
 *
 * Type of the item an #AsRelation is for.
 * }
{< private > }
type
  PAsRelationItemKind = ^TAsRelationItemKind;
  TAsRelationItemKind =  Longint;
  Const
    AS_RELATION_ITEM_KIND_UNKNOWN = 0;
    AS_RELATION_ITEM_KIND_ID = 1;
    AS_RELATION_ITEM_KIND_MODALIAS = 2;
    AS_RELATION_ITEM_KIND_KERNEL = 3;
    AS_RELATION_ITEM_KIND_MEMORY = 4;
    AS_RELATION_ITEM_KIND_FIRMWARE = 5;
    AS_RELATION_ITEM_KIND_CONTROL = 6;
    AS_RELATION_ITEM_KIND_DISPLAY_LENGTH = 7;
    AS_RELATION_ITEM_KIND_HARDWARE = 8;
    AS_RELATION_ITEM_KIND_INTERNET = 9;
    AS_RELATION_ITEM_KIND_LAST = 10;
;
{*
 * AsRelationCompare:
 * @AS_RELATION_COMPARE_UNKNOWN:	Comparison predicate invalid or not known
 * @AS_RELATION_COMPARE_EQ:		Equal to
 * @AS_RELATION_COMPARE_NE:		Not equal to
 * @AS_RELATION_COMPARE_LT:		Less than
 * @AS_RELATION_COMPARE_GT:		Greater than
 * @AS_RELATION_COMPARE_LE:		Less than or equal to
 * @AS_RELATION_COMPARE_GE:		Greater than or equal to
 *
 * The relational comparison type.
 * }
{< private > }
type
  PAsRelationCompare = ^TAsRelationCompare;
  TAsRelationCompare =  Longint;
  Const
    AS_RELATION_COMPARE_UNKNOWN = 0;
    AS_RELATION_COMPARE_EQ = 1;
    AS_RELATION_COMPARE_NE = 2;
    AS_RELATION_COMPARE_LT = 3;
    AS_RELATION_COMPARE_GT = 4;
    AS_RELATION_COMPARE_LE = 5;
    AS_RELATION_COMPARE_GE = 6;
    AS_RELATION_COMPARE_LAST = 7;
;
{*
 * AsControlKind:
 * @AS_CONTROL_KIND_UNKNOWN:	Unknown kind
 * @AS_CONTROL_KIND_POINTING:	Mouse/cursors/other precision pointing device
 * @AS_CONTROL_KIND_KEYBOARD:	Keyboard input
 * @AS_CONTROL_KIND_CONSOLE:	Console / command-line interface
 * @AS_CONTROL_KIND_TOUCH:	Touch input
 * @AS_CONTROL_KIND_GAMEPAD:	Gamepad input (any game controller with wheels/buttons/joysticks)
 * @AS_CONTROL_KIND_VOICE:	Control via voice recognition/activation
 * @AS_CONTROL_KIND_VISION:	Computer vision / visual object and sign detection
 * @AS_CONTROL_KIND_TV_REMOTE:	Input via a television remote
 * @AS_CONTROL_KIND_TABLET:	Graphics tablet input
 *
 * Kind of an input method for users to control software
 * }
{< private > }
type
  PAsControlKind = ^TAsControlKind;
  TAsControlKind =  Longint;
  Const
    AS_CONTROL_KIND_UNKNOWN = 0;
    AS_CONTROL_KIND_POINTING = 1;
    AS_CONTROL_KIND_KEYBOARD = 2;
    AS_CONTROL_KIND_CONSOLE = 3;
    AS_CONTROL_KIND_TOUCH = 4;
    AS_CONTROL_KIND_GAMEPAD = 5;
    AS_CONTROL_KIND_VOICE = 6;
    AS_CONTROL_KIND_VISION = 7;
    AS_CONTROL_KIND_TV_REMOTE = 8;
    AS_CONTROL_KIND_TABLET = 9;
    AS_CONTROL_KIND_LAST = 10;
;
{*
 * AsDisplaySideKind:
 * @AS_DISPLAY_SIDE_KIND_UNKNOWN:	Unknown
 * @AS_DISPLAY_SIDE_KIND_SHORTEST:	Shortest side of the display rectangle.
 * @AS_DISPLAY_SIDE_KIND_LONGEST:	Longest side of the display rectangle.
 *
 * Side a display_length requirement is for.
 * }
{< private > }
type
  PAsDisplaySideKind = ^TAsDisplaySideKind;
  TAsDisplaySideKind =  Longint;
  Const
    AS_DISPLAY_SIDE_KIND_UNKNOWN = 0;
    AS_DISPLAY_SIDE_KIND_SHORTEST = 1;
    AS_DISPLAY_SIDE_KIND_LONGEST = 2;
    AS_DISPLAY_SIDE_KIND_LAST = 3;
;
{*
 * AsInternetKind:
 * @AS_INTERNET_KIND_UNKNOWN:		Unknown
 * @AS_INTERNET_KIND_ALWAYS:		Always requires/recommends internet
 * @AS_INTERNET_KIND_OFFLINE_ONLY:	Application is offline-only
 * @AS_INTERNET_KIND_FIRST_RUN:	Requires/Recommends internet on first run only
 *
 * Different internet connectivity requirements or recommendations for an
 * application.
 *
 * Since: 0.15.5
 * }
{< private > }
type
  PAsInternetKind = ^TAsInternetKind;
  TAsInternetKind =  Longint;
  Const
    AS_INTERNET_KIND_UNKNOWN = 0;
    AS_INTERNET_KIND_ALWAYS = 1;
    AS_INTERNET_KIND_OFFLINE_ONLY = 2;
    AS_INTERNET_KIND_FIRST_RUN = 3;
    AS_INTERNET_KIND_LAST = 4;
;
{*
 * AsRelationError:
 * @AS_RELATION_ERROR_FAILED:			Generic failure
 * @AS_RELATION_ERROR_BAD_VALUE:		A metadata value was bad.
 * @AS_RELATION_ERROR_NOT_IMPLEMENTED:		Some check was not (yet) implemented.
 *
 * The error type.
 * }
{< private > }
type
  PAsRelationError = ^TAsRelationError;
  TAsRelationError =  Longint;
  Const
    AS_RELATION_ERROR_FAILED = 0;
    AS_RELATION_ERROR_BAD_VALUE = 1;
    AS_RELATION_ERROR_NOT_IMPLEMENTED = 2;
    AS_RELATION_ERROR_LAST = 3;
;

{ was #define dname def_expr }
function AS_RELATION_ERROR : longint; { return type might be wrong }

function as_relation_error_quark:TGQuark;cdecl;external libappstream;
function as_relation_kind_to_string(kind:TAsRelationKind):Pgchar;cdecl;external libappstream;
function as_relation_kind_from_string(kind_str:Pgchar):TAsRelationKind;cdecl;external libappstream;
function as_relation_item_kind_to_string(kind:TAsRelationItemKind):Pgchar;cdecl;external libappstream;
function as_relation_item_kind_from_string(kind_str:Pgchar):TAsRelationItemKind;cdecl;external libappstream;
function as_relation_compare_from_string(compare_str:Pgchar):TAsRelationCompare;cdecl;external libappstream;
function as_relation_compare_to_string(compare:TAsRelationCompare):Pgchar;cdecl;external libappstream;
function as_relation_compare_to_symbols_string(compare:TAsRelationCompare):Pgchar;cdecl;external libappstream;
function as_control_kind_to_string(kind:TAsControlKind):Pgchar;cdecl;external libappstream;
function as_control_kind_from_string(kind_str:Pgchar):TAsControlKind;cdecl;external libappstream;
function as_display_side_kind_to_string(kind:TAsDisplaySideKind):Pgchar;cdecl;external libappstream;
function as_display_side_kind_from_string(kind_str:Pgchar):TAsDisplaySideKind;cdecl;external libappstream;
function as_internet_kind_to_string(kind:TAsInternetKind):Pgchar;cdecl;external libappstream;
function as_internet_kind_from_string(kind_str:Pgchar):TAsInternetKind;cdecl;external libappstream;
function as_relation_new:PAsRelation;cdecl;external libappstream;
function as_relation_get_kind(relation:PAsRelation):TAsRelationKind;cdecl;external libappstream;
procedure as_relation_set_kind(relation:PAsRelation; kind:TAsRelationKind);cdecl;external libappstream;
function as_relation_get_item_kind(relation:PAsRelation):TAsRelationItemKind;cdecl;external libappstream;
procedure as_relation_set_item_kind(relation:PAsRelation; kind:TAsRelationItemKind);cdecl;external libappstream;
function as_relation_get_compare(relation:PAsRelation):TAsRelationCompare;cdecl;external libappstream;
procedure as_relation_set_compare(relation:PAsRelation; compare:TAsRelationCompare);cdecl;external libappstream;
function as_relation_get_version(relation:PAsRelation):Pgchar;cdecl;external libappstream;
procedure as_relation_set_version(relation:PAsRelation; version:Pgchar);cdecl;external libappstream;
function as_relation_get_value_str(relation:PAsRelation):Pgchar;cdecl;external libappstream;
procedure as_relation_set_value_str(relation:PAsRelation; value:Pgchar);cdecl;external libappstream;
function as_relation_get_value_int(relation:PAsRelation):Tgint;cdecl;external libappstream;
procedure as_relation_set_value_int(relation:PAsRelation; value:Tgint);cdecl;external libappstream;
function as_relation_get_value_control_kind(relation:PAsRelation):TAsControlKind;cdecl;external libappstream;
procedure as_relation_set_value_control_kind(relation:PAsRelation; kind:TAsControlKind);cdecl;external libappstream;
function as_relation_get_display_side_kind(relation:PAsRelation):TAsDisplaySideKind;cdecl;external libappstream;
procedure as_relation_set_display_side_kind(relation:PAsRelation; kind:TAsDisplaySideKind);cdecl;external libappstream;
function as_relation_get_value_px(relation:PAsRelation):Tgint;cdecl;external libappstream;
procedure as_relation_set_value_px(relation:PAsRelation; logical_px:Tgint);cdecl;external libappstream;
function as_relation_get_value_internet_kind(relation:PAsRelation):TAsInternetKind;cdecl;external libappstream;
procedure as_relation_set_value_internet_kind(relation:PAsRelation; kind:TAsInternetKind);cdecl;external libappstream;
function as_relation_get_value_internet_bandwidth(relation:PAsRelation):Tguint;cdecl;external libappstream;
procedure as_relation_set_value_internet_bandwidth(relation:PAsRelation; bandwidth_mbitps:Tguint);cdecl;external libappstream;
function as_relation_version_compare(relation:PAsRelation; version:Pgchar; error:PPGError):Tgboolean;cdecl;external libappstream;
function as_relation_is_satisfied(relation:PAsRelation; system_info:PAsSystemInfo; pool:PAsPool; error:PPGError):PAsRelationCheckResult;cdecl;external libappstream;
{$endif}
{ __AS_RELATION_H  }

// === Konventiert am: 30-7-26 19:35:33 ===

function AS_TYPE_RELATION: TGType;
function AS_RELATION(obj: Pointer): PAsRelation;
function AS_IS_RELATION(obj: Pointer): Tgboolean;
function AS_RELATION_CLASS(klass: Pointer): PAsRelationClass;
function AS_IS_RELATION_CLASS(klass: Pointer): Tgboolean;
function AS_RELATION_GET_CLASS(obj: Pointer): PAsRelationClass;

implementation

function AS_TYPE_RELATION: TGType;
begin
  Result := as_relation_get_type;
end;

function AS_RELATION(obj: Pointer): PAsRelation;
begin
  Result := PAsRelation(g_type_check_instance_cast(obj, AS_TYPE_RELATION));
end;

function AS_IS_RELATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_RELATION);
end;

function AS_RELATION_CLASS(klass: Pointer): PAsRelationClass;
begin
  Result := PAsRelationClass(g_type_check_class_cast(klass, AS_TYPE_RELATION));
end;

function AS_IS_RELATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_RELATION);
end;

function AS_RELATION_GET_CLASS(obj: Pointer): PAsRelationClass;
begin
  Result := PAsRelationClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsRelation = record
    parent_instance: TGObject;
  end;
  PAsRelation = ^TAsRelation;

  PAsRelationClass = type Pointer;

function as_relation_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function AS_RELATION_ERROR : longint; { return type might be wrong }
  begin
    AS_RELATION_ERROR:=as_relation_error_quark;
  end;


end.
