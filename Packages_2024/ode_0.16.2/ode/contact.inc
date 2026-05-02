{$IFDEF read_interface}

const
  dContactMu2 = $001;
  dContactAxisDep = $001;
  dContactFDir1 = $002;
  dContactBounce = $004;
  dContactSoftERP = $008;
  dContactSoftCFM = $010;
  dContactMotion1 = $020;
  dContactMotion2 = $040;
  dContactMotionN = $080;
  dContactSlip1 = $100;
  dContactSlip2 = $200;
  dContactRolling = $400;
  dContactApprox0 = $0000;
  dContactApprox1_1 = $1000;
  dContactApprox1_2 = $2000;
  dContactApprox1_N = $4000;
  dContactApprox1 = $7000;

type
  TdSurfaceParameters = record
    mode: longint;
    mu: TdReal;
    mu2: TdReal;
    rho: TdReal;
    rho2: TdReal;
    rhoN: TdReal;
    bounce: TdReal;
    bounce_vel: TdReal;
    soft_erp: TdReal;
    soft_cfm: TdReal;
    motion1: TdReal;
    motion2: TdReal;
    motionN: TdReal;
    slip1: TdReal;
    slip2: TdReal;
  end;
  PdSurfaceParameters = ^TdSurfaceParameters;

  TdContactGeom = record
    pos: TdVector3;
    normal: TdVector3;
    depth: TdReal;
    g1: TdGeomID;
    g2: TdGeomID;
    side1: longint;
    side2: longint;
  end;
  PdContactGeom = ^TdContactGeom;

  TdContact = record
    surface: TdSurfaceParameters;
    geom: TdContactGeom;
    fdir1: TdVector3;
  end;
  PdContact = ^TdContact;

  // === Konventiert am: 30-4-26 17:09:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
