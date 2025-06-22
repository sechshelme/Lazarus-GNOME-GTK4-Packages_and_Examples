{$IFDEF read_interface}

var
  eina_seed: cardinal; external libeina;


function eina_hash_djb2(key: pchar; len: integer): integer;
function eina_hash_djb2_len(key: pchar; plen: PInteger): integer;
function eina_hash_int32(pkey: PCardinal; len: integer): integer;
function eina_hash_int64(pkey: PInt64; len: integer): integer;
function eina_hash_murmur3(key: pchar; len: integer): integer;
function eina_hash_crc(key: pchar; len: integer): integer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_hash_djb2(key: pchar; len: integer): integer;
var
  hash_num: cardinal;
  ptr: pbyte;
begin
  hash_num := 5381 xor eina_seed;
  if key <> nil then begin
    ptr := pbyte(key);
    while len > 0 do begin
      hash_num := ((hash_num shl 5) + hash_num) xor ptr^;
      Inc(ptr);
      Dec(len);
    end;
    Result := integer(hash_num);
  end else begin
    Result := 0;
  end;
end;

function eina_hash_djb2_len(key: pchar; plen: PInteger): integer;
var
  hash_num: cardinal;
  len: integer;
  ptr: pbyte;
begin
  hash_num := 5381 xor eina_seed;
  len := 0;
  if key <> nil then begin
    ptr := pbyte(key);
    while ptr^ <> 0 do begin
      hash_num := ((hash_num shl 5) + hash_num) xor ptr^;
      Inc(ptr);
      Inc(len);
    end;
    plen^ := len + 1;
    Result := integer(hash_num);
  end else begin
    Result := 0;
  end;
end;

function eina_hash_int32(pkey: PCardinal; len: integer): integer;
var
  key: cardinal;
begin
  key := pkey^;

  key := not key + (key shl 15);
  key := key xor (key shr 12);
  key := key + (key shl 2);
  key := key xor (key shr 4);
  key := key * (2057 xor eina_seed);
  key := key xor (key shr 16);
  Result := key;
end;

function eina_hash_int64(pkey: PInt64; len: integer): integer;
var
  key: int64;
begin
  key := pkey^;

  key := not key + (key shl 18);
  key := key xor (key shr 31);
  key := key * (21 xor eina_seed);
  key := key xor (key shr 11);
  key := key + (key shl 6);
  key := key xor (key shr 22);
  Result := integer(key);
end;

function _rotl32(x: cardinal; r: byte): cardinal;
begin
  Result := (x shl r) or (x shr (32 - r));
end;


function _fmix32(h: cardinal): cardinal;
begin
  h := h xor (h shr 16);
  h := h * $85ebca6b;
  h := h xor (h shr 13);
  h := h * $c2b2ae35;
  h := h xor (h shr 16);
  Result := h;
end;

function eina_hash_murmur3(key: pchar; len: integer): integer;
var
  data: pbyte;
  nblocks: integer;
  h1, k1: cardinal;
  c1, c2: cardinal;
  blocks: PCardinal;
  i: integer;
  tail: pbyte;
begin
  data := pbyte(key);
  nblocks := len div 4;
  h1 := 0;
  c1 := $cc9e2d51 xor eina_seed;
  c2 := $1b873593 xor eina_seed;
  blocks := PCardinal(pbyte(data) + nblocks * 4);

  for i := -nblocks to -1 do begin
    k1 := blocks[i];

    k1 := k1 * c1;
    k1 := _rotl32(k1, 15);
    k1 := k1 * c2;

    h1 := h1 xor k1;
    h1 := _rotl32(h1, 13);
    h1 := h1 * 5 + $e6546b64;
  end;

  tail := pbyte(data + nblocks * 4);
  k1 := 0;

  if (len and 3) = 3 then begin
    k1 := k1 xor (tail[2] shl 16);
  end;
  if (len and 3) >= 2 then begin
    k1 := k1 xor (tail[1] shl 8);
  end;
  if (len and 3) >= 1 then begin
    k1 := k1 xor tail[0];
    k1 := k1 * c1;
    k1 := _rotl32(k1, 16);
    k1 := k1 * c2;
    h1 := h1 xor k1;
  end;

  h1 := h1 xor len;

  Result := _fmix32(h1);
end;

function eina_hash_crc(key: pchar; len: integer): integer;
var
  crc: cardinal;
  seed: cardinal;
begin
  seed := $FFFFFFFF;
  crc := eina_crc(key, len, seed, True);
  Result := integer(crc);
end;

{$ENDIF read_implementation}
