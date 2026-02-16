unit io;

interface

uses
  fp_cglm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_io_h}
{$define cglmc_io_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_mat4_print(matrix:Tmat4; ostream:PFILE);cdecl;external libcglm;
procedure glmc_mat3_print(matrix:Tmat3; ostream:PFILE);cdecl;external libcglm;
procedure glmc_vec4_print(vec:Tvec4; ostream:PFILE);cdecl;external libcglm;
procedure glmc_vec3_print(vec:Tvec3; ostream:PFILE);cdecl;external libcglm;
procedure glmc_versor_print(vec:Tversor; ostream:PFILE);cdecl;external libcglm;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_io_h  }

// === Konventiert am: 16-2-26 19:44:49 ===


implementation



end.
