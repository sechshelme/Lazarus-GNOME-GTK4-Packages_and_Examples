
unit error;
interface

{
  Automatically converted by H2Pas 1.0.0 from error.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    error.h
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
PTCOD_Error  = ^TCOD_Error;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ BSD 3-Clause License
 *
 * Copyright © 2008-2021, Jice and the libtcod contributors.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
  }
{$ifndef LIBTCOD_ENGINE_ERROR_H_}
{$define LIBTCOD_ENGINE_ERROR_H_}
{ __cplusplus }
{$include "config.h"}
{$include "version.h"}
{*
 *  An enum of libtcod error codes.
 *
 *  On values other than `TCOD_E_OK` you can use `TCOD_get_error()` to learn
 *  more information.
 *  \rst
 *  .. versionadded:: 1.16
 *  \endrst
  }
{*
   *  The function completed successfully without issues.
   *
   *  A function is successful when `(err >= 0)`.  Positive values may be used
   *  for warnings, or for other outputs.
    }
{*
   *  The error code for generic runtime errors.
   *
   *  The returned code my be changed in the future to something more specific.
   *  Use `(err < 0)` to check if the value is an error.
    }
{*
   *  The function failed because a given input argument was invalid.
    }
{*
   *  The function failed because it was unable to allocate enough memory.
    }
{*
      This function needs additional attention, but is otherwise functioning
      correctly.  See its documentation.
      \rst
      .. versionadded:: 1.16
      \endrst
    }
{*
   *  The function completed, but a minor issue was detected.
    }
type
  PTCOD_Error = ^TTCOD_Error;
  TTCOD_Error =  Longint;
  Const
    TCOD_E_OK = 0;
    TCOD_E_ERROR = -(1);
    TCOD_E_INVALID_ARGUMENT = -(2);
    TCOD_E_OUT_OF_MEMORY = -(3);
    TCOD_E_REQUIRES_ATTENTION = -(4);
    TCOD_E_WARN = 1;
;
{ C++ extern C conditionnal removed }
{ __cplusplus }
{*
 *  Return the last error message.  If there is no error then the string will
 *  have a length of zero.
 *
 *  The error state is thread specific.
 *  \rst
 *  .. versionadded:: 1.12
 *  \endrst
  }
(* Const before type ignored *)

function TCOD_get_error:Pchar;cdecl;external;
{*
 *  Set an error message and return TCOD_E_ERROR.
 *  \rst
 *  .. versionadded:: 1.12
 *  \endrst
  }
(* Const before type ignored *)
function TCOD_set_error(msg:Pchar):TTCOD_Error;cdecl;external;
{*
 *  Set an error message and return TCOD_E_ERROR.
 *  \rst
 *  .. versionadded:: 1.16
 *  \endrst
  }
(* Const before type ignored *)
function TCOD_set_errorf(fmt:Pchar; args:array of const):TTCOD_Error;cdecl;external;
function TCOD_set_errorf(fmt:Pchar):TTCOD_Error;cdecl;external;
{*
 *  Clear a current existing error message.
 *  \rst
 *  .. versionadded:: 1.16
 *  \endrst
  }
procedure TCOD_clear_error;cdecl;external;
{*
 *  Set an error with version, file, and line info added to the output.
 *
 *  Used internally.
  }
{*
 *  Format an error with version, file, and line info added to the output.
 *
 *  Used internally.
  }

implementation


end.
