{$IFDEF read_interface}

type
  TVteRegex = record
  end;
  PVteRegex = ^TVteRegex;
  PPVteRegex = ^PVteRegex;

function vte_regex_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function vte_regex_error_quark: TGQuark; cdecl; external libvte_2_91_gtk4;

const
  VTE_REGEX_FLAGS_DEFAULT = ($00080000 or $40000000) or $00100000;

function vte_regex_ref(regex: PVteRegex): PVteRegex; cdecl; external libvte_2_91_gtk4;
function vte_regex_unref(regex: PVteRegex): PVteRegex; cdecl; external libvte_2_91_gtk4;
function vte_regex_new_for_match(pattern: pchar; pattern_length: Tgssize; flags: Tguint32; error: PPGError): PVteRegex; cdecl; external libvte_2_91_gtk4;
function vte_regex_new_for_match_full(pattern: pchar; pattern_length: Tgssize; flags: Tuint32_t; extra_flags: Tuint32_t; error_offset: Pgsize;
  error: PPGError): PVteRegex; cdecl; external libvte_2_91_gtk4;
function vte_regex_new_for_search(pattern: pchar; pattern_length: Tgssize; flags: Tguint32; error: PPGError): PVteRegex; cdecl; external libvte_2_91_gtk4;
function vte_regex_new_for_search_full(pattern: pchar; pattern_length: Tgssize; flags: Tuint32_t; extra_flags: Tuint32_t; error_offset: Pgsize;
  error: PPGError): PVteRegex; cdecl; external libvte_2_91_gtk4;
function vte_regex_jit(regex: PVteRegex; flags: Tguint32; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_regex_substitute(regex: PVteRegex; subject: pchar; replacement: pchar; flags: Tguint32; error: PPGError): pchar; cdecl; external libvte_2_91_gtk4;

function VTE_REGEX_ERROR: TGQuark;


// === Konventiert am: 3-5-25 17:06:47 ===

function VTE_TYPE_REGEX: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function VTE_TYPE_REGEX: TGType;
begin
  VTE_TYPE_REGEX := vte_regex_get_type;
end;

function VTE_REGEX_ERROR: TGQuark;
begin
  VTE_REGEX_ERROR := vte_regex_error_quark;
end;


{$ENDIF read_implementation}
