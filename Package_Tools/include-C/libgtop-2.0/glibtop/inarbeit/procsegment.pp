
unit procsegment;
interface

{
  Automatically converted by H2Pas 1.0.0 from procsegment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procsegment.h
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
Pglibtop  = ^glibtop;
Pglibtop_proc_segment  = ^glibtop_proc_segment;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig
   This file is part of LibGTop 1.0.

   Contributed by Martin Baulig <martin@home-of-linux.org>, April 1998.

   LibGTop is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License,
   or (at your option) any later version.

   LibGTop is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License
   along with LibGTop; see the file COPYING. If not, write to the
   Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.
 }
{$ifndef __GLIBTOP_PROCSEGMENT_H__}
{$define __GLIBTOP_PROCSEGMENT_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_SEGMENT_TEXT_RSS = 0;  
  GLIBTOP_PROC_SEGMENT_SHLIB_RSS = 1;  
  GLIBTOP_PROC_SEGMENT_DATA_RSS = 2;  
  GLIBTOP_PROC_SEGMENT_STACK_RSS = 3;  
  GLIBTOP_PROC_SEGMENT_DIRTY_SIZE = 4;  
  GLIBTOP_PROC_SEGMENT_START_CODE = 5;  
  GLIBTOP_PROC_SEGMENT_END_CODE = 6;  
  GLIBTOP_PROC_SEGMENT_START_STACK = 7;  
  GLIBTOP_MAX_PROC_SEGMENT = 8;  
type
{ Segment stuff  }
{ text resident set size  }
{ shared-lib resident set size  }
{ data resident set size  }
{ stack resident set size  }
{ size of dirty pages  }
{ address of beginning of code segment  }
{ address of end of code segment  }
{ address of the bottom of stack segment  }
  Pglibtop_proc_segment = ^Tglibtop_proc_segment;
  Tglibtop_proc_segment = record
      flags : Tguint64;
      text_rss : Tguint64;
      shlib_rss : Tguint64;
      data_rss : Tguint64;
      stack_rss : Tguint64;
      dirty_size : Tguint64;
      start_code : Tguint64;
      end_code : Tguint64;
      start_stack : Tguint64;
    end;


procedure glibtop_get_proc_segment(buf:Pglibtop_proc_segment; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_SEGMENT}

const
  glibtop_get_proc_segment_r = glibtop_get_proc_segment_p;  
{$else}

const
  glibtop_get_proc_segment_r = glibtop_get_proc_segment_s;  
{$endif}

procedure glibtop_get_proc_segment_l(server:Pglibtop; buf:Pglibtop_proc_segment; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_SEGMENT}

procedure _glibtop_init_proc_segment_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_segment_p(server:Pglibtop; buf:Pglibtop_proc_segment; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_segment_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_segment_s(server:Pglibtop; buf:Pglibtop_proc_segment; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
