unit policy;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPolicyDomain = ^TPolicyDomain;
  TPolicyDomain = longint;

const
  UndefinedPolicyDomain = 0;
  CoderPolicyDomain = 1;
  DelegatePolicyDomain = 2;
  FilterPolicyDomain = 3;
  PathPolicyDomain = 4;
  ResourcePolicyDomain = 5;
  SystemPolicyDomain = 6;
  CachePolicyDomain = 7;
  ModulePolicyDomain = 8;

type
  PPolicyRights = ^TPolicyRights;
  TPolicyRights = longint;

const
  UndefinedPolicyRights = $00;
  NoPolicyRights = $00;
  ReadPolicyRights = $01;
  WritePolicyRights = $02;
  ExecutePolicyRights = $04;
  AllPolicyRights = $ff;

type
  PolicyInfo = type Pointer;
  PPolicyInfo = ^PolicyInfo;
  PPPolicyInfo = ^PPolicyInfo;

function GetPolicyValue(name: pchar): pchar; cdecl; external libmagiccore;
function GetPolicyList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPchar; cdecl; external libmagiccore;
function GetPolicyInfoList(para1: pchar; para2: Psize_t; para3: PExceptionInfo): PPPolicyInfo; cdecl; external libmagiccore;
function IsRightsAuthorized(para1: TPolicyDomain; para2: TPolicyRights; para3: pchar): TMagickBooleanType; cdecl; external libmagiccore;
function ListPolicyInfo(para1: PFILE; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
function PolicyComponentGenesis: TMagickBooleanType; cdecl; external libmagiccore;
function SetMagickSecurityPolicy(para1: pchar; para2: PExceptionInfo): TMagickBooleanType; cdecl; external libmagiccore;
procedure PolicyComponentTerminus; cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 17:33:31 ===


implementation



end.
