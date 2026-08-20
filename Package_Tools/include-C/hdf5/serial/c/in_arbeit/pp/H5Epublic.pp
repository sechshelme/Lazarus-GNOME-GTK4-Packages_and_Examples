
unit H5Epublic;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5Epublic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5Epublic.h
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
Pdword  = ^dword;
PFILE  = ^FILE;
PH5E_auto1_t  = ^H5E_auto1_t;
PH5E_auto2_t  = ^H5E_auto2_t;
PH5E_direction_t  = ^H5E_direction_t;
PH5E_error1_t  = ^H5E_error1_t;
PH5E_error2_t  = ^H5E_error2_t;
PH5E_major_t  = ^H5E_major_t;
PH5E_minor_t  = ^H5E_minor_t;
PH5E_type_t  = ^H5E_type_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 * All rights reserved.                                                      *
 *                                                                           *
 * This file is part of HDF5.  The full HDF5 copyright notice, including     *
 * terms governing use, modification, and redistribution, is contained in    *
 * the COPYING file, which can be found at the root of the source code       *
 * distribution tree, or in https://www.hdfgroup.org/licenses.               *
 * If you do not have access to either file, you may request a copy from     *
 * help@hdfgroup.org.                                                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  }
{
 * This file contains public declarations for the H5E module.
  }
{$ifndef H5Epublic_H}
{$define H5Epublic_H}
{$include <stdio.h> /*FILE arg of H5Eprint()                     */}
{ Public headers needed by this file  }
{$include "H5public.h"}
{$include "H5Ipublic.h"}
{ Value for the default error stack  }
{ (hid_t)  }

const
  H5E_DEFAULT = 0;  
{*
 * Different kinds of error information
  }
type
  PH5E_type_t = ^TH5E_type_t;
  TH5E_type_t =  Longint;
  Const
    H5E_MAJOR = 0;
    H5E_MINOR = 1;
;
{*
 * Information about an error; element of error stack
  }
{*< Class ID                            }
{*< Major error ID                         }
{*< Minor error number                     }
{*< Line in file where error occurs     }
(* Const before type ignored *)
{*< Function in which error occurred    }
(* Const before type ignored *)
{*< File in which error occurred        }
(* Const before type ignored *)
{*< Optional supplied description       }
type
  PH5E_error2_t = ^TH5E_error2_t;
  TH5E_error2_t = record
      cls_id : Thid_t;
      maj_num : Thid_t;
      min_num : Thid_t;
      line : dword;
      func_name : Pchar;
      file_name : Pchar;
      desc : Pchar;
    end;
{
 * One often needs to temporarily disable automatic error reporting when
 * trying something that's likely or expected to fail.  The code to try can
 * be nested between calls to H5Eget_auto() and H5Eset_auto(), but it's
 * easier just to use this macro like:
 *     H5E_BEGIN_TRY 
 *        ...stuff here that's likely to fail...
 *       H5E_END_TRY;
 *
 * Warning: don't break, return, or longjmp() from the body of the loop or
 *        the error reporting won't be properly restored!
 *
 * These two macros still use the old API functions for backward compatibility
 * purpose.
  }
{*
 * Error stack traversal direction
  }
{*< begin w/ most specific error, end at API function  }
{*< begin at API function, end w/ most specific error  }

  PH5E_direction_t = ^TH5E_direction_t;
  TH5E_direction_t =  Longint;
  Const
    H5E_WALK_UPWARD = 0;
    H5E_WALK_DOWNWARD = 1;
;
{ C++ extern C conditionnal removed }
{ Error stack traversal callback function pointers  }
{! <!-- [H5E_walk2_t_snip] --> }
{*
 * \brief Callback function for H5Ewalk2()
 *
 * \param[in] n Indexed error position in the stack
 * \param[in] err_desc Pointer to a data structure describing the error
 * \param[in] client_data Pointer to client data in the format expected by the
 *                        user-defined function
 * \return \herr_t
  }
