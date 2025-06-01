unit eina_inline_slice;



interface

uses
  efl,
  fp_eina,
  SysUtils, // For CompareMem, ScanBytes
  Classes;  // For general utility functions, though we use our own here




(*
 * Original C License Header:
 * EINA - EFL data type library
 * Copyright (C) 2016 ProFUSION embedded systems
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
*)

  //type
  //  // Eina_Bool corresponds to Pascal's Boolean
  //  Eina_Bool = Boolean;
  //
  //const
  //  EINA_TRUE = True;
  //  EINA_FALSE = False;
  //
  //  // Constants for seek operations, matching C's fseek
  //  SEEK_SET = 0;
  //  SEEK_END = 2;
  //
  //type
  //  // TEina_Slice corresponds to a read-only memory slice
  //  TEina_Slice = record
  //    len: Cardinal; // C's size_t
  //    mem: Pointer;  // C's const void *
  //  end;
  //
  //  // TEina_Rw_Slice corresponds to a read-write memory slice
  //  TEina_Rw_Slice = record
  //    len: Cardinal; // C's size_t
  //    mem: Pointer;  // C's void *
  //  end;

  // --- Eina Slice Library Functions ---

function eina_rw_slice_slice_get(const rw_slice: TEina_Rw_Slice): TEina_Slice; overload; inline;
function eina_slice_dup(const slice: TEina_Slice): TEina_Rw_Slice; overload; inline;
function eina_rw_slice_dup(const rw_slice: TEina_Rw_Slice): TEina_Rw_Slice; overload; inline;
function eina_slice_compare(const a, b: TEina_Slice): integer; overload; inline;
function eina_rw_slice_compare(const a, b: TEina_Rw_Slice): integer; overload; inline;
function eina_rw_slice_copy(const dst: TEina_Rw_Slice; const src: TEina_Slice): TEina_Rw_Slice; overload; inline;
function eina_slice_seek(const slice: TEina_Slice; offset: longint; whence: integer): TEina_Slice; overload; inline; // C's ssize_t is signed
function eina_rw_slice_seek(const rw_slice: TEina_Rw_Slice; offset: longint; whence: integer): TEina_Rw_Slice; overload; inline; // C's ssize_t is signed
function eina_slice_strchr(const slice: TEina_Slice; c: integer): Pointer; overload; inline;
function eina_slice_find(const slice, needle: TEina_Slice): Pointer; overload; inline;
function eina_slice_startswith(const slice, prefix: TEina_Slice): TEina_Bool; overload; inline;
function eina_slice_endswith(const slice, suffix: TEina_Slice): TEina_Bool; overload; inline;
function eina_rw_slice_strchr(const rw_slice: TEina_Rw_Slice; c: integer): Pointer; overload; inline;
function eina_rw_slice_find(const rw_slice: TEina_Rw_Slice; const needle: TEina_Slice): Pointer; overload; inline;
function eina_rw_slice_startswith(const rw_slice: TEina_Rw_Slice; const prefix: TEina_Slice): TEina_Bool; overload; inline;
function eina_rw_slice_endswith(const rw_slice: TEina_Rw_Slice; const suffix: TEina_Slice): TEina_Bool; overload; inline;
function eina_slice_end_get(const slice: TEina_Slice): Pointer; overload; inline;
function eina_rw_slice_end_get(const rw_slice: TEina_Rw_Slice): Pointer; overload; inline;
function eina_slice_strdup(const slice: TEina_Slice): pansichar; overload; inline;
function eina_rw_slice_strdup(const rw_slice: TEina_Rw_Slice): pansichar; overload; inline;

implementation

// Helper function to emulate C's eina_strndup (duplicate string with length limit)
function Eina_StrNdup_Helper(const S: Pointer; Len: cardinal): pansichar;
var
  P: pansichar;
begin
  if (S = nil) or (Len = 0) then begin
    Result := StrNew(''); // Returns a pointer to an empty, null-terminated string
    Exit;
  end;

  P := StrAlloc(Len + 1); // Allocate memory for bytes and null terminator
  System.Move(S^, P^, Len); // Copy data
  P[Len] := #0; // Null-terminate
  Result := P;
