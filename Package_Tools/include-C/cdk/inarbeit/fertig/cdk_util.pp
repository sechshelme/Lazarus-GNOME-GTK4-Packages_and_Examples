
unit cdk_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from cdk_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cdk_util.h
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
PCDK_CSTRING  = ^CDK_CSTRING;
PCDKSCREEN  = ^CDKSCREEN;
Pchar  = ^char;
Pchtype  = ^chtype;
Plongint  = ^longint;
PWINDOW  = ^WINDOW;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: cdk_util.h,v 1.36 2014/01/19 01:58:31 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKUTIL_H}

const
  CDKUTIL_H = 1;  
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$include <cdk/binding.h>}
{$include <cdk/cdkscreen.h>}
{$endif}
{
 * Changes 1999-2012,2014 copyright Thomas E. Dickey
 * Copyright 1999, Mike Glover
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, distribute with
 * modifications, sublicense, and/or sell copies of the Software, and to permit
 * persons to whom the Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
 * IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name(s) of the above copyright
 * holders shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in this Software without prior written authorization.
  }
{
 * This beeps at the user. The standard curses beep() does not
 * flush the stream, so it will only beep until a force is made.
 * This forces a flush after issuing the beep command.
  }

procedure Beep;cdecl;external;
{
 * This aligns a 'box' on the given window with the height and
 * width given.
  }
{ window  }{ xpos  }{ ypos  }{ boxWidth  }{ boxHeight  }procedure alignxy(para1:PWINDOW; para2:Plongint; para3:Plongint; para4:longint; para5:longint);cdecl;external;
{
 * This takes a string, a field width and a justification type and returns the
 * justification adjustment to make, to fill the justification requirement.
  }
{ fieldWidth  }{ mesglen  }{ justify  }function justifyString(para1:longint; para2:longint; para3:longint):longint;cdecl;external;
{
 * This is a quick little popup label widget.
  }
{ win  }{ mesg  }{ count  }procedure popupLabel(para1:PCDKSCREEN; para2:TCDK_CSTRING2; para3:longint);cdecl;external;
{
 * This is a quick little popup label widget.
  }
{ win  }{ mesg  }{ count  }{ attribute  }procedure popupLabelAttrib(para1:PCDKSCREEN; para2:TCDK_CSTRING2; para3:longint; para4:Tchtype);cdecl;external;
{
 * This is a quick little popup dialog box.
  }
{ screen  }{ mesg  }{ mesgCount  }{ buttons  }{ buttonCount  }function popupDialog(para1:PCDKSCREEN; para2:TCDK_CSTRING2; para3:longint; para4:TCDK_CSTRING2; para5:longint):longint;cdecl;external;
{
 * This pops up a scrolling list and returns the value selected.
  }
{ screen  }(* Const before type ignored *)
{ title  }{ list  }{ listSize  }{ numbers  }function getListIndex(para1:PCDKSCREEN; para2:Pchar; para3:TCDK_CSTRING2; para4:longint; para5:Tboolean):longint;cdecl;external;
{
 * This gets a simple string value from a user.
  }
{ screen  }(* Const before type ignored *)
{ title  }(* Const before type ignored *)
{ label  }(* Const before type ignored *)
{ init  }function getString(para1:PCDKSCREEN; para2:Pchar; para3:Pchar; para4:Pchar):Pchar;cdecl;external;
{
 * This allows a user to view a file.
  }
{ screen  }(* Const before type ignored *)
{ title  }(* Const before type ignored *)
{ filename  }{ buttons  }{ buttonCount  }function viewFile(para1:PCDKSCREEN; para2:Pchar; para3:Pchar; para4:TCDK_CSTRING2; para5:longint):longint;cdecl;external;
{
 * This allows a person to select a file.
  }
{ screen  }(* Const before type ignored *)
{ title  }function selectFile(para1:PCDKSCREEN; para2:Pchar):Pchar;cdecl;external;
{
 * This allows people to view information in an array.
  }
{ screen  }(* Const before type ignored *)
{ title  }{ info  }{ size  }{ buttons  }{ buttonCount  }{ interpret  }function viewInfo(para1:PCDKSCREEN; para2:Pchar; para3:TCDK_CSTRING2; para4:longint; para5:TCDK_CSTRING2; 
           para6:longint; para7:Tboolean):longint;cdecl;external;
{
 * This is a wrapper for qsort.
  }
{ list  }{ length  }procedure sortList(para1:PCDK_CSTRING; para2:longint);cdecl;external;
{
 * This reads a file, loads the contents into info and
 * returns the number of lines read.
  }
