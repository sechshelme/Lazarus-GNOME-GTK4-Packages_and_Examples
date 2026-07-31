unit as_spdx;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function as_is_spdx_license_id(license_id: Pgchar): Tgboolean; cdecl; external libappstream;
function as_is_spdx_license_exception_id(exception_id: Pgchar): Tgboolean; cdecl; external libappstream;
function as_is_spdx_license_expression(license: Pgchar): Tgboolean; cdecl; external libappstream;
function as_spdx_license_tokenize(license: Pgchar): PPgchar; cdecl; external libappstream;
function as_spdx_license_detokenize(license_tokens: PPgchar): Pgchar; cdecl; external libappstream;
function as_license_to_spdx_id(license: Pgchar): Pgchar; cdecl; external libappstream;
function as_license_is_metadata_license_id(license_id: Pgchar): Tgboolean; cdecl; external libappstream;
function as_license_is_metadata_license(license: Pgchar): Tgboolean; cdecl; external libappstream;
function as_license_is_free_license(license: Pgchar): Tgboolean; cdecl; external libappstream;
function as_get_license_name(license: Pgchar): Pgchar; cdecl; external libappstream;
function as_get_license_url(license: Pgchar): Pgchar; cdecl; external libappstream;
{$ENDIF read_function}

// === Konventiert am: 30-7-26 19:34:49 ===


implementation



end.
