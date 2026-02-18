unit stat;

interface

uses
  fp_qhull;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{<html><pre>  -<a                             href="qh-stat.htm"
  >-------------------------------</a><a name="TOP">-</a>

   stat.h
     contains all statistics that are collected for qhull

   see qh-stat.htm and stat.c

   Copyright (c) 1993-2020 The Geometry Center.
   $Id: //main/2019/qhull/src/libqhull/stat.h#4 $$Change: 2953 $
   $DateTime: 2020/05/21 22:05:32 $$Author: bbarber $

   recompile qhull if you change this file

   Integer statistics are Z* while real statistics are W*.

   define MAYdebugx to call a routine at every statistic event

 }
{$ifndef qhDEFstat}

const
  qhDEFstat = 1;  
{ Depends on realT.  Do not include "libqhull_r" to avoid circular dependency  }
{-<a                             href="qh-stat.htm#TOC"
  >-------------------------------</a><a name="KEEPstatistics">-</a>

  qh_KEEPstatistics
    0 turns off statistic reporting and gathering (except zzdef/zzinc/zzadd/zzval/wwval)

  set qh_KEEPstatistics in user.h to 0 to turn off statistics
 }
{$ifndef qh_KEEPstatistics}

const
  qh_KEEPstatistics = 1;  
{$endif}
{-<a                             href="qh-stat.htm#TOC"
  >-------------------------------</a><a name="statistics">-</a>

  Zxxx for integers, Wxxx for reals

  notes:
    be sure that all statistics are defined in stat.c
      otherwise initialization may core dump
    can pick up all statistics by:
      grep '[zw].*_[(][ZW]' *.c >z.x
    remove trailers with query">-</a>
    remove leaders with  query-replace-regexp [ ^I]+  (
 }
{$if qh_KEEPstatistics}
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

{-<a                             href="qh-stat.htm#TOC"
  >-------------------------------</a><a name="ZZstat">-</a>

  Zxxx/Wxxx statistics that remain defined if qh_KEEPstatistics=0

  notes:
    be sure to use zzdef, zzinc, etc. with these statistics (no double checking!)
 }
{$else}
{ for zzdef etc. macros  }
type
  Tqh_statistics =  Longint;
  Const
    Zback0 = 0;
    Zbestdist = 1;
    Zcentrumtests = 2;
    Zcheckpart = 3;
    Zconcaveridges = 4;
    Zcoplanarhorizon = 5;
    Zcoplanarpart = 6;
    Zcoplanarridges = 7;
    Zcyclefacettot = 8;
    Zcyclehorizon = 9;
    Zdelvertextot = 10;
    Zdistcheck = 11;
    Zdistconvex = 12;
    Zdistplane = 13;
    Zdistzero = 14;
    Zdoc1 = 15;
    Zdoc2 = 16;
    Zdoc3 = 17;
    Zdoc11 = 18;
    Zflippedfacets = 19;
    Zflipridge = 20;
    Zflipridge2 = 21;
    Zgauss0 = 22;
    Zminnorm = 23;
    Zmultiridge = 24;
    Znearlysingular = 25;
    Wnewvertexmax = 26;
    Znumvisibility = 27;
    Zpartcoplanar = 28;
    Zpartition = 29;
    Zpartitionall = 30;
    Zpinchduplicate = 31;
    Zpinchedvertex = 32;
    Zprocessed = 33;
    Zretry = 34;
    Zridge = 35;
    Wridge = 36;
    Wridgemax = 37;
    Zridge0 = 38;
    Wridge0 = 39;
    Wridge0max = 40;
    Zridgemid = 41;
    Wridgemid = 42;
    Wridgemidmax = 43;
    Zridgeok = 44;
    Wridgeok = 45;
    Wridgeokmax = 46;
    Zsetplane = 47;
    Ztotcheck = 48;
    Ztotmerge = 49;
    Zvertextests = 50;
    ZEND = 51;

{$endif}
{-<a                             href="qh-stat.htm#TOC"
  >-------------------------------</a><a name="ztype">-</a>

  ztype
    the type of a statistic sets its initial value.

  notes:
    The type should be the same as the macro for collecting the statistic
 }
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
{-<a                             href="qh-stat.htm#TOC"
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

{-<a                             href="qh-stat.htm#TOC"
  >--------------------------------</a><a name="qhstat">-</a>

  qhstat
    global data structure for statistics, similar to qh and qhrbox

  notes:
   access to qh_qhstat is via the "qhstat" macro.  There are two choices
   qh_QHpointer = 1     access globals via a pointer
                        enables qh_saveqhull() and qh_restoreqhull()
                = 0     qh_qhstat is a static data structure
                        only one instance of qhull() can be active at a time
                        default value
   qh_QHpointer is defined in libqhull.h
   For msvc, qh_QHpointer_dllimport or qh_dllimport define qh_qh as __declspec(dllimport) [libqhull.h]

   allocated in stat.c using qh_malloc()
 }
{$endif}
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
type
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

procedure qh_allstatA;cdecl;external libqhull;
procedure qh_allstatB;cdecl;external libqhull;
procedure qh_allstatC;cdecl;external libqhull;
procedure qh_allstatD;cdecl;external libqhull;
procedure qh_allstatE;cdecl;external libqhull;
procedure qh_allstatE2;cdecl;external libqhull;
procedure qh_allstatF;cdecl;external libqhull;
procedure qh_allstatG;cdecl;external libqhull;
procedure qh_allstatH;cdecl;external libqhull;
procedure qh_allstatI;cdecl;external libqhull;
procedure qh_allstatistics;cdecl;external libqhull;
procedure qh_collectstatistics;cdecl;external libqhull;
procedure qh_freestatistics;cdecl;external libqhull;
procedure qh_initstatistics;cdecl;external libqhull;
function qh_newstats(idx:longint; nextindex:Plongint):TboolT;cdecl;external libqhull;
function qh_nostatistic(i:longint):TboolT;cdecl;external libqhull;
procedure qh_printallstatistics(fp:PFILE; _string:Pchar);cdecl;external libqhull;
procedure qh_printstatistics(fp:PFILE; _string:Pchar);cdecl;external libqhull;
procedure qh_printstatlevel(fp:PFILE; id:longint);cdecl;external libqhull;
procedure qh_printstats(fp:PFILE; idx:longint; nextindex:Plongint);cdecl;external libqhull;
function qh_stddev(num:longint; tot:TrealT; tot2:TrealT; ave:PrealT):TrealT;cdecl;external libqhull;
{$endif}
{ qhDEFstat  }

// === Konventiert am: 18-2-26 16:48:01 ===


implementation



end.
