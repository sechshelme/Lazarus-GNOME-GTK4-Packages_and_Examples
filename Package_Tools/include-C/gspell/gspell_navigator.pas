unit gspell_navigator;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2015, 2016 - Sébastien Wilmet <swilmet@gnome.org>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GSPELL_NAVIGATOR_H}
{$define GSPELL_NAVIGATOR_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <glib-object.h>}
{$include <gspell/gspell-checker.h>}

{G_DECLARE_INTERFACE (GspellNavigator, gspell_navigator, GSPELL, NAVIGATOR, GInitiallyUnowned) }
type
  PGspellNavigatorInterface = ^TGspellNavigatorInterface;
  TGspellNavigatorInterface = record
      parent_interface : TGTypeInterface;
      goto_next : function (navigator:PGspellNavigator; word:PPgchar; spell_checker:PPGspellChecker; error:PPGError):Tgboolean;cdecl;
      change : procedure (navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;
      change_all : procedure (navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;
    end;


function gspell_navigator_goto_next(navigator:PGspellNavigator; word:PPgchar; spell_checker:PPGspellChecker; error:PPGError):Tgboolean;cdecl;external libgspell;
procedure gspell_navigator_change(navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;external libgspell;
procedure gspell_navigator_change_all(navigator:PGspellNavigator; word:Pgchar; change_to:Pgchar);cdecl;external libgspell;
{$endif}
{ GSPELL_NAVIGATOR_H  }

// === Konventiert am: 4-8-26 16:41:57 ===

function GSPELL_TYPE_NAVIGATOR: TGType;
function GSPELL_NAVIGATOR(obj: Pointer): PGspellNavigator;
function GSPELL_IS_NAVIGATOR(obj: Pointer): Tgboolean;
function GSPELL_NAVIGATOR_GET_IFACE(obj: Pointer): PGspellNavigatorInterface;

implementation

function GSPELL_TYPE_NAVIGATOR: TGType;
begin
  Result := gspell_navigator_get_type;
end;

function GSPELL_NAVIGATOR(obj: Pointer): PGspellNavigator;
begin
  Result := PGspellNavigator(g_type_check_instance_cast(obj, GSPELL_TYPE_NAVIGATOR));
end;

function GSPELL_IS_NAVIGATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_NAVIGATOR);
end;

function GSPELL_NAVIGATOR_GET_IFACE(obj: Pointer): PGspellNavigatorInterface;
begin
  Result := g_type_interface_peek(obj, GSPELL_TYPE_NAVIGATOR);
end;

type 
  PGspellNavigator = type Pointer;

  PGspellNavigatorInterface = type Pointer

function gspell_navigator_get_type: TGType; cdecl; external libgxxxxxxx;



end.
