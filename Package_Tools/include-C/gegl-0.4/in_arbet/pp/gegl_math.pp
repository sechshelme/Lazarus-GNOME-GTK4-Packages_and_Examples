
unit gegl_math;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_math.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_math.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ xxxxxxxx


static inline float gegl_fabsf (float x)

  union 
   float f;
   guint32 i;
   u = x;
  u.i &= 0x7fffffff;
  return u.f;


static inline double gegl_fabs (double x)

  union 
   double d;
   guint64 i;
   u = x;
  u.i &= 0x7fffffffffffffff;
  return u.d;


static inline float gegl_floorf (float x)

  int i = (int)x;       
  return i - ( i > x ); 


static inline float gegl_ceilf (float x)

  return - gegl_floorf (-x);


static inline double gegl_floor (double x)

  gint64 i = (gint64)x; 
  return i - ( i > x ); 


static inline double  gegl_ceil (double x)

  return - gegl_floor (-x);


static inline float gegl_fmodf (float x, float y)

  return x - y * gegl_floorf (x/y);


static inline double gegl_fmod (double x, double y)

  return x - y * gegl_floor (x/y);


  }

const
  blublu = xxxxxx;  

implementation


end.
