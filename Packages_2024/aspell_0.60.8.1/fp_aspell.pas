unit fp_aspell;

interface

const
  {$ifdef linux}
  libaspell = 'aspell';
  {$endif}

  {$ifdef windows}
  libaspell = 'msys-aspell-15.dll';
  {$endif}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAspellTypeId = record
    case longint of
      0: (num: dword);
      1: (str: array[0..3] of char);
  end;
  PAspellTypeId = ^TAspellTypeId;

  PAspellMutableContainer = type Pointer;

function aspell_mutable_container_add(ths: PAspellMutableContainer; to_add: pchar): longint; cdecl; external libaspell;
function aspell_mutable_container_remove(ths: PAspellMutableContainer; to_rem: pchar): longint; cdecl; external libaspell;
procedure aspell_mutable_container_clear(ths: PAspellMutableContainer); cdecl; external libaspell;
function aspell_mutable_container_to_mutable_container(ths: PAspellMutableContainer): PAspellMutableContainer; cdecl; external libaspell;

type
  PAspellKeyInfoType = ^TAspellKeyInfoType;
  TAspellKeyInfoType = longint;

const
  AspellKeyInfoString = 0;
  AspellKeyInfoInt = 1;
  AspellKeyInfoBool = 2;
  AspellKeyInfoList = 3;

type
  TAspellKeyInfo = record
    name: pchar;
    _type: TAspellKeyInfoType;
    def: pchar;
    desc: pchar;
    flags: longint;
    other_data: longint;
  end;
  PAspellKeyInfo = ^TAspellKeyInfo;

  PAspellKeyInfoEnumeration = type Pointer;

function aspell_key_info_enumeration_at_end(ths: PAspellKeyInfoEnumeration): longint; cdecl; external libaspell;
function aspell_key_info_enumeration_next(ths: PAspellKeyInfoEnumeration): PAspellKeyInfo; cdecl; external libaspell;
procedure delete_aspell_key_info_enumeration(ths: PAspellKeyInfoEnumeration); cdecl; external libaspell;
function aspell_key_info_enumeration_clone(ths: PAspellKeyInfoEnumeration): PAspellKeyInfoEnumeration; cdecl; external libaspell;
procedure aspell_key_info_enumeration_assign(ths: PAspellKeyInfoEnumeration; other: PAspellKeyInfoEnumeration); cdecl; external libaspell;

type
  PAspellErrorInfo = ^TAspellErrorInfo;

  TAspellErrorInfo = record
    isa: PAspellErrorInfo;
    mesg: pchar;
    num_parms: dword;
    parms: array[0..2] of pchar;
  end;

  TAspellError = record
    mesg: pchar;
    err: PAspellErrorInfo;
  end;
  PAspellError = ^TAspellError;

  PAspellConfig = type Pointer;
  PAspellStringPairEnumeration = type Pointer;
  PAspellCanHaveError = type Pointer;

function new_aspell_config: PAspellConfig; cdecl; external libaspell;
procedure delete_aspell_config(ths: PAspellConfig); cdecl; external libaspell;
function aspell_config_clone(ths: PAspellConfig): PAspellConfig; cdecl; external libaspell;
procedure aspell_config_assign(ths: PAspellConfig; other: PAspellConfig); cdecl; external libaspell;
function aspell_config_error_number(ths: PAspellConfig): dword; cdecl; external libaspell;
function aspell_config_error_message(ths: PAspellConfig): pchar; cdecl; external libaspell;
function aspell_config_error(ths: PAspellConfig): PAspellError; cdecl; external libaspell;
procedure aspell_config_set_extra(ths: PAspellConfig; begin_: PAspellKeyInfo; end_: PAspellKeyInfo); cdecl; external libaspell;
function aspell_config_keyinfo(ths: PAspellConfig; key: pchar): PAspellKeyInfo; cdecl; external libaspell;
function aspell_config_possible_elements(ths: PAspellConfig; include_extra: longint): PAspellKeyInfoEnumeration; cdecl; external libaspell;
function aspell_config_get_default(ths: PAspellConfig; key: pchar): pchar; cdecl; external libaspell;
function aspell_config_elements(ths: PAspellConfig): PAspellStringPairEnumeration; cdecl; external libaspell;
function aspell_config_replace(ths: PAspellConfig; key: pchar; value: pchar): longint; cdecl; external libaspell;
function aspell_config_remove(ths: PAspellConfig; key: pchar): longint; cdecl; external libaspell;
function aspell_config_have(ths: PAspellConfig; key: pchar): longint; cdecl; external libaspell;
function aspell_config_retrieve(ths: PAspellConfig; key: pchar): pchar; cdecl; external libaspell;
function aspell_config_retrieve_list(ths: PAspellConfig; key: pchar; lst: PAspellMutableContainer): longint; cdecl; external libaspell;
function aspell_config_retrieve_bool(ths: PAspellConfig; key: pchar): longint; cdecl; external libaspell;
function aspell_config_retrieve_int(ths: PAspellConfig; key: pchar): longint; cdecl; external libaspell;