(* Const before type ignored *)
type

  TH5E_walk2_t = function (n:dword; err_desc:PH5E_error2_t; client_data:pointer):Therr_t;cdecl;
{! <!-- [H5E_walk2_t_snip] --> }
{! <!-- [H5E_auto2_t_snip] --> }
{*
 * \brief Callback function for H5Eset_auto2()
 *
 * \estack_idestack
 * \param[in] client_data Pointer to client data in the format expected by the
 *                        user-defined function
 * \return \herr_t
  }

  TH5E_auto2_t = function (estack:Thid_t; client_data:pointer):Therr_t;cdecl;
{! <!-- [H5E_auto2_t_snip] --> }
{ Public API functions  }
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Registers a client library or application program to the HDF5 error API
 *
 * \param[in] cls_name Name of the error class
 * \param[in] lib_name Name of the client library or application to which the error class belongs
 * \param[in] version Version of the client library or application to which the
              error class belongs. Can be \c NULL.
 * \return Returns a class identifier on success; otherwise returns H5I_INVALID_ID.
 *
 * \details H5Eregister_class() registers a client library or application
 *          program to the HDF5 error API so that the client library or
 *          application program can report errors together with the HDF5
 *          library. It receives an identifier for this error class for further
 *          error operations. The library name and version number will be
 *          printed out in the error message as a preamble.
 *
 * \since 1.8.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function H5Eregister_class(cls_name:Pchar; lib_name:Pchar; version:Pchar):Thid_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Removes an error class
 *
 * \param[in] class_id Error class identifier.
 * \return \herr_t
 *
 * \details H5Eunregister_class() removes the error class specified by \p
 *          class_id. All the major and minor errors in this class will also be
 *          closed.
 *
 * \since 1.8.0
  }
function H5Eunregister_class(class_id:Thid_t):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Closes an error message
 *
 * \param[in] err_id An error message identifier
 * \return \herr_t
 *
 * \details H5Eclose_msg() closes an error message identifier, which can be
 *          either a major or minor message.
 *
 * \since 1.8.0
  }
function H5Eclose_msg(err_id:Thid_t):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Adds a major error message to an error class
 *
 * \param[in] cls An error class identifier
 * \param[in] msg_type The type of the error message
 * \param[in] msg Major error message
 * \return \herr_t
 *
 * \details H5Ecreate_msg() adds an error message to an error class defined by
 *          client library or application program. The error message can be
 *          either major or minor as indicated by the parameter \p msg_type.
 *
 *          Use H5Eclose_msg() to close the message identifier returned by this
 *          function.
 *
 * \since 1.8.0
  }
(* Const before type ignored *)
function H5Ecreate_msg(cls:Thid_t; msg_type:TH5E_type_t; msg:Pchar):Thid_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Creates a new, empty error stack
 *
 * \return \hid_tierror stack
 *
 * \details H5Ecreate_stack() creates a new empty error stack and returns the
 *          new stack’s identifier. Use H5Eclose_stack() to close the error stack
 *          identifier returned by this function.
 *
 * \since 1.8.0
  }
function H5Ecreate_stack:Thid_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Returns a copy of the current error stack
 *
 * \return \hid_tierror stack
 *
 * \details H5Eget_current_stack() copies the current error stack and returns an
 *          error stack identifier for the new copy.
 *
 * \since 1.8.0
  }
function H5Eget_current_stack:Thid_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Closes an error stack handle
 *
 * \estack_idstack_id
 *
 * \return \herr_t
 *
 * \details H5Eclose_stack() closes the error stack handle \p stack_id
 *          and releases its resources. #H5E_DEFAULT cannot be closed.
 *
 * \since 1.8.0
  }
function H5Eclose_stack(stack_id:Thid_t):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Retrieves error class name
 *
 * \param[in] class_id Error class identifier
 * \param[out] name Buffer for the error class name
 * \param[in] size The maximum number of characters the class name to be returned
 *            by this function in\p name.
 * \return Returns non-negative value as on success; otherwise returns negative value.
 *
 * \details H5Eget_class_name() retrieves the name of the error class specified
 *          by the class identifier. If non-NULL pointer is passed in for \p
 *          name and \p size is greater than zero, the class name of \p size
 *          long is returned. The length of the error class name is also
 *          returned. If NULL is passed in as \p name, only the length of class
 *          name is returned. If zero is returned, it means no name. The user is
 *          responsible for allocating sufficient buffer space for the name.
 *
 * \since 1.8.0
  }
