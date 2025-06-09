unit efl_net_types_eot;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_TYPES_EOT_H_}
{$define _EFL_NET_TYPES_EOT_H_}
{$ifndef _EFL_NET_TYPES_EOT_TYPES}
{$define _EFL_NET_TYPES_EOT_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}

function efl_net_error_couldnt_resolve_host_get:TEina_Error;cdecl;external libecore_con;
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

// === Konventiert am: 9-6-25 19:30:57 ===


implementation


{ was #define dname def_expr }
function EFL_NET_ERROR_COULDNT_RESOLVE_HOST : longint; { return type might be wrong }
  begin
    EFL_NET_ERROR_COULDNT_RESOLVE_HOST:=efl_net_error_couldnt_resolve_host_get;
  end;


end.
