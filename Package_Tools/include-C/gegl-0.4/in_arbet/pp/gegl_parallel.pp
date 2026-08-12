
unit gegl_parallel;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_parallel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_parallel.h
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
PGeglRectangle  = ^GeglRectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2018 Ell
  }
{$ifndef __GEGL_PARALLEL_H__}
{$define __GEGL_PARALLEL_H__}
{*
 * GeglParallelDistributeFunc:
 * @i: the current thread index, in the range [0,@n)
 * @n: the number of threads execution is distributed across
 * @user_data: user data pointer
 *
 * Specifies the type of function passed to gegl_parallel_distribute().
 *
 * The function should process the @i-th part of the data, out of @n
 * equal parts.  @n may be less-than or equal-to the @max_n argument
 * passed to gegl_parallel_distribute().
  }
type

  TGeglParallelDistributeFunc = procedure (i:Tgint; n:Tgint; user_data:Tgpointer);cdecl;
{*
 * GeglParallelDistributeRangeFunc:
 * @offset: the current data offset
 * @size: the current data size
 * @user_data: user data pointer
 *
 * Specifies the type of function passed to
 * gegl_parallel_distribute_range().
 *
 * The function should process @size elements of the data, starting
 * at @offset.
  }

  TGeglParallelDistributeRangeFunc = procedure (offset:Tgsize; size:Tgsize; user_data:Tgpointer);cdecl;
{*
 * GeglParallelDistributeAreaFunc:
 * @area: the current sub-area
 * @user_data: user data pointer
 *
 * Specifies the type of function passed to
 * gegl_parallel_distribute_area().
 *
 * The function should process the sub-area specified by @area.
 *
  }
(* Const before type ignored *)

  TGeglParallelDistributeAreaFunc = procedure (area:PGeglRectangle; user_data:Tgpointer);cdecl;
{*
 * gegl_parallel_distribute:
 * @max_n: the maximal number of threads to use
 * @func: (closure user_data) (scope call): the function to call
 * @user_data: user data to pass to the function
 *
 * Distributes the execution of a function across multiple threads,
 * by calling it with a different index on each thread.
  }

procedure gegl_parallel_distribute(max_n:Tgint; func:TGeglParallelDistributeFunc; user_data:Tgpointer);cdecl;external;
{*
 * gegl_parallel_distribute_range:
 * @size: the total size of the data
 * @thread_cost: the cost of using each additional thread, relative
 *               to the cost of processing a single data element
 * @func: (closure user_data) (scope call): the function to call
 * @user_data: user data to pass to the function
 *
 * Distributes the processing of a linear data-structure across
 * multiple threads, by calling the given function with different
 * sub-ranges on different threads.
  }
procedure gegl_parallel_distribute_range(size:Tgsize; thread_cost:Tgdouble; func:TGeglParallelDistributeRangeFunc; user_data:Tgpointer);cdecl;external;
{*
 * gegl_parallel_distribute_area:
 * @area: the area to process
 * @thread_cost: the cost of using each additional thread, relative
 *               to the cost of processing a single data element
 * @split_strategy: the strategy to use for dividing the area
 * @func: (closure user_data) (scope call): the function to call
 * @user_data: user data to pass to the function
 *
 * Distributes the processing of a planar data-structure across
 * multiple threads, by calling the given function with different
 * sub-areas on different threads.
  }
(* Const before type ignored *)
procedure gegl_parallel_distribute_area(area:PGeglRectangle; thread_cost:Tgdouble; split_strategy:TGeglSplitStrategy; func:TGeglParallelDistributeAreaFunc; user_data:Tgpointer);cdecl;external;

implementation


end.
