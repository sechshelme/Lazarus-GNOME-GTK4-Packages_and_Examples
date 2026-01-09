unit fp_datrie;

interface

const
  {$IFDEF Linux}
  libdatrie = 'datrie';
  {$ENDIF}

  {$IFDEF Windows}
  libdatrie = 'datrie.dll';  // ????
  {$ENDIF}

type
  PFILE = type Pointer;

  Tsize_t = SizeUInt;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ========= /usr/include/datrie/triedefs.h

type
  PAlphaChar = ^TAlphaChar;
  TAlphaChar = uint32;

const
  ALPHA_CHAR_ERROR = not (TAlphaChar(0));

type
  PTrieChar = ^TTrieChar;
  TTrieChar = ansichar;

const
  TRIE_CHAR_TERM = #0;
  TRIE_CHAR_MAX = #255;

type
  PTrieIndex = ^TTrieIndex;
  TTrieIndex = int32;

const
  TRIE_INDEX_ERROR = 0;
  TRIE_INDEX_MAX = $7fffffff;

type
  PTrieData = ^TTrieData;
  TTrieData = int32;

const
  TRIE_DATA_ERROR = -(1);


  // ========= /usr/include/datrie/alpha-map.h

type
  PAlphaMap = type Pointer;

function alpha_map_new: PAlphaMap; cdecl; external libdatrie;
function alpha_map_clone(a_map: PAlphaMap): PAlphaMap; cdecl; external libdatrie;
procedure alpha_map_free(alpha_map: PAlphaMap); cdecl; external libdatrie;
function alpha_map_add_range(alpha_map: PAlphaMap; begin_: TAlphaChar; end_: TAlphaChar): longint; cdecl; external libdatrie;
function alpha_char_strlen(str: PAlphaChar): longint; cdecl; external libdatrie;
function alpha_char_strcmp(str1: PAlphaChar; str2: PAlphaChar): longint; cdecl; external libdatrie;


// ========= /usr/include/datrie/typedefs.h

const
  DA_FALSE = False;
  DA_TRUE = True;


  // ========= /usr/include/datrie/trie.h

type
  PTrie = type Pointer;
  TTrieEnumFunc = function(key: PAlphaChar; key_data: TTrieData; user_data: pointer): boolean; cdecl;
  PTrieState = type Pointer;
  PTrieIterator = type Pointer;

function trie_new(alpha_map: PAlphaMap): PTrie; cdecl; external libdatrie;
function trie_new_from_file(path: pchar): PTrie; cdecl; external libdatrie;
function trie_fread(file_: PFILE): PTrie; cdecl; external libdatrie;
procedure trie_free(trie: PTrie); cdecl; external libdatrie;
function trie_get_serialized_size(trie: PTrie): Tsize_t; cdecl; external libdatrie;
procedure trie_serialize(trie: PTrie; ptr: Puint8); cdecl; external libdatrie;
function trie_save(trie: PTrie; path: pchar): longint; cdecl; external libdatrie;
function trie_fwrite(trie: PTrie; file_: PFILE): longint; cdecl; external libdatrie;
function trie_is_dirty(trie: PTrie): boolean; cdecl; external libdatrie;

function trie_retrieve(trie: PTrie; key: PAlphaChar; o_data: PTrieData): boolean; cdecl; external libdatrie;
function trie_store(trie: PTrie; key: PAlphaChar; data: TTrieData): boolean; cdecl; external libdatrie;
function trie_store_if_absent(trie: PTrie; key: PAlphaChar; data: TTrieData): boolean; cdecl; external libdatrie;
function trie_delete(trie: PTrie; key: PAlphaChar): boolean; cdecl; external libdatrie;
function trie_enumerate(trie: PTrie; enum_func: TTrieEnumFunc; user_data: pointer): boolean; cdecl; external libdatrie;

function trie_root(trie: PTrie): PTrieState; cdecl; external libdatrie;

function trie_state_clone(s: PTrieState): PTrieState; cdecl; external libdatrie;
procedure trie_state_copy(dst: PTrieState; src: PTrieState); cdecl; external libdatrie;
procedure trie_state_free(s: PTrieState); cdecl; external libdatrie;
procedure trie_state_rewind(s: PTrieState); cdecl; external libdatrie;
function trie_state_walk(s: PTrieState; c: TAlphaChar): boolean; cdecl; external libdatrie;
function trie_state_is_walkable(s: PTrieState; c: TAlphaChar): boolean; cdecl; external libdatrie;
function trie_state_walkable_chars(s: PTrieState; chars: PAlphaChar; chars_nelm: longint): longint; cdecl; external libdatrie;

function trie_state_is_terminal(s: PTrieState): boolean;

function trie_state_is_single(s: PTrieState): boolean; cdecl; external libdatrie;

function trie_state_is_leaf(s: PTrieState): boolean;

function trie_state_get_data(s: PTrieState): TTrieData; cdecl; external libdatrie;

function trie_iterator_new(s: PTrieState): PTrieIterator; cdecl; external libdatrie;
procedure trie_iterator_free(iter: PTrieIterator); cdecl; external libdatrie;
function trie_iterator_next(iter: PTrieIterator): boolean; cdecl; external libdatrie;
function trie_iterator_get_key(iter: PTrieIterator): PAlphaChar; cdecl; external libdatrie;
function trie_iterator_get_data(iter: PTrieIterator): TTrieData; cdecl; external libdatrie;

// === Konventiert am: 2-12-25 17:08:28 ===


implementation


function trie_state_is_terminal(s: PTrieState): boolean;
begin
  trie_state_is_terminal := trie_state_is_walkable(s, 0);
end;

function trie_state_is_leaf(s: PTrieState): boolean;
begin
  trie_state_is_leaf := trie_state_is_single(s) and trie_state_is_terminal(s);
end;


end.
