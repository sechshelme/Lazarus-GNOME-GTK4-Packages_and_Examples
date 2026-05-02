{$IFDEF read_interface}


procedure dRSetIdentity(R: TdMatrix3); cdecl; external libodes;
procedure dRFromAxisAndAngle(R: TdMatrix3; ax: TdReal; ay: TdReal; az: TdReal; angle: TdReal); cdecl; external libodes;
procedure dRFromEulerAngles(R: TdMatrix3; phi: TdReal; theta: TdReal; psi: TdReal); cdecl; external libodes;
procedure dRFrom2Axes(R: TdMatrix3; ax: TdReal; ay: TdReal; az: TdReal; bx: TdReal; by: TdReal; bz: TdReal); cdecl; external libodes;
procedure dRFromZAxis(R: TdMatrix3; ax: TdReal; ay: TdReal; az: TdReal); cdecl; external libodes;
procedure dQSetIdentity(q: TdQuaternion); cdecl; external libodes;
procedure dQFromAxisAndAngle(q: TdQuaternion; ax: TdReal; ay: TdReal; az: TdReal; angle: TdReal); cdecl; external libodes;
procedure dQMultiply0(qa: TdQuaternion; qb: TdQuaternion; qc: TdQuaternion); cdecl; external libodes;
procedure dQMultiply1(qa: TdQuaternion; qb: TdQuaternion; qc: TdQuaternion); cdecl; external libodes;
procedure dQMultiply2(qa: TdQuaternion; qb: TdQuaternion; qc: TdQuaternion); cdecl; external libodes;
procedure dQMultiply3(qa: TdQuaternion; qb: TdQuaternion; qc: TdQuaternion); cdecl; external libodes;
procedure dRfromQ(R: TdMatrix3; q: TdQuaternion); cdecl; external libodes;
procedure dQfromR(q: TdQuaternion; R: TdMatrix3); cdecl; external libodes;
procedure dDQfromW(dq: PdReal; w: TdVector3; q: TdQuaternion); cdecl; external libodes;

// === Konventiert am: 30-4-26 17:09:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