function aspell_version_string: pchar; cdecl; external libaspell;
function aspell_error_is_a(ths: PAspellError; e: PAspellErrorInfo): longint; cdecl; external libaspell;

function aspell_error_number(ths: PAspellCanHaveError): dword; cdecl; external libaspell;
function aspell_error_message(ths: PAspellCanHaveError): pchar; cdecl; external libaspell;
function aspell_error(ths: PAspellCanHaveError): PAspellError; cdecl; external libaspell;
procedure delete_aspell_can_have_error(ths: PAspellCanHaveError); cdecl; external libaspell;

var
  aerror_other : PAspellErrorInfo;cvar;external libaspell;
  aerror_operation_not_supported : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_copy : PAspellErrorInfo;cvar;external libaspell;
  aerror_unimplemented_method : PAspellErrorInfo;cvar;external libaspell;
  aerror_file : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_open_file : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_read_file : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_write_file : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_name : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_file_format : PAspellErrorInfo;cvar;external libaspell;
  aerror_dir : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_read_dir : PAspellErrorInfo;cvar;external libaspell;
  aerror_config : PAspellErrorInfo;cvar;external libaspell;
  aerror_unknown_key : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_change_value : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_key : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_value : PAspellErrorInfo;cvar;external libaspell;
  aerror_duplicate : PAspellErrorInfo;cvar;external libaspell;
  aerror_key_not_string : PAspellErrorInfo;cvar;external libaspell;
  aerror_key_not_int : PAspellErrorInfo;cvar;external libaspell;
  aerror_key_not_bool : PAspellErrorInfo;cvar;external libaspell;
  aerror_key_not_list : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_value_reset : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_value_enable : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_value_disable : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_value_clear : PAspellErrorInfo;cvar;external libaspell;
  aerror_language_related : PAspellErrorInfo;cvar;external libaspell;
  aerror_unknown_language : PAspellErrorInfo;cvar;external libaspell;
  aerror_unknown_soundslike : PAspellErrorInfo;cvar;external libaspell;
  aerror_language_not_supported : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_wordlist_for_lang : PAspellErrorInfo;cvar;external libaspell;
  aerror_mismatched_language : PAspellErrorInfo;cvar;external libaspell;
  aerror_affix : PAspellErrorInfo;cvar;external libaspell;
  aerror_corrupt_affix : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_cond : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_cond_strip : PAspellErrorInfo;cvar;external libaspell;
  aerror_incorrect_encoding : PAspellErrorInfo;cvar;external libaspell;
  aerror_encoding : PAspellErrorInfo;cvar;external libaspell;
  aerror_unknown_encoding : PAspellErrorInfo;cvar;external libaspell;
  aerror_encoding_not_supported : PAspellErrorInfo;cvar;external libaspell;
  aerror_conversion_not_supported : PAspellErrorInfo;cvar;external libaspell;
  aerror_pipe : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_create_pipe : PAspellErrorInfo;cvar;external libaspell;
  aerror_process_died : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_input : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_string : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_word : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_affix : PAspellErrorInfo;cvar;external libaspell;
  aerror_inapplicable_affix : PAspellErrorInfo;cvar;external libaspell;
  aerror_unknown_unichar : PAspellErrorInfo;cvar;external libaspell;
  aerror_word_list_flags : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_flag : PAspellErrorInfo;cvar;external libaspell;
  aerror_conflicting_flags : PAspellErrorInfo;cvar;external libaspell;
  aerror_version_control : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_version_string : PAspellErrorInfo;cvar;external libaspell;
  aerror_filter : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_dlopen_file : PAspellErrorInfo;cvar;external libaspell;
  aerror_empty_filter : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_such_filter : PAspellErrorInfo;cvar;external libaspell;
  aerror_confusing_version : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_version : PAspellErrorInfo;cvar;external libaspell;
  aerror_identical_option : PAspellErrorInfo;cvar;external libaspell;
  aerror_options_only : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_option_modifier : PAspellErrorInfo;cvar;external libaspell;
  aerror_cant_describe_filter : PAspellErrorInfo;cvar;external libaspell;
  aerror_filter_mode_file : PAspellErrorInfo;cvar;external libaspell;
  aerror_mode_option_name : PAspellErrorInfo;cvar;external libaspell;
  aerror_no_filter_to_option : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_mode_key : PAspellErrorInfo;cvar;external libaspell;
  aerror_expect_mode_key : PAspellErrorInfo;cvar;external libaspell;
  aerror_mode_version_requirement : PAspellErrorInfo;cvar;external libaspell;
  aerror_confusing_mode_version : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_mode_version : PAspellErrorInfo;cvar;external libaspell;
  aerror_missing_magic_expression : PAspellErrorInfo;cvar;external libaspell;
  aerror_empty_file_ext : PAspellErrorInfo;cvar;external libaspell;
  aerror_filter_mode_expand : PAspellErrorInfo;cvar;external libaspell;
  aerror_unknown_mode : PAspellErrorInfo;cvar;external libaspell;
  aerror_mode_extend_expand : PAspellErrorInfo;cvar;external libaspell;
  aerror_filter_mode_magic : PAspellErrorInfo;cvar;external libaspell;
  aerror_file_magic_pos : PAspellErrorInfo;cvar;external libaspell;
  aerror_file_magic_range : PAspellErrorInfo;cvar;external libaspell;
  aerror_missing_magic : PAspellErrorInfo;cvar;external libaspell;
  aerror_bad_magic : PAspellErrorInfo;cvar;external libaspell;
  aerror_expression : PAspellErrorInfo;cvar;external libaspell;
  aerror_invalid_expression : PAspellErrorInfo;cvar;external libaspell;

