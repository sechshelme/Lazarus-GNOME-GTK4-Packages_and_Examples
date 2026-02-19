unit stat_r;

interface

uses
  fp_qhull_r;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-stat_r.htm"
  >-------------------------------</a><a name="TOP">-</a>

   stat_r.h
     contains all statistics that are collected for qhull

   see qh-stat_r.htm and stat_r.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull_r/stat_r.h#4 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $

   recompile qhull if you change this file

   Integer statistics are Z* while real statistics are W*.

   define MAYdebugx to call a routine at every statistic event

 }
{$ifndef qhDEFstat}

const
  qhDEFstat = 1;  
{ Depends on realT.  Do not include "libqhull_r" to avoid circular dependency  }
{$ifndef DEFqhT}

const
  DEFqhT = 1;  
type
{ Defined by libqhull_r.h  }
{$endif}
{$ifndef DEFqhstatT}

const
  DEFqhstatT = 1;  
type
{ Defined here  }
{$endif}
{-<a                             href="qh-stat_r.htm#TOC"
  >-------------------------------</a><a name="KEEPstatistics">-</a>

  qh_KEEPstatistics
    0 turns off statistic reporting and gathering (except zzdef/zzinc/zzadd/zzval/wwval)

  set qh_KEEPstatistics in user_r.h to 0 to turn off statistics
 }
{ alphabetical after Z/W  }
type
  Tqh_statistics =  Longint;
  Const
    Zacoplanar = 0;
    Wacoplanarmax = 1;
    Wacoplanartot = 2;
    Zangle = 3;
    Wangle = 4;
    Wanglemax = 5;
    Wanglemin = 6;
    Zangletests = 7;
    Wareatot = 8;
    Wareamax = 9;
    Wareamin = 10;
    Zavoidold = 11;
    Wavoidoldmax = 12;
    Wavoidoldtot = 13;
    Zback0 = 14;
    Zbestcentrum = 15;
    Zbestdist = 16;
    Zbestlower = 17;
    Zbestlowerall = 18;
    Zbestloweralln = 19;
    Zbestlowerv = 20;
    Zcentrumtests = 21;
    Zcheckpart = 22;
    Zcomputefurthest = 23;
    Zconcave = 24;
    Wconcavemax = 25;
    Wconcavetot = 26;
    Zconcavecoplanar = 27;
    Wconcavecoplanarmax = 28;
    Wconcavecoplanartot = 29;
    Zconcavecoplanarridge = 30;
    Zconcaveridge = 31;
    Zconcaveridges = 32;
    Zcoplanar = 33;
    Wcoplanarmax = 34;
    Wcoplanartot = 35;
    Zcoplanarangle = 36;
    Zcoplanarcentrum = 37;
    Zcoplanarhorizon = 38;
    Zcoplanarinside = 39;
    Zcoplanarpart = 40;
    Zcoplanarridges = 41;
    Wcpu = 42;
    Zcyclefacetmax = 43;
    Zcyclefacettot = 44;
    Zcyclehorizon = 45;
    Zcyclevertex = 46;
    Zdegen = 47;
    Wdegenmax = 48;
    Wdegentot = 49;
    Zdegenvertex = 50;
    Zdelfacetdup = 51;
    Zdelridge = 52;
    Zdelvertextot = 53;
    Zdelvertexmax = 54;
    Zdetfacetarea = 55;
    Zdetsimplex = 56;
    Zdistcheck = 57;
    Zdistconvex = 58;
    Zdistgood = 59;
    Zdistio = 60;
    Zdistplane = 61;
    Zdiststat = 62;
    Zdistvertex = 63;
    Zdistzero = 64;
    Zdoc1 = 65;
    Zdoc2 = 66;
    Zdoc3 = 67;
    Zdoc4 = 68;
    Zdoc5 = 69;
    Zdoc6 = 70;
    Zdoc7 = 71;
    Zdoc8 = 72;
    Zdoc9 = 73;
    Zdoc10 = 74;
    Zdoc11 = 75;
    Zdoc12 = 76;
    Zdropdegen = 77;
    Zdropneighbor = 78;
    Zdupflip = 79;
    Zduplicate = 80;
    Wduplicatemax = 81;
    Wduplicatetot = 82;
    Zdupsame = 83;
    Zflipped = 84;
    Wflippedmax = 85;
    Wflippedtot = 86;
    Zflippedfacets = 87;
    Zflipridge = 88;
    Zflipridge2 = 89;
    Zfindbest = 90;
    Zfindbestmax = 91;
    Zfindbesttot = 92;
    Zfindcoplanar = 93;
    Zfindfail = 94;
    Zfindhorizon = 95;
    Zfindhorizonmax = 96;
    Zfindhorizontot = 97;
    Zfindjump = 98;
    Zfindnew = 99;
    Zfindnewmax = 100;
    Zfindnewtot = 101;
    Zfindnewjump = 102;
    Zfindnewsharp = 103;
    Zgauss0 = 104;
    Zgoodfacet = 105;
    Zhashlookup = 106;
    Zhashridge = 107;
    Zhashridgetest = 108;
    Zhashtests = 109;
    Zinsidevisible = 110;
    Zintersect = 111;
    Zintersectfail = 112;
    Zintersectmax = 113;
    Zintersectnum = 114;
    Zintersecttot = 115;
    Zmaxneighbors = 116;
    Wmaxout = 117;
    Wmaxoutside = 118;
    Zmaxridges = 119;
    Zmaxvertex = 120;
    Zmaxvertices = 121;
    Zmaxvneighbors = 122;
    Zmemfacets = 123;
    Zmempoints = 124;
    Zmemridges = 125;
    Zmemvertices = 126;
    Zmergeflipdup = 127;
    Zmergehorizon = 128;
    Zmergeinittot = 129;
    Zmergeinitmax = 130;
    Zmergeinittot2 = 131;
    Zmergeintocoplanar = 132;
    Zmergeintohorizon = 133;
    Zmergenew = 134;
    Zmergesettot = 135;
    Zmergesetmax = 136;
    Zmergesettot2 = 137;
    Zmergesimplex = 138;
    Zmergevertex = 139;
    Wmindenom = 140;
    Wminvertex = 141;
    Zminnorm = 142;
    Zmultiridge = 143;
    Znearlysingular = 144;
    Zredundant = 145;
    Wnewbalance = 146;
    Wnewbalance2 = 147;
    Znewbesthorizon = 148;
    Znewfacettot = 149;
    Znewfacetmax = 150;
    Znewvertex = 151;
    Wnewvertex = 152;
    Wnewvertexmax = 153;
    Znewvertexridge = 154;
    Znoarea = 155;
    Znonsimplicial = 156;
    Znowsimplicial = 157;
    Znotgood = 158;
    Znotgoodnew = 159;
    Znotmax = 160;
    Znumfacets = 161;
    Znummergemax = 162;
    Znummergetot = 163;
    Znumneighbors = 164;
    Znumridges = 165;
    Znumvertices = 166;
    Znumvisibility = 167;
    Znumvneighbors = 168;
    Zonehorizon = 169;
    Zpartangle = 170;
    Zpartcoplanar = 171;
    Zpartcorner = 172;
    Zparthidden = 173;
    Zpartinside = 174;
    Zpartition = 175;
    Zpartitionall = 176;
    Zpartnear = 177;
    Zparttwisted = 178;
    Zpbalance = 179;
    Wpbalance = 180;
    Wpbalance2 = 181;
    Zpinchduplicate = 182;
    Zpinchedapex = 183;
    Zpinchedvertex = 184;
    Zpostfacets = 185;
    Zpremergetot = 186;
    Zprocessed = 187;
    Zremvertex = 188;
    Zremvertexdel = 189;
    Zredundantmerge = 190;
    Zrenameall = 191;
    Zrenamepinch = 192;
    Zrenameshare = 193;
    Zretry = 194;
    Wretrymax = 195;
    Zretryadd = 196;
    Zretryaddmax = 197;
    Zretryaddtot = 198;
    Zridge = 199;
    Wridge = 200;
    Wridgemax = 201;
    Zridge0 = 202;
    Wridge0 = 203;
    Wridge0max = 204;
    Zridgemid = 205;
    Wridgemid = 206;
    Wridgemidmax = 207;
    Zridgeok = 208;
    Wridgeok = 209;
    Wridgeokmax = 210;
    Zsearchpoints = 211;
    Zsetplane = 212;
    Ztestvneighbor = 213;
    Ztotcheck = 214;
    Ztothorizon = 215;
    Ztotmerge = 216;
    Ztotpartcoplanar = 217;
    Ztotpartition = 218;
    Ztotridges = 219;
    Ztotvertices = 220;
    Ztotvisible = 221;
    Ztricoplanar = 222;
    Ztricoplanarmax = 223;
    Ztricoplanartot = 224;
    Ztridegen = 225;
    Ztrimirror = 226;
    Ztrinull = 227;
    Ztwisted = 228;
    Wtwistedtot = 229;
    Wtwistedmax = 230;
    Ztwistedridge = 231;
    Zvertextests = 232;
    Wvertexmax = 233;
    Wvertexmin = 234;
    Zvertexridge = 235;
    Zvertexridgetot = 236;
    Zvertexridgemax = 237;
    Zvertices = 238;
    Zvisfacettot = 239;
    Zvisfacetmax = 240;
    Zvisit = 241;
    Zvisit2max = 242;
    Zvisvertextot = 243;
    Zvisvertexmax = 244;
    Zvvisit = 245;
    Zvvisit2max = 246;
    Zwidefacet = 247;
    Zwidevertices = 248;
    ZEND = 249;

