
unit efl_net_server_simple_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_simple_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_simple_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Net_Server_Simple  = ^Efl_Net_Server_Simple;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_SIMPLE_EO_H_}
{$define _EFL_NET_SERVER_SIMPLE_EO_H_}
{$ifndef _EFL_NET_SERVER_SIMPLE_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_SIMPLE_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Simple = ^TEfl_Net_Server_Simple;
  TEfl_Net_Server_Simple = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_SIMPLE_EO_TYPES}
{$define _EFL_NET_SERVER_SIMPLE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A network server wrapper that creates clients based on
 * @ref Efl_Net_Socket_Simple.
 *
 * This is just a wrapper server. It takes an actual server using
 * @ref efl_net_server_simple_inner_server_get or creates one using
 * @ref efl_net_server_simple_inner_class_get.
 *
 * @ingroup Efl_Net_Server_Simple
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_SIMPLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_simple_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The class used to create @ref efl_net_server_simple_inner_server_get
 * if none was provided.
 *
 * This class must be set at build time and will be used to create the inner
 * socket during @ref efl_finalize.
 *
 * It is a helper for users, saving them the trouble of manually creating and
 * specifying a dialer object.
 *
 * Constructor-only property to define the class used to create the inner
 * dialer.
 *
 * @param[in] obj The object.
 * @param[in] klass The class
 *
 * @ingroup Efl_Net_Server_Simple
  }
(* Const before type ignored *)
procedure efl_net_server_simple_inner_class_set(obj:PEo; klass:PEfl_Class);cdecl;external;
{*
 * @brief The class used to create @ref efl_net_server_simple_inner_server_get
 * if none was provided.
 *
 * This class must be set at build time and will be used to create the inner
 * socket during @ref efl_finalize.
 *
 * It is a helper for users, saving them the trouble of manually creating and
 * specifying a dialer object.
 *
 * The internal class used to create the inner dialer.
 *
 * @param[in] obj The object.
 *
 * @return The class
 *
 * @ingroup Efl_Net_Server_Simple
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_net_server_simple_inner_class_get(obj:PEo):PEfl_Class;cdecl;external;
{*
 * @brief The inner @ref Efl_Net_Server this wrapper operates on.
 *
 * Constructor-only property to set the inner_server.
 *
 * @param[in] obj The object.
 * @param[in] server The server instance
 *
 * @ingroup Efl_Net_Server_Simple
  }
procedure efl_net_server_simple_inner_server_set(obj:PEo; server:PEfl_Object);cdecl;external;
{*
 * @brief The inner @ref Efl_Net_Server this wrapper operates on.
 *
 * The internal server used for actual operations, use with care!
 *
 * @param[in] obj The object.
 *
 * @return The server instance
 *
 * @ingroup Efl_Net_Server_Simple
  }
(* Const before type ignored *)
function efl_net_server_simple_inner_server_get(obj:PEo):PEfl_Object;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_SIMPLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_SIMPLE_CLASS:=efl_net_server_simple_class_get;
  end;


end.
