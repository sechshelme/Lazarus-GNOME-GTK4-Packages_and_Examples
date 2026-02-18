unit user;

interface

uses
  fp_qhull, Math;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qh_FILENAMElen = 500;

  MSG_TRACE0 = 0;
  MSG_TRACE1 = 1000;
  MSG_TRACE2 = 2000;
  MSG_TRACE3 = 3000;
  MSG_TRACE4 = 4000;
  MSG_TRACE5 = 5000;
  MSG_ERROR = 6000;
  MSG_WARNING = 7000;
  MSG_STDERR = 8000;
  MSG_OUTPUT = 9000;
  MSG_QHULL_ERROR = 10000;
  MSG_FIX = 11000;
  MSG_MAXLEN = 3000;

  qh_OPTIONline = 80;
  REALfloat = 0;

type
  realT = double;

const
  qh_REALmax = 1.7976931348623157e+308;
  qh_REALmin = 2.2250738585072014e-308;
  qh_REALepsilon = 2.2204460492503131e-16;
  qh_REALdigits = 16;
  qh_REAL_1 = '%6.16g ';
  qh_REAL_2n = '%6.16g %6.16g\n';
  qh_REAL_3n = '%6.16g %6.16g %6.16g\n';

const
  DEFcountT = 1;

type
  PcountT = ^TcountT;
  TcountT = longint;

const
  COUNTmax = MaxInt;

  qh_POINTSmax = MaxInt - 16;
  qh_CLOCKtype = 1;
  qh_ORIENTclock = 0;
  qh_JOGGLEdefault = 30000.0;
  qh_JOGGLEincrease = 10.0;
  qh_JOGGLEretry = 2;
  qh_JOGGLEagain = 1;
  qh_JOGGLEmaxincrease = 1e-2;
  qh_JOGGLEmaxretry = 50;
  qh_HASHfactor = 2;
  qh_VERIFYdirect = 1000000;
  qh_INITIALsearch = 6;
  qh_INITIALmax = 8;
  qh_MEMbufsize = $10000;
  qh_MEMinitbuf = $20000;
  qh_INFINITE = -(10.101);
  qh_DEFAULTbox = 0.5;
  qh_DEFAULTzbox = 1e6;
  qh_COMPUTEfurthest = 0;
  qh_KEEPstatistics = 1;
  qh_MAXoutside = 1;
  qh_QHpointer = 0;
  qh_QUICKhelp = 0;
  qh_BESTcentrum = 20;
  qh_BESTcentrum2 = 2;
  qh_BESTnonconvex = 15;
  qh_COPLANARratio = 3;
  qh_DIMmergeVertex = 6;
  qh_DIMreduceBuild = 5;
  qh_MAXcheckpoint = 10;
  qh_MAXcoplanarcentrum = 10;
  qh_MAXnewcentrum = 5;
  qh_MAXnewmerges = 2;
  qh_RATIOconcavehorizon = 20.0;
  qh_RATIOconvexmerge = 10.0;
  qh_RATIOcoplanarapex = 3.0;
  qh_RATIOcoplanaroutside = 30.0;
  qh_RATIOmaxsimplex = 1.0e-3;
  qh_RATIOnearinside = 5;
  qh_RATIOpinchedsubridge = 10.0;
  qh_RATIOtrypinched = 4.0;
  qh_RATIOtwisted = 20.0;
  qh_MAXnarrow = -(0.99999999);
  qh_WARNnarrow = -(0.999999999999999);
  qh_WIDEcoplanar = 6;
  qh_WIDEduplicate = 100;
  qh_WIDEdupridge = 50;
  qh_WIDEmaxoutside = 100;
  qh_WIDEmaxoutside2 = 10 * qh_WIDEmaxoutside;
  qh_WIDEpinched = 100;
  qh_ZEROdelaunay = 2;

  // === Konventiert am: 18-2-26 16:47:59 ===


implementation


end.
