{$IFDEF read_interface}


{
    Copyright (C) 2014 Abhinav Baid

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{  Memory management  ****************************************************** }

function _d_vec_init(len:Tslong):Pdouble;cdecl;external libflint;
procedure _d_vec_clear(vec:Pdouble);cdecl;external libflint;
{  Randomisation  ********************************************************** }
procedure _d_vec_randtest(f:Pdouble; state:Tflint_rand_t; len:Tslong; minexp:Tslong; maxexp:Tslong);cdecl;external libflint;
{  Assignment and basic manipulation  ************************************** }
procedure _d_vec_set(vec1:Pdouble; vec2:Pdouble; len2:Tslong);cdecl;external libflint;
procedure _d_vec_zero(vec:Pdouble; len:Tslong);cdecl;external libflint;
{  Comparison  ************************************************************* }
function _d_vec_equal(vec1:Pdouble; vec2:Pdouble; len:Tslong):longint;cdecl;external libflint;
function _d_vec_approx_equal(vec1:Pdouble; vec2:Pdouble; len:Tslong; eps:Tdouble):longint;cdecl;external libflint;
function _d_vec_is_zero(vec:Pdouble; len:Tslong):longint;cdecl;external libflint;
function _d_vec_is_approx_zero(vec:Pdouble; len:Tslong; eps:Tdouble):longint;cdecl;external libflint;
{  Addition  *************************************************************** }
procedure _d_vec_add(res:Pdouble; vec1:Pdouble; vec2:Pdouble; len2:Tslong);cdecl;external libflint;
procedure _d_vec_sub(res:Pdouble; vec1:Pdouble; vec2:Pdouble; len2:Tslong);cdecl;external libflint;
{  Dot product and norm  ************************************* }
function _d_vec_dot(vec1:Pdouble; vec2:Pdouble; len2:Tslong):Tdouble;cdecl;external libflint;
function _d_vec_norm(vec:Pdouble; len:Tslong):Tdouble;cdecl;external libflint;
function _d_vec_dot_heuristic(vec1:Pdouble; vec2:Pdouble; len2:Tslong; err:Pdouble):Tdouble;cdecl;external libflint;
function _d_vec_dot_thrice(vec1:Pdouble; vec2:Pdouble; len2:Tslong; err:Pdouble):Tdouble;cdecl;external libflint;
{$endif}

// === Konventiert am: 30-8-26 15:00:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
