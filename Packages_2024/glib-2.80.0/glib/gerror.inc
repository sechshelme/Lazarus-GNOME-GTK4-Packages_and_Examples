
{$IFDEF read_interface}


type
  TGError = record
    domain: TGQuark;
    code: Tgint;
    message: Pgchar;
  end;
  PGError = ^TGError;
  PPGError = ^PGError;

  TGErrorInitFunc = procedure(error: PGError); cdecl;
  TGErrorCopyFunc = procedure(src_error: PGError; dest_error: PGError); cdecl;
  TGErrorClearFunc = procedure(error: PGError); cdecl;

function g_error_domain_register_static(error_type_name: PChar; error_type_private_size: Tgsize; error_type_init: TGErrorInitFunc; error_type_copy: TGErrorCopyFunc; error_type_clear: TGErrorClearFunc): TGQuark; cdecl; external libglib2;
function g_error_domain_register(error_type_name: PChar; error_type_private_size: Tgsize; error_type_init: TGErrorInitFunc; error_type_copy: TGErrorCopyFunc; error_type_clear: TGErrorClearFunc): TGQuark; cdecl; external libglib2;
function g_error_new(domain: TGQuark; code: Tgint; format: Pgchar): PGError; varargs; cdecl; external libglib2;
function g_error_new_literal(domain: TGQuark; code: Tgint; message: Pgchar): PGError; cdecl; external libglib2;
function g_error_new_valist(domain: TGQuark; code: Tgint; format: Pgchar; args: Tva_list): PGError; cdecl; external libglib2;
procedure g_error_free(error: PGError); cdecl; external libglib2;
function g_error_copy(error: PGError): PGError; cdecl; external libglib2;
function g_error_matches(error: PGError; domain: TGQuark; code: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_set_error(err: PPGError; domain: TGQuark; code: Tgint; format: Pgchar); varargs; cdecl; external libglib2;
procedure g_set_error_literal(err: PPGError; domain: TGQuark; code: Tgint; message: Pgchar); cdecl; external libglib2;
procedure g_propagate_error(dest: PPGError; src: PGError); cdecl; external libglib2;
procedure g_clear_error(err: PPGError); cdecl; external libglib2;
procedure g_prefix_error(err: PPGError; format: Pgchar); varargs; cdecl; external libglib2;
procedure g_prefix_error_literal(err: PPGError; prefix: Pgchar); cdecl; external libglib2;
procedure g_propagate_prefixed_error(dest: PPGError; src: PGError; format: Pgchar); varargs; cdecl; external libglib2;

// === Konventiert am: 6-8-24 17:13:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
