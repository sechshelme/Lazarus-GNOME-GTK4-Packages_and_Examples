
unit eina_safety_checks;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_safety_checks.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_safety_checks.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2008 Gustavo Sverzut Barbieri
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_SAFETY_CHECKS_H_}
{$define EINA_SAFETY_CHECKS_H_}
{*
 * @addtogroup Eina_Tools_Group Tools
 *
 * @
  }
{*
 * @defgroup Eina_Safety_Checks_Group Safety Checks
 *
 * @warning @c eina_safety_checks.h should only be included by source
 *          files after all other includes and before the source file
 *          specific includes. By source file specific includes we
 *          mean those that define the functions that are being
 *          checked. The reason for such complexity is the trick to
 *          avoid compiler optimizations. If compilers are told that
 *          some given function will never receive @c NULL
 *          (EINA_ARG_NONNULL()), then the compiler will emit a warning if
 *          it detects so (good!) and also will remove any checks for that
 *          condition as it believes it will never happen, removing
 *          all safety checks! By including @c eina_safety_checks.h last it
 *          will redefine EINA_ARG_NONNULL() to void and compiler
 *          warning will not be emitted, but checks will be there. The
 *          files already processed with the old macro
 *          EINA_ARG_NONNULL() will still work and emit the warnings.
 *
 *
 * @code
 *
 * // all these files will emit warning from EINA_ARG_NONNULL()
 * #include <Evas.h>  // third party headers
 * #include <Ecore.h>
 *
 * #include <eina_safety_checks.h>
 * // all the files below will NOT emit warning from EINA_ARG_NONNULL(),
 * // but this is required to have the functions defined there to be checked
 * // for NULL pointers
 * #include "my_functions1.h"
 * #include "my_functions2.h"
 *
 * @endcode
  }
{*
 * @addtogroup Eina_Safety_Checks_Group Safety Checks
 *
 * Safety checks are a set of macros to check for parameters or values
 * that should never happen, it is similar in concept to assert(), but
 * will log and return instead of abort() your program.
 *
 * Since these cases should never happen, one may want to keep safety
 * checks enabled during tests but disable them during deploy, not
 * doing any checks at all. This is a common requirement for embedded
 * systems. When to check or not should be set during compile time
 * by using @c --disable-safety-checks or @c --enable-safety-checks
 * options to @c configure script.
 *
 * Whenever these macros capture an error, EINA_LOG_ERR() will be
 * called.
 *
 * @see EINA_SAFETY_ON_NULL_RETURN(), EINA_SAFETY_ON_NULL_RETURN_VAL()
 *      and other macros.
 *
 * @
  }
{$include "eina_config.h"}
{$include "eina_error.h"}
  var
    EINA_ERROR_SAFETY_FAILED : TEina_Error;cvar;external;
{$ifdef EINA_SAFETY_CHECKS}
{$include "eina_log.h"}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * Log entry-point called every time an eina safety check fails.
 *
 * One purpose of this dedicated function is to provide a convenient breakpoint
 * for GDB debugging. Also, this gives it a dedicated log domain, rather than
 * using the default one.
 *
 * @since 1.17
 * @internal
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure _eina_safety_error(file:Pchar; func:Pchar; line:longint; str:Pchar);cdecl;external;
{*
 * @
  }
{*
 * @
  }

implementation


end.