function H5Eget_class_name(class_id:Thid_t; name:Pchar; size:Tsize_t):Tssize_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Replaces the current error stack
 *
 * \estack_iderr_stack_id
 *
 * \return \herr_t
 *
 * \details H5Eset_current_stack() replaces the content of the current error
 *          stack with a copy of the content of the error stack specified by
 *          \p err_stack_id, and it closes the error stack specified by
 *          \p err_stack_id.
 *
 * \since 1.8.0
  }
function H5Eset_current_stack(err_stack_id:Thid_t):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Pushes a new error record onto an error stack
 *
 * \estack_iderr_stack. If the identifier is #H5E_DEFAULT, the error record
 *                        will be pushed to the current stack.
 * \param[in] file Name of the file in which the error was detected
 * \param[in] func Name of the function in which the error was detected
 * \param[in] line Line number in the file where the error was detected
 * \param[in] cls_id Error class identifier
 * \param[in] maj_id Major error identifier
 * \param[in] min_id Minor error identifier
 * \param[in] msg Error description string
 * \return \herr_t
 *
 * \details H5Epush2() pushes a new error record onto the error stack specified
 *          by \p err_stack.\n
 *          The error record contains the error class identifier \p cls_id, the
 *          major and minor message identifiers \p maj_id and \p min_id, the
 *          function name \p func where the error was detected, the file name \p
 *          file and line number \p line in the file where the error was
 *          detected, and an error description \p msg.\n
 *          The major and minor errors must be in the same error class.\n
 *          The function name, filename, and error description strings must be
 *          statically allocated.\n
 *          \p msg can be a format control string with additional
 *          arguments. This design of appending additional arguments is similar
 *          to the system and C functions printf() and fprintf().
 *
 * \since 1.8.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function H5Epush2(err_stack:Thid_t; file:Pchar; func:Pchar; line:dword; cls_id:Thid_t; 
           maj_id:Thid_t; min_id:Thid_t; msg:Pchar; args:array of const):Therr_t;cdecl;external;
function H5Epush2(err_stack:Thid_t; file:Pchar; func:Pchar; line:dword; cls_id:Thid_t; 
           maj_id:Thid_t; min_id:Thid_t; msg:Pchar):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Deletes specified number of error messages from the error stack
 *
 * \estack_iderr_stack
 * \param[in] count The number of error messages to be deleted from the top
 *                  of error stack
 * \return \herr_t
 *
 * \details H5Epop() deletes the number of error records specified in \p count
 *          from the top of the error stack specified by \p err_stack (including
 *          major, minor messages and description). The number of error messages
 *          to be deleted is specified by \p count.
 *
 * \since 1.8.0
  }
function H5Epop(err_stack:Thid_t; count:Tsize_t):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Prints the specified error stack in a default manner
 *
 * \estack_iderr_stack
 * \param[in] stream File pointer, or \c NULL for \c stderr
 * \return \herr_t
 *
 * \details H5Eprint2() prints the error stack specified by \p err_stack on the
 *          specified stream, \p stream. Even if the error stack is empty, a
 *          one-line message of the following form will be printed:
 *          \code.unparsed
 *          HDF5-DIAG: Error detected in HDF5 library version: 1.5.62 thread 0.
 *          \endcode
 *
 *          A similar line will appear before the error messages of each error
 *          class stating the library name, library version number, and thread
 *          identifier.
 *
 *          If \p err_stack is #H5E_DEFAULT, the current error stack will be
 *          printed.
 *
 *          H5Eprint2() is a convenience function for H5Ewalk2() with a function
 *          that prints error messages. Users are encouraged to write their own
 *          more specific error handlers.
 *
 * \since 1.8.0
  }