type
  Tztypes =  Longint;
  Const
    zdoc = 0;
    zinc = 1;
    zadd = 2;
    zmax = 3;
    zmin = 4;
    ZTYPEreal = 5;
    wadd = 6;
    wmax = 7;
    wmin = 8;
    ZTYPEend = 9;

{========== macros and constants ============= }
{-<a                             href="qh-stat_r.htm#TOC"
  >--------------------------------</a><a name="MAYdebugx">-</a>

  MAYdebugx
    define as maydebug() to be called frequently for error trapping
 }
{$define MAYdebugx}
type
  PintrealT = ^TintrealT;
  TintrealT = TintrealT;
{ union of int and realT  }
  PintrealT = ^TintrealT;
  TintrealT = record
      case longint of
        0 : ( i : longint );
        1 : ( r : TrealT );
      end;

{-<a                             href="qh-stat_r.htm#TOC"
  >--------------------------------</a><a name="qhstat">-</a>

  qhstat
    Data structure for statistics, similar to qh and qhrbox

    Allocated as part of qhT (libqhull_r.h)
 }
{ integer and real statistics  }
{ id's in print order  }
{ array of documentation strings  }
{ -1 if none, else index of count to use  }
{ type, see ztypes above  }
{ true, if statistic has been printed  }
{ initial values by types, set initstatistics  }
{ next index for zdef_  }
{ index for precision problems, printed on qh_errexit and qh_produce_output2/Q0/QJn  }
{ index for Voronoi ridges, printed on qh_produce_output2  }
  PqhstatT = ^TqhstatT;
  TqhstatT = record
      stats : array[0..(ZEND)-1] of TintrealT;
      id : array[0..(ZEND+10)-1] of byte;
      doc : array[0..(ZEND)-1] of Pchar;
      count : array[0..(ZEND)-1] of smallint;
      _type : array[0..(ZEND)-1] of char;
      printed : array[0..(ZEND)-1] of char;
      init : array[0..(ZTYPEend)-1] of TintrealT;
      next : longint;
      precision : longint;
      vridges : longint;
      tempi : longint;
      tempr : TrealT;
    end;

{========== function prototypes =========== }
{ C++ extern C conditionnal removed }

procedure qh_allstatA(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatB(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatC(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatD(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatE(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatE2(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatF(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatG(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatH(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatI(qh:PqhT);cdecl;external libqhull_r;
procedure qh_allstatistics(qh:PqhT);cdecl;external libqhull_r;
procedure qh_collectstatistics(qh:PqhT);cdecl;external libqhull_r;
procedure qh_initstatistics(qh:PqhT);cdecl;external libqhull_r;
function qh_newstats(qh:PqhT; idx:longint; nextindex:Plongint):TboolT;cdecl;external libqhull_r;
function qh_nostatistic(qh:PqhT; i:longint):TboolT;cdecl;external libqhull_r;
procedure qh_printallstatistics(qh:PqhT; fp:PFILE; _string:Pchar);cdecl;external libqhull_r;
procedure qh_printstatistics(qh:PqhT; fp:PFILE; _string:Pchar);cdecl;external libqhull_r;
procedure qh_printstatlevel(qh:PqhT; fp:PFILE; id:longint);cdecl;external libqhull_r;
procedure qh_printstats(qh:PqhT; fp:PFILE; idx:longint; nextindex:Plongint);cdecl;external libqhull_r;
function qh_stddev(qh:PqhT; num:longint; tot:TrealT; tot2:TrealT; ave:PrealT):TrealT;cdecl;external libqhull_r;
{$endif}
{ qhDEFstat  }

// === Konventiert am: 19-2-26 17:34:07 ===


implementation



end.