type
  PAspellSpeller = type Pointer;
  PAspellWordList = type Pointer;

function new_aspell_speller(config: PAspellConfig): PAspellCanHaveError; cdecl; external libaspell;
function to_aspell_speller(obj: PAspellCanHaveError): PAspellSpeller; cdecl; external libaspell;
procedure delete_aspell_speller(ths: PAspellSpeller); cdecl; external libaspell;
function aspell_speller_error_number(ths: PAspellSpeller): dword; cdecl; external libaspell;
function aspell_speller_error_message(ths: PAspellSpeller): pchar; cdecl; external libaspell;
function aspell_speller_error(ths: PAspellSpeller): PAspellError; cdecl; external libaspell;
function aspell_speller_config(ths: PAspellSpeller): PAspellConfig; cdecl; external libaspell;
function aspell_speller_check(ths: PAspellSpeller; word: pchar; word_size: longint): longint; cdecl; external libaspell;
function aspell_speller_check_wide(ths: PAspellSpeller; word: pointer; word_size: longint; word_type_width: longint): longint; cdecl; external libaspell;
function aspell_speller_add_to_personal(ths: PAspellSpeller; word: pchar; word_size: longint): longint; cdecl; external libaspell;
function aspell_speller_add_to_personal_wide(ths: PAspellSpeller; word: pointer; word_size: longint; word_type_width: longint): longint; cdecl; external libaspell;
function aspell_speller_add_to_session(ths: PAspellSpeller; word: pchar; word_size: longint): longint; cdecl; external libaspell;
function aspell_speller_add_to_session_wide(ths: PAspellSpeller; word: pointer; word_size: longint; word_type_width: longint): longint; cdecl; external libaspell;
function aspell_speller_personal_word_list(ths: PAspellSpeller): PAspellWordList; cdecl; external libaspell;
function aspell_speller_session_word_list(ths: PAspellSpeller): PAspellWordList; cdecl; external libaspell;
function aspell_speller_main_word_list(ths: PAspellSpeller): PAspellWordList; cdecl; external libaspell;
function aspell_speller_save_all_word_lists(ths: PAspellSpeller): longint; cdecl; external libaspell;
function aspell_speller_clear_session(ths: PAspellSpeller): longint; cdecl; external libaspell;
function aspell_speller_suggest(ths: PAspellSpeller; word: pchar; word_size: longint): PAspellWordList; cdecl; external libaspell;
function aspell_speller_suggest_wide(ths: PAspellSpeller; word: pointer; word_size: longint; word_type_width: longint): PAspellWordList; cdecl; external libaspell;
function aspell_speller_store_replacement(ths: PAspellSpeller; mis: pchar; mis_size: longint; cor: pchar; cor_size: longint): longint; cdecl; external libaspell;
function aspell_speller_store_replacement_wide(ths: PAspellSpeller; mis: pointer; mis_size: longint; mis_type_width: longint; cor: pointer;
  cor_size: longint; cor_type_width: longint): longint; cdecl; external libaspell;

