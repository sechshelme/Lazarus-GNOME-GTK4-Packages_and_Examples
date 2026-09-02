
unit fftw;
interface

{
  Automatically converted by H2Pas 1.0.0 from fftw.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fftw.h
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
Pfftw_codelet_desc  = ^fftw_codelet_desc;
Pfftw_complex  = ^fftw_complex;
Pfftw_direction  = ^fftw_direction;
Pfftw_generic_codelet  = ^fftw_generic_codelet;
Pfftw_hc2hc_codelet  = ^fftw_hc2hc_codelet;
Pfftw_hc2real_codelet  = ^fftw_hc2real_codelet;
Pfftw_malloc_type_function  = ^fftw_malloc_type_function;
Pfftw_node_type  = ^fftw_node_type;
Pfftw_notw_codelet  = ^fftw_notw_codelet;
Pfftw_plan  = ^fftw_plan;
Pfftw_plan_node  = ^fftw_plan_node;
Pfftw_plan_node_struct  = ^fftw_plan_node_struct;
Pfftw_plan_struct  = ^fftw_plan_struct;
Pfftw_rader_codelet  = ^fftw_rader_codelet;
Pfftw_rader_data  = ^fftw_rader_data;
Pfftw_rader_data_struct  = ^fftw_rader_data_struct;
Pfftw_real  = ^fftw_real;
Pfftw_real2hc_codelet  = ^fftw_real2hc_codelet;
Pfftw_recurse_kind  = ^fftw_recurse_kind;
Pfftw_rgeneric_codelet  = ^fftw_rgeneric_codelet;
Pfftw_status  = ^fftw_status;
Pfftw_twiddle  = ^fftw_twiddle;
Pfftw_twiddle_codelet  = ^fftw_twiddle_codelet;
Pfftw_twiddle_struct  = ^fftw_twiddle_struct;
Pfftwnd_data  = ^fftwnd_data;
Pfftwnd_plan  = ^fftwnd_plan;
PFILE  = ^FILE;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ fftw/fftw.h.  Generated from fftw.h.in by configure.   }
{ -*- C -*-  }
{
 * Copyright (c) 1997-1999, 2003 Massachusetts Institute of Technology
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
  }
{ fftw.h -- system-wide definitions  }
{ $Id: fftw.h.in,v 1.57 2003/03/16 23:43:46 stevenj Exp $  }
{$ifndef FFTW_H}
{$define FFTW_H}
{$include <stdlib.h>}
{$include <stdio.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{ Define for using single precision  }
{
 * If you can, use configure --enable-float instead of changing this
 * flag directly 
  }
{ #undef FFTW_ENABLE_FLOAT  }
{ our real numbers  }
{$ifdef FFTW_ENABLE_FLOAT}
type
  Pfftw_real = ^Tfftw_real;
  Tfftw_real = single;
{$else}
type
  Pfftw_real = ^Tfftw_real;
  Tfftw_real = Tdouble;
{$endif}
{********************************************
 * Complex numbers and operations 
 ******************************************** }
type
  Pfftw_complex = ^Tfftw_complex;
  Tfftw_complex = record
      re : Tfftw_real;
      im : Tfftw_real;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function c_re(c : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function c_im(c : longint) : longint;

type
  Pfftw_direction = ^Tfftw_direction;
  Tfftw_direction =  Longint;
  Const
    FFTW_FORWARD = -(1);
    FFTW_BACKWARD = 1;
;
{ backward compatibility with FFTW-1.3  }
type
  PFFTW_COMPLEX = ^TFFTW_COMPLEX;
  TFFTW_COMPLEX = Tfftw_complex;

  PFFTW_REAL = ^TFFTW_REAL;
  TFFTW_REAL = Tfftw_real;
{$ifndef FFTW_1_0_COMPATIBILITY}

const
  FFTW_1_0_COMPATIBILITY = 0;  
{$endif}
{$if FFTW_1_0_COMPATIBILITY}
{ backward compatibility with FFTW-1.0  }

const
  REAL = fftw_real;  
  COMPLEX = fftw_complex;  
{$endif}
{********************************************
 * Success or failure status
 ******************************************** }
type
  Pfftw_status = ^Tfftw_status;
  Tfftw_status =  Longint;
  Const
    FFTW_SUCCESS = 0;
    FFTW_FAILURE = -(1);
;
{********************************************
 *              Codelets
 ******************************************** }
(* Const before type ignored *)
type
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{********************************************
 *     Configurations
 ******************************************** }
{
 * A configuration is a database of all known codelets
  }
  Tfftw_node_type =  Longint;
  Const
    FFTW_NOTW = 0;
    FFTW_TWIDDLE = 1;
    FFTW_GENERIC = 2;
    FFTW_RADER = 3;
    FFTW_REAL2HC = 4;
    FFTW_HC2REAL = 5;
    FFTW_HC2HC = 6;
    FFTW_RGENERIC = 7;

{ description of a codelet  }
(* Const before type ignored *)
{ name of the codelet  }
{ pointer to the codelet itself  }
{ size of the codelet  }
{ direction  }
{ TWIDDLE or NO_TWIDDLE  }
{ unique id  }
{ number of twiddle factors  }
(* Const before type ignored *)
{ 
				 * array that determines the order 
				 * in which the codelet expects
				 * the twiddle factors
				  }
type
  Pfftw_codelet_desc = ^Tfftw_codelet_desc;
  Tfftw_codelet_desc = record
      name : Pchar;
      codelet : procedure ;cdecl;
      size : longint;
      dir : Tfftw_direction;
      _type : Tfftw_node_type;
      signature : longint;
      ntwiddle : longint;
      twiddle_order : Plongint;
    end;
{ On Win32, you need to do funny things to access global variables
   in shared libraries.  Thanks to Andrew Sterian for this hack.  }
(* Const before type ignored *)
  var
    fftw_version : Pchar;cvar;external;
{****************************
 *        Plans
 **************************** }
{
 * A plan is a sequence of reductions to compute a FFT of
 * a given size.  At each step, the FFT algorithm can:
 *
 * 1) apply a notw codelet, or
 * 2) recurse and apply a twiddle codelet, or
 * 3) apply the generic codelet.
  }
{ structure that contains twiddle factors  }
(* Const before type ignored *)
type
  Pfftw_twiddle_struct = ^Tfftw_twiddle_struct;
  Tfftw_twiddle_struct = record
      n : longint;
      cdesc : Pfftw_codelet_desc;
      twarray : Pfftw_complex;
      next : Pfftw_twiddle_struct;
      refcnt : longint;
    end;
  Tfftw_twiddle = Tfftw_twiddle_struct;
  Pfftw_twiddle = ^Tfftw_twiddle;

  Pfftw_rader_data_struct = ^Tfftw_rader_data_struct;
  Tfftw_rader_data_struct = record
      plan : Pfftw_plan_struct;
      omega : Pfftw_complex;
      g : longint;
      ginv : longint;
      p : longint;
      flags : longint;
      refcount : longint;
      next : Pfftw_rader_data_struct;
      cdesc : Pfftw_codelet_desc;
    end;
  Tfftw_rader_data = Tfftw_rader_data_struct;
  Pfftw_rader_data = ^Tfftw_rader_data;
