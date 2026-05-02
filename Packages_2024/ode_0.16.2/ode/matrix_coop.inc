{$IFDEF read_interface}


procedure dEstimateCooperativelyFactorLDLTResourceRequirements(requirements: TdResourceRequirementsID; maximalAllowedThreadCount: dword; maximalRowCount: dword); cdecl; external libodes;
procedure dCooperativelyFactorLDLT(resources: TdResourceContainerID; allowedThreadCount: dword; A: PdReal; d: PdReal; rowCount: dword; rowSkip: dword); cdecl; external libodes;
procedure dEstimateCooperativelySolveLDLTResourceRequirements(requirements: TdResourceRequirementsID; maximalAllowedThreadCount: dword; maximalRowCount: dword); cdecl; external libodes;
procedure dCooperativelySolveLDLT(resources: TdResourceContainerID; allowedThreadCount: dword; L: PdReal; d: PdReal; b: PdReal; rowCount: dword; rowSkip: dword); cdecl; external libodes;
procedure dEstimateCooperativelySolveL1StraightResourceRequirements(requirements: TdResourceRequirementsID; maximalAllowedThreadCount: dword; maximalRowCount: dword); cdecl; external libodes;
procedure dCooperativelySolveL1Straight(resources: TdResourceContainerID; allowedThreadCount: dword; L: PdReal; b: PdReal; rowCount: dword; rowSkip: dword); cdecl; external libodes;
procedure dEstimateCooperativelySolveL1TransposedResourceRequirements(requirements: TdResourceRequirementsID; maximalAllowedThreadCount: dword; maximalRowCount: dword); cdecl; external libodes;
procedure dCooperativelySolveL1Transposed(resources: TdResourceContainerID; allowedThreadCount: dword; L: PdReal; b: PdReal; rowCount: dword; rowSkip: dword); cdecl; external libodes;
procedure dEstimateCooperativelyScaleVectorResourceRequirements(requirements: TdResourceRequirementsID; maximalAllowedThreadCount: dword; maximalElementCount: dword); cdecl; external libodes;
procedure dCooperativelyScaleVector(resources: TdResourceContainerID; allowedThreadCount: dword; dataVector: PdReal; scaleVector: PdReal; elementCount: dword); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
