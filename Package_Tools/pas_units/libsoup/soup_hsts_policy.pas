unit soup_hsts_policy;

interface

uses
  fp_glib2, fp_soup, soup_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function soup_hsts_policy_get_type: TGType; cdecl; external libsoup;

function SOUP_TYPE_HSTS_POLICY: TGType;

const
  SOUP_HSTS_POLICY_MAX_AGE_PAST = 0;

function soup_hsts_policy_new(domain: pchar; max_age: dword; include_subdomains: Tgboolean): PSoupHSTSPolicy; cdecl; external libsoup;
function soup_hsts_policy_new_full(domain: pchar; max_age: dword; expires: PGDateTime; include_subdomains: Tgboolean): PSoupHSTSPolicy; cdecl; external libsoup;
function soup_hsts_policy_new_session_policy(domain: pchar; include_subdomains: Tgboolean): PSoupHSTSPolicy; cdecl; external libsoup;
function soup_hsts_policy_new_from_response(msg: PSoupMessage): PSoupHSTSPolicy; cdecl; external libsoup;
function soup_hsts_policy_copy(policy: PSoupHSTSPolicy): PSoupHSTSPolicy; cdecl; external libsoup;
function soup_hsts_policy_equal(policy1: PSoupHSTSPolicy; policy2: PSoupHSTSPolicy): Tgboolean; cdecl; external libsoup;
function soup_hsts_policy_get_domain(policy: PSoupHSTSPolicy): pchar; cdecl; external libsoup;
function soup_hsts_policy_is_expired(policy: PSoupHSTSPolicy): Tgboolean; cdecl; external libsoup;
function soup_hsts_policy_includes_subdomains(policy: PSoupHSTSPolicy): Tgboolean; cdecl; external libsoup;
function soup_hsts_policy_is_session_policy(policy: PSoupHSTSPolicy): Tgboolean; cdecl; external libsoup;
procedure soup_hsts_policy_free(policy: PSoupHSTSPolicy); cdecl; external libsoup;
function soup_hsts_policy_get_expires(policy: PSoupHSTSPolicy): PGDateTime; cdecl; external libsoup;
function soup_hsts_policy_get_max_age(policy: PSoupHSTSPolicy): Tgulong; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:41 ===


implementation


function SOUP_TYPE_HSTS_POLICY: TGType;
begin
  SOUP_TYPE_HSTS_POLICY := soup_hsts_policy_get_type;
end;


end.
