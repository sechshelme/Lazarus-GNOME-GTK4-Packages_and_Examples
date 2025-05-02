
unit tickit_termdrv;
interface

{
  Automatically converted by H2Pas 1.0.0 from tickit_termdrv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tickit_termdrv.h
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
PTickitPen  = ^TickitPen;
PTickitRect  = ^TickitRect;
PTickitTerm  = ^TickitTerm;
PTickitTermDriver  = ^TickitTermDriver;
PTickitTermDriverVTable  = ^TickitTermDriverVTable;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ C++ extern C conditionnal removed }
{$ifndef __TICKIT_TERMDRV_H__}
{$define __TICKIT_TERMDRV_H__}
{
 * The contents of this file should be considered entirely experimental, and
 * subject to any change at any time. We make no API or ABI stability
 * guarantees at this time.
  }
{$include "tickit.h"}
{ optional  }
{ optional  }
{ optional  }
{ optional  }
{ optional  }
{ optional  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ optional  }
(* Const before type ignored *)
type
  PTickitTermDriverVTable = ^TTickitTermDriverVTable;
  TTickitTermDriverVTable = record
      attach : procedure (ttd:PTickitTermDriver; tt:PTickitTerm);cdecl;
      destroy : procedure (ttd:PTickitTermDriver);cdecl;
      start : procedure (ttd:PTickitTermDriver);cdecl;
      started : function (ttd:PTickitTermDriver):Tbool;cdecl;
      stop : procedure (ttd:PTickitTermDriver);cdecl;
      pause : procedure (ttd:PTickitTermDriver);cdecl;
      resume : procedure (ttd:PTickitTermDriver);cdecl;
      print : function (ttd:PTickitTermDriver; str:Pchar; len:Tsize_t):Tbool;cdecl;
      goto_abs : function (ttd:PTickitTermDriver; line:longint; col:longint):Tbool;cdecl;
      move_rel : function (ttd:PTickitTermDriver; downward:longint; rightward:longint):Tbool;cdecl;
      scrollrect : function (ttd:PTickitTermDriver; rect:PTickitRect; downward:longint; rightward:longint):Tbool;cdecl;
      erasech : function (ttd:PTickitTermDriver; count:longint; moveend:TTickitMaybeBool):Tbool;cdecl;
      clear : function (ttd:PTickitTermDriver):Tbool;cdecl;
      chpen : function (ttd:PTickitTermDriver; delta:PTickitPen; final:PTickitPen):Tbool;cdecl;
      getctl_int : function (ttd:PTickitTermDriver; ctl:TTickitTermCtl; value:Plongint):Tbool;cdecl;
      setctl_int : function (ttd:PTickitTermDriver; ctl:TTickitTermCtl; value:longint):Tbool;cdecl;
      setctl_str : function (ttd:PTickitTermDriver; ctl:TTickitTermCtl; value:Pchar):Tbool;cdecl;
      on_modereport : function (ttd:PTickitTermDriver; initial:longint; mode:longint; value:longint):longint;cdecl;
      on_decrqss : function (ttd:PTickitTermDriver; args:Pchar; arglen:Tsize_t):longint;cdecl;
    end;
(* Const before type ignored *)
  PTickitTermDriver = ^TTickitTermDriver;
  TTickitTermDriver = record
      tt : PTickitTerm;
      vtable : PTickitTermDriverVTable;
      name : Pchar;
    end;


function tickit_termdrv_get_tmpbuffer(ttd:PTickitTermDriver; len:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
procedure tickit_termdrv_write_str(ttd:PTickitTermDriver; str:Pchar; len:Tsize_t);cdecl;external;
(* Const before type ignored *)
procedure tickit_termdrv_write_strf(ttd:PTickitTermDriver; fmt:Pchar; args:array of const);cdecl;external;
procedure tickit_termdrv_write_strf(ttd:PTickitTermDriver; fmt:Pchar);cdecl;external;
function tickit_termdrv_current_pen(ttd:PTickitTermDriver):PTickitPen;cdecl;external;
{
 * Intended for "subclass" terminal methods, to obtain their custom driver
 * when given a TT instance
  }
function tickit_term_get_driver(tt:PTickitTerm):PTickitTermDriver;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }

implementation


end.
