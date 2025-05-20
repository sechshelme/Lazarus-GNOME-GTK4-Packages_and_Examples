
unit eina_counter;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_counter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_counter.h
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
PEina_Counter  = ^Eina_Counter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2008 Cedric Bail
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
{$ifndef EINA_COUNTER_H_}
{$define EINA_COUNTER_H_}
{$include "eina_types.h"}
{*
 * @defgroup Eina_Counter_Group Counter
 * @ingroup Eina_Tools_Group
 *
 * @brief This group discusses the functions that allow you to get the time spent in a part of a code.
 *
 * Before using the counter system, Eina must be initialized with
 * eina_init() and later shut down with eina_shutdown(). To create a
 * counter, use eina_counter_new(). To free it, use
 * eina_counter_free().
 *
 * To time a code sequence, call eina_counter_start() just before it,
 * and eina_counter_stop() just after it. Each time you start timing
 * a code, a clock is added to a list. You can give the number of that
 * clock with the second argument of eina_counter_stop(). To send all
 * the registered clocks to a stream (like stdout, for a file), use
 * eina_counter_dump().
 *
 * Here is a straightforward example:
 *
 * @code
 * #include <stdlib.h>
 * #include <stdio.h>
 *
 * #include <eina_counter.h>
 *
 * void test_malloc(void)
 * 
 *    int i;
 *
 *    for (i = 0; i < 100000; ++i)
 *    
 *       void *buf;
 *
 *       buf = malloc(100);
 *       free(buf);
 *    
 * 
 *
 * int main(void)
 * 
 *    Eina_Counter *counter;
 *
 *    if (!eina_init())
 *    
 *        printf("Error during the initialization of eina\n");
 *        return EXIT_FAILURE;
 *    
 *
 *    counter = eina_counter_new("malloc");
 *
 *    eina_counter_start(counter);
 *    test_malloc();
 *    eina_counter_stop(counter, 1);
 *
 *    char* result = eina_counter_dump(counter);
 *    printf("%s", result);
 *    free(result);
 *
 *    eina_counter_free(counter);
 *    eina_shutdown();
 *
 *    return EXIT_SUCCESS;
 * 
 * @endcode
 *
 * Compile this code with the following command:
 *
 * @verbatim
 * gcc -Wall -o test_eina_counter test_eina.c `pkg-config --cflags --libs eina`
 * @endverbatim
 *
 * The result should be something like this:
 *
 * @verbatim
 * \# specimen    experiment time    starting time    ending time
 * 1              9794125            783816           10577941
 * @endverbatim
 *
 * @note The displayed time is in nanoseconds.
 *
 * @
  }
{*
 * @typedef Eina_Counter
 * @brief An opaque type for counter.
  }
type
{*
 * @brief Returns a counter.
 * @details This function returns a new counter. It is characterized by @p
 *          name. If @p name is @c NULL, the function returns @c NULL
 *          immediately. If memory allocation fails, @c NULL is returned.
 *
 * @param[in] name The name of the counter
 * @return A newly allocated counter
 *
 * @note When the new counter is not needed anymore, use eina_counter_free() to
 *       free the allocated memory.
  }
(* Const before type ignored *)

function eina_counter_new(name:Pchar):PEina_Counter;cdecl;external;
{*
 * @brief Deletes a counter.
 * @details This function removes the clock of @p counter from the used clocks
 *          (see eina_counter_start()) and frees the memory allocated for
 *          @p counter. If @p counter is @c NULL, the function returns
 *          immediately.
 * @param[in] counter The counter to delete
 *
  }
procedure eina_counter_free(counter:PEina_Counter);cdecl;external;
{*
 * @brief Starts the time count.
 * @details This function specifies that the part of the code beginning just
 *          after its call is being timed, using @p counter. If
 *          @p counter is @c NULL, this function returns immediately.
 *
 * @param[in] counter The counter
 *
 * @note This function adds the clock associated with @p counter in a list. If
 *       the memory needed by that clock cannot be allocated, the function
 *       returns and nothing is done.
 *
 * @note To stop the timing, eina_counter_stop() must be called with the
 *       same counter.
  }
procedure eina_counter_start(counter:PEina_Counter);cdecl;external;
{*
 * @brief Stops the time count.
 * @details This function stops the timing that has been started with
 *          eina_counter_start(). @p counter must be the same as the one used
 *          with eina_counter_start(). @p specimen is the number of the
 *          test. If @p counter or its associated clock is @c NULL, or if the
 *          time can't be retrieved the function exits.
 * @param[in] counter The counter
 * @param[in] specimen The number of the test
 *
  }
procedure eina_counter_stop(counter:PEina_Counter; specimen:longint);cdecl;external;
{*
 * @brief Dumps the result of all the clocks of a counter to a stream.
 * @details This function returns a malloc'd string containing the dump of
 *          all the valid clocks of @p counter.
 *          If @p counter is @c NULL, the functions exits
 *          immediately. Otherwise, the output is formatted like this:
 *
 * @param[in] counter The counter
 * @return A string with a summary of the test
 *
 * @verbatim
 * \# specimen    experiment time    starting time    ending time
 * 1              208                120000           120208
 * @endverbatim
 *
 * @note The unit of time is nanoseconds.
  }
function eina_counter_dump(counter:PEina_Counter):Pchar;cdecl;external;
{*
 * @
  }
{$endif}
{ EINA_COUNTER_H_  }

implementation


end.
