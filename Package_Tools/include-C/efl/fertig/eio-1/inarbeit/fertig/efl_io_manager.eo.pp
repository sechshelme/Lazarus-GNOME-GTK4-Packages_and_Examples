
unit efl_io_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_io_manager.eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_io_manager.eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Io_Manager  = ^Efl_Io_Manager;
PEina_Array  = ^Eina_Array;
PEina_Binbuf  = ^Eina_Binbuf;
PEina_File  = ^Eina_File;
PEina_Future  = ^Eina_Future;
PEio_Data  = ^Eio_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_IO_MANAGER_EO_H_}
{$define _EFL_IO_MANAGER_EO_H_}
{$ifndef _EFL_IO_MANAGER_EO_CLASS_TYPE}
{$define _EFL_IO_MANAGER_EO_CLASS_TYPE}
type
  PEfl_Io_Manager = ^TEfl_Io_Manager;
  TEfl_Io_Manager = TEo;
{$endif}
{$ifndef _EFL_IO_MANAGER_EO_TYPES}
{$define _EFL_IO_MANAGER_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* A structure to handle arbitrary data to be sent over Promises.
 *
 * @ingroup Eio_Data
  }
{*< Private data pointer  }
{*< Size of private data  }
type
  PEio_Data = ^TEio_Data;
  TEio_Data = record
      data : pointer;
      size : dword;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* EflIoPath function
 *
 * @ingroup EflIoPath
  }
type

  TEflIoPath = procedure (data:pointer; paths:PEina_Array);cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* EflIoDirectInfo function
 *
 * @ingroup EflIoDirectInfo
  }
type

  TEflIoDirectInfo = procedure (data:pointer; entries:PEina_Array);cdecl;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Class representing an asynchronous file operation.
 *
 * @ingroup Efl_Io_Manager
  }

{ was #define dname def_expr }
function EFL_IO_MANAGER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_io_manager_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Lists entries in a given path. See @ref Eina_File.
 *
 * @param[in] obj The object.
 * @param[in] path Path we want to list entries for
 * @param[in] paths Callback called for each packet of files found
 *
 * @return Amount of files found during the listing of the directory
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_ls(obj:PEo; path:Pchar; paths_data:pointer; paths:TEflIoPath; paths_free_cb:TEina_Free_Cb):PEina_Future;cdecl;external;
{*
 * @brief Lists entries in a given path with more information.
 *
 * @param[in] obj The object.
 * @param[in] path Path we want to list entries for
 * @param[in] recursive If @c true, list entries recursively, @c false
 * otherwise
 * @param[in] info Callback called for each packet of
 * @ref Eina_File_Direct_Info
 *
 * @return Amount of files found during the listing of the directory
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_direct_ls(obj:PEo; path:Pchar; recursive:TEina_Bool; info_data:pointer; info:TEflIoDirectInfo; 
           info_free_cb:TEina_Free_Cb):PEina_Future;cdecl;external;
{*
 * @brief Lists entries in a given path with stat information.
 *
 * @param[in] obj The object.
 * @param[in] path Path we want to list entries for
 * @param[in] recursive If @c true, list entries recursively, @c false
 * otherwise
 * @param[in] info Callback called for each packet of
 * @ref Eina_File_Direct_Info
 *
 * @return Amount of files found during the listing of the directory
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_stat_ls(obj:PEo; path:Pchar; recursive:TEina_Bool; info_data:pointer; info:TEflIoDirectInfo; 
           info_free_cb:TEina_Free_Cb):PEina_Future;cdecl;external;
{*
 * @brief Lists all extended attributes asynchronously.
 *
 * @param[in] obj The object.
 * @param[in] path Path we want to list entries for
 * @param[in] paths Callback called for each packet of extended attributes
 * found.
 *
 * @return Amount of extended attributes found
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_xattr_ls(obj:PEo; path:Pchar; paths_data:pointer; paths:TEflIoPath; paths_free_cb:TEina_Free_Cb):PEina_Future;cdecl;external;
{*
 * @brief Get stat info on a given file/directory.
 *
 * @param[in] obj The object.
 * @param[in] path Path we want to get stat information for
 *
 * @return Stat information
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_stat(obj:PEo; path:Pchar):PEina_Future;cdecl;external;
{*
 * @brief Retrieves or sets information of a given extended attribute.
 *
 * @param[in] obj The object.
 * @param[in] path File path
 * @param[in] attribute Attribute name
 * @param[in] data Data to set as information
 * @param[in] flags Extended attributes flags
 *
 * @return Future for asynchronous set operation
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_xattr_set(obj:PEo; path:Pchar; attribute:Pchar; data:PEina_Binbuf; flags:TEina_Xattr_Flags):PEina_Future;cdecl;external;
{*
 * @brief Retrieves or sets information of a given extended attribute.
 *
 * @param[in] obj The object.
 * @param[in] path File path
 * @param[in] attribute Attribute name
 *
 * @return Information
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_xattr_get(obj:PEo; path:Pchar; attribute:Pchar):PEina_Future;cdecl;external;
{*
 * @brief Opens a file.
 *
 * The fulfilled value in the promise will be the Eina.File*.
 *
 * @param[in] obj The object.
 * @param[in] path Path to file
 * @param[in] shared @c true if the file can be accessed by others, @c false
 * otherwise
 *
 * @return Eina file handle
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_io_manager_open(obj:PEo; path:Pchar; shared:TEina_Bool):PEina_Future;cdecl;external;
{*
 * @brief Closes an open Eina.File.
 *
 * @param[in] obj The object.
 * @param[in] file Eina file handle
 *
 * @return Close return code
 *
 * @ingroup Efl_Io_Manager
  }
(* Const before type ignored *)
function efl_io_manager_close(obj:PEo; file:PEina_File):PEina_Future;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_IO_MANAGER_CLASS : longint; { return type might be wrong }
  begin
    EFL_IO_MANAGER_CLASS:=efl_io_manager_class_get;
  end;


end.
