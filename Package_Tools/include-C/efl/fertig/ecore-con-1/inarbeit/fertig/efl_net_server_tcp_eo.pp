
unit efl_net_server_tcp_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_server_tcp_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_server_tcp_eo.h
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
PEfl_Net_Server_Tcp  = ^Efl_Net_Server_Tcp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SERVER_TCP_EO_H_}
{$define _EFL_NET_SERVER_TCP_EO_H_}
{$ifndef _EFL_NET_SERVER_TCP_EO_CLASS_TYPE}
{$define _EFL_NET_SERVER_TCP_EO_CLASS_TYPE}
type
  PEfl_Net_Server_Tcp = ^TEfl_Net_Server_Tcp;
  TEfl_Net_Server_Tcp = TEo;
{$endif}
{$ifndef _EFL_NET_SERVER_TCP_EO_TYPES}
{$define _EFL_NET_SERVER_TCP_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A TCP server.
 *
 * @ingroup Efl_Net_Server_Tcp
  }

{ was #define dname def_expr }
function EFL_NET_SERVER_TCP_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_server_tcp_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SERVER_TCP_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SERVER_TCP_CLASS:=efl_net_server_tcp_class_get;
  end;


end.
