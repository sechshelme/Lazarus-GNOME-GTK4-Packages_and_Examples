
unit opt;
interface

{
  Automatically converted by H2Pas 1.0.0 from opt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    opt.h
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
Prist_ctx  = ^rist_ctx;
Prist_opt  = ^rist_opt;
Prist_thread_callback_t  = ^rist_thread_callback_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_OPT_H}
{$define LIBRIST_OPT_H}
{$include "common.h"}
{$include "headers.h"}
{$include <stdbool.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief Thread callback function
 * 
 * The thread callback function is called whenever a thread is created or (about to be) destroyed. This can be used 
 * to apply cpu sets to the thread, or set fine grained priorities.
 * 
 * @param handle, OS specific thread handle, on POSIX systems this will be a pointer to pthread_t on Windows systems
 * 				  this will be a pointer to a pseudo thread handle. The handle is invalidated after the callback is
 * 				  called a second time with created set to false.
 * @param type Not used for now, it is here for future extension.
 * @param created True when thread is newly created, false when it's (about to be) destroyed.
 * @param user_data Calling application specified user data.
  }
type

  Trist_thread_callback_func_t = procedure (handle:pointer; _type:longint; created:Tbool; user_data:pointer);cdecl;
{Wrapper struct because ISO C forbids conversion from object pointer to function pointer }

  Prist_thread_callback_t = ^Trist_thread_callback_t;
  Trist_thread_callback_t = record
      thread_callback : Trist_thread_callback_func_t;
    end;
{Set callback called when a thread is created or destroyed. This can only be set before rist_start is called. }
{optval1 must point to a rist_thread_callback_t struct, optval2 may contain a pointer to user data, optval3 must be NULL. }
  Trist_opt =  Longint;
  Const
    RIST_OPT_THREAD_CALLBACK = 0;

{*
 * @brief Set option on RIST CTX
 * 
 * For usage see documentation for rist_opt enum
  }

function rist_set_opt(ctx:Prist_ctx; opt:Trist_opt; optval1:pointer; optval2:pointer; optval3:pointer):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBRIST_OPT_H  }

implementation


end.