(* Const before type ignored *)
{ filename  }{ info  }function CDKreadFile(para1:Pchar; para2:PPPchar):longint;cdecl;external;
{
 * This strips white space from the front/back of the given
 * string. The stripType is one of: vFRONT, vBACK, vBOTH.
  }
{ stripType  }{ string  }procedure stripWhiteSpace(para1:TEStripType; para2:Pchar);cdecl;external;
{
 * These functions are used to manage a string which is split into parts, e.g.,
 * a file which is read into memory.
  }
(* Const before type ignored *)
{ string  }{ separator  }function CDKsplitString(para1:Pchar; para2:longint):^Pchar;cdecl;external;
{ list  }{ item  }{ length  }{ used  }function CDKallocStrings(para1:PPPchar; para2:Pchar; para3:dword; para4:dword):dword;cdecl;external;
{ list  }function CDKcountStrings(para1:TCDK_CSTRING2):dword;cdecl;external;
{ list  }procedure CDKfreeStrings(para1:PPchar);cdecl;external;
{
 * Free a list of chtype-strings, terminated by a null pointer.
  }
{ list  }procedure CDKfreeChtypes(para1:PPchtype);cdecl;external;
{
 * This returns the length of an integer.
  }
{ value  }function intlen(para1:longint):longint;cdecl;external;
{
 * This opens the given directory and reads in the contents. It stores
 * the results in 'list' and returns the number of elements found.
  }
(* Const before type ignored *)
{ directory  }{ list  }function CDKgetDirectoryContents(para1:Pchar; para2:PPPchar):longint;cdecl;external;
{
 * This looks for the given pattern in the given list.
  }
{ list  }{ listSize  }(* Const before type ignored *)
{ pattern  }function searchList(para1:TCDK_CSTRING2; para2:longint; para3:Pchar):longint;cdecl;external;
{
 * This returns the basename of a file.
  }
{ filename  }function baseName(para1:Pchar):Pchar;cdecl;external;
{
 * This returns the directory name of a file.
  }
{ filename  }function dirName(para1:Pchar):Pchar;cdecl;external;
{
 * This frees the memory used by the given string.
  }
{ string  }procedure freeChar(para1:Pchar);cdecl;external;
{
 * This frees the memory used by the given string.
  }
{ string  }procedure freeChtype(para1:Pchtype);cdecl;external;
{
 * This frees the memory used by the given list of strings.
  }
{ list  }{ size  }procedure freeCharList(para1:PPchar; para2:dword);cdecl;external;
{
 * This frees the memory used by the given list of strings.
  }
{ list  }{ size  }procedure freeChtypeList(para1:PPchtype; para2:dword);cdecl;external;
{
 * This sets the elements of the given string to 'character'
  }
{ string  }{ length  }{ character  }procedure cleanChar(para1:Pchar; para2:longint; para3:char);cdecl;external;
{
 * This sets the elements of the given string to 'character'
  }
{ string  }{ length  }{ character  }procedure cleanChtype(para1:Pchtype; para2:longint; para3:Tchtype);cdecl;external;
{
 * This takes a chtype pointer and returns a char pointer.
  }
(* Const before type ignored *)
{ string  }function chtype2Char(para1:Pchtype):Pchar;cdecl;external;
{
 * This takes a chtype pointer and returns a char pointer with embedded
 * formatting information.
  }