function H5Eprint2(err_stack:Thid_t; stream:PFILE):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Walks the specified error stack, calling the specified function
 *
 * \estack_iderr_stack
 * \param[in] direction Direction in which the error stack is to be walked
 * \param[in] func Function to be called for each error encountered
 * \param[in] client_data Data to be passed to \p func
 * \return \herr_t
 *
 * \details H5Ewalk2() walks the error stack specified by err_stack for the
 *          current thread and calls the function specified in \p func for each
 *          error along the way.
 *
 *          If the value of \p err_stack is #H5E_DEFAULT, then H5Ewalk2() walks
 *          the current error stack.
 *
 *          \p direction specifies whether the stack is walked from the inside
 *          out or the outside in. A value of #H5E_WALK_UPWARD means to begin
 *          with the most specific error and end at the API; a value of
 *          #H5E_WALK_DOWNWARD means to start at the API and end at the
 *          innermost function where the error was first detected.
 *
 *          \p func, a function conforming to the #H5E_walk2_t prototype, will
 *          be called for each error in the error stack. Its arguments will
 *          include an index number \c n (beginning at zero regardless of stack
 *          traversal direction), an error stack entry \c err_desc, and the \c
 *          client_data pointer passed to H5Eprint(). The #H5E_walk2_t prototype
 *          is as follows:
 *          \snippet this H5E_walk2_t_snip
 *
 * \since 1.8.0
  }
function H5Ewalk2(err_stack:Thid_t; direction:TH5E_direction_t; func:TH5E_walk2_t; client_data:pointer):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Returns the settings for the automatic error stack traversal
 *        function and its data
 *
 * \estack_id
 * \param[out] func The function currently set to be called upon an error condition
 * \param[out] client_data Data currently set to be passed to the error function
 * \return \herr_t
 *
 * \details H5Eget_auto2() returns the settings for the automatic error stack
 *          traversal function, \p func, and its data, \p client_data, that are
 *          associated with the error stack specified by \p estack_id.
 *
 *          Either or both of the \p func and \p client_data arguments may be
 *          \c NULL, in which case the value is not returned.
 *
 *          The library initializes its default error stack traversal functions
 *          to H5Eprint1() and H5Eprint2(). A call to H5Eget_auto2() returns
 *          H5Eprint2() or the user-defined function passed in through
 *          H5Eset_auto2(). A call to H5Eget_auto1() returns H5Eprint1() or the
 *          user-defined function passed in through H5Eset_auto1(). However, if
 *          the application passes in a user-defined function through
 *          H5Eset_auto1(), it should call H5Eget_auto1() to query the traversal
 *          function. If the application passes in a user-defined function
 *          through H5Eset_auto2(), it should call H5Eget_auto2() to query the
 *          traversal function.
 *
 *          Mixing the new style and the old style functions will cause a
 *          failure. For example, if the application sets a user-defined
 *          old-style traversal function through H5Eset_auto1(), a call to
 *          H5Eget_auto2() will fail and will indicate that the application has
 *          mixed H5Eset_auto1() and H5Eget_auto2(). On the other hand, mixing
 *          H5Eset_auto2() and H5Eget_auto1() will also cause a failure. But if
 *          the traversal functions are the library’s default H5Eprint1() or
 *          H5Eprint2(), mixing H5Eset_auto1() and H5Eget_auto2() or mixing
 *          H5Eset_auto2() and H5Eget_auto1() does not fail.
 *
 * \since 1.8.0
  }
function H5Eget_auto2(estack_id:Thid_t; func:PH5E_auto2_t; client_data:Ppointer):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Turns automatic error printing on or off
 *
 * \estack_id
 * \param[in] func Function to be called upon an error condition
 * \param[in] client_data Data passed to the error function
 * \return \herr_t
 *
 * \details H5Eset_auto2() turns on or off automatic printing of errors for the
 *          error stack specified with \p estack_id. An \p estack_id value of
 *          #H5E_DEFAULT indicates the current stack.
 *
 *          When automatic printing is turned on, by the use of a non-null \p func
 *          pointer, any API function which returns an error indication will
 *          first call \p func, passing it \p client_data as an argument.
 *
 *          \p func, a function compliant with the #H5E_auto2_t prototype, is
 *          defined in the H5Epublic.h source code file as:
 *          \snippet this H5E_auto2_t_snip
 *
 *          When the library is first initialized, the auto printing function is
 *          set to H5Eprint2() (cast appropriately) and \p client_data is the
 *          standard error stream pointer, \c stderr.
 *
 *          Automatic stack traversal is always in the #H5E_WALK_DOWNWARD
 *          direction.
 *
 *          Automatic error printing is turned off with a H5Eset_auto2() call
 *          with a \c NULL \p func pointer.
 *
 * \since 1.8.0
  }
