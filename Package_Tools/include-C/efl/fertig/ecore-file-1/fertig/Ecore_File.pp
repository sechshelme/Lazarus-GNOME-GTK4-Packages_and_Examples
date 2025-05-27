
unit Ecore_File;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_File.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_File.h
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
PEcore_File_Download_Job  = ^Ecore_File_Download_Job;
PEcore_File_Event  = ^Ecore_File_Event;
PEcore_File_Monitor  = ^Ecore_File_Monitor;
PEcore_File_Progress_Return  = ^Ecore_File_Progress_Return;
PEina_Hash  = ^Eina_Hash;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ECORE_FILE_H}
{$define ECORE_FILE_H}
{
 * TODO:
 * - More events, move/rename of directory file
  }
{$include <Eina.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @file Ecore_File.h
 * @brief Files utility functions.
  }
{ C++ extern C conditionnal removed }
{*
 * @defgroup Ecore_File_Group Ecore_File - Files and directories convenience functions
 * @ingroup Ecore
 *
 * @
  }
{*
 * @typedef Ecore_File_Monitor
 * Abstract type used when monitoring a directory.
  }
type
{*
 * @typedef Ecore_File_Download_Job
 * Abstract type used when aborting a download.
  }
{*
 * @typedef _Ecore_File_Event
 * The event type returned when a file or directory is monitored.
  }
{*< No event.  }
{*< Created file event.  }
{*< Created directory event.  }
{*< Deleted file event.  }
{*< Deleted directory event.  }
{*< Deleted monitored directory event.  }
{*< Modified file or directory event.  }
{*< Closed file event  }

  PEcore_File_Event = ^TEcore_File_Event;
  TEcore_File_Event =  Longint;
  Const
    ECORE_FILE_EVENT_NONE = 0;
    ECORE_FILE_EVENT_CREATED_FILE = 1;
    ECORE_FILE_EVENT_CREATED_DIRECTORY = 2;
    ECORE_FILE_EVENT_DELETED_FILE = 3;
    ECORE_FILE_EVENT_DELETED_DIRECTORY = 4;
    ECORE_FILE_EVENT_DELETED_SELF = 5;
    ECORE_FILE_EVENT_MODIFIED = 6;
    ECORE_FILE_EVENT_CLOSED = 7;
;
{*
 * @typedef Ecore_File_Monitor_Cb
 * Callback type used when a monitored directory has changes.
  }
(* Const before type ignored *)
type

  TEcore_File_Monitor_Cb = procedure (data:pointer; em:PEcore_File_Monitor; event:TEcore_File_Event; path:Pchar);cdecl;
{*
 * @typedef Ecore_File_Download_Completion_Cb
 * Callback type used when a download is finished.
  }
(* Const before type ignored *)

  TEcore_File_Download_Completion_Cb = procedure (data:pointer; file:Pchar; status:longint);cdecl;
{*
 * @typedef _Ecore_File_Progress_Return
 * What to do with the download as a return from the
 * Ecore_File_Download_Progress_Cb function, if provided.
  }
{*< Continue the download.  }
{*< Abort the download.  }

  PEcore_File_Progress_Return = ^TEcore_File_Progress_Return;
  TEcore_File_Progress_Return =  Longint;
  Const
    ECORE_FILE_PROGRESS_CONTINUE = 0;
    ECORE_FILE_PROGRESS_ABORT = 1;
;
{*
 * @typedef Ecore_File_Download_Progress_Cb
 * Callback type used while a download is in progress.
  }
(* Const before type ignored *)
type

  TEcore_File_Download_Progress_Cb = function (data:pointer; file:Pchar; dltotal:longint; dlnow:longint; ultotal:longint; 
               ulnow:longint):longint;cdecl;
{ File operations  }
{*
 * @brief Initializes the Ecore_File library.
 *
 * @return @c 1 or greater on success, otherwise @c 0 on error.
 *
 * This function sets up Ecore_File and the services it will use
 * (monitoring, downloading, PATH related feature). It returns 0 on
 * failure, otherwise it returns the number of times it has already
 * been called.
 *
 * When Ecore_File is not used anymore, call ecore_file_shutdown()
 * to shut down the Ecore_File library.
  }

