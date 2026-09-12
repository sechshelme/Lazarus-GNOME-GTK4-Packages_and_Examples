unit getopt;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2013-2016, The Regents of The University of Michigan.
All rights reserved.
This software was developed in the APRIL Robotics Lab under the
direction of Edwin Olson, ebolson@umich.edu. This software may be
available under alternative licensing terms; contact the address above.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the Regents of The University of Michigan.
 }
(** unsupported pragma#pragma once*)
{$include "zarray.h"}
{$include "string_util.h"}
{ C++ extern C conditionnal removed }
type
  Tgetopt = Tgetopt_t;

function getopt_create:Pgetopt_t;cdecl;external libapriltag;
procedure getopt_destroy(gopt:Pgetopt_t);cdecl;external libapriltag;
{ Parse args. Returns 1 on success }
function getopt_parse(gopt:Pgetopt_t; argc:longint; argv:PPchar; showErrors:longint):longint;cdecl;external libapriltag;
procedure getopt_do_usage(gopt:Pgetopt_t);cdecl;external libapriltag;
{ Returns a string containing the usage. Must be freed by caller }
function getopt_get_usage(gopt:Pgetopt_t):Pchar;cdecl;external libapriltag;
procedure getopt_add_spacer(gopt:Pgetopt_t; s:Pchar);cdecl;external libapriltag;
procedure getopt_add_bool(gopt:Pgetopt_t; sopt:char; lname:Pchar; def:longint; help:Pchar);cdecl;external libapriltag;
procedure getopt_add_int(gopt:Pgetopt_t; sopt:char; lname:Pchar; def:Pchar; help:Pchar);cdecl;external libapriltag;
procedure getopt_add_string(gopt:Pgetopt_t; sopt:char; lname:Pchar; def:Pchar; help:Pchar);cdecl;external libapriltag;
procedure getopt_add_double(gopt:Pgetopt_t; sopt:char; lname:Pchar; def:Pchar; help:Pchar);cdecl;external libapriltag;
function getopt_get_string(gopt:Pgetopt_t; lname:Pchar):Pchar;cdecl;external libapriltag;
function getopt_get_int(getopt:Pgetopt_t; lname:Pchar):longint;cdecl;external libapriltag;
function getopt_get_bool(getopt:Pgetopt_t; lname:Pchar):longint;cdecl;external libapriltag;
function getopt_get_double(getopt:Pgetopt_t; lname:Pchar):Tdouble;cdecl;external libapriltag;
function getopt_was_specified(gopt:Pgetopt_t; lname:Pchar):longint;cdecl;external libapriltag;
function getopt_get_extra_args(gopt:Pgetopt_t):Pzarray_t;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:14:22 ===


implementation



end.
