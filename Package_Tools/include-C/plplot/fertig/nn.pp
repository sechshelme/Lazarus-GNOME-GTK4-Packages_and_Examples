
unit nn;
interface

{
  Automatically converted by H2Pas 1.0.0 from nn.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nn.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdelaunay  = ^delaunay;
Pdouble  = ^double;
Plongint  = ^longint;
Plpi  = ^lpi;
PNN_RULE  = ^NN_RULE;
Pnnai  = ^nnai;
Pnnhpi  = ^nnhpi;
Pnnpi  = ^nnpi;
Ppoint  = ^point;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{-------------------------------------------------------------------------- }
{ }
{ File:           nn.h }
{ }
{ Created:        04/08/2000 }
{ }
{ Author:         Pavel Sakov }
{                 CSIRO Marine Research }
{ }
{ Purpose:        Header file for nn library }
{ }
{ Description:    None }
{ }
{ Revisions:      None }
{ }
{-------------------------------------------------------------------------- }
{$if !defined ( _NN_H )}
{$define _NN_H}
{$include "nndll.h"}
type
  PNN_RULE = ^TNN_RULE;
  TNN_RULE =  Longint;
  Const
    SIBSON = 0;
    NON_SIBSONIAN = 1;
;
{$if !defined ( _POINT_STRUCT )}
{$define _POINT_STRUCT}
type
  Ppoint = ^Tpoint;
  Tpoint = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;
{$endif}
{* Smoothes the input point array by averaging the input x,y and z values }
{** for each cell within virtual rectangular nx by ny grid. The corners of the }
{** grid are created from min and max values of the input array. It also frees }
{** the original array and returns results and new dimension via original }
{** data and size pointers. }
{* }
{* @param pn Pointer to number of points (input/output) }
{* @param ppoints Pointer to array of points (input/output) [*pn] }
{* @param nx Number of x nodes in decimation }
{* @param ny Number of y nodes in decimation }
{ }

procedure points_thin(n:Plongint; points:PPpoint; nx:longint; ny:longint);cdecl;external;
{* Generates rectangular grid nx by ny using min and max x and y values from }
{** the input point array. Allocates space for the output point array, be sure }
{** to free it when necessary! }
{* }
{* @param n Number of points }
{* @param points Array of points [n] }
{* @param nx Number of x nodes }
{* @param ny Number of y nodes }
{* @param nout Pointer to number of output points }
{* @param pout Ppointer to array of output points [*nout] }
{ }
procedure points_generate1(n:longint; points:Ppoint; nx:longint; ny:longint; zoom:Tdouble; 
            nout:Plongint; pout:PPpoint);cdecl;external;
{* Generates rectangular grid nx by ny using specified min and max x and y }
{** values. Allocates space for the output point array, be sure to free it }
{** when necessary! }
{* }
{* @param xmin Min x value }
{* @param xmax Max x value }
{* @param ymin Min y value }
{* @param ymax Max y value }
{* @param nx Number of x nodes }
{* @param ny Number of y nodes }
{* @param zoom Zoom coefficient }
{* @param nout Pointer to number of output points }
{* @param pout Pointer to array of output points [*nout] }
{ }
procedure points_generate2(xmin:Tdouble; xmax:Tdouble; ymin:Tdouble; ymax:Tdouble; nx:longint; 
            ny:longint; nout:Plongint; pout:PPpoint);cdecl;external;
{* Reads array of points from a columnar file. }
{ }
{ @param fname File name (can be "stdin" dor stndard input) }
{ @param dim Number of dimensions (must be 2 or 3) }
{ @param n Pointer to number of points (output) }
{ @param points Pointer to array of points [*n] (output) }
{ }
procedure points_read(fname:Pchar; dim:longint; n:Plongint; points:PPpoint);cdecl;external;
{* Scales Y coordinate so that the resulting set fits into square: }
{** xmax - xmin = ymax - ymin }
{* }
{* @param n Number of points }
{* @param points The points to scale }
{* @return Y axis compression coefficient }
{ }
function points_scaletosquare(n:longint; points:Ppoint):Tdouble;cdecl;external;
{* Compresses Y domain by a given multiple. }
{ }
{ @param n Number of points }
{ @param points The points to scale }
{ @param Y axis compression coefficient as returned by points_scaletosquare() }
{ }
procedure points_scale(n:longint; points:Ppoint; k:Tdouble);cdecl;external;
{* Structure to perform the Delaunay triangulation of a given array of points. }
{ }
{ Contains a deep copy of the input array of points. }
{ Contains triangles, circles and edges resulted from the triangulation. }
{ Contains neighbour triangles for each triangle. }
{ Contains point to triangle map. }
{ }
type
  Pdelaunay = ^Tdelaunay;
  Tdelaunay = record
      {undefined structure}
    end;

{* Builds Delaunay triangulation of the given array of points. }
{ }
{ @param np Number of points }
{ @param points Array of points [np] (input) }
{ @param ns Number of forced segments }
{ @param segments Array of (forced) segment endpoint indices [2*ns] }
{ @param nh Number of holes }
{ @param holes Array of hole (x,y) coordinates [2*nh] }
{ @return Delaunay triangulation with triangulation results }
{ }

function delaunay_build(np:longint; points:Ppoint; ns:longint; segments:Plongint; nh:longint; 
           holes:Pdouble):Pdelaunay;cdecl;external;
{* Destroys Delaunay triangulation. }
{ }
{ @param d Structure to be destroyed }
{ }
procedure delaunay_destroy(d:Pdelaunay);cdecl;external;
{* `lpi' -- "linear point interpolator" is a structure for }
{ conducting linear interpolation on a given data on a "point-to-point" basis. }
{ It interpolates linearly within each triangle resulted from the Delaunay }
{ triangluation of input data. `lpi' is much faster than all }
{ Natural Neighbours interpolators below. }
{ }
type
  Plpi = ^Tlpi;
  Tlpi = record
      {undefined structure}
    end;

{* Builds linear interpolator. }
{ }
{ @param d Delaunay triangulation }
{ @return Linear interpolator }
{ }

function lpi_build(d:Pdelaunay):Plpi;cdecl;external;
{* Destroys linear interpolator. }
{ }
{ @param l Structure to be destroyed }
{ }
procedure lpi_destroy(l:Plpi);cdecl;external;
{* Finds linearly interpolated value in a point. }
{ }
{ @param l Linear point interpolator }
{ @param p Point to be interpolated (p->x, p->y -- input; p->z -- output) }
{ }
procedure lpi_interpolate_point(l:Plpi; p:Ppoint);cdecl;external;
{ Linearly interpolates data from one array of points for another array of }
{ points. }
{ }
{ @param nin Number of input points }
{ @param pin Array of input points [pin] }
{ @param nout Number of ouput points }
{ @param pout Array of output points [nout] }
{ }
procedure lpi_interpolate_points(nin:longint; pin:Ppoint; nout:longint; pout:Ppoint);cdecl;external;
{* `nnpi' -- "Natural Neighbours point interpolator" is a }
{ structure for conducting Natural Neighbours interpolation on a given data on }
{ a "point-to-point" basis. Because it involves weight calculation for each }
{ next output point, it is not particularly suitable for consequitive }
{ interpolations on the same set of observation points -- use }
{ `nnhpi' or `nnai' in these cases. }
{ }
type
  Pnnpi = ^Tnnpi;
  Tnnpi = record
      {undefined structure}
    end;

{* Creates Natural Neighbours point interpolator. }
{ }
{ @param d Delaunay triangulation }
{ @return Natural Neighbours interpolation }
{ }

function nnpi_create(d:Pdelaunay):Pnnpi;cdecl;external;
{* Destroys Natural Neighbours point interpolation. }
{ }
{ @param nn Structure to be destroyed }
{ }
procedure nnpi_destroy(nn:Pnnpi);cdecl;external;
{* Finds Natural Neighbours-interpolated value in a point. }
{ }
{ @param nn NN point interpolator }
{ @param p Point to be interpolated (p->x, p->y -- input; p->z -- output) }
{ }
procedure nnpi_interpolate_point(nn:Pnnpi; p:Ppoint);cdecl;external;
{* Natural Neighbours-interpolates data in one array of points for another }
{** array of points. }
{* }
{* @param nin Number of input points }
{* @param pin Array of input points [pin] }
{* @param wmin Minimal allowed weight }
{* @param nout Number of output points }
{* @param pout Array of output points [nout] }
{ }
procedure nnpi_interpolate_points(nin:longint; pin:Ppoint; wmin:Tdouble; nout:longint; pout:Ppoint);cdecl;external;
{* Sets minimal allowed weight for Natural Neighbours interpolation. }
{ @param nn Natural Neighbours point interpolator }
{ @param wmin Minimal allowed weight }
{ }
procedure nnpi_setwmin(nn:Pnnpi; wmin:Tdouble);cdecl;external;
{* `nnhpi' is a structure for conducting consequitive }
{ Natural Neighbours interpolations on a given spatial data set in a random }
{ sequence of points from a set of finite size, taking advantage of repeated }
{ interpolations in the same point. It allows to modify Z }
{ coordinate of data between interpolations. }
{ }
type
  Pnnhpi = ^Tnnhpi;
  Tnnhpi = record
      {undefined structure}
    end;

{* Creates Natural Neighbours hashing point interpolator. }
{ }
{ @param d Delaunay triangulation }
{ @param size Hash table size (should be of order of number of output points) }
{ @return Natural Neighbours interpolation }
{ }

function nnhpi_create(d:Pdelaunay; size:longint):Pnnhpi;cdecl;external;
{* Destroys Natural Neighbours hashing point interpolation. }
{ }
{ @param nn Structure to be destroyed }
{ }
procedure nnhpi_destroy(nn:Pnnhpi);cdecl;external;
{* Finds Natural Neighbours-interpolated value in a point. }
{ }
{ @param nnhpi NN hashing point interpolator }
{ @param p Point to be interpolated (p->x, p->y -- input; p->z -- output) }
{ }
procedure nnhpi_interpolate(nn:Pnnhpi; p:Ppoint);cdecl;external;
{* Modifies interpolated data. }
{ Finds point* pd in the underlying Delaunay triangulation such that }
{ pd->x = p->x and pd->y = p->y, and copies p->z to pd->z. Exits with error }
{ if the point is not found. }
{ }
{ @param nn Natural Neighbours hashing point interpolator }
{ @param p New data }
{ }
procedure nnhpi_modify_data(nn:Pnnhpi; p:Ppoint);cdecl;external;
{* Sets minimal allowed weight for Natural Neighbours interpolation. }
{ @param nn Natural Neighbours point hashing interpolator }
{ @param wmin Minimal allowed weight }
{ }
procedure nnhpi_setwmin(nn:Pnnhpi; wmin:Tdouble);cdecl;external;
{ `nnai' is a tructure for conducting consequitive Natural }
{ Neighbours interpolations on a given spatial data set in a given array of }
{ points. It allows to modify Z coordinate of data between interpolations. }
{ `nnai' is the fastest of the three Natural Neighbours }
{ interpolators here. }
{ }
type
  Pnnai = ^Tnnai;
  Tnnai = record
      {undefined structure}
    end;

{* Builds Natural Neighbours array interpolator. This includes calculation of }
{ weights used in nnai_interpolate(). }
{ }
{ @param d Delaunay triangulation }
{ @return Natural Neighbours interpolation }
{ }

function nnai_build(d:Pdelaunay; n:longint; x:Pdouble; y:Pdouble):Pnnai;cdecl;external;
{* Destroys Natural Neighbours array interpolator. }
{ }
{ @param nn Structure to be destroyed }
{ }
procedure nnai_destroy(nn:Pnnai);cdecl;external;
{* Conducts NN interpolation in a fixed array of output points using }
{ data specified for a fixed array of input points. Uses pre-calculated }
{ weights. }
{ }
{ @param nn NN array interpolator }
{ @param zin input data [nn->d->npoints] }
{ @param zout output data [nn->n]. Must be pre-allocated! }
{ }
procedure nnai_interpolate(nn:Pnnai; zin:Pdouble; zout:Pdouble);cdecl;external;
{* Sets minimal allowed weight for Natural Neighbours interpolation. }
{ @param nn Natural Neighbours array interpolator }
{ @param wmin Minimal allowed weight }
{ }
procedure nnai_setwmin(nn:Pnnai; wmin:Tdouble);cdecl;external;
{ Sets the verbosity level within nn package. }
{ 0 (default) - silent }
{ 1 - verbose }
{ 2 - very verbose }
{ }
  var
    nn_verbose : longint;cvar;external;
{ Switches between weight calculation methods. }
{ SIBSON -- classic Sibson method }
{ NON_SIBSONIAN -- simpler and (I think) more robust method }
{ }
    nn_rule : TNN_RULE;cvar;external;
{ Contains version string for the nn package. }
{ }
(* Const before type ignored *)
    nn_version : Pchar;cvar;external;
{ Limits verbose information to a particular vertex (used mainly for }
{ debugging purposes). }
{ }
    nn_test_vertice : longint;cvar;external;
{$endif}
{ _NN_H }

implementation


end.
