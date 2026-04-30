unit mass;

interface

uses
  fp_ode, odeconfig, common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TdMass = record
    mass: TdReal;
    c: TdVector3;
    I: TdMatrix3;
  end;
  PdMass = ^TdMass;

function dMassCheck(m: PdMass): longint; cdecl; external libodes;
procedure dMassSetZero(para1: PdMass); cdecl; external libodes;
procedure dMassSetParameters(para1: PdMass; themass: TdReal; cgx: TdReal; cgy: TdReal; cgz: TdReal;
  I11: TdReal; I22: TdReal; I33: TdReal; I12: TdReal; I13: TdReal;
  I23: TdReal); cdecl; external libodes;
procedure dMassSetSphere(para1: PdMass; density: TdReal; radius: TdReal); cdecl; external libodes;
procedure dMassSetSphereTotal(para1: PdMass; total_mass: TdReal; radius: TdReal); cdecl; external libodes;
procedure dMassSetCapsule(para1: PdMass; density: TdReal; direction: longint; radius: TdReal; length: TdReal); cdecl; external libodes;
procedure dMassSetCapsuleTotal(para1: PdMass; total_mass: TdReal; direction: longint; radius: TdReal; length: TdReal); cdecl; external libodes;
procedure dMassSetCylinder(para1: PdMass; density: TdReal; direction: longint; radius: TdReal; length: TdReal); cdecl; external libodes;
procedure dMassSetCylinderTotal(para1: PdMass; total_mass: TdReal; direction: longint; radius: TdReal; length: TdReal); cdecl; external libodes;
procedure dMassSetBox(para1: PdMass; density: TdReal; lx: TdReal; ly: TdReal; lz: TdReal); cdecl; external libodes;
procedure dMassSetBoxTotal(para1: PdMass; total_mass: TdReal; lx: TdReal; ly: TdReal; lz: TdReal); cdecl; external libodes;
procedure dMassSetTrimesh(para1: PdMass; density: TdReal; g: TdGeomID); cdecl; external libodes;
procedure dMassSetTrimeshTotal(m: PdMass; total_mass: TdReal; g: TdGeomID); cdecl; external libodes;
procedure dMassAdjust(para1: PdMass; newmass: TdReal); cdecl; external libodes;
procedure dMassTranslate(para1: PdMass; x: TdReal; y: TdReal; z: TdReal); cdecl; external libodes;
procedure dMassRotate(para1: PdMass; R: TdMatrix3); cdecl; external libodes;
procedure dMassAdd(a: PdMass; b: PdMass); cdecl; external libodes;
procedure dMassSetCappedCylinder(a: PdMass; b: TdReal; c: longint; d: TdReal; e: TdReal); cdecl; external libodes; deprecated;
procedure dMassSetCappedCylinderTotal(a: PdMass; b: TdReal; c: longint; d: TdReal; e: TdReal); cdecl; external libodes; deprecated;

// === Konventiert am: 30-4-26 17:09:49 ===


implementation



end.
