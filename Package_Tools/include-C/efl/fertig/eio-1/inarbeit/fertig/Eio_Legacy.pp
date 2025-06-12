
unit Eio_Legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eio_Legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eio_Legacy.h
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
PEet_Data_Descriptor  = ^Eet_Data_Descriptor;
PEet_File  = ^Eet_File;
PEina_File  = ^Eina_File;
PEina_File_Direct_Info  = ^Eina_File_Direct_Info;
PEina_Stat  = ^Eina_Stat;
PEio_File  = ^Eio_File;
PEio_File_Op  = ^Eio_File_Op;
PEio_Monitor  = ^Eio_Monitor;
PEio_Monitor_Error  = ^Eio_Monitor_Error;
PEio_Monitor_Event  = ^Eio_Monitor_Event;
PEio_Progress  = ^Eio_Progress;
PEio_Version  = ^Eio_Version;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ C++ extern C conditionnal removed }
{*
    * @typedef Eio_Version
    * Represents the current version of EIO
     }
{*< Major version number  }
{*< Minor version number  }
{*< Micro version number  }
{*< Revision number  }
type
  PEio_Version = ^TEio_Version;
  TEio_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
{*
 * Eio Version Information
 * @ingroup Eio
  }
  var
    eio_version : PEio_Version;cvar;external;
{*
 * @file
 * @brief Eio asynchronous input/output library
 *
 * These routines are used for Eio.
  }
{*
 * @page eio_main Eio
 *
 * @date 2012 (created)
 *
 * @section eio_toc Table of Contents
 *
 * @li @ref eio_main_intro
 * @li @ref eio_main_compiling
 * @li @ref eio_main_next_steps
 * @li @ref eio_main_intro_example
 *
 * @section eio_main_intro Introduction
 *
 * The Eio library is a library that implements an API for asynchronous
 * input/output operation. Most operations are done in a separate thread
 * to prevent lock. See @ref Eio. Some helper to work on data
 * received in Eio callback are also provided see @ref Eio_Helper.
 * It is also possible to work asynchronously on Eina_File with @ref Eio_Map
 * or on Eet_File with @ref Eio_Eet. It comes with way to manipulate
 * eXtended attribute asynchronous with @ref Eio_Xattr.
 *
 * This library is cross-platform and can be compiled and used on
 * Linux, BSD, Opensolaris and Windows (XP and CE). It is heavily
 * based on @ref Ecore_Main_Loop_Group.
 *
 * @section eio_main_compiling How to compile
 *
 * Eio is a library your application links to. The procedure for this is
 * very simple. You simply have to compile your application with the
 * appropriate compiler flags that the @c pkg-config script outputs. For
 * example:
 *
 * Compiling C or C++ files into object files:
 *
 * @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags eio`
   @endverbatim
 *
 * Linking object files into a binary executable:
 *
 * @verbatim
   gcc -o my_application main.o `pkg-config --libs eio`
   @endverbatim
 *
 * See @ref pkgconfig
 *
 * @section eio_main_next_steps Next Steps
 *
 * After you understand what Eio is and installed it on your system
 * you should proceed understand the programming interface.
 *
 * Recommended reading:
 *
 * @li @ref Eio_Helper for common functions and library initialization.
 * @li @ref Eio_List for listing files asynchronous.
 * @li @ref Eio_Management for anyone who want to do a file manager (copy, rm, ...).
 * @li @ref Eio_Map to manipulate files asynchronously (mmap).
 * @li @ref Eio_Xattr to access file extended attributes (xattr).
 * @li @ref Eio_Monitor to monitor for file changes (inotify).
 * @li @ref Eio_Eet to access Eet files asynchronously.
 *
 * @section eio_main_intro_example Introductory Example
 *
 * @include eio_file_ls.c
 *
 * More examples can be found at @ref eio_examples.
 *
  }
{*
 * @enum _Eio_File_Op
 *
 * @brief Input/Output operations on files.
 *
 * This enum represents the operations that can be done.
  }
{*< I/O operation is about a specific file copy  }
{*< I/O operation is about a specific file move  }
{*< I/O operation is about a specific directory copy  }
{*< I/O operation is about a specific directory move  }
{* I/O operation is about destroying a path:
   * source will point to base path to be destroyed,
   * and dest will point to to path destroyed by this I/O
    }
{*< I/O operation is trying to get uid from user name  }
{*< I/O operation is trying to get gid from user name  }
type
  TEio_File_Op =  Longint;
  Const
    EIO_FILE_COPY = 0;
    EIO_FILE_MOVE = 1;
    EIO_DIR_COPY = 2;
    EIO_DIR_MOVE = 3;
    EIO_UNLINK = 4;
    EIO_FILE_GETPWNAM = 5;
    EIO_FILE_GETGRNAM = 6;

{*
 * @typedef Eio_File_Op
 * Input/Output operations on files.
  }
type
  PEio_File_Op = ^TEio_File_Op;
  TEio_File_Op = TEio_File_Op;
{*
 * @defgroup Eio_List Eio file listing API
 * @ingroup Eio
 *
 * @brief This functions helps list files asynchronously.
 *
 * This set of functions work on top of Eina_File and Ecore_Thread
 * to list files under various condition.
 *
 * @
  }
{*
 * @typedef Eio_Progress
 * Progress information on a specific operation.
  }
(* Const before type ignored *)

  TEio_Filter_Cb = function (data:pointer; handler:PEio_File; file:Pchar):TEina_Bool;cdecl;
(* Const before type ignored *)

  TEio_Main_Cb = procedure (data:pointer; handler:PEio_File; file:Pchar);cdecl;

  TEio_Filter_Dir_Cb = function (data:pointer; handler:PEio_File; info:PEina_File_Direct_Info):TEina_Bool;cdecl;
(* Const before type ignored *)

  TEio_Main_Direct_Cb = procedure (data:pointer; handler:PEio_File; info:PEina_File_Direct_Info);cdecl;
(* Const before type ignored *)

  TEio_Stat_Cb = procedure (data:pointer; handler:PEio_File; stat:PEina_Stat);cdecl;
(* Const before type ignored *)

  TEio_Progress_Cb = procedure (data:pointer; handler:PEio_File; info:PEio_Progress);cdecl;

  TEio_Eet_Open_Cb = procedure (data:pointer; handler:PEio_File; file:PEet_File);cdecl;

  TEio_Open_Cb = procedure (data:pointer; handler:PEio_File; file:PEina_File);cdecl;

  TEio_Filter_Map_Cb = function (data:pointer; handler:PEio_File; map:pointer; length:Tsize_t):TEina_Bool;cdecl;

  TEio_Map_Cb = procedure (data:pointer; handler:PEio_File; map:pointer; length:Tsize_t);cdecl;
(* Const before type ignored *)

  TEio_Done_Data_Cb = procedure (data:pointer; handler:PEio_File; read_data:Pchar; size:dword);cdecl;
(* Const before type ignored *)

  TEio_Done_String_Cb = procedure (data:pointer; handler:PEio_File; xattr_string:Pchar);cdecl;

  TEio_Done_Double_Cb = procedure (data:pointer; handler:PEio_File; xattr_double:Tdouble);cdecl;

  TEio_Done_Int_Cb = procedure (data:pointer; handler:PEio_File; i:longint);cdecl;

  TEio_Done_ERead_Cb = procedure (data:pointer; handler:PEio_File; decoded:pointer);cdecl;

  TEio_Done_Read_Cb = procedure (data:pointer; handler:PEio_File; read_data:pointer; size:dword);cdecl;

  TEio_Done_Cb = procedure (data:pointer; handler:PEio_File);cdecl;

  TEio_Error_Cb = procedure (data:pointer; handler:PEio_File; error:longint);cdecl;

  TEio_Eet_Error_Cb = procedure (data:pointer; handler:PEio_File; err:TEet_Error);cdecl;
{*
  * @struct _Eio_Progress
  * @brief Represents the current progress of the operation.
   }
{*< I/O type  }
{*< Current step in the I/O operation  }
{*< Number of total steps to complete this I/O  }
{*< Percent done for the I/O operation  }
(* Const before type ignored *)
{*< source of the I/O operation  }
(* Const before type ignored *)
{*< target of the I/O operation  }
  PEio_Progress = ^TEio_Progress;
  TEio_Progress = record
      op : TEio_File_Op;cdecl;
      current : int64;
      max : int64;
      percent : single;
      source : Pchar;
      dest : Pchar;
    end;

{*
 * @brief List contents of a directory without locking your app.
 * @param dir The directory to list.
 * @param filter_cb Callback used to decide if the file will be passed to main_cb
 * @param main_cb Callback called for each listed file if it was not filtered.
 * @param done_cb Callback called when the ls operation is done.
 * @param error_cb Callback called when either the directory could not be opened or the operation has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * This function is responsible for listing the content of a directory without blocking your application.
 * It's equivalent to the "ls" shell command. Every file will be passed to the
 * filter_cb, so it's your job to decide if you want to pass the file to the
 * main_cb or not. Return EINA_TRUE to pass it to the main_cb or EINA_FALSE to
 * ignore it. It runs eina_file_ls() in a separate thread using
 * ecore_thread_feedback_run().
 *
 * @see eina_file_ls()
 * @see ecore_thread_feedback_run()
 * @see eio_file_direct_ls()
 * @see eio_file_stat_ls()
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eio_file_ls(dir:Pchar; filter_cb:TEio_Filter_Cb; main_cb:TEio_Main_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief List contents of a directory without locking your app.
 * @param dir The directory to list.
 * @param filter_cb Callback used to decide if the file will be passed to main_cb
 * @param main_cb Callback called from the main loop for each accepted file (not filtered).
 * @param done_cb Callback called from the main loop after the contents of the directory has been listed.
 * @param error_cb Callback called from the main loop when either the directory could not be opened or the operation has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_direct_ls() runs eina_file_direct_ls() in a separate thread using
 * ecore_thread_feedback_run(). This prevents any blocking in your apps.
 * Every file will be passed to the filter_cb, so it's your job to decide if you
 * want to pass the file to the main_cb or not. Return EINA_TRUE to pass it to
 * the main_cb or EINA_FALSE to ignore it.
 *
 * @warning If readdir_r doesn't contain file type information, file type is
 *          EINA_FILE_UNKNOWN.
 *
 * @note The iterator walks over '.' and '..' without returning them.
 * @note The difference between this function and eina_file_stat_ls() is that
 *       it may not get the file type information however it is likely to be
 *       faster.
 *
 * @see eio_file_stat_ls()
 * @see eina_file_direct_ls()
 * @see ecore_thread_feedback_run()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_direct_ls(dir:Pchar; filter_cb:TEio_Filter_Direct_Cb; main_cb:TEio_Main_Direct_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief List content of a directory without locking your app.
 * @param dir The directory to list.
 * @param filter_cb Callback used to decide if the file will be passed to main_cb
 * @param main_cb Callback called from the main loop for each accepted file (not filtered).
 * @param done_cb Callback called from the main loop after the contents of the directory has been listed.
 * @param error_cb Callback called from the main loop when either the directory could not be opened or the operation has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * Every file will be passed to the filter_cb, so it's your job to decide if you
 * want to pass the file to the main_cb or not. Return EINA_TRUE to pass it to
 * the main_cb or EINA_FALSE to ignore it. eio_file_stat_ls() run eina_file_stat_ls()
 * in a separate thread using ecore_thread_feedback_run().
 *
 * @note The iterator walks over '.' and '..' without returning them.
 * @note The difference between this function and eio_file_direct_ls() is that
 *       it guarantees the file type information to be correct by incurring a
 *       possible performance penalty.
 *
 * @see eio_file_stat_ls()
 * @see eina_file_stat_ls()
 * @see ecore_thread_feedback_run()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_stat_ls(dir:Pchar; filter_cb:TEio_Filter_Direct_Cb; main_cb:TEio_Main_Direct_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief List the content of a directory and all its sub-content asynchronously
 * @param dir The directory to list.
 * @param filter_cb Callback used to decide if the file will be passed to main_cb
 * @param main_cb Callback called from the main loop for each accepted file (not filtered).
 * @param done_cb Callback called from the main loop after the contents of the directory has been listed.
 * @param error_cb Callback called from the main loop when either the directory could not be opened or the operation has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_dir_stat_ls() runs eina_file_stat_ls() recursively in a separate thread using
 * ecore_thread_feedback_run(). This prevents any blocking in your apps.
 * Every file will be passed to the
 * filter_cb, so it's your job to decide if you want to pass the file to the
 * main_cb or not. Return EINA_TRUE to pass it to the main_cb or EINA_FALSE to
 * ignore it.
 *
 * @see eio_file_stat_ls()
 * @see eio_dir_direct_ls()
 * @see eina_file_stat_ls()
 * @see ecore_thread_feedback_run()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_dir_stat_ls(dir:Pchar; filter_cb:TEio_Filter_Direct_Cb; main_cb:TEio_Main_Direct_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief List the content of a directory and all its sub-content asynchronously
 * @param dir The directory to list.
 * @param filter_cb Callback used to decide if the file will be passed to main_cb
 * @param main_cb Callback called from the main loop for each accepted file (not filtered).
 * @param done_cb Callback called from the main loop after the contents of the directory has been listed.
 * @param error_cb Callback called from the main loop when either the directory could not be opened or the operation has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_dir_direct_ls() runs eina_file_direct_ls() recursively in a separate thread using
 * ecore_thread_feedback_run(). This prevents any blocking in your apps.
 * Every file will be passed to the filter_cb, so it's your job to decide if you
 * want to pass the file to the main_cb or not. Return EINA_TRUE to pass it to
 * the main_cb or EINA_FALSE to ignore it.
 *
 * @see eio_file_direct_ls()
 * @see eio_dir_stat_ls()
 * @see eina_file_direct_ls()
 * @see ecore_thread_feedback_run()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_dir_direct_ls(dir:Pchar; filter_cb:TEio_Filter_Dir_Cb; main_cb:TEio_Main_Direct_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Stat a file/directory.
 * @param path The path to stat.
 * @param done_cb Callback called from the main loop when stat was successfully called.
 * @param error_cb Callback called from the main loop when stat failed or has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_direct_stat calls stat in another thread. This prevents any blocking in your apps.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_direct_stat(path:Pchar; done_cb:TEio_Stat_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eio_Management Eio file management API.
 * @ingroup Eio
 *
 * @brief A set of function to manage file asynchronously.
 *
 * The function provided by this API are the one useful for any
 * file manager. Like moving or copying a file, unlinking it, changing
 * it's access right, ...
 *
 * @
  }
{*
 * @brief Change rights of a path.
 * @param path The directory path to change access rights.
 * @param mode The permission to set, follow (mode & ~umask & 0777).
 * @param done_cb Callback called when the operation is completed.
 * @param error_cb Callback called from if something goes wrong.
 * @param data Unmodified user data passed to callbacks.
 * @return A reference to the I/O operation.
 *
 * Set a new permission of a path changing it to the mode passed as argument.
 * It's equivalent to the chmod command.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_chmod(path:Pchar; mode:Tmode_t; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Change owner of a path.
 * @param path The directory path to change owner.
 * @param user The new user to set (can be NULL).
 * @param group The new group to set (can be NULL).
 * @param done_cb Callback called when the operation is completed.
 * @param error_cb Callback called from if something goes wrong.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * This function will change the owner of a path, setting it to the user and
 * group passed as argument. It's equivalent to the chown shell command.
 *
 * @note Some platforms (including Windows) do not support chown(). In that
 * case, this function returns @c NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_chown(path:Pchar; user:Pchar; group:Pchar; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Unlink a file/directory.
 * @param path The path to unlink.
 * @param done_cb Callback called when the operation is completed.
 * @param error_cb Callback called from if something goes wrong.
 * @param data Unmodified user data passed to callbacks.
 * @return A reference to the I/O operation.
 *
 * This function will erase a file.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_unlink(path:Pchar; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Create a new directory.
 * @param path The directory path to create.
 * @param mode The permission to set, follow (mode & ~umask & 0777).
 * @param done_cb Callback called when the operation is completed.
 * @param error_cb Callback called from if something goes wrong.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * Creates a new directory using the mode provided.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_mkdir(path:Pchar; mode:Tmode_t; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Move a file asynchronously
 * @param source Should be the name of the file to move the data from.
 * @param dest Should be the name of the file to move the data to.
 * @param progress_cb Callback called to know the progress of the move.
 * @param done_cb Callback called when the move is done.
 * @param error_cb Callback called when something goes wrong.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * @return an Eio_File pointer, handler to the move operation, can be used to cancel the operation
 *
 * This function will copy a file from source to dest. It will try to use splice
 * if possible, if not it will fallback to mmap/write. It will try to preserve
 * access rights, but not user/group identification.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_move(source:Pchar; dest:Pchar; progress_cb:TEio_Progress_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Copy a file asynchronously
 * @param source Should be the name of the file to copy the data from.
 * @param dest Should be the name of the file to copy the data to.
 * @param progress_cb Callback called to know the progress of the copy.
 * @param done_cb Callback called when the copy is done.
 * @param error_cb Callback called when something goes wrong.
 * @param data Unmodified user data passed to callbacks
 *
 * @return an Eio_File pointer, handler to the copy operation, can be used to cancel the operation
 *
 * This function will copy a file from source to dest. It will try to use splice
 * if possible, if not it will fallback to mmap/write. It will try to preserve
 * access rights, but not user/group identification.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_copy(source:Pchar; dest:Pchar; progress_cb:TEio_Progress_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Move a directory and its content asynchronously
 * @param source Should be the name of the directory to copy the data from.
 * @param dest Should be the name of the directory to copy the data to.
 * @param filter_cb Possible to deny the move of some files/directories.
 * @param progress_cb Callback called to know the progress of the copy.
 * @param done_cb Callback called when the copy is done.
 * @param error_cb Callback called when something goes wrong.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * @return an Eio_File pointer, handler to the move operation, can be used to cancel the operation
 *
 * This function will move a directory and all its content from source to dest.
 * It will try first to rename the directory, if not it will try to use splice
 * if possible, if not it will fallback to mmap/write.
 * It will try to preserve access rights, but not user/group identity.
 * Every file will be passed to the filter_cb, so it's your job to decide if you
 * want to pass the file to the main_cb or not. Return EINA_TRUE to pass it to
 * the main_cb or EINA_FALSE to ignore it.
 *
 * @note if a rename occurs, the filter callback will not be called.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_dir_move(source:Pchar; dest:Pchar; filter_cb:TEio_Filter_Direct_Cb; progress_cb:TEio_Progress_Cb; done_cb:TEio_Done_Cb; 
           error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Copy a directory and its content asynchronously
 * @param source Should be the name of the directory to copy the data from.
 * @param dest Should be the name of the directory to copy the data to.
 * @param filter_cb Possible to deny the move of some files/directories.
 * @param progress_cb Callback called to know the progress of the copy.
 * @param done_cb Callback called when the copy is done.
 * @param error_cb Callback called when something goes wrong.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * @return an Eio_File pointer, handler to the copy operation, can be used to cancel the operation
 *
 * This function will copy a directory and all its content from source to dest.
 * It will try to use splice if possible, if not it will fallback to mmap/write.
 * It will try to preserve access rights, but not user/group identity.
 * Every file will be passed to the filter_cb, so it's your job to decide if you
 * want to pass the file to the main_cb or not. Return EINA_TRUE to pass it to
 * the main_cb or EINA_FALSE to ignore it.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_dir_copy(source:Pchar; dest:Pchar; filter_cb:TEio_Filter_Direct_Cb; progress_cb:TEio_Progress_Cb; done_cb:TEio_Done_Cb; 
           error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Remove a directory and its content asynchronously
 * @param path Should be the name of the directory to destroy.
 * @param filter_cb Possible to deny the move of some files/directories.
 * @param progress_cb Callback called to know the progress of the copy.
 * @param done_cb Callback called when the copy is done.
 * @param error_cb Callback called when something goes wrong.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * @return an Eio_File pointer, handler to the unlink operation, can be used to cancel the operation
 *
 * This function will remove a directory and all its content.
 * Every file will be passed to the filter_cb, so it's your job to decide if you
 * want to pass the file to the main_cb or not. Return EINA_TRUE to pass it to
 * the main_cb or EINA_FALSE to ignore it.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_dir_unlink(path:Pchar; filter_cb:TEio_Filter_Direct_Cb; progress_cb:TEio_Progress_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eio_Xattr Eio manipulation of eXtended attribute.
 * @ingroup Eio
 *
 * @brief A set of function to manipulate data associated with a specific file
 *
 * The functions provided by this API are responsible to manage Extended
 * attribute files. Like file authors, character encoding, checksum, etc.
 * @
  }
{*
 * @brief Asynchronously list all eXtended attribute
 * @param path The path to get the eXtended attribute from.
 * @param filter_cb Callback called in the thread to validate the eXtended attribute.
 * @param main_cb Callback called in the main loop for each accepted eXtended attribute.
 * @param done_cb Callback called in the main loop when the all the eXtended attribute have been listed.
 * @param error_cb Callback called in the main loop when something goes wrong during the listing of the eXtended attribute.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr(path:Pchar; filter_cb:TEio_Filter_Cb; main_cb:TEio_Main_Cb; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Define an extended attribute on a file/directory.
 * @param path The path to set the attribute on.
 * @param attribute The name of the attribute to define.
 * @param xattr_int The value to link the attribute with.
 * @param flags Whether to insert, replace or create the attribute.
 * @param done_cb The callback called from the main loop when setxattr succeeded.
 * @param error_cb The callback called from the main loop when setxattr failed.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_int_set calls eina_xattr_int_set from another thread. This prevents blocking in your apps. If
 * the writing succeeded, the done_cb will be called even if a cancel was requested, but came too late.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_int_set(path:Pchar; attribute:Pchar; xattr_int:longint; flags:TEina_Xattr_Flags; done_cb:TEio_Done_Cb; 
           error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Define an extended attribute on a file/directory.
 * @param path The path to set the attribute on.
 * @param attribute The name of the attribute to define.
 * @param xattr_double The value to link the attribute with.
 * @param flags Whether to insert, replace or create the attribute.
 * @param done_cb The callback called from the main loop when setxattr succeeded.
 * @param error_cb The callback called from the main loop when setxattr failed.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_double_set calls eina_xattr_double_set from another thread. This prevents blocking in your apps. If
 * the writing succeeded, the done_cb will be called even if a cancel was requested, but came too late.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_double_set(path:Pchar; attribute:Pchar; xattr_double:Tdouble; flags:TEina_Xattr_Flags; done_cb:TEio_Done_Cb; 
           error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Define a string extended attribute on a file/directory.
 * @param path The path to set the attribute on.
 * @param attribute The name of the attribute to define.
 * @param xattr_string The string to link the attribute with.
 * @param flags Whether to insert, replace or create the attribute.
 * @param done_cb The callback called from the main loop when setxattr succeeded.
 * @param error_cb The callback called from the main loop when setxattr failed.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_string_set calls eina_xattr_string_set from another thread. This prevents blocking in your apps. If
 * the writing succeeded, the done_cb will be called even if a cancel was requested, but came too late.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_string_set(path:Pchar; attribute:Pchar; xattr_string:Pchar; flags:TEina_Xattr_Flags; done_cb:TEio_Done_Cb; 
           error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Define an extended attribute on a file/directory.
 * @param path The path to set the attribute on.
 * @param attribute The name of the attribute to define.
 * @param xattr_data The data to link the attribute with.
 * @param xattr_size The size of the data to set.
 * @param flags Whether to insert, replace or create the attribute.
 * @param done_cb The callback called from the main loop when setxattr succeeded.
 * @param error_cb The callback called from the main loop when setxattr failed.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_set calls setxattr from another thread. This prevents blocking in your apps. If
 * the writing succeeded, the done_cb will be called even if a cancel was requested, but came too late.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_set(path:Pchar; attribute:Pchar; xattr_data:Pchar; xattr_size:dword; flags:TEina_Xattr_Flags; 
           done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Retrieve the extended attribute of a file/directory.
 * @param path The path to retrieve the extended attribute from.
 * @param attribute The name of the attribute to retrieve.
 * @param done_cb Callback called from the main loop when getxattr succeeded.
 * @param error_cb Callback called from the main loop when getxattr failed or has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_get calls getxattr from another thread. This prevents blocking in your apps.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_get(path:Pchar; attribute:Pchar; done_cb:TEio_Done_Data_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Retrieve a extended attribute of a file/directory.
 * @param path The path to retrieve the extended attribute from.
 * @param attribute The name of the attribute to retrieve.
 * @param done_cb Callback called from the main loop when getxattr succeeded.
 * @param error_cb Callback called from the main loop when getxattr failed or has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_int_get calls eina_xattr_int_get from another thread. This prevents blocking in your apps.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_int_get(path:Pchar; attribute:Pchar; done_cb:TEio_Done_Int_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Retrieve a extended attribute of a file/directory.
 * @param path The path to retrieve the extended attribute from.
 * @param attribute The name of the attribute to retrieve.
 * @param done_cb Callback called from the main loop when getxattr succeeded.
 * @param error_cb Callback called from the main loop when getxattr failed or has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_double_get calls eina_xattr_double_get from another thread. This prevents blocking in your apps.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_double_get(path:Pchar; attribute:Pchar; done_cb:TEio_Done_Double_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Retrieve a string extended attribute of a file/directory.
 * @param path The path to retrieve the extended attribute from.
 * @param attribute The name of the attribute to retrieve.
 * @param done_cb Callback called from the main loop when getxattr succeeded.
 * @param error_cb Callback called from the main loop when getxattr failed or has been canceled.
 * @param data Unmodified user data passed to callbacks
 * @return A reference to the I/O operation.
 *
 * eio_file_xattr_string_get calls eina_xattr_string_get from another thread. This prevents blocking in your apps.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_xattr_string_get(path:Pchar; attribute:Pchar; done_cb:TEio_Done_String_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eio_Helper Eio Reference helper API
 * @ingroup Eio
 *
 * @brief This are helper provided around core Eio API.
 *
 * This set of functions do provide helper to work around data
 * provided by Eio without the need to look at system header.
 *
 * @
  }
{*
 * @brief Initialize eio and all its required submodule.
 * @return the current number of eio users.
  }
function eio_init:longint;cdecl;external;
{*
 * @brief Shutdown eio and all its submodule if possible.
 * @return the number of pending users of eio.
  }
function eio_shutdown:longint;cdecl;external;
{*
 * @brief Set the limit to the maximum amount of memory used
 * @param limit The actual limit to set.
 *
 * Eio work by burst, allocating memory in a thread and moving it
 * back to the main loop. This result in quite some huge memory
 * usage if the main loop is to slow to cope with the speed of the
 * thread. By setting this limit, the thread will block until
 * enough memory has been freed to be below the limit again.
 *
 * By default no limit is set and any value < 0 will mean no limit.
 *
 * @note You should give at least a reasonable amount of memory or
 * the thread might stall.
 * @since 1.10
  }
procedure eio_memory_burst_limit_set(limit:Tsize_t);cdecl;external;
{*
 * @brief Get the actual limit to the maximum amount of memory used
 * @return The current limit being set.
 *
 * @since 1.10
 * @see eio_memory_burst_limit_set
  }
function eio_memory_burst_limit_get:Tsize_t;cdecl;external;
{*
 * @brief Return the container during EIO operation
 * @param ls The asynchronous I/O operation to retrieve container from.
 * @return NULL if not available, a DIRP if it is.
 *
 * This is only available and make sense in the thread callback, not in
 * the mainloop.
  }
function eio_file_container_get(ls:PEio_File):pointer;cdecl;external;
{*
 * @brief Cancel any Eio_File.
 * @param ls The asynchronous I/O operation to cancel.
 * @return EINA_FALSE if the destruction is delayed, EINA_TRUE if it's done.
 *
 * This will cancel any kind of I/O operation and cleanup the mess. This means
 * that it could take time to cancel an I/O.
  }
function eio_file_cancel(ls:PEio_File):TEina_Bool;cdecl;external;
{*
 * @brief Check if an Eio_File operation has been cancelled.
 * @param ls The asynchronous I/O operation to check.
 * @return EINA_TRUE if it was canceled, EINA_FALSE other wise.
 *
 * In case of an error it also return EINA_TRUE.
  }
function eio_file_check(ls:PEio_File):TEina_Bool;cdecl;external;
{*
 * @brief Associate data with the current filtered file.
 * @param ls The Eio_File ls request currently calling the filter callback.
 * @param key The key to associate data to.
 * @param data The data to associate the data to.
 * @param free_cb Optionally a function to call to free the associated data,
 * @p data is passed as the callback data parameter. If no @p free_cb is provided
 * the user @p data remains untouched.
 * @return EINA_TRUE if insertion was fine.
 *
 * This function can only be safely called from within the filter callback.
 * If you don't need to copy the key around you can use @ref eio_file_associate_direct_add
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_associate_add(ls:PEio_File; key:Pchar; data:pointer; free_cb:TEina_Free_Cb):TEina_Bool;cdecl;external;
{*
 * @brief Associate data with the current filtered file.
 * @param ls The Eio_File ls request currently calling the filter callback.
 * @param key The key to associate data to (will not be copied, and the pointer will not be used as long as the file is not notified).
 * @param data The data to associate the data to.
 * @param free_cb The function to call to free the associated data, @p free_cb will be called if not specified.
 * @return EINA_TRUE if insertion was fine.
 *
 * This function can only be safely called from within the filter callback.
 * If you need eio to make a proper copy of the @p key to be safe use
 * @ref eio_file_associate_add instead.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_associate_direct_add(ls:PEio_File; key:Pchar; data:pointer; free_cb:TEina_Free_Cb):TEina_Bool;cdecl;external;
{*
 * @brief Get the data associated during the filter callback inside the main loop
 * @param ls The Eio_File ls request currently calling the notify callback.
 * @param key The key pointing to the data to retrieve.
 * @return the data associated with the key or @p NULL if not found.
  }
(* Const before type ignored *)
function eio_file_associate_find(ls:PEio_File; key:Pchar):pointer;cdecl;external;
{*
 * @
  }
{*
 *
  }
{*
 * @defgroup Eio_Map Manipulate an Eina_File asynchronously
 * @ingroup Eio
 *
 * @brief This function helps when manipulating a file asynchronously.
 *
 * These set of functions work on top of Eina_File and Ecore_Thread to
 * do basic operations on a file, like opening, closing and mapping a file to
 * memory.
 * @
  }
{*
 * @brief Asynchronously open a file.
 * @param name The file to open.
 * @param shared If it's a shared memory file.
 * @param open_cb Callback called in the main loop when the file has been successfully opened.
 * @param error_cb Callback called in the main loop when the file couldn't be opened.
 * @param data Unmodified user data passed to callbacks
 * @return Pointer to the file if successful or NULL otherwise.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_file_open(name:Pchar; shared:TEina_Bool; open_cb:TEio_Open_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Asynchronously close a file.
 * @param f The file to close.
 * @param done_cb Callback called in the main loop when the file has been successfully closed.
 * @param error_cb Callback called in the main loop when the file couldn't be closed.
 * @param data Unmodified user data passed to callbacks
 * @return Pointer to the file if successful or NULL otherwise.
  }
(* Const before type ignored *)
function eio_file_close(f:PEina_File; done_cb:TEio_Done_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Asynchronously map a file in memory.
 * @param f The file to map.
 * @param rule The rule to apply to the map.
 * @param filter_cb Callback called in the thread to validate the content of the map.
 * @param map_cb Callback called in the main loop when the file has been successfully mapped.
 * @param error_cb Callback called in the main loop when the file can't be mapped.
 * @param data Unmodified user data passed to callbacks
 * @return Pointer to the file if successful or NULL otherwise.
 *
 * The container of the Eio_File is the Eina_File.
  }
(* Const before type ignored *)
function eio_file_map_all(f:PEina_File; rule:TEina_File_Populate; filter_cb:TEio_Filter_Map_Cb; map_cb:TEio_Map_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Asynchronously map a part of a file in memory.
 * @param f The file to map.
 * @param rule The rule to apply to the map.
 * @param offset The offset inside the file
 * @param length The length of the memory to map
 * @param filter_cb Callback called in the thread to validate the content of the map.
 * @param map_cb Callback called in the main loop when the file has been successfully mapped.
 * @param error_cb Callback called in the main loop when the file can't be mapped.
 * @param data Unmodified user data passed to callbacks
 * @return Pointer to the file if successful or NULL otherwise.
 *
 * The container of the Eio_File is the Eina_File.
  }
(* Const before type ignored *)
function eio_file_map_new(f:PEina_File; rule:TEina_File_Populate; offset:dword; length:dword; filter_cb:TEio_Filter_Map_Cb; 
           map_cb:TEio_Map_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eio_Eet Eio asynchronous API for Eet file.
 * @ingroup Eio
 *
 * @brief This set of functions help in the asynchronous use of Eet
 *
 * @
  }
{*
 * @brief Open an eet file on disk, and returns a handle to it asynchronously.
 * @param filename The file path to the eet file. eg: @c "/tmp/file.eet".
 * @param mode The mode for opening. Either EET_FILE_MODE_READ,
 *        EET_FILE_MODE_WRITE or EET_FILE_MODE_READ_WRITE.
 * @param eet_cb The callback to call when the file has been successfully opened.
 * @param error_cb Callback called in the main loop when the file can't be opened.
 * @param data Unmodified user data passed to callbacks
 * @return NULL in case of a failure.
 *
 * This function calls eet_open() from another thread using Ecore_Thread.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_open(filename:Pchar; mode:TEet_File_Mode; eet_cb:TEio_Eet_Open_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Close an eet file handle and flush pending writes asynchronously.
 * @param ef A valid eet file handle.
 * @param done_cb Callback called from the main loop when the file has been closed.
 * @param error_cb Callback called in the main loop when the file can't be closed.
 * @param data Unmodified user data passed to callbacks
 * @return NULL in case of a failure.
 *
 * This function will call eet_close() from another thread by
 * using Ecore_Thread. You should assume that the Eet_File is dead after this
 * function is called.
  }
(* Const before type ignored *)
function eio_eet_close(ef:PEet_File; done_cb:TEio_Done_Cb; error_cb:TEio_Eet_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Sync content of an eet file handle, flushing pending writes asynchronously.
 * @param ef A valid eet file handle.
 * @param done_cb Callback called from the main loop when the file has been synced.
 * @param error_cb Callback called in the main loop when the file can't be synced.
 * @param data Unmodified user data passed to callbacks
 * @return NULL in case of a failure.
 *
 * This function will call eet_sync() from another thread. As long as the done_cb or
 * error_cb haven't be called, you must keep @p ef open.
  }
(* Const before type ignored *)
function eio_eet_sync(ef:PEet_File; done_cb:TEio_Done_Cb; error_cb:TEio_Eet_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Write a data structure from memory and store in an eet file
 * using a cipher asynchronously.
 * @param ef The eet file handle to write to.
 * @param edd The data descriptor to use when encoding.
 * @param name The key to store the data under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @param write_data A pointer to the data structure to save and encode.
 * @param compress Compression flags for storage.
 * @param done_cb Callback called from the main loop when the data has been put in the Eet_File.
 * @param error_cb Callback called in the main loop when the file can't be written.
 * @param user_data Private data given to each callback.
 * @return NULL in case of a failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_data_write_cipher(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar; cipher_key:Pchar; write_data:pointer; 
           compress:longint; done_cb:TEio_Done_Int_Cb; error_cb:TEio_Error_Cb; user_data:pointer):PEio_File;cdecl;external;
{*
 * @brief Read a data structure from an eet file and decodes it using a cipher asynchronously.
 * @param ef The eet file handle to read from.
 * @param edd The data descriptor handle to use when decoding.
 * @param name The key the data is stored under in the eet file.
 * @param cipher_key The key to use as cipher.
 * @param done_cb Callback called from the main loop when the data has been read and decoded.
 * @param error_cb Callback called in the main loop when the data can't be read.
 * @param data Unmodified user data passed to callbacks
 * @return NULL in case of a failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_data_read_cipher(ef:PEet_File; edd:PEet_Data_Descriptor; name:Pchar; cipher_key:Pchar; done_cb:TEio_Done_ERead_Cb; 
           error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Write image data to the named key in an eet file asynchronously.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param write_data A pointer to the image pixel data.
 * @param w The width of the image in pixels.
 * @param h The height of the image in pixels.
 * @param alpha The alpha channel flag.
 * @param compress The compression amount.
 * @param quality The quality encoding amount.
 * @param lossy The lossiness flag.
 * @param done_cb Callback called from the main loop when the data has been put in the Eet_File.
 * @param error_cb Callback called in the main loop when the file can't be written.
 * @param user_data Private data given to each callback.
 * @return NULL in case of a failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_data_image_write_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; write_data:pointer; w:dword; 
           h:dword; alpha:longint; compress:longint; quality:longint; lossy:longint; 
           done_cb:TEio_Done_Int_Cb; error_cb:TEio_Error_Cb; user_data:pointer):PEio_File;cdecl;external;
{*
 * @brief Read a specified entry from an eet file and return data
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param done_cb Callback called from the main loop when the data has been read.
 * @param error_cb Callback called in the main loop when the data can't be read.
 * @param data Unmodified user data passed to callbacks
 * @return NULL in case of a failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_read_direct(ef:PEet_File; name:Pchar; done_cb:TEio_Done_Data_Cb; error_cb:TEio_Error_Cb; data:pointer):PEio_File;cdecl;external;
{*
 * @brief Read a specified entry from an eet file and return data
 * @param ef A valid eet file handle opened for reading.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param cipher_key The key to use as cipher.
 * @param done_cb Callback called from the main loop when the data has been read.
 * @param error_cb Callback called in the main loop when the data can't be read.
 * @param data Unmodified user data passed to callbacks
 * @return NULL in case of a failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_read_cipher(ef:PEet_File; name:Pchar; cipher_key:Pchar; done_cb:TEio_Done_Read_Cb; error_cb:TEio_Error_Cb; 
           data:pointer):PEio_File;cdecl;external;
{*
 * @brief Write a specified entry to an eet file handle using a cipher.
 * @param ef A valid eet file handle opened for writing.
 * @param name Name of the entry. eg: "/base/file_i_want".
 * @param write_data Pointer to the data to be stored.
 * @param size Length in bytes in the data to be stored.
 * @param compress Compression flags (1 == compress, 0 = don't compress).
 * @param cipher_key The key to use as cipher.
 * @param done_cb Callback called from the main loop when the data has been put in the Eet_File.
 * @param error_cb Callback called in the main loop when the file can't be written.
 * @param user_data Private data given to each callback.
 * @return NULL in case of a failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eio_eet_write_cipher(ef:PEet_File; name:Pchar; write_data:pointer; size:longint; compress:longint; 
           cipher_key:Pchar; done_cb:TEio_Done_Int_Cb; error_cb:TEio_Error_Cb; user_data:pointer):PEio_File;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eio_Monitor Eio file and directory monitoring API
 * @ingroup Eio
 *
 * @brief These function monitor changes in directories and files
 *
 * These functions use the best available method to monitor changes on a specified directory
 * or file. They send ecore events when changes occur, and they maintain internal refcounts to
 * reduce resource consumption on duplicate monitor targets.
 *
 * @
  }
  var
    EIO_MONITOR_FILE_CREATED : longint;cvar;external;
{*< A new file was created in a watched directory  }
    EIO_MONITOR_FILE_DELETED : longint;cvar;external;
{*< A watched file was deleted, or a file in a watched directory was deleted  }
    EIO_MONITOR_FILE_MODIFIED : longint;cvar;external;
{*< A file was modified in a watched directory  }
    EIO_MONITOR_FILE_CLOSED : longint;cvar;external;
{*< A file was closed in a watched directory. This event is never sent on Windows and OSX, or for non-fallback monitors  }
    EIO_MONITOR_DIRECTORY_CREATED : longint;cvar;external;
{*< A new directory was created in a watched directory  }
    EIO_MONITOR_DIRECTORY_DELETED : longint;cvar;external;
{*< A directory has been deleted: this can be either a watched directory or one of its subdirectories  }
    EIO_MONITOR_DIRECTORY_MODIFIED : longint;cvar;external;
{*< A directory has been modified in a watched directory  }
    EIO_MONITOR_DIRECTORY_CLOSED : longint;cvar;external;
{*< A directory has been closed in a watched directory. This event is never sent on Windows and OSX, or for non-fallback monitors  }
    EIO_MONITOR_SELF_RENAME : longint;cvar;external;
{*< The monitored path has been renamed, an error could happen just after if the renamed path doesn't exist. This event is never sent on OSX, or for non-fallback monitors  }
    EIO_MONITOR_SELF_DELETED : longint;cvar;external;
{*< The monitored path has been removed. This event is never sent on OSX  }
    EIO_MONITOR_ERROR : longint;cvar;external;
{*< During operation the monitor failed and will no longer work. eio_monitor_del must be called on it.  }
type
  PEio_Monitor_Error = ^TEio_Monitor_Error;
  TEio_Monitor_Error = record
      monitor : PEio_Monitor;
      error : longint;
    end;

(* Const before type ignored *)
  PEio_Monitor_Event = ^TEio_Monitor_Event;
  TEio_Monitor_Event = record
      monitor : PEio_Monitor;
      filename : Pchar;
    end;

{*
 * @brief Adds a file/directory to monitor (inotify mechanism)
 * @param path file/directory to monitor
 * @return NULL in case of a failure or a pointer to the monitor in case of
 * success.
 *
 * This function will add the given path to its internal
 * list of files to monitor. It utilizes the inotify mechanism
 * introduced in kernel 2.6.13 for passive monitoring.
  }
(* Const before type ignored *)

function eio_monitor_add(path:Pchar):PEio_Monitor;cdecl;external;
{*
 * @brief Adds a file/directory to monitor
 * @param path file/directory to monitor
 * @return NULL in case of a failure or a pointer to the monitor in case of
 * success.
 * @warning Do NOT pass non-stringshared strings to this function!
 *  If you don't know what this means, use eio_monitor_add().
 *
 * This function is just like eio_monitor_add(), however the string passed by
 * argument must be created using eina_stringshare_add().
  }
(* Const before type ignored *)
function eio_monitor_stringshared_add(path:Pchar):PEio_Monitor;cdecl;external;
{*
 * @brief Deletes a path from the “watched” list
 * @param monitor The Eio_Monitor you want to stop watching.
 *  It can only be an Eio_Monitor returned to you from calling
 *  eio_monitor_add() or eio_monitor_stringshared_add()
  }
procedure eio_monitor_del(monitor:PEio_Monitor);cdecl;external;
{*
 * @brief returns the path being watched by the given
 *  Eio_Monitor.
 * @param monitor Eio_Monitor to return the path of
 * @return The stringshared path belonging to @p monitor
  }
(* Const before type ignored *)
function eio_monitor_path_get(monitor:PEio_Monitor):Pchar;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Check whether a monitor is using the fallback backend
 * @param monitor The Eio_Monitor to check
 * @return EINA_TRUE only if the monitor is valid and is using the fallback monitoring mechanism
 *
 * Fallback monitors are unable to provide the CLOSED or RENAME events. It's important
 * to check whether a monitor is a fallback monitor before relying on these events.
 *
 * @since 1.21
  }
(* Const before type ignored *)
function eio_monitor_fallback_check(monitor:PEio_Monitor):TEina_Bool;cdecl;external;
{*
 * @brief Check if a monitor has the context about a file or not
 * @param monitor The Eio_Monitor to check
 * @param path The path to check
 * @return EINA_TRUE if there is context, EINA_FALSE otherwise.
 *
 * There are Monitors that need context about a file before they can monitor the file correctly.
 * As an example: If you publish a file in your API before the monitor has this file in his context,
 * and the file gets deleted as a reaction to this, the monitor will not be able to emit the correct DELETE
 * event even if the file is in the monitors path.
 *
 * In case the monitor does not yet have context, you can be sure that the monitor will bring up an FILE_ADD event about that file.
 *
 * @since 1.23
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eio_monitor_has_context(monitor:PEio_Monitor; path:Pchar):TEina_Bool;cdecl;external;
{$endif}
{*
 * @
  }
{ C++ end of extern C conditionnal removed }

implementation


end.
