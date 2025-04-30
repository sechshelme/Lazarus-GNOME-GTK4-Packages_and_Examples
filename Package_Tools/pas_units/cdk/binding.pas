unit binding;

interface

uses
  ncurses, cdk;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TBINDFN = function(cdktype: TEObjectType; object_: Pointer; clientData: Pointer; input: TChType): integer; cdecl;

function getcCDKBind(cdktype: TEObjectType; object_: Pointer; clientData: Pointer; input: TChType): integer; cdecl; external;

type
  TPROCESSFN = function(para1: TEObjectType; para2: pointer; para3: pointer; para4: Tchtype): longint; cdecl;

procedure bindCDKObject(para1: TEObjectType; para2: pointer; para3: Tchtype; para4: TBINDFN; para5: pointer); cdecl; external libcdk;
procedure unbindCDKObject(para1: TEObjectType; para2: pointer; para3: Tchtype); cdecl; external libcdk;
function checkCDKObjectBind(para1: TEObjectType; para2: pointer; para3: Tchtype): longint; cdecl; external libcdk;
function isCDKObjectBind(para1: TEObjectType; para2: pointer; para3: Tchtype): boolean; cdecl; external libcdk;
procedure cleanCDKObjectBindings(para1: TEObjectType; para2: pointer); cdecl; external libcdk;

// === Konventiert am: 30-4-25 17:39:25 ===


implementation



end.
