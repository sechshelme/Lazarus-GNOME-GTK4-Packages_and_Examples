unit plevent;

interface

uses
  fp_plplot;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  Input event (especially keyboard) definitions for use from plplot }
{  event handlers. }
{ }
{  Key definitions are taken from the X11/keysymdef.h include file, with }
{  some changes: }
{      - only the control keys are retained }
{      - the XK prefix has been changed to PLK }
{      - control keys with ASCII equivalents use the ASCII code }
{ }
{  By using the ASCII equivalent (if it exists) for all control keys, it }
{  is easier to handle keyboard input from any device which is ASCII based. }
{  Devices which use some other kind of key encoding must translate the raw }
{  keycodes to those used here. }
{ }
{$ifndef __PLEVENT_H__}
{$define __PLEVENT_H__}
{ Key definitions }
{-------------------------------------------------------------------------- }
{ Copyright 1987 by Digital Equipment Corporation, Maynard, Massachusetts, }
{ and the Massachusetts Institute of Technology, Cambridge, Massachusetts. }
{ }
{                      All Rights Reserved }
{ }
{ Permission to use, copy, modify, and distribute this software and its }
{ documentation for any purpose and without fee is hereby granted, }
{ provided that the above copyright notice appear in all copies and that }
{ both that copyright notice and this permission notice appear in }
{ supporting documentation, and that the names of Digital or MIT not be }
{ used in advertising or publicity pertaining to distribution of the }
{ software without specific, written prior permission. }
{ }
{ DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING }
{ ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL }
{ DIGITAL BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR }
{ ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, }
{ WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, }
{ ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS }
{ SOFTWARE. }
{ }
{-------------------------------------------------------------------------- }
{ Miscellaneous control keys, those with ASCII equivalents }