function ecore_file_init:longint;cdecl;external;
{*
 * @brief Shuts down the Ecore_File library.
 *
 * @return @c 0 when the library is completely shut down, @c 1 or
 * greater otherwise.
 *
 * This function shuts down the Ecore_File library. It returns 0 when it has
 * been called the same number of times than ecore_file_init(). In that case
 * it shuts down all the services it uses.
  }
function ecore_file_shutdown:longint;cdecl;external;
{*
 * @brief Gets the time of the last modification to the given file.
 *
 * @param file The name of the file.
 * @return Return the time of the last data modification, or @c 0 on
 * failure.
 *
 * This function returns the time of the last modification of
 * @p file. On failure, it returns 0.
  }
(* Const before type ignored *)
function ecore_file_mod_time(file:Pchar):int64;cdecl;external;
{*
 * @brief Gets the size of the given file.
 *
 * @param file The name of the file.
 * @return Return the size of the file in bytes, or @c 0 on failure.
 *
 * This function returns the size of @p file in bytes. On failure, it
 * returns 0.
  }
(* Const before type ignored *)
function ecore_file_size(file:Pchar):int64;cdecl;external;
{*
 * @brief Checks if the given file exists.
 *
 * @param file The name of the file.
 * @return @c EINA_TRUE if the @p file exists, @c EINA_FALSE otherwise.
 *
 * This function returns @c EINA_TRUE if @p file exists on local filesystem,
 * @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_exists(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the given file is a directory.
 *
 * @param file The name of the file.
 * @return @c EINA_TRUE if the file exists and is a directory, @c EINA_FALSE
 * otherwise.
 *
 * This function returns @c EINA_TRUE if @p file exists exists and is a
 * directory on local filesystem, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_is_dir(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Creates a new directory.
 *
 * @param  dir The name of the directory to create
 * @return @c EINA_TRUE on successful creation, @c EINA_FALSE otherwise.
 *
 * This function creates the directory @p dir, with the mode S_IRUSR |
 * S_IWUSR | S_IXUSR | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH on UNIX
 * (mode is unused on Windows). On success, it returns @c EINA_TRUE,
 * @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_mkdir(dir:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Creates complete directory in a batch.
 *
 * @param dirs The list of directories, null terminated.
 * @return The number of successful directories created, -1 if dirs is
 * @c NULL.
 *
 * This function creates all the directories that are in the null
 * terminated array @p dirs. The function loops over the directories
 * and call ecore_file_mkdir(). This function returns -1 if @p dirs is
 * @c NULL, otherwise if returns the number of successfully created
 * directories.
  }
(* Const before type ignored *)
function ecore_file_mkdirs(dirs:PPchar):longint;cdecl;external;
{*
 * @brief Creates complete list of sub-directories in a batch (optimized).
 *
 * @param base The base directory to act on.
 * @param subdirs The list of directories, null terminated.
 * @return The number of successful directories created, @c -1 on failure.
 *
 * This function creates all the directories that are in the null
 * terminated array @p subdirs in the @p base directory. If @p base does
 * not exist, it will be created. The function loops over the directories
 * and call ecore_file_mkdir(). The whole path of the directories must
 * exist. So if base/a/b/c wants to be created, @p subdirs must
 * contain "a", "a/b" and "a/b/c", in that order. This function
 * returns -1 if @p subdirs or @p base are @c NULL, or if @p base is
 * empty ("\0"). It returns 0 is @p base is not a directory or
 * invalid, or if it can't be created. Otherwise if returns the number
 * of successfully created directories.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_mksubdirs(base:Pchar; subdirs:PPchar):longint;cdecl;external;
{*
 * @brief Deletes the given empty directory.
 *
 * @param  dir The name of the directory to delete.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function deletes @p dir. It returns @c EINA_TRUE on success,
 * @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_rmdir(dir:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes the given directory and all its contents.
 *
 * @param  dir The name of the directory to delete.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function delete @p dir and all its contents. If @p dir is a
 * link only the link is removed. It returns @c EINA_TRUE on success,
 * @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_recursive_rm(dir:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Creates a complete path.
 *
 * @param path The path to create
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function creates @p path and all the subdirectories it
 * contains. The separator is '/' or '\'. If @p path exists, this
 * function returns @c EINA_TRUE immediately. It returns @c EINA_TRUE on
 * success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_mkpath(path:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Creates complete paths in a batch.
 *
 * @param paths list of paths, null terminated.
 * @return The number of successful paths created, @c -1 if paths is NULL.
 *
 * This function creates all the directories that are in the null
 * terminated array @p paths. The function loops over the directories
 * and call ecore_file_mkpath(), hence on Windows, '\' must be
 * replaced by '/' before calling that function. This function
 * returns -1 if @p paths is @c NULL. Otherwise if returns the number
 * of successfully created directories.
  }
(* Const before type ignored *)
function ecore_file_mkpaths(paths:PPchar):longint;cdecl;external;
{*
 * @brief Copies the given file to the given destination.
 *
 * @param  src The name of the source file.
 * @param  dst The name of the destination file.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function copies @p src to @p dst. If the absolute path name of
 * @p src and @p dst can not be computed, or if they are equal, or if
 * the copy fails, the function returns @c EINA_FALSE, otherwise it
 * returns @c EINA_TRUE.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_cp(src:Pchar; dst:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Moves the given file to the given destination.
 *
 * @param  src The name of the source file.
 * @param  dst The name of the destination file.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function moves @p src to @p dst. It returns @c EINA_TRUE on
 * success, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_mv(src:Pchar; dst:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Creates a symbolic link.
 *
 * @param  src The name of the file to link.
 * @param  dest The name of link.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function creates the symbolic link @p dest of @p src. It returns
 * @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * @note On windows, this function always returns @c EINA_FALSE.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_symlink(src:Pchar; dest:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the canonicalized absolute path name.
 *
 * @param  file The file path.
 * @return The canonicalized absolute pathname or an empty string on
 * failure.
 *
 * This function returns the absolute path name of @p file as a newly
 * allocated string. If @p file is @c NULL, or on error, this function
 * returns an empty string. Otherwise, it returns the absolute path
 * name. When not needed anymore, the returned value must be freed.
  }
(* Const before type ignored *)
function ecore_file_realpath(file:Pchar):Pchar;cdecl;external;
{*
 * @brief Deletes the given file.
 *
 * @param  file The name of the file to delete.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function deletes @p file. It returns @c EINA_TRUE on success,
 * @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_unlink(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Removes the given file or directory.
 *
 * @param  file The name of the file or directory to delete.
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise.
 *
 * This function removes @p file. It returns @c EINA_TRUE on success,
 * @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function ecore_file_remove(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the filename from a given path.
 *
 * @param  path The complete path.
 * @return The file name.
 *
 * This function returns the file name of @p path. If @p path is
 * @c NULL, the functions returns @c NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_file_get(path:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets the directory where the given file resides.
 *
 * @param  file The name of the file.
 * @return The directory name.
 *
 * This function returns the directory where @p file resides as newly
 * allocated string. If @p file is @c NULL or on error, this function
 * returns @c NULL. When not needed anymore, the returned value must
 * be freed.
  }
(* Const before type ignored *)
function ecore_file_dir_get(file:Pchar):Pchar;cdecl;external;
{*
 * @brief Checks if the given file can be read.
 *
 * @param  file The name of the file.
 * @return @c EINA_TRUE if the @p file is readable, @c EINA_FALSE otherwise.
 *
 * This function returns @c EINA_TRUE if @p file can be read, @c EINA_FALSE
 * otherwise.
  }
(* Const before type ignored *)
function ecore_file_can_read(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the given file can be written.
 *
 * @param  file The name of the file.
 * @return @c EINA_TRUE if the @p file is writable, @c EINA_FALSE otherwise.
 *
 * This function returns @c EINA_TRUE if @p file can be written, @c EINA_FALSE
 * otherwise.
  }
(* Const before type ignored *)
function ecore_file_can_write(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the given file can be executed.
 *
 * @param  file The name of the file.
 * @return @c EINA_TRUE if the @p file can be executed, @c EINA_FALSE
 * otherwise.
 *
 * This function returns @c EINA_TRUE if @p file can be executed, @c EINA_FALSE
 * otherwise.
  }
(* Const before type ignored *)
function ecore_file_can_exec(file:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets the path pointed by the given link.
 *
 * @param  link The name of the link.
 * @return The path pointed by link or NULL.
 *
 * This function returns the path pointed by @p link as a newly
 * allocated string. On failure, the function returns @c NULL. When not
 * needed anymore, the returned value must be freed.
 *
 * @note On windows, this function always returns @c NULL.
  }
(* Const before type ignored *)
function ecore_file_readlink(link:Pchar):Pchar;cdecl;external;
{*
 * @brief Gets the list of the files and directories in the given
 * directory.
 *
 * @param  dir The name of the directory to list
 * @return Return an Eina_List containing all the files in the directory;
 *         on failure it returns NULL.
 *
 * This function returns a list of allocated strings of all the files
 * and directories contained in @p dir. The list will be sorted with
 * strcoll as compare function. That means that you may want to set
 * the current locale for the category LC_COLLATE with
 * setlocale(). For more information see the manual pages of strcoll
 * and setlocale. The list will not contain the directory entries for
 * '.' and '..'. On failure, @c NULL is returned. When not needed
 * anymore, the list elements must be freed.
  }
(* Const before type ignored *)
function ecore_file_ls(dir:Pchar):PEina_List;cdecl;external;
{*
 * @brief Returns the executable from the given command.
 *
 * @param app The application command, with parameters.
 * @return The executable from @p app as a newly allocated string. Arguments
 * are removed and escape characters are handled. If @p app is @c NULL, or
 * on failure, the function returns @c NULL. When not needed anymore, the
 * returned value must be freed.
  }
(* Const before type ignored *)
function ecore_file_app_exe_get(app:Pchar):Pchar;cdecl;external;
{*
 * @brief Adds the escape sequence ('\\') to the given file name.
 *
 * @param  filename The file name.
 * @return The file name with special characters escaped.
 *
 * This function adds the escape sequence ('\\') to the given file
 * name and returns the result as a newly allocated string. If the
 * length of the returned string is longer than PATH_MAX, or on
 * failure, @c NULL is returned. When not needed anymore, the returned
 * value must be freed.
  }
(* Const before type ignored *)
function ecore_file_escape_name(filename:Pchar):Pchar;cdecl;external;
{*
 * @brief Removes the extension from the given file name.
 *
 * @param  path The name of the file.
 * @return A newly allocated string with the extension stripped out, or
 * @c NULL on errors.
 *
 * This function removes the extension from @p path and returns the
 * result as a newly allocated string. If @p path is @c NULL, or on
 * failure, the function returns @c NULL. When not needed anymore, the
 * returned value must be freed.
  }
(* Const before type ignored *)
function ecore_file_strip_ext(path:Pchar):Pchar;cdecl;external;
{*
 * @brief Checks if the given directory is empty.
 *
 * @param  dir The name of the directory to check.
 * @return @c 1 if directory is empty, @c 0 if it has at least one file, or
 * @c -1 in case of errors.
 *
 * This functions checks if @p dir is empty. The '.' and '..' files
 * will be ignored. If @p dir is empty, 1 is returned, if it contains
 * at least one file, @c 0 is returned. On failure, @c -1 is returned.
  }
(* Const before type ignored *)
function ecore_file_dir_is_empty(dir:Pchar):longint;cdecl;external;
{ Monitoring  }
{*
 * @brief Monitors the given path using inotify, Windows notification, or polling.
 *
 * @param  path The path to monitor.
 * @param  func The function to call on changes.
 * @param  data The data passed to func.
 * @return An Ecore_File_Monitor pointer or NULL on failure.
 *
 * This function monitors @p path. If @p path is @c NULL, or is an
 * empty string, or none of the notify methods (Inotify, Windows
 * notification or polling) is available, or if @p path does not exist
 * the function returns @c NULL. Otherwise, it returns a newly
 * allocated Ecore_File_Monitor object and the monitoring begins.
 * When one of the Ecore_File_Event event is notified, @p func is called
 * and @p data is passed to @p func.Call ecore_file_monitor_del() to
 * stop the monitoring.
  }
(* Const before type ignored *)
function ecore_file_monitor_add(path:Pchar; func:TEcore_File_Monitor_Cb; data:pointer):PEcore_File_Monitor;cdecl;external;
{*
 * @brief Stops the monitoring of the given path.
 *
 * @param em The Ecore_File_Monitor to stop.
 *
 * This function stops the the monitoring of the path that has been
 * monitored by ecore_file_monitor_add(). @p em must be the value
 * returned by ecore_file_monitor_add(). If @p em is @c NULL, or none
 * of the notify methods (Inotify, Windows notification or polling) is
 * available this function does nothing.
  }
procedure ecore_file_monitor_del(em:PEcore_File_Monitor);cdecl;external;
{*
 * @brief Gets the monitored path.
 *
 * @param  em The Ecore_File_Monitor to query.
 * @return The path that is monitored by @p em.
 *
 * This function returns the monitored path that has been
 * monitored by ecore_file_monitor_add(). @p em must be the value
 * returned by ecore_file_monitor_add(). If @p em is @c NULL, the
 * function returns @c NULL.
  }
(* Const before type ignored *)
function ecore_file_monitor_path_get(em:PEcore_File_Monitor):Pchar;cdecl;external;
{ Path  }
{*
 * @brief Checks if the given directory is in PATH.
 *
 * @param in_dir The name of the directory to search in PATH.
 * @return @c EINA_TRUE if the directory exist in PATH, @c EINA_FALSE otherwise.
 *
 * This function checks if @p in_dir is in the environment variable
 * PATH. If @p in_dir is @c NULL, or if PATH is empty, or @p in_dir is
 * not in PATH, the function returns @c EINA_FALSE, otherwise it returns
 * @c EINA_TRUE.
  }
(* Const before type ignored *)
function ecore_file_path_dir_exists(in_dir:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the given application is installed.
 *
 * @param  exe The name of the application
 * @return @c EINA_TRUE if the @p exe is in PATH and is executable,
 * @c EINA_FALSE otherwise.
 *
 * This function checks if @p exe exists in PATH and is executable. If
 * @p exe is @c NULL or is not executable, the function returns
 * @c EINA_FALSE, otherwise it returns @c EINA_TRUE.
  }
(* Const before type ignored *)
function ecore_file_app_installed(exe:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Gets a list of all the applications installed on the system.
 *
 * @return An Eina_List containing all the executable files in the
 * system.
 *
 * This function returns a list of allocated strings of all the
 * executable files. If no files are found, the function returns
 * @c NULL. When not needed anymore, the element of the list must be
 * freed.
  }
function ecore_file_app_list:PEina_List;cdecl;external;
{ Download  }
{*
 * @brief Downloads the given url to the given destination.
 *
 * @param  url The complete url to download.
 * @param  dst The local file to save the downloaded to.
 * @param  completion_cb A callback called on download complete.
 * @param  progress_cb A callback called during the download operation.
 * @param  data User data passed to both callbacks.
 * @param  job_ret Job used to abort the download.
 * @return @c EINA_TRUE if the download start or @c EINA_FALSE on failure.
 *
 * This function starts the download of the URL @p url and saves it to
 * @p dst. @p url must provide the protocol, including '%http://',
 * '%ftp://' or '%file://'. Ecore_File must be compiled with CURL to
 * download using http and ftp protocols. If @p dst is ill-formed, or
 * if it already exists, the function returns @c EINA_FALSE. When the
 * download is complete, the callback @p completion_cb is called and
 * @p data is passed to it. The @p status parameter of @p completion_cb
 * will be filled with the status of the download (200, 404,...). The
 * @p progress_cb is called during the download operation, each time a
 * packet is received or when CURL wants. It can be used to display the
 * percentage of the downloaded file. Return 0 from this callback, if provided,
 * to continue the operation or anything else to abort the download. The only
 * operations that can be aborted are those with protocol 'http' or 'ftp'. In
 * that case @p job_ret can be passed to ecore_file_download_abort() to abort
 * that download job. Similarly ecore_file_download_abort_all() can be used to
 * abort all download operations. This function returns @c EINA_TRUE if the
 * download starts, @c EINA_FALSE otherwise.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_download(url:Pchar; dst:Pchar; completion_cb:TEcore_File_Download_Completion_Cb; progress_cb:TEcore_File_Download_Progress_Cb; data:pointer; 
           job_ret:PPEcore_File_Download_Job):TEina_Bool;cdecl;external;
{*
 * @brief Downloads the given url to the given destination with additional headers.
 *
 * @param  url The complete url to download.
 * @param  dst The local file to save the downloaded to.
 * @param  completion_cb A callback called on download complete.
 * @param  progress_cb A callback called during the download operation.
 * @param  data User data passed to both callbacks.
 * @param  job_ret Job used to abort the download.
 * @param  headers pointer of header lists.
 * @return @c EINA_TRUE if the download start or @c EINA_FALSE on failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_file_download_full(url:Pchar; dst:Pchar; completion_cb:TEcore_File_Download_Completion_Cb; progress_cb:TEcore_File_Download_Progress_Cb; data:pointer; 
           job_ret:PPEcore_File_Download_Job; headers:PEina_Hash):TEina_Bool;cdecl;external;
{*
 * @brief Aborts all downloads.
 *
 * This function aborts all the downloads that have been started by
 * ecore_file_download(). It loops over the started downloads and call
 * ecore_file_download_abort() for each of them. To abort only one
 * specific download operation, call ecore_file_download_abort().
  }
procedure ecore_file_download_abort_all;cdecl;external;
{*
 * @brief Aborts the given download job and call the completion_cb
 * callback with a status of 1 (error).
 *
 * @param job The download job to abort.
 *
 * This function aborts a download operation started by
 * ecore_file_download(). @p job is the #Ecore_File_Download_Job
 * structure filled by ecore_file_download(). If it is @c NULL, this
 * function does nothing. To abort all the currently downloading
 * operations, call ecore_file_download_abort_all().
  }
procedure ecore_file_download_abort(job:PEcore_File_Download_Job);cdecl;external;
{*
 * @brief Checks if the given protocol is available.
 *
 * @param  protocol The protocol to check.
 * @return @c EINA_TRUE if protocol is handled, @c EINA_FALSE otherwise.
 *
 * This function returns @c EINA_TRUE if @p protocol is supported,
 * @c EINA_FALSE otherwise. @p protocol can be '%http://', '%ftp://' or
 * '%file://'. Ecore_FILE must be compiled with CURL to handle http and
 * ftp protocols.
  }
(* Const before type ignored *)
function ecore_file_download_protocol_available(protocol:Pchar):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
