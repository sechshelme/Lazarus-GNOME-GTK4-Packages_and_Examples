unit chvalid;

interface

uses
  ctypes, xml2_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PxmlChSRangePtr = ^TxmlChSRangePtr;
  TxmlChSRangePtr = ^TxmlChSRange;
  PxmlChSRange = ^TxmlChSRange;

  TxmlChSRange = record
    low: word;
    high: word;
  end;

  PxmlChLRangePtr = ^TxmlChLRangePtr;
  TxmlChLRangePtr = ^TxmlChLRange;
  PxmlChLRange = ^TxmlChLRange;

  TxmlChLRange = record
    low: dword;
    high: dword;
  end;

  PxmlChRangeGroupPtr = ^TxmlChRangeGroupPtr;
  TxmlChRangeGroupPtr = ^TxmlChRangeGroup;
  PxmlChRangeGroup = ^TxmlChRangeGroup;

  TxmlChRangeGroup = record
    nbShortRange: longint;
    nbLongRange: longint;
    shortRange: PxmlChSRange;
    longRange: PxmlChLRange;
  end;

function xmlCharInRange(val: dword; group: PxmlChRangeGroup): longint; cdecl; external libxml2;

var
  xmlIsBaseCharGroup: TxmlChRangeGroup; cvar;external libxml2;
  xmlIsCharGroup: TxmlChRangeGroup; cvar;external libxml2;
  xmlIsCombiningGroup: TxmlChRangeGroup; cvar;external libxml2;
  xmlIsDigitGroup: TxmlChRangeGroup; cvar;external libxml2;
  xmlIsExtenderGroup: TxmlChRangeGroup; cvar;external libxml2;
  xmlIsIdeographicGroup: TxmlChRangeGroup; cvar;external libxml2;
  xmlIsPubidChar_tab: array[0..255] of byte; cvar;external libxml2;


function xmlIsBaseChar(ch: dword): longint; cdecl; external libxml2;
function xmlIsBlank(ch: dword): longint; cdecl; external libxml2;
function xmlIsChar(ch: dword): longint; cdecl; external libxml2;
function xmlIsCombining(ch: dword): longint; cdecl; external libxml2;
function xmlIsDigit(ch: dword): longint; cdecl; external libxml2;
function xmlIsExtender(ch: dword): longint; cdecl; external libxml2;
function xmlIsIdeographic(ch: dword): longint; cdecl; external libxml2;
function xmlIsPubidChar(ch: dword): longint; cdecl; external libxml2;

function xmlIsBaseChar_ch(c: longint): boolean;
function xmlIsBaseCharQ(c: longint): boolean;
function xmlIsBlank_ch(c: longint): boolean;
function xmlIsBlankQ(c: longint): boolean;
function xmlIsChar_ch(c: longint): boolean;
function xmlIsCharQ(c: longint): boolean;
function xmlIsCombiningQ(c: longint): boolean;
function xmlIsDigit_ch(c: longint): boolean;
function xmlIsDigitQ(c: longint): boolean;
function xmlIsExtender_ch(c: longint): boolean;
function xmlIsExtenderQ(c: longint): boolean;
function xmlIsIdeographicQ(c: longint): boolean;
function xmlIsPubidChar_ch(c: longint): boolean;
function xmlIsPubidCharQ(c: longint): boolean;

// === Konventiert am: 3-3-25 17:42:13 ===


implementation


function xmlIsBaseChar_ch(c: longint): boolean;
begin
  xmlIsBaseChar_ch :=
    (($41 <= c) and (c <= $5a)) or
    (($61 <= c) and (c <= $7a)) or
    (($c0 <= c) and (c <= $d6)) or
    (($d8 <= c) and (c <= $f6)) or
    ($f8 <= c);
end;

function xmlIsBaseCharQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := xmlIsBaseChar_ch(c);
  end else begin
    Result := xmlCharInRange(c, @xmlIsBaseCharGroup) <> 0;
  end;
end;

function xmlIsBlank_ch(c: longint): boolean;
begin
  xmlIsBlank_ch := (c = $20) or (($9 <= c) and (c <= $a)) or (c = $d);
end;

function xmlIsBlankQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := xmlIsBlank_ch(c);
  end else begin
    Result := False;
  end;
end;

function xmlIsChar_ch(c: longint): boolean;
begin
  xmlIsChar_ch := (($9 <= c) and (c <= $a)) or (c = $d) or ($20 <= c);
end;

function xmlIsCharQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := xmlIsChar_ch(c);
  end else begin
    Result := (($100 <= c) and (c <= $d7ff)) or (($e000 <= c) and (c <= $fffd)) or (($10000 <= c) and (c <= $10ffff));
  end;
end;

function xmlIsCombiningQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := False;
  end else begin
    Result := xmlCharInRange(c, @(xmlIsCombiningGroup)) <> 0;
  end;
end;

function xmlIsDigit_ch(c: longint): boolean;
begin
  xmlIsDigit_ch := ($30 <= c) and (c <= $39);
end;

function xmlIsDigitQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := xmlIsDigit_ch(c);
  end else begin
    Result := xmlCharInRange(c, @(xmlIsDigitGroup)) <> 0;
  end;
end;

function xmlIsExtender_ch(c: longint): boolean;
begin
  xmlIsExtender_ch := c = $b7;
end;

function xmlIsExtenderQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := xmlIsExtender_ch(c);
  end else begin
    Result := xmlCharInRange(c, @(xmlIsExtenderGroup)) <> 0;
  end;
end;

function xmlIsIdeographicQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := False;
  end else begin
    Result := (($4e00 <= c) and (c <= $9fa5)) or (c = $3007) or (($3021 <= c) and (c <= $3029));
  end;
end;

function xmlIsPubidChar_ch(c: longint): boolean;
begin
  xmlIsPubidChar_ch := xmlIsPubidChar_tab[c] <> 0;
end;

function xmlIsPubidCharQ(c: longint): boolean;
begin
  if c < $100 then begin
    Result := xmlIsPubidChar_ch(c);
  end else begin
    Result := False;
  end;
end;


end.