const
  PLK_BackSpace = $08;  { back space, back char }
  PLK_Tab = $09;  
  PLK_Linefeed = $0A;  { Linefeed, LF }
  PLK_Return = $0D;  { Return, enter }
  PLK_Escape = $1B;  
  PLK_Delete = $FF;  { Delete, rubout }
{ Those without ASCII equivalents }
  PLK_Clear = $FF0B;  
  PLK_Pause = $FF13;  { Pause, hold }
  PLK_Scroll_Lock = $FF14;  
{ Cursor control & motion }
  PLK_Home = $FF50;  
  PLK_Left = $FF51;  { Move left, left arrow }
  PLK_Up = $FF52;  { Move up, up arrow }
  PLK_Right = $FF53;  { Move right, right arrow }
  PLK_Down = $FF54;  { Move down, down arrow }
  PLK_Prior = $FF55;  { Prior, previous (Page Up) }
  PLK_Next = $FF56;  { Next (Page Down) }
  PLK_End = $FF57;  { EOL }
  PLK_Begin = $FF58;  { BOL }
{ Misc Functions }
  PLK_Select = $FF60;  { Select, mark }
  PLK_Print = $FF61;  
  PLK_Execute = $FF62;  { Execute, run, do }
  PLK_Insert = $FF63;  { Insert, insert here }
  PLK_Undo = $FF65;  { Undo, oops }
  PLK_Redo = $FF66;  { redo, again }
  PLK_Menu = $FF67;  
  PLK_Find = $FF68;  { Find, search }
  PLK_Cancel = $FF69;  { Cancel, stop, abort, exit }
  PLK_Help = $FF6A;  { Help, ? }
  PLK_Break = $FF6B;  
  PLK_Mode_switch = $FF7E;  { Character set switch }
  PLK_script_switch = $FF7E;  { Alias for mode_switch }
  PLK_Num_Lock = $FF7F;  
{ Keypad Functions, keypad numbers cleverly chosen to map to ascii }
  PLK_KP_Space = $FF80;  { space }
  PLK_KP_Tab = $FF89;  
  PLK_KP_Enter = $FF8D;  { enter }
  PLK_KP_F1 = $FF91;  { PF1, KP_A, ... }
  PLK_KP_F2 = $FF92;  
  PLK_KP_F3 = $FF93;  
  PLK_KP_F4 = $FF94;  
  PLK_KP_Equal = $FFBD;  { equals }
  PLK_KP_Multiply = $FFAA;  
  PLK_KP_Add = $FFAB;  
  PLK_KP_Separator = $FFAC;  { separator, often comma }
  PLK_KP_Subtract = $FFAD;  
  PLK_KP_Decimal = $FFAE;  
  PLK_KP_Divide = $FFAF;  
  PLK_KP_0 = $FFB0;  
  PLK_KP_1 = $FFB1;  
  PLK_KP_2 = $FFB2;  
  PLK_KP_3 = $FFB3;  
  PLK_KP_4 = $FFB4;  
  PLK_KP_5 = $FFB5;  
  PLK_KP_6 = $FFB6;  
  PLK_KP_7 = $FFB7;  
  PLK_KP_8 = $FFB8;  
  PLK_KP_9 = $FFB9;  
{ }
{ Auxilliary Functions; note the duplicate definitions for left and right }
{ function keys;  Sun keyboards and a few other manufactures have such }
{ function key groups on the left and/or right sides of the keyboard. }
{ We've not found a keyboard with more than 35 function keys total. }
{ }
  PLK_F1 = $FFBE;  
  PLK_F2 = $FFBF;  
  PLK_F3 = $FFC0;  
  PLK_F4 = $FFC1;  
  PLK_F5 = $FFC2;  
  PLK_F6 = $FFC3;  
  PLK_F7 = $FFC4;  
  PLK_F8 = $FFC5;  
  PLK_F9 = $FFC6;  
  PLK_F10 = $FFC7;  
  PLK_F11 = $FFC8;  
  PLK_L1 = $FFC8;  
  PLK_F12 = $FFC9;  
  PLK_L2 = $FFC9;  
  PLK_F13 = $FFCA;  
  PLK_L3 = $FFCA;  
  PLK_F14 = $FFCB;  
  PLK_L4 = $FFCB;  
  PLK_F15 = $FFCC;  
  PLK_L5 = $FFCC;  
  PLK_F16 = $FFCD;  
  PLK_L6 = $FFCD;  
  PLK_F17 = $FFCE;  
  PLK_L7 = $FFCE;  
  PLK_F18 = $FFCF;  
  PLK_L8 = $FFCF;  
  PLK_F19 = $FFD0;  
  PLK_L9 = $FFD0;  
  PLK_F20 = $FFD1;  
  PLK_L10 = $FFD1;  
  PLK_F21 = $FFD2;  
  PLK_R1 = $FFD2;  
  PLK_F22 = $FFD3;  
  PLK_R2 = $FFD3;  
  PLK_F23 = $FFD4;  
  PLK_R3 = $FFD4;  
  PLK_F24 = $FFD5;  
  PLK_R4 = $FFD5;  
  PLK_F25 = $FFD6;  
  PLK_R5 = $FFD6;  
  PLK_F26 = $FFD7;  
  PLK_R6 = $FFD7;  
  PLK_F27 = $FFD8;  
  PLK_R7 = $FFD8;  
  PLK_F28 = $FFD9;  
  PLK_R8 = $FFD9;  
  PLK_F29 = $FFDA;  
  PLK_R9 = $FFDA;  
  PLK_F30 = $FFDB;  
  PLK_R10 = $FFDB;  
  PLK_F31 = $FFDC;  
  PLK_R11 = $FFDC;  
  PLK_F32 = $FFDD;  
  PLK_R12 = $FFDD;  
  PLK_R13 = $FFDE;  
  PLK_F33 = $FFDE;  
  PLK_F34 = $FFDF;  
  PLK_R14 = $FFDF;  
  PLK_F35 = $FFE0;  
  PLK_R15 = $FFE0;  
{ Modifiers }
  PLK_Shift_L = $FFE1;  { Left shift }
  PLK_Shift_R = $FFE2;  { Right shift }
  PLK_Control_L = $FFE3;  { Left control }
  PLK_Control_R = $FFE4;  { Right control }
  PLK_Caps_Lock = $FFE5;  { Caps lock }
  PLK_Shift_Lock = $FFE6;  { Shift lock }
  PLK_Meta_L = $FFE7;  { Left meta }
  PLK_Meta_R = $FFE8;  { Right meta }
  PLK_Alt_L = $FFE9;  { Left alt }
  PLK_Alt_R = $FFEA;  { Right alt }
  PLK_Super_L = $FFEB;  { Left super }
  PLK_Super_R = $FFEC;  { Right super }
  PLK_Hyper_L = $FFED;  { Left hyper }
  PLK_Hyper_R = $FFEE;  { Right hyper }
{$endif}
{ __PLEVENT_H__ }

// === Konventiert am: 31-3-26 20:05:11 ===


implementation



end.