function H5Eset_auto2(estack_id:Thid_t; func:TH5E_auto2_t; client_data:pointer):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Clears the specified error stack or the error stack for the current thread
 *
 * \estack_iderr_stack
 * \return \herr_t
 *
 * \details H5Eclear2() clears the error stack specified by \p err_stack, or, if
 *          \p err_stack is set to #H5E_DEFAULT, the error stack for the current
 *          thread.
 *
 *          \p err_stack is an error stack identifier, such as that returned by
 *          H5Eget_current_stack().
 *
 *          The current error stack is also cleared whenever an API function is
 *          called, with certain exceptions (for instance, H5Eprint1() or
 *          H5Eprint2()).
 *
 * \since 1.8.0
  }
function H5Eclear2(err_stack:Thid_t):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Determines the type of error stack
 *
 * \estack_iderr_stack
 * \param[out] is_stack A flag indicating which error stack \c typedef the
 *                      specified error stack conforms to
 *
 * \return \herr_t
 *
 * \details H5Eauto_is_v2() determines whether the error auto reporting function
 *          for an error stack conforms to the #H5E_auto2_t \c typedef or the
 *          #H5E_auto1_t \c typedef.
 *
 *          The \p is_stack parameter is set to 1 if the error stack conforms to
 *          #H5E_auto2_t and 0 if it conforms to #H5E_auto1_t.
 *
 * \since 1.8.0
  }
function H5Eauto_is_v2(err_stack:Thid_t; is_stack:Pdword):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Retrieves an error message
 *
 * \param[in] msg_id Error message identifier
 * \param[out] type The type of the error message Valid values are #H5E_MAJOR
 *                  and #H5E_MINOR.
 * \param[out] msg Error message buffer
 * \param[in] size The length of error message to be returned by this function
 * \return Returns the size of the error message in bytes on success; otherwise
 *         returns a negative value.
 *
 * \details H5Eget_msg() retrieves the error message including its length and
 *          type. The error message is specified by \p msg_id. The user is
 *          responsible for passing in sufficient buffer space for the
 *          message. If \p msg is not NULL and \p size is greater than zero, the
 *          error message of \p size long is returned. The length of the message
 *          is also returned. If NULL is passed in as \p msg, only the length
 *          and type of the message is returned. If the return value is zero, it
 *          means there is no message.
 *
 * \since 1.8.0
  }
function H5Eget_msg(msg_id:Thid_t; _type:PH5E_type_t; msg:Pchar; size:Tsize_t):Tssize_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Retrieves the number of error messages in an error stack
 *
 * \estack_iderror_stack_id
 * \return Returns a non-negative value on success; otherwise returns a negative value.
 *
 * \details H5Eget_num() retrieves the number of error records in the error
 *          stack specified by \p error_stack_id (including major, minor
 *          messages and description).
 *
 * \since 1.8.0
  }
function H5Eget_num(error_stack_id:Thid_t):Tssize_t;cdecl;external;
{ Symbols defined for compatibility with previous versions of the HDF5 API.
 *
 * Use of these symbols is deprecated.
  }
{$ifndef H5_NO_DEPRECATED_SYMBOLS}
{ Typedefs  }
{ Alias major & minor error types to hid_t's, for compatibility with new
 *      error API in v1.8
  }
type
  PH5E_major_t = ^TH5E_major_t;
  TH5E_major_t = Thid_t;

  PH5E_minor_t = ^TH5E_minor_t;
  TH5E_minor_t = Thid_t;
{*
 * Information about an error element of error stack.
  }
{*< major error number                  }
{*< minor error number                  }
(* Const before type ignored *)
{*< function in which error occurred    }
(* Const before type ignored *)
{*< file in which error occurred        }
{*< line in file where error occurs     }
(* Const before type ignored *)
{*< optional supplied description       }

  PH5E_error1_t = ^TH5E_error1_t;
  TH5E_error1_t = record
      maj_num : TH5E_major_t;
      min_num : TH5E_minor_t;
      func_name : Pchar;
      file_name : Pchar;
      line : dword;
      desc : Pchar;
    end;
{ Error stack traversal callback function pointers  }
{! <!-- [H5E_walk1_t_snip] --> }
{*
 * \brief Callback function for H5Ewalk1()
 *
 * \param[in] n Indexed error position in the stack
 * \param[in] err_desc Pointer to a data structure describing the error
 * \param[in] client_data Pointer to client data in the format expected by the
 *                        user-defined function
 * \return \herr_t
  }

  TH5E_walk1_t = function (n:longint; err_desc:PH5E_error1_t; client_data:pointer):Therr_t;cdecl;
{! <!-- [H5E_walk1_t_snip] --> }
{! <!-- [H5E_auto1_t_snip] --> }
{*
 * \brief Callback function for H5Eset_auto1()
 *
 * \param[in] client_data Pointer to client data in the format expected by the
 *                        user-defined function
 * \return \herr_t
  }

  TH5E_auto1_t = function (client_data:pointer):Therr_t;cdecl;
{! <!-- [H5E_auto1_t_snip] --> }
{ Function prototypes  }
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Clears the error stack for the current thread
 *
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function H5Eclear() renamed to H5Eclear1() and deprecated
 *                   in this release.
 *
 * \details H5Eclear1() clears the error stack for the current thread.\n
 *          The stack is also cleared whenever an API function is called, with
 *          certain exceptions (for instance, H5Eprint1()).
 *
  }