end;

function eina_rw_slice_slice_get(const rw_slice: TEina_Rw_Slice): TEina_Slice;
begin
  Result.len := rw_slice.len;
  Result.mem := rw_slice.mem;
end;

function eina_slice_dup(const slice: TEina_Slice): TEina_Rw_Slice;
begin
  Result.len := slice.len;
  Result.mem := nil;
  if Result.len = 0 then begin
    Exit;
  end;

  System.GetMem(Result.mem, Result.len); // Allocate memory
  if Result.mem <> nil then begin
    System.Move(slice.mem^, Result.mem^, Result.len);
  end // Copy data
  else begin
    Result.len := 0;
  end; // Memory allocation failed, set length to 0
end;

function eina_rw_slice_dup(const rw_slice: TEina_Rw_Slice): TEina_Rw_Slice;
begin
  Result := eina_slice_dup(eina_rw_slice_slice_get(rw_slice));
end;

function eina_slice_compare(const a, b: TEina_Slice): integer;
var
  len: SizeUInt;
  r: integer;
begin
  if a.len <= b.len then begin
    len := a.len;
  end else begin
    len := b.len;
  end;

  if len > 0 then begin
    r := CompareMemRange(a.mem, b.mem, len);
    if r <> 0 then begin
      Result := r;
      Exit;
    end;
  end;

  if a.len < b.len then begin
    Result := -1;
  end else if a.len > b.len then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;

function eina_rw_slice_compare(const a, b: TEina_Rw_Slice): integer;
begin
  Result := eina_slice_compare(eina_rw_slice_slice_get(a), eina_rw_slice_slice_get(b));
end;

function eina_rw_slice_copy(const dst: TEina_Rw_Slice; const src: TEina_Slice): TEina_Rw_Slice;
var
  len: SizeUInt;
  ret: TEina_Rw_Slice;
begin
  if src.len <= dst.len then begin
    len := src.len;
  end else begin
    len := dst.len;
  end;

  ret.len := len;
  ret.mem := dst.mem;
  if len > 0 then begin
    memcpy(ret.mem, src.mem, len);
  end;
  Result := ret;
end;

function eina_slice_seek(const slice: TEina_Slice; offset: longint; whence: integer): TEina_Slice;
var
  AdjustedOffset: longint;
begin
  Result.len := 0;
  Result.mem := slice.mem;

  AdjustedOffset := offset;

  if whence = SEEK_END then begin
    whence := SEEK_SET;
    AdjustedOffset := AdjustedOffset + slice.len;
  end;

  if whence = SEEK_SET then begin
    if cardinal(AdjustedOffset) > slice.len then // Ensure offset doesn't exceed length
    begin
      AdjustedOffset := slice.len;
    end else if AdjustedOffset < 0 then // Ensure offset isn't negative
    begin
      AdjustedOffset := 0;
    end;
    Result.len := slice.len - AdjustedOffset;
    Result.mem := pbyte(Pointer(slice.mem) + AdjustedOffset); // Pointer arithmetic
  end;
end;

function eina_rw_slice_seek(const rw_slice: TEina_Rw_Slice; offset: longint; whence: integer): TEina_Rw_Slice;
var
  AdjustedOffset: longint;
begin
  Result.len := 0;
  Result.mem := rw_slice.mem;

  AdjustedOffset := offset;

  if whence = SEEK_END then begin
    whence := SEEK_SET;
    AdjustedOffset := AdjustedOffset + rw_slice.len;
  end;

  if whence = SEEK_SET then begin
    if cardinal(AdjustedOffset) > rw_slice.len then begin
      AdjustedOffset := rw_slice.len;
    end else if AdjustedOffset < 0 then begin
      AdjustedOffset := 0;
    end;
    Result.len := rw_slice.len - AdjustedOffset;
    Result.mem := pbyte(Pointer(rw_slice.mem) + AdjustedOffset); // Pointer arithmetic
  end;
end;

