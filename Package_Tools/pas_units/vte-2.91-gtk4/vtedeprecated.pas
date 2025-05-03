unit vtedeprecated;

interface

uses
  fp_glib2, fp_GTK4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001,2002,2003,2009,2010 Red Hat, Inc.
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include "vteterminal.h"}
{$include "vtepty.h"}
{$include "vtemacros.h"}

procedure vte_terminal_match_set_cursor(terminal:PVteTerminal; tag:longint; cursor:PGdkCursor);cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_match_check(terminal:PVteTerminal; column:Tglong; row:Tglong; tag:Plongint):Pchar;cdecl;external libvte_2_91_gtk4 ;
{ out  }function vte_terminal_spawn_sync(terminal:PVteTerminal; pty_flags:TVtePtyFlags; working_directory:Pchar; argv:PPchar; envv:PPchar; 
           spawn_flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; child_setup_data:Tgpointer; child_pid:PGPid; cancellable:PGCancellable; 
           error:PPGError):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
procedure vte_pty_close(pty:PVtePty);cdecl;external libvte_2_91_gtk4 ;
procedure vte_terminal_copy_clipboard(terminal:PVteTerminal);cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_get_icon_title(terminal:PVteTerminal):Pchar;cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_set_encoding(terminal:PVteTerminal; codeset:Pchar; error:PPGError):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_get_encoding(terminal:PVteTerminal):Pchar;cdecl;external libvte_2_91_gtk4 ;
type

  TVteSelectionFunc = function (terminal:PVteTerminal; column:Tglong; row:Tglong; data:Tgpointer):Tgboolean;cdecl;

function vte_terminal_get_text(terminal:PVteTerminal; is_selected:TVteSelectionFunc; user_data:Tgpointer; attributes:PGArray):Pchar;cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_get_text_range(terminal:PVteTerminal; start_row:Tglong; start_col:Tglong; end_row:Tglong; end_col:Tglong; 
           is_selected:TVteSelectionFunc; user_data:Tgpointer; attributes:PGArray):Pchar;cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_get_text_include_trailing_spaces(terminal:PVteTerminal; is_selected:TVteSelectionFunc; user_data:Tgpointer; attributes:PGArray):Pchar;cdecl;external libvte_2_91_gtk4 ;
procedure vte_terminal_set_rewrap_on_resize(terminal:PVteTerminal; rewrap:Tgboolean);cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_get_rewrap_on_resize(terminal:PVteTerminal):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
procedure vte_terminal_set_allow_bold(terminal:PVteTerminal; allow_bold:Tgboolean);cdecl;external libvte_2_91_gtk4 ;
function vte_terminal_get_allow_bold(terminal:PVteTerminal):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
procedure vte_terminal_feed_child_binary(terminal:PVteTerminal; data:Pguint8; length:Tgsize);cdecl;external libvte_2_91_gtk4 ;
function vte_get_encodings(include_aliases:Tgboolean):^Pchar;cdecl;external libvte_2_91_gtk4 ;
function vte_get_encoding_supported(encoding:Pchar):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
type
{ The structure we return as the supplemental attributes for strings.  }
{< private > }
{ logical column  }
  PVteCharAttributes = ^TVteCharAttributes;
  TVteCharAttributes = record
      row : longint;cdecl;
      column : longint;
      fore : TPangoColor;
      back : TPangoColor;
      flag0 : word;
    end;


const
  bm_TVteCharAttributes_underline = $1;
  bp_TVteCharAttributes_underline = 0;
  bm_TVteCharAttributes_strikethrough = $2;
  bp_TVteCharAttributes_strikethrough = 1;
  bm_TVteCharAttributes_columns = $3C;
  bp_TVteCharAttributes_columns = 2;

function underline(var a : TVteCharAttributes) : Tguint;
procedure set_underline(var a : TVteCharAttributes; __underline : Tguint);
function strikethrough(var a : TVteCharAttributes) : Tguint;
procedure set_strikethrough(var a : TVteCharAttributes; __strikethrough : Tguint);
function columns(var a : TVteCharAttributes) : Tguint;
procedure set_columns(var a : TVteCharAttributes; __columns : Tguint);
{$undef }

// === Konventiert am: 3-5-25 17:03:50 ===


implementation


function underline(var a : TVteCharAttributes) : Tguint;
begin
  underline:=(a.flag0 and bm_TVteCharAttributes_underline) shr bp_TVteCharAttributes_underline;
end;

procedure set_underline(var a : TVteCharAttributes; __underline : Tguint);
begin
  a.flag0:=a.flag0 or ((__underline shl bp_TVteCharAttributes_underline) and bm_TVteCharAttributes_underline);
end;

function strikethrough(var a : TVteCharAttributes) : Tguint;
begin
  strikethrough:=(a.flag0 and bm_TVteCharAttributes_strikethrough) shr bp_TVteCharAttributes_strikethrough;
end;

procedure set_strikethrough(var a : TVteCharAttributes; __strikethrough : Tguint);
begin
  a.flag0:=a.flag0 or ((__strikethrough shl bp_TVteCharAttributes_strikethrough) and bm_TVteCharAttributes_strikethrough);
end;

function columns(var a : TVteCharAttributes) : Tguint;
begin
  columns:=(a.flag0 and bm_TVteCharAttributes_columns) shr bp_TVteCharAttributes_columns;
end;

procedure set_columns(var a : TVteCharAttributes; __columns : Tguint);
begin
  a.flag0:=a.flag0 or ((__columns shl bp_TVteCharAttributes_columns) and bm_TVteCharAttributes_columns);
end;


end.
