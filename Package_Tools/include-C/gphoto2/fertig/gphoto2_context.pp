
unit gphoto2_context;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_context.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_context.h
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
PGPContext  = ^GPContext;
PGPContextFeedback  = ^GPContextFeedback;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 * \brief Context callback operation functions.
 *
 * \author Copyright 2001 Lutz Mueller <lutz@users.sourceforge.net>
 *
 * \note
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \note
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \note
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_CONTEXT_H}
{$define LIBGPHOTO2_GPHOTO2_CONTEXT_H}
{$include <stdarg.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief The gphoto context structure.
 *
 * This structure allows callback handling, passing error contexts back,
 * progress handling and download cancellation and similar things.
 * It is usually passed around the functions.
  }
type

function gp_context_new:PGPContext;cdecl;external;
procedure gp_context_ref(context:PGPContext);cdecl;external;
procedure gp_context_unref(context:PGPContext);cdecl;external;
{*
 * \brief Return codes that can be returned by progress handling.
 *
 * An application can return special values back to the libgphoto2
 * progress callback handling functions. If "Cancel" is selected,
 * libgphoto2 and the camera driver will try to cancel transfer.
  }
{*< Everything ok... proceed.  }
{*< Please cancel the current transfer if possible.  }
type
  PGPContextFeedback = ^TGPContextFeedback;
  TGPContextFeedback =  Longint;
  Const
    GP_CONTEXT_FEEDBACK_OK = 0;
    GP_CONTEXT_FEEDBACK_CANCEL = 1;
;
{ Functions  }
type

  TGPContextIdleFunc = procedure (context:PGPContext; data:pointer);cdecl;
(* Const before type ignored *)

  TGPContextErrorFunc = procedure (context:PGPContext; text:Pchar; data:pointer);cdecl;
(* Const before type ignored *)

  TGPContextStatusFunc = procedure (context:PGPContext; text:Pchar; data:pointer);cdecl;
(* Const before type ignored *)

  TGPContextMessageFunc = procedure (context:PGPContext; text:Pchar; data:pointer);cdecl;
(* Const before type ignored *)

  TGPContextQuestionFunc = function (context:PGPContext; text:Pchar; data:pointer):TGPContextFeedback;cdecl;

  TGPContextCancelFunc = function (context:PGPContext; data:pointer):TGPContextFeedback;cdecl;
(* Const before type ignored *)

  TGPContextProgressStartFunc = function (context:PGPContext; target:single; text:Pchar; data:pointer):dword;cdecl;

  TGPContextProgressUpdateFunc = procedure (context:PGPContext; id:dword; current:single; data:pointer);cdecl;

  TGPContextProgressStopFunc = procedure (context:PGPContext; id:dword; data:pointer);cdecl;
{ Setting those functions (frontends)  }

procedure gp_context_set_idle_func(context:PGPContext; func:TGPContextIdleFunc; data:pointer);cdecl;external;
procedure gp_context_set_progress_funcs(context:PGPContext; start_func:TGPContextProgressStartFunc; update_func:TGPContextProgressUpdateFunc; stop_func:TGPContextProgressStopFunc; data:pointer);cdecl;external;
procedure gp_context_set_error_func(context:PGPContext; func:TGPContextErrorFunc; data:pointer);cdecl;external;
procedure gp_context_set_status_func(context:PGPContext; func:TGPContextStatusFunc; data:pointer);cdecl;external;
procedure gp_context_set_question_func(context:PGPContext; func:TGPContextQuestionFunc; data:pointer);cdecl;external;
procedure gp_context_set_cancel_func(context:PGPContext; func:TGPContextCancelFunc; data:pointer);cdecl;external;
procedure gp_context_set_message_func(context:PGPContext; func:TGPContextMessageFunc; data:pointer);cdecl;external;
{ Calling those functions (backends)  }
procedure gp_context_idle(context:PGPContext);cdecl;external;
(* Const before type ignored *)
procedure gp_context_error(context:PGPContext; format:Pchar; args:array of const);cdecl;external;
procedure gp_context_error(context:PGPContext; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gp_context_status(context:PGPContext; format:Pchar; args:array of const);cdecl;external;
procedure gp_context_status(context:PGPContext; format:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gp_context_message(context:PGPContext; format:Pchar; args:array of const);cdecl;external;
procedure gp_context_message(context:PGPContext; format:Pchar);cdecl;external;
(* Const before type ignored *)
function gp_context_question(context:PGPContext; format:Pchar; args:array of const):TGPContextFeedback;cdecl;external;
function gp_context_question(context:PGPContext; format:Pchar):TGPContextFeedback;cdecl;external;
function gp_context_cancel(context:PGPContext):TGPContextFeedback;cdecl;external;
(* Const before type ignored *)
function gp_context_progress_start(context:PGPContext; target:single; format:Pchar; args:array of const):dword;cdecl;external;
function gp_context_progress_start(context:PGPContext; target:single; format:Pchar):dword;cdecl;external;
procedure gp_context_progress_update(context:PGPContext; id:dword; current:single);cdecl;external;
procedure gp_context_progress_stop(context:PGPContext; id:dword);cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_CONTEXT_H)  }

implementation


end.
