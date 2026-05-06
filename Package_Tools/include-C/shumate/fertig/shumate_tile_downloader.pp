
unit shumate_tile_downloader;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_tile_downloader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_tile_downloader.h
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
PShumateTileDownloader  = ^ShumateTileDownloader;
PShumateTileDownloaderError  = ^ShumateTileDownloaderError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 James Westman <james@jwestman.net>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <shumate/shumate-data-source.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_TILE_DOWNLOADER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateTileDownloader, shumate_tile_downloader, SHUMATE, TILE_DOWNLOADER, ShumateDataSource) }
(* Const before type ignored *)
function shumate_tile_downloader_new(url_template:Pchar):PShumateTileDownloader;cdecl;external;
{*
 * SHUMATE_TILE_DOWNLOADER_ERROR:
 *
 * Error domain for errors that may occur while fetching tiles from the network
 * using [class@TileDownloader]. Errors in this domain will be from the
 * [enum@TileDownloaderError] enum.
  }
{ was #define dname def_expr }
function SHUMATE_TILE_DOWNLOADER_ERROR : longint; { return type might be wrong }

function shumate_tile_downloader_error_quark:TGQuark;cdecl;external;
{*
 * ShumateTileDownloaderError:
 * @SHUMATE_TILE_DOWNLOADER_ERROR_FAILED: An unspecified error occurred during the operation.
 * @SHUMATE_TILE_DOWNLOADER_ERROR_BAD_RESPONSE: An unsuccessful HTTP response was received from the server.
 * @SHUMATE_TILE_DOWNLOADER_ERROR_COULD_NOT_CONNECT: The server could not be reached.
 * @SHUMATE_TILE_DOWNLOADER_ERROR_MALFORMED_URL: The provided URL isn't valid
 * @SHUMATE_TILE_DOWNLOADER_ERROR_OFFLINE: The tile source has been marked as offline.
 *
 * Error codes in the #SHUMATE_TILE_DOWNLOADER_ERROR domain.
  }
type
  PShumateTileDownloaderError = ^TShumateTileDownloaderError;
  TShumateTileDownloaderError =  Longint;
  Const
    SHUMATE_TILE_DOWNLOADER_ERROR_FAILED = 0;
    SHUMATE_TILE_DOWNLOADER_ERROR_BAD_RESPONSE = 1;
    SHUMATE_TILE_DOWNLOADER_ERROR_COULD_NOT_CONNECT = 2;
    SHUMATE_TILE_DOWNLOADER_ERROR_MALFORMED_URL = 3;
    SHUMATE_TILE_DOWNLOADER_ERROR_OFFLINE = 4;
;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_TILE_DOWNLOADER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_TILE_DOWNLOADER:=shumate_tile_downloader_get_type;
  end;

{ was #define dname def_expr }
function SHUMATE_TILE_DOWNLOADER_ERROR : longint; { return type might be wrong }
  begin
    SHUMATE_TILE_DOWNLOADER_ERROR:=shumate_tile_downloader_error_quark;
  end;


end.
