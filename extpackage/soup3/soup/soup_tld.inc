{$IFDEF read_interface}


function soup_tld_get_base_domain(hostname: pchar; error: PPGError): pchar; cdecl; external libsoup;
function soup_tld_domain_is_public_suffix(domain: pchar): Tgboolean; cdecl; external libsoup;
function soup_tld_error_quark: TGQuark; cdecl; external libsoup;

function SOUP_TLD_ERROR: TGQuark;

type
  PSoupTLDError = ^TSoupTLDError;
  TSoupTLDError = longint;

const
  SOUP_TLD_ERROR_INVALID_HOSTNAME = 0;
  SOUP_TLD_ERROR_IS_IP_ADDRESS = 1;
  SOUP_TLD_ERROR_NOT_ENOUGH_DOMAINS = 2;
  SOUP_TLD_ERROR_NO_BASE_DOMAIN = 3;
  SOUP_TLD_ERROR_NO_PSL_DATA = 4;

  // === Konventiert am: 29-9-25 19:43:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function SOUP_TLD_ERROR: TGQuark;
begin
  SOUP_TLD_ERROR := soup_tld_error_quark;
end;


{$ENDIF read_implementation}
