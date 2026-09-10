unit apr_getopt;

interface

uses
  fp_apr;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_GETOPT_H}
{$define APR_GETOPT_H}
{*
 * @file apr_getopt.h
 * @brief APR Command Arguments (getopt)
  }
{$include "apr_pools.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_getopt Command Argument Parsing
 * @ingroup APR 
 * @
  }
{* 
 * An @c apr_getopt_t error callback function.
 *
 * @a arg is this @c apr_getopt_t's @c errarg member.
  }
type
{* @see apr_getopt_t  }
{*
 * Structure to store command line argument information.
  }{* context for processing  }
{* function to print error message (NULL == no messages)  }
{* user defined first arg to pass to error message   }
{* index into parent argv vector  }
{* character checked for validity  }
{* reset getopt  }
{* count of arguments  }
{* array of pointers to arguments  }
{* argument associated with option  }
{* set to nonzero to support interleaving options with regular args  }
{* start of non-option arguments skipped for interleaving  }
{* end of non-option arguments skipped for interleaving  }
  Papr_getopt_t = ^Tapr_getopt_t;
  Tapr_getopt_t = record
      cont : Papr_pool_t;
      errfn : Papr_getopt_err_fn_t;
      errarg : pointer;
      ind : longint;
      opt : longint;
      reset : longint;
      argc : longint;
      argv : ^Pchar;
      place : Pchar;
      interleave : longint;
      skip_start : longint;
      skip_end : longint;
    end;

{* @see apr_getopt_option_t  }
{*
 * Structure used to describe options that getopt should search for.
  }
{* long option name, or NULL if option has no long name  }
{* option letter, or a value greater than 255 if option has no letter  }
{* nonzero if option takes an argument  }
{* a description of the option  }
  Papr_getopt_option_t = ^Tapr_getopt_option_t;
  Tapr_getopt_option_t = record
      name : Pchar;
      optch : longint;
      has_arg : longint;
      description : Pchar;
    end;

{*
 * Initialize the arguments for parsing by apr_getopt().
 * @param os   The options structure created for apr_getopt()
 * @param cont The pool to operate on
 * @param argc The number of arguments to parse
 * @param argv The array of arguments to parse
 * @remark Arguments 3 and 4 are most commonly argc and argv from main(argc, argv)
 * The (*os)->errfn is initialized to fprintf(stderr... but may be overridden.
  }

function apr_getopt_init(os:PPapr_getopt_t; cont:Papr_pool_t; argc:longint; argv:PPchar):Tapr_status_t;cdecl;external libapr;
{*
 * Parse the options initialized by apr_getopt_init().
 * @param os     The apr_opt_t structure returned by apr_getopt_init()
 * @param opts   A string of characters that are acceptable options to the 
 *               program.  Characters followed by ":" are required to have an 
 *               option associated
 * @param option_ch  The next option character parsed
 * @param option_arg The argument following the option character:
 * @return There are four potential status values on exit. They are:
 * <PRE>
 *             APR_EOF      --  No more options to parse
 *             APR_BADCH    --  Found a bad option character
 *             APR_BADARG   --  No argument followed the option flag
 *             APR_SUCCESS  --  The next option was found.
 * </PRE>
  }
function apr_getopt(os:Papr_getopt_t; opts:Pchar; option_ch:Pchar; option_arg:PPchar):Tapr_status_t;cdecl;external libapr;
{*
 * Parse the options initialized by apr_getopt_init(), accepting long
 * options beginning with "--" in addition to single-character
 * options beginning with "-".
 * @param os     The apr_getopt_t structure created by apr_getopt_init()
 * @param opts   A pointer to a list of apr_getopt_option_t structures, which
 *               can be initialized with  "name", optch, has_args .  has_args
 *               is nonzero if the option requires an argument.  A structure
 *               with an optch value of 0 terminates the list.
 * @param option_ch  Receives the value of "optch" from the apr_getopt_option_t
 *                   structure corresponding to the next option matched.
 * @param option_arg Receives the argument following the option, if any.
 * @return There are four potential status values on exit.   They are:
 * <PRE>
 *             APR_EOF      --  No more options to parse
 *             APR_BADCH    --  Found a bad option character
 *             APR_BADARG   --  No argument followed the option flag
 *             APR_SUCCESS  --  The next option was found.
 * </PRE>
 * When APR_SUCCESS is returned, os->ind gives the index of the first
 * non-option argument.  On error, a message will be printed to stdout unless
 * os->err is set to 0.  If os->interleave is set to nonzero, options can come
 * after arguments, and os->argv will be permuted to leave non-option arguments
 * at the end (the original argv is unaffected).
  }
function apr_getopt_long(os:Papr_getopt_t; opts:Papr_getopt_option_t; option_ch:Plongint; option_arg:PPchar):Tapr_status_t;cdecl;external libapr;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_GETOPT_H  }

// === Konventiert am: 10-9-26 16:37:21 ===


implementation



end.