type
  PAspellFilter = type Pointer;

procedure delete_aspell_filter(ths: PAspellFilter); cdecl; external libaspell;
function aspell_filter_error_number(ths: PAspellFilter): dword; cdecl; external libaspell;
function aspell_filter_error_message(ths: PAspellFilter): pchar; cdecl; external libaspell;
function aspell_filter_error(ths: PAspellFilter): PAspellError; cdecl; external libaspell;
function to_aspell_filter(obj: PAspellCanHaveError): PAspellFilter; cdecl; external libaspell;

type
  TAspellToken = record
    offset: dword;
    len: dword;
  end;
  PAspellToken = ^TAspellToken;

  PAspellDocumentChecker = type Pointer;

procedure delete_aspell_document_checker(ths: PAspellDocumentChecker); cdecl; external libaspell;
function aspell_document_checker_error_number(ths: PAspellDocumentChecker): dword; cdecl; external libaspell;
function aspell_document_checker_error_message(ths: PAspellDocumentChecker): pchar; cdecl; external libaspell;
function aspell_document_checker_error(ths: PAspellDocumentChecker): PAspellError; cdecl; external libaspell;
function new_aspell_document_checker(speller: PAspellSpeller): PAspellCanHaveError; cdecl; external libaspell;
function to_aspell_document_checker(obj: PAspellCanHaveError): PAspellDocumentChecker; cdecl; external libaspell;
procedure aspell_document_checker_reset(ths: PAspellDocumentChecker); cdecl; external libaspell;
procedure aspell_document_checker_process(ths: PAspellDocumentChecker; str: pchar; str_size: longint); cdecl; external libaspell;
procedure aspell_document_checker_process_wide(ths: PAspellDocumentChecker; str: pointer; str_size: longint; str_type_width: longint); cdecl; external libaspell;
function aspell_document_checker_next_misspelling(ths: PAspellDocumentChecker): TAspellToken; cdecl; external libaspell;
function aspell_document_checker_next_misspelling_adj(ths: PAspellDocumentChecker; type_width: longint): TAspellToken; cdecl; external libaspell;
function aspell_document_checker_filter(ths: PAspellDocumentChecker): PAspellFilter; cdecl; external libaspell;

type
  PAspellStringEnumeration = type Pointer;