function H5Eclear1:Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Returns the current settings for the automatic error stack traversal
 *        function and its data
 *
 * \param[out] func Current setting for the function to be called upon an error
 *                  condition
 * \param[out] client_data Current setting for the data passed to the error
 *                         function
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function H5Eget_auto() renamed to H5Eget_auto1() and
 *                   deprecated in this release.
 *
 * \details H5Eget_auto1() returns the current settings for the automatic error
 *          stack traversal function, \p func, and its data,
 *          \p client_data. Either or both arguments may be \c NULL, in which case the
 *          value is not returned.
 *
 *          The library initializes its default error stack traversal functions
 *          to H5Eprint1() and H5Eprint2(). A call to H5Eget_auto2() returns
 *          H5Eprint2() or the user-defined function passed in through
 *          H5Eset_auto2(). A call to H5Eget_auto1() returns H5Eprint1() or the
 *          user-defined function passed in through H5Eset_auto1(). However, if
 *          the application passes in a user-defined function through
 *          H5Eset_auto1(), it should call H5Eget_auto1() to query the traversal
 *          function. If the application passes in a user-defined function
 *          through H5Eset_auto2(), it should call H5Eget_auto2() to query the
 *          traversal function.
 *
 *          Mixing the new style and the old style functions will cause a
 *          failure. For example, if the application sets a user-defined
 *          old-style traversal function through H5Eset_auto1(), a call to
 *          H5Eget_auto2() will fail and will indicate that the application has
 *          mixed H5Eset_auto1() and H5Eget_auto2(). On the other hand, mixing
 *          H5Eset_auto2() and H5Eget_auto1() will also cause a failure. But if
 *          the traversal functions are the library’s default H5Eprint1() or
 *          H5Eprint2(), mixing H5Eset_auto1() and H5Eget_auto2() or mixing
 *          H5Eset_auto2() and H5Eget_auto1() does not fail.
 *
  }
function H5Eget_auto1(func:PH5E_auto1_t; client_data:Ppointer):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Pushes a new error record onto the error stack
 *
 * \param[in] file Name of the file in which the error was detected
 * \param[in] func Name of the function in which the error was detected
 * \param[in] line Line number in the file where the error was detected
 * \param[in] maj Major error identifier
 * \param[in] min Minor error identifier
 * \param[in] str Error description string
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function H5Epush() renamed to H5Epush1() and
 *                   deprecated in this release.
 *
 * \details H5Epush1() pushes a new error record onto the error stack for the
 *          current thread.\n
 *          The error has major and minor numbers \p maj_num
 *          and \p min_num, the function \p func where the error was detected, the
 *          name of the file \p file where the error was detected, the line \p line
 *          within that file, and an error description string \p str.\n
 *          The function name, filename, and error description strings must be statically
 *          allocated.
 *
 * \since 1.4.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function H5Epush1(file:Pchar; func:Pchar; line:dword; maj:TH5E_major_t; min:TH5E_minor_t; 
           str:Pchar):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Prints the current error stack in a default manner
 *
 * \param[in] stream File pointer, or \c NULL for \c stderr
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function H5Eprint() renamed to H5Eprint1() and
 *                   deprecated in this release.
 *
 * \details H5Eprint1() prints prints the error stack for the current thread
 *          on the specified stream, \p stream. Even if the error stack is empty, a
 *          one-line message of the following form will be printed:
 *          \code.unparsed
 *          HDF5-DIAG: Error detected in thread 0.
 *          \endcode
 *          H5Eprint1() is a convenience function for H5Ewalk1() with a function
 *          that prints error messages. Users are encouraged to write their own
 *          more specific error handlers.
 *
  }
