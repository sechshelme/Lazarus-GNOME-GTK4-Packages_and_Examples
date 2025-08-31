
unit fuse_opt;
interface

{
  Automatically converted by H2Pas 1.0.0 from fuse_opt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fuse_opt.h
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
Pfuse_args  = ^fuse_args;
Pfuse_opt  = ^fuse_opt;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  FUSE: Filesystem in Userspace
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.
 }
{$ifndef FUSE_OPT_H_}
{$define FUSE_OPT_H_}
{* @file
 *
 * This file defines the option parsing interface of FUSE
  }
{ C++ extern C conditionnal removed }
{*
 * Option description
 *
 * This structure describes a single option, and action associated
 * with it, in case it matches.
 *
 * More than one such match may occur, in which case the action for
 * each match is executed.
 *
 * There are three possible actions in case of a match:
 *
 * i) An integer (int or unsigned) variable determined by 'offset' is
 *    set to 'value'
 *
 * ii) The processing function is called, with 'value' as the key
 *
 * iii) An integer (any) or string (char *) variable determined by
 *    'offset' is set to the value of an option parameter
 *
 * 'offset' should normally be either set to
 *
 *  - 'offsetof(struct foo, member)'  actions i) and iii)
 *
 *  - -1			      action ii)
 *
 * The 'offsetof()' macro is defined in the <stddef.h> header.
 *
 * The template determines which options match, and also have an
 * effect on the action.  Normally the action is either i) or ii), but
 * if a format is present in the template, then action iii) is
 * performed.
 *
 * The types of templates are:
 *
 * 1) "-x", "-foo", "--foo", "--foo-bar", etc.	These match only
 *   themselves.  Invalid values are "--" and anything beginning
 *   with "-o"
 *
 * 2) "foo", "foo-bar", etc.  These match "-ofoo", "-ofoo-bar" or
 *    the relevant option in a comma separated option list
 *
 * 3) "bar=", "--foo=", etc.  These are variations of 1) and 2)
 *    which have a parameter
 *
 * 4) "bar=%s", "--foo=%lu", etc.  Same matching as above but perform
 *    action iii).
 *
 * 5) "-x ", etc.  Matches either "-xparam" or "-x param" as
 *    two separate arguments
 *
 * 6) "-x %s", etc.  Combination of 4) and 5)
 *
 * If the format is "%s", memory is allocated for the string unlike with
 * scanf().  The previous value (if non-NULL) stored at the this location is
 * freed.
  }
{* Matching template and optional parameter formatting  }
(* Const before type ignored *)
{*
	 * Offset of variable within 'data' parameter of fuse_opt_parse()
	 * or -1
	  }
{*
	 * Value to set the variable to, or to be passed as 'key' to the
	 * processing function.	 Ignored if template has a format
	  }
type
  Pfuse_opt = ^Tfuse_opt;
  Tfuse_opt = record
      templ : Pchar;
      offset : dword;
      value : longint;
    end;

{*
 * Key option.	In case of a match, the processing function will be
 * called with the specified key.
  }
{*
 * Last option.	 An array of 'struct fuse_opt' must end with a NULL
 * template value
  }
{*
 * Argument list
  }
{* Argument count  }
{* Argument vector.  NULL terminated  }
{* Is 'argv' allocated?  }
  Pfuse_args = ^Tfuse_args;
  Tfuse_args = record
      argc : longint;
      argv : ^Pchar;
      allocated : longint;
    end;

{*
 * Initializer for 'struct fuse_args'
  }
{*
 * Key value passed to the processing function if an option did not
 * match any template
  }