function eina_slice_strchr(const slice: TEina_Slice; c: integer): Pointer;
begin
  if slice.len <> 0 then begin
    Result := memchr(slice.mem, c, slice.len);
  end else begin
    Result := nil;
  end;
end;

function eina_slice_find(const slice, needle: TEina_Slice): Pointer;
var
  s, n: TEina_Slice;
  c: byte;
  p: pbyte;
  offset: SizeUInt;
begin
  Result := nil;
  if (slice.len <> 0) and (needle.len <> 0) and (slice.len >= needle.len) then begin
    if needle.len = 1 then begin
      Result := eina_slice_strchr(slice, needle.bytes[0]);
      Exit;
    end;

    if (slice.len = needle.len) and (memcmp(slice.mem, needle.mem, needle.len) = 0) then begin
      Result := slice.mem;
      Exit;
    end;

    s.mem := slice.mem;
    s.len := slice.len - (needle.len - 1);

    c := needle.bytes[0];
    n.mem := Pointer(needle.bytes + 1);
    n.len := needle.len - 1;

    while s.len > 0 do begin
      p := pbyte(eina_slice_strchr(s, c));
      if p <> nil then begin
        Inc(p);
        if memcmp(p, n.mem, n.len) = 0 then begin
          Result := Pointer(p - 1);
          Exit;
        end;
        offset := p - s.bytes;
        s.mem := Pointer(s.bytes + offset);
        s.len := s.len - offset;
        Continue;
      end;
      Break;
    end;
  end;
end;

function eina_slice_startswith(const slice, prefix: TEina_Slice): TEina_Bool;
begin
  if (prefix.len <> 0) and (slice.len >= prefix.len) then begin
    Result := memcmp(slice.mem, prefix.mem, prefix.len) = 0;   // ?????
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_slice_endswith(const slice: TEina_Slice; const suffix: TEina_Slice): TEina_Bool; inline;
begin
  if (suffix.len <> 0) and (slice.len >= suffix.len) then begin
    Result := memcmp(slice.mem + slice.len - suffix.len, suffix.mem, suffix.len) = 0;  // ?????
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_rw_slice_strchr(const rw_slice: TEina_Rw_Slice; c: integer): Pointer;
begin
  if rw_slice.len <> 0 then begin
    Result := memchr(rw_slice.mem, c, rw_slice.len);
  end else begin
    Result := nil;
  end;
end;

function eina_rw_slice_find(const rw_slice: TEina_Rw_Slice; const needle: TEina_Slice): Pointer;
begin
  Result := eina_slice_find(eina_rw_slice_slice_get(rw_slice), needle);
end;

function eina_rw_slice_startswith(const rw_slice: TEina_Rw_Slice; const prefix: TEina_Slice): TEina_Bool;
begin
  if (prefix.len <> 0) and (rw_slice.len >= prefix.len) then begin
    Result := memcmp(rw_slice.mem, prefix.mem, prefix.len) = 0;        // ?????
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_rw_slice_endswith(const rw_slice: TEina_Rw_Slice; const suffix: TEina_Slice): TEina_Bool;
begin
  if (suffix.len <> 0) and (rw_slice.len >= suffix.len) then begin
    Result := memcmp(rw_slice.mem + rw_slice.len - suffix.len, suffix.mem, suffix.len) = 0;  // ?????
  end else begin
    Result := EINA_FALSE;
  end;
end;

function eina_slice_end_get(const slice: TEina_Slice): Pointer;
begin
  Result := pbyte(Pointer(slice.mem) + slice.len);
end;

function eina_rw_slice_end_get(const rw_slice: TEina_Rw_Slice): Pointer;
begin
  Result := pbyte(Pointer(rw_slice.mem) + rw_slice.len);
end;

function eina_slice_strdup(const slice: TEina_Slice): pansichar;
begin
  Result := Eina_StrNdup_Helper(slice.mem, slice.len);
end;

function eina_rw_slice_strdup(const rw_slice: TEina_Rw_Slice): pansichar;
begin
  Result := Eina_StrNdup_Helper(rw_slice.mem, rw_slice.len);
end;

end.
