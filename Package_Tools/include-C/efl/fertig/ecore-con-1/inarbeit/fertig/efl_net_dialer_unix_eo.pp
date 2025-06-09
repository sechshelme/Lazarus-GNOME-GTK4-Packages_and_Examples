
unit efl_net_dialer_unix_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_dialer_unix_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_dialer_unix_eo.h
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
PEfl_Net_Dialer_Unix  = ^Efl_Net_Dialer_Unix;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_DIALER_UNIX_EO_H_}
{$define _EFL_NET_DIALER_UNIX_EO_H_}
{$ifndef _EFL_NET_DIALER_UNIX_EO_CLASS_TYPE}
{$define _EFL_NET_DIALER_UNIX_EO_CLASS_TYPE}
type
  PEfl_Net_Dialer_Unix = ^TEfl_Net_Dialer_Unix;
  TEfl_Net_Dialer_Unix = TEo;
{$endif}
{$ifndef _EFL_NET_DIALER_UNIX_EO_TYPES}
{$define _EFL_NET_DIALER_UNIX_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Connects to a local AF_UNIX server.
 *
 * The dial address is a file system path (portable) or "abstract:ID"
 * (Linux-only extension).
 *
 * @note Proxies are meaningless for AF_UNIX family, thus are not implemented.
 *
 * @ingroup Efl_Net_Dialer_Unix
  }

{ was #define dname def_expr }
function EFL_NET_DIALER_UNIX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_dialer_unix_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_DIALER_UNIX_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_DIALER_UNIX_CLASS:=efl_net_dialer_unix_class_get;
  end;


end.
