
unit xraylib_error;
interface

{
  Automatically converted by H2Pas 1.0.0 from xraylib_error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xraylib_error.h
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
Pxrl_error  = ^xrl_error;
Pxrl_error_code  = ^xrl_error_code;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2018 Tom Schoonjans
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * The names of the contributors may not be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Tom Schoonjans 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Tom Schoonjans BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 }
{$ifndef XRAYLIB_ERROR_H}
{$define XRAYLIB_ERROR_H}
{ C++ extern C conditionnal removed }
{$ifndef SWIG}
{ set in case of a memory allocation problem  }
{ set in case an invalid argument gets passed to a routine  }
{ set in case an error involving input/output occurred  }
{ set in case an error involving type conversion occurred  }
{ set in case an unsupported feature has been requested  }
{ set in case an unexpected runtime error occurred  }
type
  Pxrl_error_code = ^Txrl_error_code;
  Txrl_error_code =  Longint;
  Const
    XRL_ERROR_MEMORY = 0;
    XRL_ERROR_INVALID_ARGUMENT = 1;
    XRL_ERROR_IO = 2;
    XRL_ERROR_TYPE = 3;
    XRL_ERROR_UNSUPPORTED = 4;
    XRL_ERROR_RUNTIME = 5;
;
{*
 * xrl_error:
 * @code: error code, e.g. %XRL_ERROR_MEMORY
 * @message: human-readable informative error message
 *
 * The `xrl_error` structure contains information about
 * an error that has occurred.
  }
type
  Pxrl_error = ^Txrl_error;
  Txrl_error = record
      code : Txrl_error_code;
      message : Pchar;
    end;


procedure xrl_error_free(error:Pxrl_error);cdecl;external;
(* Const before type ignored *)
function xrl_error_copy(error:Pxrl_error):Pxrl_error;cdecl;external;
(* Const before type ignored *)
function xrl_error_matches(error:Pxrl_error; code:Txrl_error_code):longint;cdecl;external;
procedure xrl_propagate_error(dest:PPxrl_error; src:Pxrl_error);cdecl;external;
procedure xrl_clear_error(err:PPxrl_error);cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
