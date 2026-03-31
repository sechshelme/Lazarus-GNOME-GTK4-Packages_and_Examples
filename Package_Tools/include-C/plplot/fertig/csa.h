//--------------------------------------------------------------------------
//
// File:           csa.h
//
// Created:        16/10/2002
//
// Author:         Pavel Sakov
//                 CSIRO Marine Research
//
// Purpose:        A header for csa library (2D data approximation with
//                 bivariate C1 cubic spline)
//
// Revisions:      None
//
//--------------------------------------------------------------------------

#if !defined ( _CSA_H )
#define _CSA_H

// include header file for dll definitions
#include "csadll.h"

#if _MSC_VER > 1309
  #define hypot    _hypot
#endif

#if !defined ( _POINT_STRUCT )
#define _POINT_STRUCT
typedef struct
{
    double x;
    double y;
    double z;
} point;
#endif

extern int       csa_verbose;
extern const char* csa_version;

struct csa;
typedef struct csa   csa;

extern
csa* csa_create( void );
extern
void csa_destroy( csa* a );
extern
void csa_addpoints( csa* a, int n, point points[] );
extern
void csa_calculatespline( csa* a );
extern
void csa_approximate_point( csa* a, point* p );
extern
void csa_approximate_points( csa* a, int n, point* points );

extern
void csa_setnpmin( csa* a, int npmin );
extern
void csa_setnpmax( csa* a, int npmax );
extern
void csa_setk( csa* a, int k );
extern
void csa_setnpps( csa* a, double npps );

#endif
