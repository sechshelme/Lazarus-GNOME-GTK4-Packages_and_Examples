{$IFDEF read_interface}


{
    Copyright (C) 2016 William Hart

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{$ifndef EXCEPTION_H}
{$define EXCEPTION_H}
{ general error  }
{ impossible inverse  }
{ domain error  }
{ divide by zero  }
{ exponent overflow  }
{ inexact error  }
type
  Pflint_err_t = ^Tflint_err_t;
  Tflint_err_t =  Longint;
  Const
    FLINT_ERROR = 0;
    FLINT_IMPINV = 1;
    FLINT_DOMERR = 2;
    FLINT_DIVZERO = 3;
    FLINT_EXPOF = 4;
    FLINT_INEXACT = 5;
;

procedure flint_throw(exc:Tflint_err_t; msg:Pchar; args:array of const);cdecl;external libflint;
procedure flint_throw(exc:Tflint_err_t; msg:Pchar);cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