function H5Eprint1(stream:PFILE):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Turns automatic error printing on or off
 *
 * \param[in] func Function to be called upon an error condition
 * \param[in] client_data Data passed to the error function
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function H5Eset_auto() renamed to H5Eset_auto1() and
 *                   deprecated in this release.
 *
 * \details H5Eset_auto1() turns on or off automatic printing of errors. When
 *          turned on (non-null \p func pointer), any API function which returns
 *          an error indication will first call \p func, passing it \p
 *          client_data as an argument.
 *
 *          \p func, a function conforming to the #H5E_auto1_t prototype, is
 *          defined in the H5Epublic.h source code file as:
 *          \snippet this H5E_auto1_t_snip
 *
 *          When the library is first initialized, the auto printing function is
 *          set to H5Eprint1() (cast appropriately) and \p client_data is the
 *          standard error stream pointer, \c stderr.
 *
 *          Automatic stack traversal is always in the #H5E_WALK_DOWNWARD
 *          direction.
 *
  }
function H5Eset_auto1(func:TH5E_auto1_t; client_data:pointer):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Walks the current error stack, calling the specified function
 *
 * \param[in] direction Direction in which the error stack is to be walked
 * \param[in] func Function to be called for each error encountered
 * \param[in] client_data Data to be passed to \p func
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function H5Ewalk() renamed to H5Ewalk1() and
 *                   deprecated in this release.
 *
 * \details H5Ewalk1() walks the error stack for the current thread and calls
 *          the function specified in \p func for each error along the way.
 *
 *          \p direction specifies whether the stack is walked from the inside
 *          out or the outside in. A value of #H5E_WALK_UPWARD means to begin
 *          with the most specific error and end at the API; a value of
 *          #H5E_WALK_DOWNWARD means to start at the API and end at the
 *          innermost function where the error was first detected.
 *
 *          \p func, a function conforming to the #H5E_walk1_t prototype, will
 *          be called for each error in the error stack. Its arguments will
 *          include an index number \c n (beginning at zero regardless of stack
 *          traversal direction), an error stack entry \c err_desc, and the \c
 *          client_data pointer passed to H5Eprint(). The #H5E_walk1_t prototype
 *          is as follows:
 *          \snippet this H5E_walk1_t_snip
 *
  }
function H5Ewalk1(direction:TH5E_direction_t; func:TH5E_walk1_t; client_data:pointer):Therr_t;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Returns a character string describing an error specified by a major
 *        error number
 *
 * \param[in] maj Major error number
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function deprecated in this release.
 *
 * \details H5Eget_major() returns a constant
 *          character string that describes the error, given a major error number.
 *
 * \attention This function returns a dynamically allocated string (\c char
 *            array). An application calling this function must free the memory
 *            associated with the return value to prevent a memory leak.
 *
  }
function H5Eget_major(maj:TH5E_major_t):Pchar;cdecl;external;
{*
 * --------------------------------------------------------------------------
 * \ingroup H5E
 *
 * \brief Returns a character string describing an error specified by a minor
 *        error number
 *
 * \param[in] min Minor error number
 * \return \herr_t
 *
 * \deprecated 1.8.0 Function deprecated and return type changed in this release.
 *
 * \details H5Eget_minor() returns a constant
 *          character string that describes the error, given a minor error number.
 *
 * \attention In the Release 1.8.x series, H5Eget_minor() returns a string of
 *            dynamic allocated \c char array. An application calling this
 *            function from an HDF5 library of Release 1.8.0 or later must free
 *            the memory associated with the return value to prevent a memory
 *            leak. This is a change from the 1.6.x release series.
 *
  }
function H5Eget_minor(min:TH5E_minor_t):Pchar;cdecl;external;
{$endif}
{ H5_NO_DEPRECATED_SYMBOLS  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ end H5Epublic_H  }

implementation


end.
