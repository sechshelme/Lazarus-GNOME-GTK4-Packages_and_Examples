unit fp_proxy;

interface

uses
  fp_glib2;

const
  {$IFDEF linux}
  libproxy = 'libproxy';
  {$ENDIF}

  {$IFDEF windows}
  libproxy = 'libproxy.dll';        // ?????????
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PpxProxyFactory = type Pointer;

function PX_TYPE_PROXY_FACTORY: TGType;

function px_proxy_factory_new: PpxProxyFactory; cdecl; external libproxy;
function px_proxy_factory_get_type: TGType; cdecl; external libproxy;
function px_proxy_factory_get_proxies(self: PpxProxyFactory; url: pchar): PPchar; cdecl; external libproxy;
procedure px_proxy_factory_free_proxies(proxies: PPchar); cdecl; external libproxy;
procedure px_proxy_factory_free(self: PpxProxyFactory); cdecl; external libproxy;


implementation


function PX_TYPE_PROXY_FACTORY: TGType;
begin
  PX_TYPE_PROXY_FACTORY := px_proxy_factory_get_type;
end;


end.