(* Const before type ignored *)
{ string  }function chtype2String(para1:Pchtype):Pchar;cdecl;external;
{
 * This takes a char pointer and returns a chtype pointer.
  }
(* Const before type ignored *)
{ string  }{ length  }{ align  }function char2Chtype(para1:Pchar; para2:Plongint; para3:Plongint):Pchtype;cdecl;external;
{
 * Compare a char string to a chtype string
  }
(* Const before type ignored *)
{ str  }(* Const before type ignored *)
{ chstr  }function cmpStrChstr(para1:Pchar; para2:Pchtype):longint;cdecl;external;
{
 * Copy from a chtype string to a char string
  }
{ dest  }(* Const before type ignored *)
{ src  }{ maxcount  }procedure chstrncpy(para1:Pchar; para2:Pchtype; para3:longint);cdecl;external;
{
 * Given a character pointer, returns the equivalent display type.
  }
(* Const before type ignored *)
{ string  }function char2DisplayType(para1:Pchar):TEDisplayType;cdecl;external;
{
 * Tell if a display type is "hidden"
  }
{ type  }function isHiddenDisplayType(para1:TEDisplayType):Tboolean;cdecl;external;
{
 * Filter an input character according to the display type.
  }
{ type  }{ input  }function filterByDisplayType(para1:TEDisplayType; para2:Tchtype):longint;cdecl;external;
{
 * Copy the given string.
  }
(* Const before type ignored *)
{ string  }function copyChtype(para1:Pchtype):Pchtype;cdecl;external;
{
 * Copy the given string.
  }
(* Const before type ignored *)
{ string  }function copyChar(para1:Pchar):Pchar;cdecl;external;
{
 * Copy the given list.
  }
(* Const before type ignored *)
{ list  }function copyCharList(para1:PPchar):^Pchar;cdecl;external;
{
 * Copy the given list.
  }
(* Const before type ignored *)
{ list  }function copyChtypeList(para1:PPchtype):^Pchtype;cdecl;external;
{
 * Return the length of the given string.
  }
(* Const before type ignored *)
{ string  }function chlen(para1:Pchtype):longint;cdecl;external;
{
 * Return the length of the given list.
  }
(* Const before type ignored *)
{ list  }function lenCharList(para1:PPchar):longint;cdecl;external;
(* Const before type ignored *)
{ list  }function lenChtypeList(para1:PPchtype):longint;cdecl;external;
{
 * This takes a file mode and returns the first character of the file
 * permissions string.
  }
{ fileMode  }function mode2Filetype(para1:Tmode_t):longint;cdecl;external;
{
 * This takes a file mode and stores the character representation
 * of the mode in 'string'. This also returns the octal value
 * of the file mode.
  }
{ string  }{ fileMode  }function mode2Char(para1:Pchar; para2:Tmode_t):longint;cdecl;external;
{
 * This looks for a link. (used by the </L> pattern)
  }
(* Const before type ignored *)
{ line  }{ filename  }function checkForLink(para1:Pchar; para2:Pchar):longint;cdecl;external;
{
 * This function help set the height/width values of a widget.
  }
{ parentDim  }{ proposedDim  }{ adjustment  }function setWidgetDimension(para1:longint; para2:longint; para3:longint):longint;cdecl;external;
{
 * This safely erases a given window.
  }
{ window  }procedure eraseCursesWindow(para1:PWINDOW);cdecl;external;
{
 * This safely deletes a given window.
  }
{ window  }procedure deleteCursesWindow(para1:PWINDOW);cdecl;external;
{
 * This moves a given window
  }
{ window  }{ xdiff  }{ ydiff  }procedure moveCursesWindow(para1:PWINDOW; para2:longint; para3:longint);cdecl;external;
{
 * Return an integer like 'floor()', which returns a double.
  }
function floorCDK(para1:Tdouble):longint;cdecl;external;
{
 * Return an integer like 'ceil()', which returns a double.
  }
function ceilCDK(para1:Tdouble):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKUTIL_H  }
{$endif}
{ CDKINCLUDES  }

implementation


end.
