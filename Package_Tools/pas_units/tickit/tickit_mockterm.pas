unit tickit_mockterm;

interface

uses
  ctypes;

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

function tickit_mockterm_new(lines:longint; cols:longint):PTickitMockTerm;cdecl;external libtickit;
procedure tickit_mockterm_destroy(mt:PTickitMockTerm);cdecl;external libtickit;
procedure tickit_mockterm_resize(mt:PTickitMockTerm; newlines:longint; newcols:longint);cdecl;external libtickit;
function tickit_mockterm_get_display_text(mt:PTickitMockTerm; buffer:Pchar; len:Tsize_t; line:longint; col:longint; 
           width:longint):Tsize_t;cdecl;external libtickit;
function tickit_mockterm_get_display_pen(mt:PTickitMockTerm; line:longint; col:longint):PTickitPen;cdecl;external libtickit;
function tickit_mockterm_loglen(mt:PTickitMockTerm):longint;cdecl;external libtickit;
function tickit_mockterm_peeklog(mt:PTickitMockTerm; i:longint):PTickitMockTermLogEntry;cdecl;external libtickit;
procedure tickit_mockterm_clearlog(mt:PTickitMockTerm);cdecl;external libtickit;
procedure tickit_mockterm_get_position(mt:PTickitMockTerm; line:Plongint; col:Plongint);cdecl;external libtickit;
{$endif}
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 2-5-25 13:40:48 ===


implementation



end.
