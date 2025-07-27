
unit Log;
interface

{
  Automatically converted by H2Pas 1.0.0 from Log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Log.h
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
PFILE  = ^FILE;
Pgr_face  = ^gr_face;
PGrLogMask  = ^GrLogMask;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  GRAPHITE2 LICENSING

    Copyright 2010, SIL International
    All rights reserved.

    This library is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 2.1 of License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should also have received a copy of the GNU Lesser General Public
    License along with this library in the file named "LICENSE".
    If not, write to the Free Software Foundation, 51 Franklin Street,
    Suite 500, Boston, MA 02110-1335, USA or visit their web page on the
    internet at http://www.fsf.org/licenses/lgpl.html.

    Alternatively, the contents of this file may be used under the terms
    of the Mozilla Public License (http://mozilla.org/MPL) or the GNU
    General Public License, as published by the Free Software Foundation,
    either version 2 of the License or (at your option) any later version.
 }
(** unsupported pragma#pragma once*)
{$include <graphite2/Types.h>}
{$include <graphite2/Font.h>}
{$include <stdio.h>}
{* deprecated mechanism that doesn't do anything now.  }
type
  PGrLogMask = ^TGrLogMask;
  TGrLogMask =  Longint;
  Const
    GRLOG_NONE = $0;
    GRLOG_FACE = $01;
    GRLOG_SEGMENT = $02;
    GRLOG_PASS = $04;
    GRLOG_CACHE = $08;
    GRLOG_OPCODE = $80;
    GRLOG_ALL = $FF;
;
{* Start logging all segment creation and updates on the provided face.  This
  * is logged to a JSON file, see "Segment JSON Schema.txt" for a precise
  * definition of the file
  *
  * @return true    if the file was successfully created and logging is correctly
  * 			    initialised.
  * @param face     the gr_face whose segments you want to log to the given file
  * @param log_path a utf8 encoded file name and path to log to.
   }
(* Const before type ignored *)

function gr_start_logging(face:Pgr_face; log_path:Pchar):Tbool;cdecl;external;
{* Stop logging on the given face.  This will close the log file created by
  * gr_start_logging.
  *
  * @param face the gr_face whose segments you want to stop logging
   }
procedure gr_stop_logging(face:Pgr_face);cdecl;external;
{* Start logging to a FILE object.
  * This function is deprecated as of 1.2.0, use the _face versions instead.
  *
  * @return        True on success
  * @param logfile FILE reference to output logging to
  * @param mask    What aspects of logging to report (ignored)
   }
function graphite_start_logging(logFile:PFILE; mask:TGrLogMask):Tbool;cdecl;external;
{may not do anthing if disabled in the implementation of the engine. }
{* Stop logging to a FILE object.
  * This function is deprecated as of 1.2.0, use the _face versions instead.
   }
procedure graphite_stop_logging;cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.