function aspell_word_list_empty(ths: PAspellWordList): longint; cdecl; external libaspell;
function aspell_word_list_size(ths: PAspellWordList): dword; cdecl; external libaspell;
function aspell_word_list_elements(ths: PAspellWordList): PAspellStringEnumeration; cdecl; external libaspell;

procedure delete_aspell_string_enumeration(ths: PAspellStringEnumeration); cdecl; external libaspell;
function aspell_string_enumeration_clone(ths: PAspellStringEnumeration): PAspellStringEnumeration; cdecl; external libaspell;
procedure aspell_string_enumeration_assign(ths: PAspellStringEnumeration; other: PAspellStringEnumeration); cdecl; external libaspell;
function aspell_string_enumeration_at_end(ths: PAspellStringEnumeration): longint; cdecl; external libaspell;
function aspell_string_enumeration_next(ths: PAspellStringEnumeration): pchar; cdecl; external libaspell;
function aspell_string_enumeration_next_wide(ths: PAspellStringEnumeration; type_width: longint): pointer; cdecl; external libaspell;

type
  PAspellStringList = type Pointer;

  TAspellModuleInfo = record
    name: pchar;
    order_num: double;
    lib_dir: pchar;
    dict_dirs: PAspellStringList;
    dict_exts: PAspellStringList;
  end;
  PAspellModuleInfo = ^TAspellModuleInfo;

  TAspellDictInfo = record
    name: pchar;
    code: pchar;
    jargon: pchar;
    size: longint;
    size_str: pchar;
    module: PAspellModuleInfo;
  end;
  PAspellDictInfo = ^TAspellDictInfo;

  PAspellModuleInfoList = type Pointer;
  PAspellModuleInfoEnumeration = type Pointer;
  PAspellDictInfoList = type Pointer;
  PAspellDictInfoEnumeration = type Pointer;

function get_aspell_module_info_list(config: PAspellConfig): PAspellModuleInfoList; cdecl; external libaspell;
function aspell_module_info_list_empty(ths: PAspellModuleInfoList): longint; cdecl; external libaspell;
function aspell_module_info_list_size(ths: PAspellModuleInfoList): dword; cdecl; external libaspell;
function aspell_module_info_list_elements(ths: PAspellModuleInfoList): PAspellModuleInfoEnumeration; cdecl; external libaspell;

function get_aspell_dict_info_list(config: PAspellConfig): PAspellDictInfoList; cdecl; external libaspell;
function aspell_dict_info_list_empty(ths: PAspellDictInfoList): longint; cdecl; external libaspell;
function aspell_dict_info_list_size(ths: PAspellDictInfoList): dword; cdecl; external libaspell;
function aspell_dict_info_list_elements(ths: PAspellDictInfoList): PAspellDictInfoEnumeration; cdecl; external libaspell;

function aspell_module_info_enumeration_at_end(ths: PAspellModuleInfoEnumeration): longint; cdecl; external libaspell;
function aspell_module_info_enumeration_next(ths: PAspellModuleInfoEnumeration): PAspellModuleInfo; cdecl; external libaspell;
procedure delete_aspell_module_info_enumeration(ths: PAspellModuleInfoEnumeration); cdecl; external libaspell;
function aspell_module_info_enumeration_clone(ths: PAspellModuleInfoEnumeration): PAspellModuleInfoEnumeration; cdecl; external libaspell;
procedure aspell_module_info_enumeration_assign(ths: PAspellModuleInfoEnumeration; other: PAspellModuleInfoEnumeration); cdecl; external libaspell;

function aspell_dict_info_enumeration_at_end(ths: PAspellDictInfoEnumeration): longint; cdecl; external libaspell;
function aspell_dict_info_enumeration_next(ths: PAspellDictInfoEnumeration): PAspellDictInfo; cdecl; external libaspell;
procedure delete_aspell_dict_info_enumeration(ths: PAspellDictInfoEnumeration); cdecl; external libaspell;
function aspell_dict_info_enumeration_clone(ths: PAspellDictInfoEnumeration): PAspellDictInfoEnumeration; cdecl; external libaspell;
procedure aspell_dict_info_enumeration_assign(ths: PAspellDictInfoEnumeration; other: PAspellDictInfoEnumeration); cdecl; external libaspell;

