unit dewarp;

interface

uses
  fp_lept, environ, array_, pix_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  DEWARP_VERSION_NUMBER = 4;

type
  TL_Dewarpa = record
    nalloc: Tl_int32;
    maxpage: Tl_int32;
    dewarp: ^PL_Dewarp;
    dewarpcache: ^PL_Dewarp;
    namodels: PNuma;
    napages: PNuma;
    redfactor: Tl_int32;
    sampling: Tl_int32;
    minlines: Tl_int32;
    maxdist: Tl_int32;
    max_linecurv: Tl_int32;
    min_diff_linecurv: Tl_int32;
    max_diff_linecurv: Tl_int32;
    max_edgeslope: Tl_int32;
    max_edgecurv: Tl_int32;
    max_diff_edgecurv: Tl_int32;
    useboth: Tl_int32;
    check_columns: Tl_int32;
    modelsready: Tl_int32;
  end;
  PL_Dewarpa = ^TL_Dewarpa;
  PPL_Dewarpa = ^PL_Dewarpa;

  TL_Dewarp = record
    dewa: PL_Dewarpa;
    pixs: PPix;
    sampvdispar: PFPix;
    samphdispar: PFPix;
    sampydispar: PFPix;
    fullvdispar: PFPix;
    fullhdispar: PFPix;
    fullydispar: PFPix;
    namidys: PNuma;
    nacurves: PNuma;
    w: Tl_int32;
    h: Tl_int32;
    pageno: Tl_int32;
    sampling: Tl_int32;
    redfactor: Tl_int32;
    minlines: Tl_int32;
    nlines: Tl_int32;
    mincurv: Tl_int32;
    maxcurv: Tl_int32;
    leftslope: Tl_int32;
    rightslope: Tl_int32;
    leftcurv: Tl_int32;
    rightcurv: Tl_int32;
    nx: Tl_int32;
    ny: Tl_int32;
    hasref: Tl_int32;
    refpage: Tl_int32;
    vsuccess: Tl_int32;
    hsuccess: Tl_int32;
    ysuccess: Tl_int32;
    vvalid: Tl_int32;
    hvalid: Tl_int32;
    skip_horiz: Tl_int32;
    debug: Tl_int32;
  end;
  PL_Dewarp = ^TL_Dewarp;
  PPL_Dewarp = ^PL_Dewarp;


  // === Konventiert am: 17-8-25 13:40:00 ===


implementation



end.
