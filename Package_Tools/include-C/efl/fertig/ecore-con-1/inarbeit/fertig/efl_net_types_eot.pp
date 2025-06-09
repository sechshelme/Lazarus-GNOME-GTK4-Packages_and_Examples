
unit efl_net_types_eot;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_types_eot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_types_eot.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_TYPES_EOT_H_}
{$define _EFL_NET_TYPES_EOT_H_}
{$ifndef _EFL_NET_TYPES_EOT_TYPES}
{$define _EFL_NET_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_error_couldnt_resolve_host_get:TEina_Error;cdecl;external;
{* Could not resolve the given host name
 *
 * @ingroup Efl_Net_Error_COULDNT_RESOLVE_HOST
  }
{ was #define dname def_expr }
function EFL_NET_ERROR_COULDNT_RESOLVE_HOST : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_ERROR_COULDNT_RESOLVE_HOST : longint; { return type might be wrong }
  begin
    EFL_NET_ERROR_COULDNT_RESOLVE_HOST:=efl_net_error_couldnt_resolve_host_get;
  end;


end.