(* Const before type ignored *)
{ structure that holds all the data needed for a given step  }
{ nodes of type FFTW_NOTW  }
(* Const before type ignored *)
{ nodes of type FFTW_TWIDDLE  }
(* Const before type ignored *)
{ nodes of type FFTW_GENERIC  }
{ nodes of type FFTW_RADER  }
{ nodes of type FFTW_REAL2HC  }
(* Const before type ignored *)
{ nodes of type FFTW_HC2REAL  }
(* Const before type ignored *)
{ nodes of type FFTW_HC2HC  }
(* Const before type ignored *)
{ nodes of type FFTW_RGENERIC  }

  Pfftw_plan_node_struct = ^Tfftw_plan_node_struct;
  Tfftw_plan_node_struct = record
      _type : Tfftw_node_type;
      nodeu : record
          case longint of
            0 : ( notw : record
                size : longint;
                codelet : Pfftw_notw_codelet;
                codelet_desc : Pfftw_codelet_desc;
              end );
            1 : ( twiddle : record
                size : longint;
                codelet : Pfftw_twiddle_codelet;
                tw : Pfftw_twiddle;
                recurse : Pfftw_plan_node_struct;
                codelet_desc : Pfftw_codelet_desc;
              end );
            2 : ( generic : record
                size : longint;
                codelet : Pfftw_generic_codelet;
                tw : Pfftw_twiddle;
                recurse : Pfftw_plan_node_struct;
              end );
            3 : ( rader : record
                size : longint;
                codelet : Pfftw_rader_codelet;
                rader_data : Pfftw_rader_data;
                tw : Pfftw_twiddle;
                recurse : Pfftw_plan_node_struct;
              end );
            4 : ( real2hc : record
                size : longint;
                codelet : Pfftw_real2hc_codelet;
                codelet_desc : Pfftw_codelet_desc;
              end );
            5 : ( hc2real : record
                size : longint;
                codelet : Pfftw_hc2real_codelet;
                codelet_desc : Pfftw_codelet_desc;
              end );
            6 : ( hc2hc : record
                size : longint;
                dir : Tfftw_direction;
                codelet : Pfftw_hc2hc_codelet;
                tw : Pfftw_twiddle;
                recurse : Pfftw_plan_node_struct;
                codelet_desc : Pfftw_codelet_desc;
              end );
            7 : ( rgeneric : record
                size : longint;
                dir : Tfftw_direction;
                codelet : Pfftw_rgeneric_codelet;
                tw : Pfftw_twiddle;
                recurse : Pfftw_plan_node_struct;
              end );
          end;
      refcnt : longint;
    end;
  Tfftw_plan_node = Tfftw_plan_node_struct;
  Pfftw_plan_node = ^Tfftw_plan_node;

  Pfftw_recurse_kind = ^Tfftw_recurse_kind;
  Tfftw_recurse_kind =  Longint;
  Const
    FFTW_NORMAL_RECURSE = 0;
    FFTW_VECTOR_RECURSE = 1;
