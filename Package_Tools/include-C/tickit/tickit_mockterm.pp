
unit tickit_mockterm;
interface

{
  Automatically converted by H2Pas 1.0.0 from tickit_mockterm.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tickit_mockterm.h
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
Plongint  = ^longint;
PTickitMockTerm  = ^TickitMockTerm;
PTickitMockTermLogEntry  = ^TickitMockTermLogEntry;
PTickitPen  = ^TickitPen;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ C++ extern C conditionnal removed }
{$ifndef __TICKIT_MOCKTERM_H__}
{$define __TICKIT_MOCKTERM_H__}
{
 * The contents of this file should be considered entirely experimental, and
 * subject to any change at any time. We make no API or ABI stability
 * guarantees at this time.
  }
{$include "tickit.h"}
{ GOTO(line, col); ERASECH(count, moveend); SCROLLRECT(downward,rightward) }
(* Const before type ignored *)
{ PRINT }
{ SCROLLRECT }
{ SETPEN }
type
  PTickitMockTermLogEntry = ^TTickitMockTermLogEntry;
  TTickitMockTermLogEntry = record
      _type :  Longint;
      Const
        LOG_GOTO = 1;
        LOG_PRINT = 2;
        LOG_ERASECH = 3;
        LOG_CLEAR = 4;
        LOG_SCROLLRECT = 5;
        LOG_SETPEN = 6;
;
      val1 : longint;
      val2 : longint;
      str : Pchar;
      rect : TTickitRect;
      pen : PTickitPen;
    end;
{ A TickitMockTerm really is a TickitTerm  }
type
  PTickitMockTerm = ^TTickitMockTerm;
  TTickitMockTerm = TTickitTerm;

function tickit_mockterm_new(lines:longint; cols:longint):PTickitMockTerm;cdecl;external;
procedure tickit_mockterm_destroy(mt:PTickitMockTerm);cdecl;external;
procedure tickit_mockterm_resize(mt:PTickitMockTerm; newlines:longint; newcols:longint);cdecl;external;
function tickit_mockterm_get_display_text(mt:PTickitMockTerm; buffer:Pchar; len:Tsize_t; line:longint; col:longint; 
           width:longint):Tsize_t;cdecl;external;
function tickit_mockterm_get_display_pen(mt:PTickitMockTerm; line:longint; col:longint):PTickitPen;cdecl;external;
function tickit_mockterm_loglen(mt:PTickitMockTerm):longint;cdecl;external;
function tickit_mockterm_peeklog(mt:PTickitMockTerm; i:longint):PTickitMockTermLogEntry;cdecl;external;
procedure tickit_mockterm_clearlog(mt:PTickitMockTerm);cdecl;external;
procedure tickit_mockterm_get_position(mt:PTickitMockTerm; line:Plongint; col:Plongint);cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }

implementation


end.
