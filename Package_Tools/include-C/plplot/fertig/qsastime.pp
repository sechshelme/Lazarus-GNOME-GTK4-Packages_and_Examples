
unit qsastime;
interface

{
  Automatically converted by H2Pas 1.0.0 from qsastime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    qsastime.h
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
Pdouble  = ^double;
Plongint  = ^longint;
PQSASConfig  = ^QSASConfig;
PQSASConfigStruct  = ^QSASConfigStruct;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _QSASTIME_H_}
{$define _QSASTIME_H_}
{ }
{ This software originally contributed under the LGPL in January 2009 to }
{ PLplot by the }
{ Cluster Science Centre }
{ QSAS team, }
{ Imperial College, London }
{ Copyright (C) 2009 Imperial College, London }
{ }
{ This file is part of PLplot. }
{ }
{ PLplot is free software; you can redistribute it and/or modify }
{ it under the terms of the GNU Library General Public License as published }
{ by the Free Software Foundation; either version 2 of the License, or }
{ (at your option) any later version. }
{ }
{ PLplot is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Library General Public License for more details. }
{ }
{ You should have received a copy of the GNU Library General Public License }
{ along with PLplot; if not, write to the Free Software }
{ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA }
{ }
{ }
{ MJD measures from the start of 17 Nov 1858 }
{ These utilities use the Gregorian calendar after 4 Oct 1582 (Julian) i.e. from 15 Oct 1582 Gregorian }
{ Note C libraries use Gregorian only from 14 Sept 1752 }
{ More detailed discussion can be found at http://aa.usno.navy.mil/data/docs/JulianDate.php }
{ These routines have been compared with the results of the US Naval Observatory online converter. }
{ Modified Julian Date (MJD) = Julian Date (JD) - 2400000.5 }
{ }
{ In all routines, specifying a day, hour, minute or second field greater than would be valid is }
{ handled with modulo arithmetic and safe. }
{ Thus 2006-12-32 00:62:00.0 will safely, and correctly, be treated as 2007-01-01 01:02:00.0 }
{ }
{ }
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <string.h>}
{ include header file for dll definitions }
{$include "qsastimedll.h"}
type
  PQSASConfigStruct = ^TQSASConfigStruct;
  TQSASConfigStruct = record
      {undefined structure}
    end;

  TQSASConfigStruct = TQSASConfig;
{ externally accessible functions }

procedure configqsas(scale:Tdouble; offset1:Tdouble; offset2:Tdouble; ccontrol:longint; ifbtime_offset:longint; 
            year:longint; month:longint; day:longint; hour:longint; min:longint; 
            sec:Tdouble; qsasconfig:PPQSASConfig);cdecl;external;
procedure closeqsas(qsasconfig:PPQSASConfig);cdecl;external;
function ctimeqsas(year:longint; month:longint; day:longint; hour:longint; min:longint; 
           sec:Tdouble; ctime:Pdouble; qsasconfig:PQSASConfig):longint;cdecl;external;
procedure btimeqsas(year:Plongint; month:Plongint; day:Plongint; hour:Plongint; min:Plongint; 
            sec:Pdouble; ctime:Tdouble; qsasconfig:PQSASConfig);cdecl;external;
(* Const before type ignored *)
function strfqsas(buf:Pchar; len:Tsize_t; format:Pchar; ctime:Tdouble; qsasconfig:PQSASConfig):Tsize_t;cdecl;external;
{$endif}

implementation


end.