;
type
  Pfftw_plan_struct = ^Tfftw_plan_struct;
  Tfftw_plan_struct = record
      n : longint;
      refcnt : longint;
      dir : Tfftw_direction;
      flags : longint;
      wisdom_signature : longint;
      wisdom_type : Tfftw_node_type;
      next : Pfftw_plan_struct;
      root : Pfftw_plan_node;
      cost : Tdouble;
      recurse_kind : Tfftw_recurse_kind;
      vector_size : longint;
    end;


  Pfftw_plan = ^Tfftw_plan;
  Tfftw_plan = Pfftw_plan_struct;
{ flags for the planner  }

const
  FFTW_ESTIMATE = 0;  
  FFTW_MEASURE = 1;  
  FFTW_OUT_OF_PLACE = 0;  
  FFTW_IN_PLACE = 8;  
  FFTW_USE_WISDOM = 16;  
{ guarantee plan is read-only so that the
				  same plan can be used in parallel by
				  multiple threads  }
  FFTW_THREADSAFE = 128;  
{ internal flag, forces buffering
                                           in fftwnd transforms  }
  FFTWND_FORCE_BUFFERED = 256;  
{ internal flag, prevents use
                                           of vector recursion  }
  FFTW_NO_VECTOR_RECURSE = 512;  

