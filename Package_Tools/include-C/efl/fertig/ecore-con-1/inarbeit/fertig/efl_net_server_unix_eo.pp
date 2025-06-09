
unit efl_net_server_unix_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_unix_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_unix_eo.h
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
Pdword  = ^dword;
PEfl_Class  = ^Efl_Class;
PEfl_Net_Server_Unix  = ^Efl_Net_Server_Unix;
PEina_Bool  = ^Eina_Bool;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_UNIX_EO_H_}
{$define _EFL_NET_SERVER_UNIX_EO_H_}
{$ifndef _EFL_NET_SERVER_UNIX_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_UNIX_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Unix = ^TEfl_Net_Server_Unix;
  TEfl_Net_Server_Unix = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_UNIX_EO_TYPES}
{$define _EFL_NET_SERVER_UNIX_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An AF_UNIX server.
 *
 * The @ref efl_net_server_serve method will call bind(2) directly. This means
 * the path will be accessed and created in that method. If the created socket
 * must be subject to some special mode or user, change before executing said
 * method, for example by calling umask(2).
 *
 * @ingroup Efl_Net_Server_Unix
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_UNIX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_unix_class_get:PEfl_Class;cdecl;external;
{*
 * @brief AF_UNIX paths may be stale due to crashes. Remove files and try
 * again.
 *
 * If this property is @c true, then it will unlink() before bind() is done,
 * repeating this process if EADDRINUSE.
 *
 * By default it's false and you will get EADDRINUSE.
 *
 * @param[in] obj The object.
 * @param[in] unlink_before_bind If @c true, server will unlink() the path
 * before bind() is called.
 *
 * @ingroup Efl_Net_Server_Unix
  }
procedure efl_net_server_unix_unlink_before_bind_set(obj:PEo; unlink_before_bind:TEina_Bool);cdecl;external;
{*
 * @brief AF_UNIX paths may be stale due to crashes. Remove files and try
 * again.
 *
 * If this property is @c true, then it will unlink() before bind() is done,
 * repeating this process if EADDRINUSE.
 *
 * By default it's false and you will get EADDRINUSE.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, server will unlink() the path before bind() is called.
 *
 * @ingroup Efl_Net_Server_Unix
  }
(* Const before type ignored *)
function efl_net_server_unix_unlink_before_bind_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief If @c true, all parent directories will be created with the given
 * mode.
 *
 * This is only effective before @ref efl_net_server_serve is called as it is
 * used from inside that method.
 *
 * @param[in] obj The object.
 * @param[in] leading_directories_create If @c true, create missing parent
 * directories. Do nothing if @c false
 * @param[in] mode The file system permissions to use (file mode)
 *
 * @ingroup Efl_Net_Server_Unix
  }
procedure efl_net_server_unix_leading_directories_create_set(obj:PEo; leading_directories_create:TEina_Bool; mode:dword);cdecl;external;
{*
 * @brief If @c true, all parent directories will be created with the given
 * mode.
 *
 * This is only effective before @ref efl_net_server_serve is called as it is
 * used from inside that method.
 *
 * @param[in] obj The object.
 * @param[out] leading_directories_create If @c true, create missing parent
 * directories. Do nothing if @c false
 * @param[out] mode The file system permissions to use (file mode)
 *
 * @ingroup Efl_Net_Server_Unix
  }
(* Const before type ignored *)
procedure efl_net_server_unix_leading_directories_create_get(obj:PEo; leading_directories_create:PEina_Bool; mode:Pdword);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_UNIX_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_UNIX_CLASS:=efl_net_server_unix_class_get;
  end;


end.