const
  FUSE_OPT_KEY_OPT = -(1);  
{*
 * Key value passed to the processing function for all non-options
 *
 * Non-options are the arguments beginning with a character other than
 * '-' or all arguments after the special '--' option
  }
  FUSE_OPT_KEY_NONOPT = -(2);  
{*
 * Special key value for options to keep
 *
 * Argument is not passed to processing function, but behave as if the
 * processing function returned 1
  }
  FUSE_OPT_KEY_KEEP = -(3);  
{*
 * Special key value for options to discard
 *
 * Argument is not passed to processing function, but behave as if the
 * processing function returned zero
  }
  FUSE_OPT_KEY_DISCARD = -(4);  
{*
 * Processing function
 *
 * This function is called if
 *    - option did not match any 'struct fuse_opt'
 *    - argument is a non-option
 *    - option did match and offset was set to -1
 *
 * The 'arg' parameter will always contain the whole argument or
 * option including the parameter if exists.  A two-argument option
 * ("-x foo") is always converted to single argument option of the
 * form "-xfoo" before this function is called.
 *
 * Options of the form '-ofoo' are passed to this function without the
 * '-o' prefix.
 *
 * The return value of this function determines whether this argument
 * is to be inserted into the output argument vector, or discarded.
 *
 * @param data is the user data passed to the fuse_opt_parse() function
 * @param arg is the whole argument or option
 * @param key determines why the processing function was called
 * @param outargs the current output argument list
 * @return -1 on error, 0 if arg is to be discarded, 1 if arg should be kept
  }
(* Const before type ignored *)
type

  Tfuse_opt_proc_t = function (data:pointer; arg:Pchar; key:longint; outargs:Pfuse_args):longint;cdecl;
{*
 * Option parsing function
 *
 * If 'args' was returned from a previous call to fuse_opt_parse() or
 * it was constructed from
 *
 * A NULL 'args' is equivalent to an empty argument vector
 *
 * A NULL 'opts' is equivalent to an 'opts' array containing a single
 * end marker
 *
 * A NULL 'proc' is equivalent to a processing function always
 * returning '1'
 *
 * @param args is the input and output argument list
 * @param data is the user data
 * @param opts is the option description array
 * @param proc is the processing function
 * @return -1 on error, 0 on success
  }
(* Const before type ignored *)

function fuse_opt_parse(args:Pfuse_args; data:pointer; opts:Pfuse_opt; proc:Tfuse_opt_proc_t):longint;cdecl;external;
{*
 * Add an option to a comma separated option list
 *
 * @param opts is a pointer to an option list, may point to a NULL value
 * @param opt is the option to add
 * @return -1 on allocation error, 0 on success
  }
(* Const before type ignored *)
function fuse_opt_add_opt(opts:PPchar; opt:Pchar):longint;cdecl;external;
{*
 * Add an option, escaping commas, to a comma separated option list
 *
 * @param opts is a pointer to an option list, may point to a NULL value
 * @param opt is the option to add
 * @return -1 on allocation error, 0 on success
  }
(* Const before type ignored *)
function fuse_opt_add_opt_escaped(opts:PPchar; opt:Pchar):longint;cdecl;external;
{*
 * Add an argument to a NULL terminated argument vector
 *
 * @param args is the structure containing the current argument list
 * @param arg is the new argument to add
 * @return -1 on allocation error, 0 on success
  }
(* Const before type ignored *)
function fuse_opt_add_arg(args:Pfuse_args; arg:Pchar):longint;cdecl;external;
{*
 * Add an argument at the specified position in a NULL terminated
 * argument vector
 *
 * Adds the argument to the N-th position.  This is useful for adding
 * options at the beginning of the array which must not come after the
 * special '--' option.
 *
 * @param args is the structure containing the current argument list
 * @param pos is the position at which to add the argument
 * @param arg is the new argument to add
 * @return -1 on allocation error, 0 on success
  }
(* Const before type ignored *)
function fuse_opt_insert_arg(args:Pfuse_args; pos:longint; arg:Pchar):longint;cdecl;external;
{*
 * Free the contents of argument list
 *
 * The structure itself is not freed
 *
 * @param args is the structure containing the argument list
  }
procedure fuse_opt_free_args(args:Pfuse_args);cdecl;external;
{*
 * Check if an option matches
 *
 * @param opts is the option description array
 * @param opt is the option to match
 * @return 1 if a match is found, 0 if not
  }
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_opt_match(opts:Pfuse_opt; opt:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ FUSE_OPT_H_  }

implementation


end.
