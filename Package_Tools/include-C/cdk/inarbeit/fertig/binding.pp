
unit binding;
interface

{
  Automatically converted by H2Pas 1.0.0 from binding.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    binding.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * $Id: binding.h,v 1.15 2005/03/08 23:44:25 tom Exp $
  }
{$ifndef CDKINCLUDES}
{$ifndef CDKBINDING_H}

const
  CDKBINDING_H = 1;  
{ C++ extern C conditionnal removed }
{$ifndef CDK_H}
{$define CDKINCLUDES}
{$include <cdk.h>}
{$undef CDKINCLUDES}
{$endif}
{
 * Copyright 1999-2004,2005 Thomas E. Dickey
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
 * Create definitions for the key bindings.
  }
{typedef BINDFN_PROTO(*BINDFN); }
{
 * Bind to this function to simply translate keys without doing anything else,
 * in getcCDKObject().
  }
  var
    getcCDKBind : TBINDFN_PROTO;cvar;external;
{
 * This is the prototype for the process callback functions.
  }
{ cdktype  }{ object  }{ clientData  }{ input  }type

  TPROCESSFN = function (para1:TEObjectType; para2:pointer; para3:pointer; para4:Tchtype):longint;cdecl;
{
 * This binds the key to the event.
  }
{ cdktype  }{ object  }{ key  }{ function  }{ data  }
procedure bindCDKObject(para1:TEObjectType; para2:pointer; para3:Tchtype; para4:TBINDFN; para5:pointer);cdecl;external;
{
 * This unbinds the key from the event.
  }
{ cdktype  }{ object  }{ key  }procedure unbindCDKObject(para1:TEObjectType; para2:pointer; para3:Tchtype);cdecl;external;
{
 * This checks if the given key has an event 'attached' to it, executes the
 * bound function if so.
  }
{ cdktype  }{ object  }{ key  }function checkCDKObjectBind(para1:TEObjectType; para2:pointer; para3:Tchtype):longint;cdecl;external;
{
 * This checks if the given key has an event 'attached' to it.
  }
{ cdktype  }{ object  }{ key  }function isCDKObjectBind(para1:TEObjectType; para2:pointer; para3:Tchtype):Tbool;cdecl;external;
{
 * This cleans out all of the key bindings.
  }
{ cdktype  }{ object  }procedure cleanCDKObjectBindings(para1:TEObjectType; para2:pointer);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CDKBINDING_H  }
{$endif}
{ CDKINCLUDES  }

implementation


end.
