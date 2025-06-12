
unit Eeze_Net;
interface

{
  Automatically converted by H2Pas 1.0.0 from Eeze_Net.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Eeze_Net.h
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
PEeze_Net  = ^Eeze_Net;
PEeze_Net_Addr_Type  = ^Eeze_Net_Addr_Type;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EEZE_NET_H}
{$define EEZE_NET_H}
{$include <Eina.h>}
{$include <Ecore.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @file Eeze_Net.h
 * @brief Network manipulation
 *
 * Eeze net functions allow you to gather information about network objects
 *
 * @defgroup Eeze_Net Net
 * Gather information about network devices.
 *
 * @ingroup Eeze
 * @
  }
type

  PEeze_Net_Addr_Type = ^TEeze_Net_Addr_Type;
  TEeze_Net_Addr_Type =  Longint;
  Const
    EEZE_NET_ADDR_TYPE_IP = 0;
    EEZE_NET_ADDR_TYPE_IP6 = 1;
    EEZE_NET_ADDR_TYPE_BROADCAST = 2;
    EEZE_NET_ADDR_TYPE_BROADCAST6 = 3;
    EEZE_NET_ADDR_TYPE_NETMASK = 4;
    EEZE_NET_ADDR_TYPE_NETMASK6 = 5;
;
{ C++ extern C conditionnal removed }
(* Const before type ignored *)

function eeze_net_new(name:Pchar):PEeze_Net;cdecl;external;
procedure eeze_net_free(net:PEeze_Net);cdecl;external;
(* Const before type ignored *)
function eeze_net_mac_get(net:PEeze_Net):Pchar;cdecl;external;
function eeze_net_idx_get(net:PEeze_Net):longint;cdecl;external;
function eeze_net_scan(net:PEeze_Net):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function eeze_net_addr_get(net:PEeze_Net; _type:TEeze_Net_Addr_Type):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eeze_net_attribute_get(net:PEeze_Net; attr:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function eeze_net_syspath_get(net:PEeze_Net):Pchar;cdecl;external;
function eeze_net_list:PEina_List;cdecl;external;
{$endif}

implementation


end.
