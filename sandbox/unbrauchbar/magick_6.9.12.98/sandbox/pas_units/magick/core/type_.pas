unit type_;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PStretchType = ^TStretchType;
  TStretchType = longint;

const
  UndefinedStretch = 0;
  NormalStretch = 1;
  UltraCondensedStretch = 2;
  ExtraCondensedStretch = 3;
  CondensedStretch = 4;
  SemiCondensedStretch = 5;
  SemiExpandedStretch = 6;
  ExpandedStretch = 7;
  ExtraExpandedStretch = 8;
  UltraExpandedStretch = 9;
  AnyStretch = 10;

type
  PStyleType = ^TStyleType;
  TStyleType = longint;

const
  UndefinedStyle = 0;
  NormalStyle = 1;
  ItalicStyle = 2;
  ObliqueStyle = 3;
  AnyStyle = 4;
  BoldStyle = 5;

type
  PPTypeInfo = ^PTypeInfo;
  PTypeInfo = ^TTypeInfo;

  TTypeInfo = record
    face: Tsize_t;
    path: pchar;
    name: pchar;
    description: pchar;
    family: pchar;
    style: TStyleType;
    stretch: TStretchType;
    weight: Tsize_t;
    encoding: pchar;
    foundry: pchar;
    format: pchar;
    metrics: pchar;
    glyphs: pchar;
    stealth: TMagickBooleanType;
    previous: PTypeInfo;
    next: PTypeInfo;
    signature: Tsize_t;
  end;

function GetTypeList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): Ppchar; cdecl; external libmagickcore;
function ListTypeInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagickcore;
function TypeComponentGenesis: TMagickBooleanType; cdecl; external libmagickcore;
function GetTypeInfo(para1: pchar; para2: PExceptionInfo): PTypeInfo; cdecl; external libmagickcore;
function GetTypeInfoByFamily(para1: pchar; para2: TStyleType; para3: TStretchType; para4: Tsize_t; para5: PExceptionInfo): PTypeInfo; cdecl; external libmagickcore;
function GetTypeInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPTypeInfo; cdecl; external libmagickcore;
procedure TypeComponentTerminus; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:50:54 ===


implementation



end.