function fftw_create_plan_specific(n:longint; dir:Tfftw_direction; flags:longint; in:Pfftw_complex; istride:longint; 
           out:Pfftw_complex; ostride:longint):Tfftw_plan;cdecl;external;
{$define FFTW_HAS_PLAN_SPECIFIC}
function fftw_create_plan(n:longint; dir:Tfftw_direction; flags:longint):Tfftw_plan;cdecl;external;
procedure fftw_print_plan(plan:Tfftw_plan);cdecl;external;
procedure fftw_destroy_plan(plan:Tfftw_plan);cdecl;external;
procedure fftw(plan:Tfftw_plan; howmany:longint; in:Pfftw_complex; istride:longint; idist:longint; 
            out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external;
procedure fftw_one(plan:Tfftw_plan; in:Pfftw_complex; out:Pfftw_complex);cdecl;external;
(* Const before type ignored *)
procedure fftw_die(s:Pchar);cdecl;external;
function fftw_malloc(n:Tsize_t):pointer;cdecl;external;
procedure fftw_free(p:pointer);cdecl;external;
procedure fftw_check_memory_leaks;cdecl;external;
procedure fftw_print_max_memory_usage;cdecl;external;
type
  Pfftw_malloc_type_function = ^Tfftw_malloc_type_function;
  Tfftw_malloc_type_function = function (n:Tsize_t):pointer;cdecl;

  Tfftw_free_type_function = procedure (p:pointer);cdecl;
(* Const before type ignored *)

  Tfftw_die_type_function = procedure (errString:Pchar);cdecl;
  var
    fftw_malloc_hook : Tfftw_malloc_type_function;cvar;external;
    fftw_free_hook : Tfftw_free_type_function;cvar;external;
    fftw_die_hook : Tfftw_die_type_function;cvar;external;

function fftw_sizeof_fftw_real:Tsize_t;cdecl;external;
{ Wisdom:  }
{
 * define this symbol so that users know we are using a version of FFTW
 * with wisdom
  }
{$define FFTW_HAS_WISDOM}
procedure fftw_forget_wisdom;cdecl;external;
procedure fftw_export_wisdom(emitter:procedure (c:char; para2:pointer); data:pointer);cdecl;external;
function fftw_import_wisdom(g:function (para1:pointer):longint; data:pointer):Tfftw_status;cdecl;external;
procedure fftw_export_wisdom_to_file(output_file:PFILE);cdecl;external;
function fftw_import_wisdom_from_file(input_file:PFILE):Tfftw_status;cdecl;external;
function fftw_export_wisdom_to_string:Pchar;cdecl;external;
(* Const before type ignored *)
function fftw_import_wisdom_from_string(input_string:Pchar):Tfftw_status;cdecl;external;
{
 * define symbol so we know this function is available (it is not in
 * older FFTWs)
  }
{$define FFTW_HAS_FPRINT_PLAN}
procedure fftw_fprint_plan(f:PFILE; plan:Tfftw_plan);cdecl;external;
{****************************
 *    N-dimensional code
 **************************** }
{ 1 if for in-place FFTs, 0 otherwise  }
{ 
				 * the rank (number of dimensions) of the
				 * array to be FFTed 
				  }
{
				 * the dimensions of the array to the
				 * FFTed 
				  }
{
				 * n_before[i] = product of n[j] for j < i 
				  }
{ n_after[i] = product of n[j] for j > i  }
{ 1d fftw plans for each dimension  }
{ 
				 * work array big enough to hold
				 * nbuffers+1 of the largest dimension 
				 * (has nwork elements)
				  }
type
  Pfftwnd_data = ^Tfftwnd_data;
  Tfftwnd_data = record
      is_in_place : longint;
      rank : longint;
      n : Plongint;
      dir : Tfftw_direction;
      n_before : Plongint;
      n_after : Plongint;
      plans : Pfftw_plan;
      nbuffers : longint;
      nwork : longint;
      work : Pfftw_complex;
    end;

  Pfftwnd_plan = ^Tfftwnd_plan;
  Tfftwnd_plan = Pfftwnd_data;
{ Initializing the FFTWND plan:  }

function fftw2d_create_plan(nx:longint; ny:longint; dir:Tfftw_direction; flags:longint):Tfftwnd_plan;cdecl;external;
function fftw3d_create_plan(nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; flags:longint):Tfftwnd_plan;cdecl;external;
(* Const before type ignored *)
function fftwnd_create_plan(rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint):Tfftwnd_plan;cdecl;external;
function fftw2d_create_plan_specific(nx:longint; ny:longint; dir:Tfftw_direction; flags:longint; in:Pfftw_complex; 
           istride:longint; out:Pfftw_complex; ostride:longint):Tfftwnd_plan;cdecl;external;
function fftw3d_create_plan_specific(nx:longint; ny:longint; nz:longint; dir:Tfftw_direction; flags:longint; 
           in:Pfftw_complex; istride:longint; out:Pfftw_complex; ostride:longint):Tfftwnd_plan;cdecl;external;
(* Const before type ignored *)
function fftwnd_create_plan_specific(rank:longint; n:Plongint; dir:Tfftw_direction; flags:longint; in:Pfftw_complex; 
           istride:longint; out:Pfftw_complex; ostride:longint):Tfftwnd_plan;cdecl;external;
{ Freeing the FFTWND plan:  }
procedure fftwnd_destroy_plan(plan:Tfftwnd_plan);cdecl;external;
{ Printing the plan:  }
procedure fftwnd_fprint_plan(f:PFILE; p:Tfftwnd_plan);cdecl;external;
procedure fftwnd_print_plan(p:Tfftwnd_plan);cdecl;external;
{$define FFTWND_HAS_PRINT_PLAN}
{ Computing the N-Dimensional FFT  }
procedure fftwnd(plan:Tfftwnd_plan; howmany:longint; in:Pfftw_complex; istride:longint; idist:longint; 
            out:Pfftw_complex; ostride:longint; odist:longint);cdecl;external;
procedure fftwnd_one(p:Tfftwnd_plan; in:Pfftw_complex; out:Pfftw_complex);cdecl;external;
{ __cplusplus  }
{$endif}
{ FFTW_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function c_re(c : longint) : longint;
begin
  c_re:=c.re;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function c_im(c : longint) : longint;
begin
  c_im:=c.im;
end;


end.