function new_aspell_string_list: PAspellStringList; cdecl; external libaspell;
function aspell_string_list_empty(ths: PAspellStringList): longint; cdecl; external libaspell;
function aspell_string_list_size(ths: PAspellStringList): dword; cdecl; external libaspell;
function aspell_string_list_elements(ths: PAspellStringList): PAspellStringEnumeration; cdecl; external libaspell;
function aspell_string_list_add(ths: PAspellStringList; to_add: pchar): longint; cdecl; external libaspell;
function aspell_string_list_remove(ths: PAspellStringList; to_rem: pchar): longint; cdecl; external libaspell;
procedure aspell_string_list_clear(ths: PAspellStringList); cdecl; external libaspell;
function aspell_string_list_to_mutable_container(ths: PAspellStringList): PAspellMutableContainer; cdecl; external libaspell;
procedure delete_aspell_string_list(ths: PAspellStringList); cdecl; external libaspell;
function aspell_string_list_clone(ths: PAspellStringList): PAspellStringList; cdecl; external libaspell;
procedure aspell_string_list_assign(ths: PAspellStringList; other: PAspellStringList); cdecl; external libaspell;

type
  PAspellStringMap = type Pointer;

function new_aspell_string_map: PAspellStringMap; cdecl; external libaspell;
function aspell_string_map_add(ths: PAspellStringMap; to_add: pchar): longint; cdecl; external libaspell;
function aspell_string_map_remove(ths: PAspellStringMap; to_rem: pchar): longint; cdecl; external libaspell;
procedure aspell_string_map_clear(ths: PAspellStringMap); cdecl; external libaspell;
function aspell_string_map_to_mutable_container(ths: PAspellStringMap): PAspellMutableContainer; cdecl; external libaspell;
procedure delete_aspell_string_map(ths: PAspellStringMap); cdecl; external libaspell;
function aspell_string_map_clone(ths: PAspellStringMap): PAspellStringMap; cdecl; external libaspell;
procedure aspell_string_map_assign(ths: PAspellStringMap; other: PAspellStringMap); cdecl; external libaspell;
function aspell_string_map_empty(ths: PAspellStringMap): longint; cdecl; external libaspell;
function aspell_string_map_size(ths: PAspellStringMap): dword; cdecl; external libaspell;
function aspell_string_map_elements(ths: PAspellStringMap): PAspellStringPairEnumeration; cdecl; external libaspell;
function aspell_string_map_insert(ths: PAspellStringMap; key: pchar; value: pchar): longint; cdecl; external libaspell;
function aspell_string_map_replace(ths: PAspellStringMap; key: pchar; value: pchar): longint; cdecl; external libaspell;
function aspell_string_map_lookup(ths: PAspellStringMap; key: pchar): pchar; cdecl; external libaspell;

type
  TAspellStringPair = record
    first: pchar;
    second: pchar;
  end;
  PAspellStringPair = ^TAspellStringPair;

function aspell_string_pair_enumeration_at_end(ths: PAspellStringPairEnumeration): longint; cdecl; external libaspell;
function aspell_string_pair_enumeration_next(ths: PAspellStringPairEnumeration): TAspellStringPair; cdecl; external libaspell;
procedure delete_aspell_string_pair_enumeration(ths: PAspellStringPairEnumeration); cdecl; external libaspell;
function aspell_string_pair_enumeration_clone(ths: PAspellStringPairEnumeration): PAspellStringPairEnumeration; cdecl; external libaspell;
procedure aspell_string_pair_enumeration_assign(ths: PAspellStringPairEnumeration; other: PAspellStringPairEnumeration); cdecl; external libaspell;

function aspell_reset_cache(which: pchar): longint; cdecl; external libaspell;

// === Konventiert am: 25-2-26 19:29:47 ===


implementation



end.
