{$IFDEF read_interface}


type
  PdxCooperative = type Pointer;
  PdxResourceRequirements = type Pointer;
  PdxResourceContainer = type Pointer;

  PdCooperativeID = ^TdCooperativeID;
  TdCooperativeID = PdxCooperative;

  PdResourceRequirementsID = ^TdResourceRequirementsID;
  TdResourceRequirementsID = PdxResourceRequirements;

  PdResourceContainerID = ^TdResourceContainerID;
  TdResourceContainerID = PdxResourceContainer;

function dCooperativeCreate(functionInfo: PdThreadingFunctionsInfo; threadingImpl: TdThreadingImplementationID): TdCooperativeID; cdecl; external libodes;
procedure dCooperativeDestroy(cooperative: TdCooperativeID); cdecl; external libodes;
function dResourceRequirementsCreate(cooperative: TdCooperativeID): TdResourceRequirementsID; cdecl; external libodes;
procedure dResourceRequirementsDestroy(requirements: TdResourceRequirementsID); cdecl; external libodes;
function dResourceRequirementsClone(requirements: TdResourceRequirementsID): TdResourceRequirementsID; cdecl; external libodes;
procedure dResourceRequirementsMergeIn(summaryRequirements: TdResourceRequirementsID; extraRequirements: TdResourceRequirementsID); cdecl; external libodes;
function dResourceContainerAcquire(requirements: TdResourceRequirementsID): TdResourceContainerID; cdecl; external libodes;
procedure dResourceContainerDestroy(resources: TdResourceContainerID); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
