unit math_util;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  M_TWOPI = pi*2;
  M_PI = pi3.141592653589793238462643383279502884196;

function to_radians(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function to_degrees(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function max(A,B : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function min(A,B : longint) : longint;

{ xxxxxx

static inline int dequals_mag(double a, double b, double thresh)

    return (fabs(a-b) < thresh);


static inline int isq(int v)

    return v*v;


static inline float fsq(float v)

    return v*v;


static inline double sq(double v)

    return v*v;


static inline double sgn(double v)

    return (v>=0) ? 1 : -1;


// random number between [0, 1)
static inline float randf()

    return (float)(rand() / (RAND_MAX + 1.0));



static inline float signed_randf()

    return randf()*2 - 1;


// return a random integer between [0, bound)
static inline int irand(int bound)

    int v = (int) (randf()*bound);
    if (v == bound)
        return (bound-1);
    //assert(v >= 0);
    //assert(v < bound);
    return v;


static inline double mod2pi_positive(double vin)

    return vin - M_TWOPI * floor(vin / M_TWOPI);


static inline double mod2pi(double vin)

    return mod2pi_positive(vin + M_PI) - M_PI;


static inline double mod2pi_ref(double ref, double vin)

    return ref + mod2pi(vin - ref);


static inline double mod360_positive(double vin)

    return vin - 360 * floor(vin / 360);


static inline double mod360(double vin)

    return mod360_positive(vin + 180) - 180;


static inline int mod_positive(int vin, int mod) 
    return (vin % mod + mod) % mod;


static inline int theta_to_int(double theta, int max)

    theta = mod2pi_ref(M_PI, theta);
    int v = (int) (theta / M_TWOPI * max);

    if (v == max)
        v = 0;

    assert (v >= 0 && v < max);

    return v;


static inline int imin(int a, int b)

    return (a < b) ? a : b;


static inline int imax(int a, int b)

    return (a > b) ? a : b;


static inline int64_t imin64(int64_t a, int64_t b)

    return (a < b) ? a : b;


static inline int64_t imax64(int64_t a, int64_t b)

    return (a > b) ? a : b;


static inline int iclamp(int v, int minv, int maxv)

    return imax(minv, imin(v, maxv));


static inline double dclamp(double a, double min, double max)

    if (a < min)
        return min;
    if (a > max)
        return max;
    return a;


static inline int fltcmp (float f1, float f2)

    float epsilon = f1-f2;
    if (epsilon < 0.0)
        return -1;
    else if (epsilon > 0.0)
        return  1;
    else
        return  0;


static inline int dblcmp (double d1, double d2)

    double epsilon = d1-d2;
    if (epsilon < 0.0)
        return -1;
    else if (epsilon > 0.0)
        return  1;
    else
        return  0;


#ifdef __cplusplus

 }
{$endif}

// === Konventiert am: 12-9-26 17:22:34 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function to_radians(x : longint) : longint;
begin
  to_radians:=x*(M_PI/180.0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function to_degrees(x : longint) : longint;
begin
  to_degrees:=x*(180.0/M_PI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function max(A,B : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if B then
    if_local1:=B
  else
    if_local1:=A;
  max:=A<(if_local1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function min(A,B : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if B then
    if_local1:=A
  else
    if_local1:=B;
  min:=A<(if_local1);
end;


end.
