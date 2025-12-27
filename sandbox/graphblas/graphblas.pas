unit graphblas;

interface

const
  {$IFDEF linux}
  libgraphblas = 'graphblas';
  {$ENDIF}

  {$IFDEF windows}
  libgraphblas = 'graphblas.dll'; // ??????
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  GxB_STDC_VERSION = 199001;  

type
  TGxB_FC32_t=record
      re,im:Single;
  end;
  PGxB_FC32_t=^TGxB_FC32_t;

  TGxB_FC64_t=record
      re,im:Double;
  end;
  PGxB_FC64_t=^TGxB_FC64_t;

function GxB_VERSION(major,minor,sub : longint) : longint;

const
  GxB_IMPLEMENTATION_NAME = 'SuiteSparse:GraphBLAS';  
  GxB_IMPLEMENTATION_DATE = 'Dec 23, 2022';  
  GxB_IMPLEMENTATION_MAJOR = 7;  
  GxB_IMPLEMENTATION_MINOR = 4;  
  GxB_IMPLEMENTATION_SUB = 0;  
  GxB_SPEC_DATE = 'Nov 15, 2021';  
  GxB_SPEC_MAJOR = 2;  
  GxB_SPEC_MINOR = 0;  
  GxB_SPEC_SUB = 0;  
  GRB_VERSION = GxB_SPEC_MAJOR;
  GRB_SUBVERSION = GxB_SPEC_MINOR;  

function GxB_IMPLEMENTATION : longint;

function GxB_SPEC_VERSION : longint;

type
  PGrB_Index = ^TGrB_Index;
  TGrB_Index = Tuint64_t;

function GrB_INDEX_MAX : longint;

function GxB_INDEX_MAX : TGrB_Index;

type
  PGrB_Info = ^TGrB_Info;
  TGrB_Info =  Longint;
  Const
    GrB_SUCCESS = 0;
    GrB_NO_VALUE = 1;
    GxB_EXHAUSTED = 2;
    GrB_UNINITIALIZED_OBJECT = -(1);
    GrB_NULL_POINTER = -(2);
    GrB_INVALID_VALUE = -(3);
    GrB_INVALID_INDEX = -(4);
    GrB_DOMAIN_MISMATCH = -(5);
    GrB_DIMENSION_MISMATCH = -(6);
    GrB_OUTPUT_NOT_EMPTY = -(7);
    GrB_NOT_IMPLEMENTED = -(8);
    GrB_PANIC = -(101);
    GrB_OUT_OF_MEMORY = -(102);
    GrB_INSUFFICIENT_SPACE = -(103);
    GrB_INVALID_OBJECT = -(104);
    GrB_INDEX_OUT_OF_BOUNDS = -(105);
    GrB_EMPTY_OBJECT = -(106);
type
  PGrB_Mode = ^TGrB_Mode;
  TGrB_Mode =  Longint;
  Const
    GrB_NONBLOCKING = 0;
    GrB_BLOCKING = 1;
    GxB_NONBLOCKING_GPU = 2;
    GxB_BLOCKING_GPU = 3;

function GrB_init(mode:TGrB_Mode):TGrB_Info;cdecl;external libgraphblas;
function GxB_init(mode:TGrB_Mode; user_malloc_function:function (para1:Tsize_t):pointer; user_calloc_function:function (para1:Tsize_t; para2:Tsize_t):pointer; user_realloc_function:function (para1:pointer; para2:Tsize_t):pointer; user_free_function:procedure (para1:pointer)):TGrB_Info;cdecl;external libgraphblas;
function GrB_finalize:TGrB_Info;cdecl;external libgraphblas;
function GrB_getVersion(version:Pdword; subversion:Pdword):TGrB_Info;cdecl;external libgraphblas;
const
  GxB_NTHREADS = 5;  
  GxB_CHUNK = 7;  
  GxB_GPU_CONTROL = 21;
  GxB_GPU_CHUNK = 22;  
type
  PGrB_Desc_Field = ^TGrB_Desc_Field;
  TGrB_Desc_Field =  Longint;
  Const
    GrB_OUTP = 0;
    GrB_MASK = 1;
    GrB_INP0 = 2;
    GrB_INP1 = 3;
    GxB_DESCRIPTOR_NTHREADS = GxB_NTHREADS;
    GxB_DESCRIPTOR_CHUNK = GxB_CHUNK;
    GxB_DESCRIPTOR_GPU_CONTROL = GxB_GPU_CONTROL;
    GxB_DESCRIPTOR_GPU_CHUNK = GxB_GPU_CHUNK;
    GxB_AxB_METHOD = 1000;
    GxB_SORT = 35;
    GxB_COMPRESSION = 36;
    GxB_IMPORT = 37;
type
  PGrB_Desc_Value = ^TGrB_Desc_Value;
  TGrB_Desc_Value =  Longint;
  Const
    GxB_DEFAULT = 0;
    GrB_REPLACE = 1;
    GrB_COMP = 2;
    GrB_STRUCTURE = 4;
    GrB_TRAN = 3;
    GxB_GPU_ALWAYS = 2001;
    GxB_GPU_NEVER = 2002;
    GxB_AxB_GUSTAVSON = 1001;
    GxB_AxB_DOT = 1003;
    GxB_AxB_HASH = 1004;
    GxB_AxB_SAXPY = 1005;
    GxB_SECURE_IMPORT = 502;
  GxB_FAST_IMPORT = GxB_DEFAULT;
type
  PGrB_Descriptor = ^TGrB_Descriptor;
  TGrB_Descriptor = PGB_Descriptor_opaque;

function GrB_Descriptor_new(descriptor:PGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
function GrB_Descriptor_set(desc:TGrB_Descriptor; field:TGrB_Desc_Field; val:TGrB_Desc_Value):TGrB_Info;cdecl;external libgraphblas;
function GxB_Descriptor_get(val:PGrB_Desc_Value; desc:TGrB_Descriptor; field:TGrB_Desc_Field):TGrB_Info;cdecl;external libgraphblas;
function GxB_Desc_set(desc:TGrB_Descriptor; field:TGrB_Desc_Field):TGrB_Info;cdecl;v;external libgraphblas;
function GxB_Desc_set_INT32(desc:TGrB_Descriptor; field:TGrB_Desc_Field; value:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Desc_set_FP64(desc:TGrB_Descriptor; field:TGrB_Desc_Field; value:Tdouble):TGrB_Info;cdecl;external libgraphblas;
function GxB_Desc_get(desc:TGrB_Descriptor; field:TGrB_Desc_Field):TGrB_Info;cdecl;va;external libgraphblas;
function GxB_Desc_get_INT32(desc:TGrB_Descriptor; field:TGrB_Desc_Field; value:Pint32_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Desc_get_FP64(desc:TGrB_Descriptor; field:TGrB_Desc_Field; value:Pdouble):TGrB_Info;cdecl;external libgraphblas;
function GrB_Descriptor_free(descriptor:PGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ Predefined descriptors and their values: }
{ OUTP         MASK           MASK       INP0      INP1 }
{              structural     complement }
{ ===========  ============== ========== ========  ======== }
{ GrB_NULL        // -            -              -          -         - }
{ -            -              -          -         GrB_TRAN }
{ -            -              -          GrB_TRAN  - }
{ -            -              -          GrB_TRAN  GrB_TRAN }
{ -            -              GrB_COMP   -         - }
{ -            -              GrB_COMP   -         GrB_TRAN }
{ -            -              GrB_COMP   GrB_TRAN  - }
{ -            -              GrB_COMP   GrB_TRAN  GrB_TRAN }
{ -            GrB_STRUCTURE  -          -         - }
{ -            GrB_STRUCTURE  -          -         GrB_TRAN }
{ -            GrB_STRUCTURE  -          GrB_TRAN  - }
{ -            GrB_STRUCTURE  -          GrB_TRAN  GrB_TRAN }
{ -            GrB_STRUCTURE  GrB_COMP   -         - }
{ -            GrB_STRUCTURE  GrB_COMP   -         GrB_TRAN }
{ -            GrB_STRUCTURE  GrB_COMP   GrB_TRAN  - }
{ -            GrB_STRUCTURE  GrB_COMP   GrB_TRAN  GrB_TRAN }
{ GrB_REPLACE  -              -          -         - }
{ GrB_REPLACE  -              -          -         GrB_TRAN }
{ GrB_REPLACE  -              -          GrB_TRAN  - }
{ GrB_REPLACE  -              -          GrB_TRAN  GrB_TRAN }
{ GrB_REPLACE  -              GrB_COMP   -         - }
{ GrB_REPLACE  -              GrB_COMP   -         GrB_TRAN }
{ GrB_REPLACE  -              GrB_COMP   GrB_TRAN  - }
{ GrB_REPLACE  -              GrB_COMP   GrB_TRAN  GrB_TRAN }
{ GrB_REPLACE  GrB_STRUCTURE  -          -         - }
{ GrB_REPLACE  GrB_STRUCTURE  -          -         GrB_TRAN }
{ GrB_REPLACE  GrB_STRUCTURE  -          GrB_TRAN  - }
{ GrB_REPLACE  GrB_STRUCTURE  -          GrB_TRAN  GrB_TRAN }
{ GrB_REPLACE  GrB_STRUCTURE  GrB_COMP   -         - }
{ GrB_REPLACE  GrB_STRUCTURE  GrB_COMP   -         GrB_TRAN }
{ GrB_REPLACE  GrB_STRUCTURE  GrB_COMP   GrB_TRAN  - }
  var
    GrB_DESC_T1 : TGrB_Descriptor;cvar;external libgraphblas;
{ GrB_REPLACE  GrB_STRUCTURE  GrB_COMP   GrB_TRAN  GrB_TRAN }
{ GrB_NULL is the default descriptor, with all settings at their defaults: }
{ }
{      OUTP: do not replace the output }
{      MASK: mask is valued and not complemented }
{      INP0: first input not transposed }
{      INP1: second input not transposed }
{ Predefined descriptors may not be modified or freed.  Attempting to modify }
{ them results in an error (GrB_INVALID_VALUE).  Attempts to free them are }
{ silently ignored. }
{============================================================================== }
{ GrB_Type: data types }
{============================================================================== }
type
  PGrB_Type = ^TGrB_Type;
  TGrB_Type = PGB_Type_opaque;
{ GraphBLAS predefined types and their counterparts in pure C: }
{ in C: bool }
{ in C: int8_t }
{ in C: int16_t }
{ in C: int32_t }
{ in C: int64_t }
{ in C: uint8_t }
{ in C: uint16_t }
{ in C: uint32_t }
{ in C: uint64_t }
{ in C: float }
{ in C: double }
{ in C: float complex }
  var
    GrB_BOOL : TGrB_Type;cvar;external libgraphblas;
{ in C: double complex }
{------------------------------------------------------------------------------ }
{ helper macros for polymorphic functions }
{------------------------------------------------------------------------------ }
{xxxxxxxxxxxxxxxx
#define GB_CAT(w,x,y,z) w ## x ## y ## z
#define GB_CONCAT(w,x,y,z) GB_CAT (w, x, y, z)

#if GxB_STDC_VERSION >= 201112L
#define GB_CASES(p,prefix,func)                                         \
        const bool       p : GB_CONCAT ( prefix, _, func, _BOOL   ),    \
              bool       p : GB_CONCAT ( prefix, _, func, _BOOL   ),    \
        const int8_t     p : GB_CONCAT ( prefix, _, func, _INT8   ),    \
              int8_t     p : GB_CONCAT ( prefix, _, func, _INT8   ),    \
        const int16_t    p : GB_CONCAT ( prefix, _, func, _INT16  ),    \
              int16_t    p : GB_CONCAT ( prefix, _, func, _INT16  ),    \
        const int32_t    p : GB_CONCAT ( prefix, _, func, _INT32  ),    \
              int32_t    p : GB_CONCAT ( prefix, _, func, _INT32  ),    \
        const int64_t    p : GB_CONCAT ( prefix, _, func, _INT64  ),    \
              int64_t    p : GB_CONCAT ( prefix, _, func, _INT64  ),    \
        const uint8_t    p : GB_CONCAT ( prefix, _, func, _UINT8  ),    \
              uint8_t    p : GB_CONCAT ( prefix, _, func, _UINT8  ),    \
        const uint16_t   p : GB_CONCAT ( prefix, _, func, _UINT16 ),    \
              uint16_t   p : GB_CONCAT ( prefix, _, func, _UINT16 ),    \
        const uint32_t   p : GB_CONCAT ( prefix, _, func, _UINT32 ),    \
              uint32_t   p : GB_CONCAT ( prefix, _, func, _UINT32 ),    \
        const uint64_t   p : GB_CONCAT ( prefix, _, func, _UINT64 ),    \
              uint64_t   p : GB_CONCAT ( prefix, _, func, _UINT64 ),    \
        const float      p : GB_CONCAT ( prefix, _, func, _FP32   ),    \
              float      p : GB_CONCAT ( prefix, _, func, _FP32   ),    \
        const double     p : GB_CONCAT ( prefix, _, func, _FP64   ),    \
              double     p : GB_CONCAT ( prefix, _, func, _FP64   ),    \
        const GxB_FC32_t p : GB_CONCAT ( GxB   , _, func, _FC32   ),    \
              GxB_FC32_t p : GB_CONCAT ( GxB   , _, func, _FC32   ),    \
        const GxB_FC64_t p : GB_CONCAT ( GxB   , _, func, _FC64   ),    \
              GxB_FC64_t p : GB_CONCAT ( GxB   , _, func, _FC64   ),    \
        const void       * : GB_CONCAT ( prefix, _, func, _UDT    ),    \
              void       * : GB_CONCAT ( prefix, _, func, _UDT    )
#endif
 }
{------------------------------------------------------------------------------ }
{ GrB_Type_new:  create a new type }
{------------------------------------------------------------------------------ }
{ GrB_Type_new is implemented both as a macro and a function.  Both are }
{ user-callable.  The default is to use the macro, since this allows the name }
{ of the type to be saved as a string, for subsequent error reporting by }
{ GrB_error. }
{$undef GrB_Type_new}
{$undef GrM_Type_new}
{ create a new GraphBLAS type }
{ handle of user type to create }
{ size = sizeof (ctype) of the C type }

function Type_new(_type:PGrB_Type; sizeof_ctype:Tsize_t):TGrB_Info;cdecl;external libgraphblas;
{ user code should not directly use GB_STR or GB_XSTR }
{ GB_STR: convert the content of x into a string "x" }
{xxxxxxxxxxxxxxxxx
#define GB_XSTR(x) GB_STR(x)
#define GB_STR(x) #x

#define GrB_Type_new(utype, sizeof_ctype) \  GxB_Type_new(utype, sizeof_ctype, GB_STR(sizeof_ctype), NULL)
#define GrM_Type_new(utype, sizeof_ctype) \  GxB_Type_new(utype, sizeof_ctype, GB_STR(sizeof_ctype), NULL)
 }
{ GxB_Type_new creates a type with a name and definition that are known to }
{ GraphBLAS, as strings.  The type_name is any valid string (max length of 128 }
{ characters, including the required null-terminating character) that may }
{ appear as the name of a C type created by a C "typedef" statement.  It must }
{ not contain any white-space characters.  Example, creating a type of size }
{ 16*4+4 = 68 bytes, with a 4-by-4 dense float array and a 32-bit integer: }
{ }
{      typedef struct  float x [4][4] ; int color ;  myquaternion ; }
{      GrB_Type MyQtype ; }
{      GxB_Type_new (&MyQtype, sizeof (myquaternion), "myquaternion", }
{          "typedef struct  float x [4][4] ; int color ;  myquaternion ;") ; }
{ }
{ The type_name and type_defn are both null-terminated strings.  Currently, }
{ type_defn is unused, but it will be required for best performance when a JIT }
{ is implemented in SuiteSparse:GraphBLAS (both on the CPU and GPU).  User }
{ defined types created by GrB_Type_new will not work with a JIT. }
{ }
{ At most GxB_MAX_NAME_LEN characters are accessed in type_name; characters }
{ beyond that limit are silently ignored. }
const
  GxB_MAX_NAME_LEN = 128;  
{ create a new named GraphBLAS type }
{ handle of user type to create }
{ size = sizeof (ctype) of the C type }
{ name of the type (max 128 characters) }
{ typedef for the type (no max length) }

function GxB_Type_new(_type:PGrB_Type; sizeof_ctype:Tsize_t; type_name:Pchar; type_defn:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ GB_Type_new is historical: use GxB_Type_new instead }
{ not user-callable }
{ handle of user type to create }
{ size of the user type }
{ name of the type, as "sizeof (ctype)" }
function GB_Type_new(_type:PGrB_Type; sizeof_ctype:Tsize_t; type_name:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ return the name of a GraphBLAS type }
{ name of the type (char array of size at least }
{ GxB_MAX_NAME_LEN, owned by the user application). }
function GxB_Type_name(type_name:Pchar; _type:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{ determine the size of the type }
{ the sizeof the type }
{ type to determine the sizeof }
function GxB_Type_size(size:Psize_t; _type:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{ return the built-in GrB_Type from a name }
{ built-in type, or NULL if user-defined }
{ array of size at least GxB_MAX_NAME_LEN }
function GxB_Type_from_name(_type:PGrB_Type; type_name:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ free a user-defined type }
{ handle of user-defined type to free }
function GrB_Type_free(_type:PGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_UnaryOp: unary operators }
{============================================================================== }
{ GrB_UnaryOp: a function z=f(x).  The function f must have the signature: }
{      void f (void *z, const void *x) ; }
{ The pointers are void * but they are always of pointers to objects of type }
{ ztype and xtype, respectively.  The function must typecast its arguments as }
{ needed from void* to ztype* and xtype*. }
type
  PGrB_UnaryOp = ^TGrB_UnaryOp;
  TGrB_UnaryOp = PGB_UnaryOp_opaque;
{------------------------------------------------------------------------------ }
{ built-in unary operators, z = f(x) }
{------------------------------------------------------------------------------ }
{ For these functions z=f(x), z and x have the same type. }
{ The suffix in the name is the type of x and z. }
{ z = x             z = -x             z = 1/x             z = ! (x != 0) }
{ identity          additive           multiplicative      logical }
{                   inverse            inverse             negation }
{ complex unary operators: }
{ no LNOT }
{ for complex }
{ z = 1             z = abs(x)         z = bnot(x)         z = signum }
{ one               absolute value     bitwise negation }
{ complex unary operators: }
{ for complex types, z = abs(x) }
{ is real; listed below. }
{ Boolean negation, z = !x, where both z and x are boolean.  There is no }
{ suffix since z and x are only boolean.  This operator is identical to }
{ GxB_LNOT_BOOL; it just has a different name. }
  var
    GrB_IDENTITY_BOOL : TGrB_UnaryOp;cvar;external libgraphblas;
{ GxB_ABS is now in the v1.3 spec, the following names are historical: }
{ z = abs(x) }
    GxB_ABS_BOOL : TGrB_UnaryOp;cvar;external libgraphblas;
{------------------------------------------------------------------------------ }
{ Unary operators for floating-point types only }
{------------------------------------------------------------------------------ }
{ The following floating-point unary operators and their ANSI C11 equivalents, }
{ are only defined for floating-point (real and complex) types. }
{-------------------------------------------------------------------------- }
{ z = f(x) where z and x have the same type (all 4 floating-point types) }
{-------------------------------------------------------------------------- }
{ z = sqrt (x)     z = log (x)         z = exp (x)         z = log2 (x) }
{ z = sin (x)      z = cos (x)         z = tan (x) }
{ z = acos (x)     z = asin (x)        z = atan (x) }
{ z = sinh (x)     z = cosh (x)        z = tanh (x) }
{ z = acosh (x)    z = asinh (x)       z = atanh (x)       z = signum (x) }
{ z = ceil (x)     z = floor (x)       z = round (x)       z = trunc (x) }
{ z = exp2 (x)     z = expm1 (x)       z = log10 (x)       z = log1p (x) }
{-------------------------------------------------------------------------- }
{ z = f(x) where z and x are the same type (floating-point real only) }
{-------------------------------------------------------------------------- }
{ z = lgamma (x)   z = tgamma (x)      z = erf (x)         z = erfc (x) }
{ z = cbrt (x) }
{ frexpx and frexpe return the mantissa and exponent, respectively, }
{ from the ANSI C11 frexp function.  The exponent is returned as a }
{ floating-point value, not an integer. }
{ z = frexpx (x)   z = frexpe (x) }
{-------------------------------------------------------------------------- }
{ z = f(x) where z and x are the same type (complex only) }
{-------------------------------------------------------------------------- }
{ z = conj (x) }
{-------------------------------------------------------------------------- }
{ z = f(x) where z is real and x is complex: }
{-------------------------------------------------------------------------- }
{ z = creal (x)    z = cimag (x)       z = carg (x)       z = abs (x) }
{-------------------------------------------------------------------------- }
{ z = f(x) where z is bool and x is any floating-point type }
{-------------------------------------------------------------------------- }
{ z = isinf (x) }
{ isinf (creal (x)) || isinf (cimag (x)) }
{ isinf (creal (x)) || isinf (cimag (x)) }
{ z = isnan (x) }
{ isnan (creal (x)) || isnan (cimag (x)) }
{ isnan (creal (x)) || isnan (cimag (x)) }
{ z = isfinite (x) }
{ isfinite (real (x)) && isfinite (cimag (x)) }
    GxB_SQRT_FP32 : TGrB_UnaryOp;cvar;external libgraphblas;
{ isfinite (real (x)) && isfinite (cimag (x)) }
{------------------------------------------------------------------------------ }
{ methods for unary operators }
{------------------------------------------------------------------------------ }
type

  TGxB_unary_function = procedure (para1:pointer; para2:pointer);cdecl;
{ GrB_UnaryOp_new creates a user-defined unary op, with an automatic }
{ detection of the operator name. }
{$undef GrB_UnaryOp_new}
{$undef GrM_UnaryOp_new}
{ create a new user-defined unary operator }
{ handle for the new unary operator }
{ pointer to the unary function }
{ type of output z }
{ type of input x }

function UnaryOp_new(unaryop:PGrB_UnaryOp; _function:TGxB_unary_function; ztype:TGrB_Type; xtype:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{xxxxxxxxxxx#define GrB_UnaryOp_new(op,f,z,x) \ GxB_UnaryOp_new(op,f,z,x, GB_STR(f), NULL) }
{xxxxxxxxxx#define GrM_UnaryOp_new(op,f,z,x) \ GxM_UnaryOp_new(op,f,z,x, GB_STR(f), NULL) }
{ GxB_UnaryOp_new creates a named user-defined unary op. }
{ create a new user-defined unary operator }
{ handle for the new unary operator }
{ pointer to the unary function }
{ type of output z }
{ type of input x }
{ name of the user function }
{ definition of the user function }
function GxB_UnaryOp_new(unaryop:PGrB_UnaryOp; _function:TGxB_unary_function; ztype:TGrB_Type; xtype:TGrB_Type; unop_name:Pchar; 
           unop_defn:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ GB_UnaryOp_new is historical: use GxB_UnaryOp_new instead }
{ not user-callable }
{ handle for the new unary operator }
{ pointer to the unary function }
{ type of output z }
{ type of input x }
{ name of the user function }
function GB_UnaryOp_new(unaryop:PGrB_UnaryOp; _function:TGxB_unary_function; ztype:TGrB_Type; xtype:TGrB_Type; unop_name:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ GxB_UnaryOp_ztype is historical.  Use GxB_UnaryOp_ztype_name instead. }
{ return the type of z }
{ return type of output z }
{ unary operator }
function GxB_UnaryOp_ztype(ztype:PGrB_Type; unaryop:TGrB_UnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of z }
{ user array of size GxB_MAX_NAME_LEN }
{ unary operator }
function GxB_UnaryOp_ztype_name(type_name:Pchar; unaryop:TGrB_UnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ GxB_UnaryOp_xtype is historical.  Use GxB_UnaryOp_xtype_name instead. }
{ return the type of x }
{ return type of input x }
{ unary operator }
function GxB_UnaryOp_xtype(xtype:PGrB_Type; unaryop:TGrB_UnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of x }
{ user array of size GxB_MAX_NAME_LEN }
{ unary operator }
function GxB_UnaryOp_xtype_name(type_name:Pchar; unaryop:TGrB_UnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ free a user-created unary operator }
{ handle of unary operator to free }
function GrB_UnaryOp_free(unaryop:PGrB_UnaryOp):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_BinaryOp: binary operators }
{============================================================================== }
{ GrB_BinaryOp: a function z=f(x,y).  The function f must have the signature: }
{      void f (void *z, const void *x, const void *y) ; }
{ The pointers are void * but they are always of pointers to objects of type }
{ ztype, xtype, and ytype, respectively.  See Demo/usercomplex.c for examples. }
type
  PGrB_BinaryOp = ^TGrB_BinaryOp;
  TGrB_BinaryOp = PGB_BinaryOp_opaque;
{------------------------------------------------------------------------------ }
{ built-in binary operators, z = f(x,y), where x,y,z all have the same type }
{------------------------------------------------------------------------------ }
{ operators for all 13 types (including complex): }
{ GxB_PAIR_T and GrB_ONEB_T are identical; the latter was added to the }
{ v2.0 C API Specification. }
{ z = x            z = y               z = 1               z = pow (x,y) }
{ complex: }
{ z = x+y          z = x-y             z = x*y             z = x/y }
{ complex: }
{ z = y-x          z = y/x             z = 1               z = any(x,y) }
{ complex: }
{ The GxB_IS* comparators z=f(x,y) return the same type as their }
{ inputs.  Each of them compute z = (x OP y), where x, y, and z all have }
{ the same type.  The value z is either 1 for true or 0 for false, but it }
{ is a value with the same type as x and y. }
{ z = (x == y)     z = (x != y) }
{ complex: }
{ z = (x > y)      z = (x < y)         z = (x >= y)     z = (x <= y) }
{ z = min(x,y)     z = max (x,y) }
{ Binary operators for each of the 11 real types: }
{ The operators convert non-boolean types internally to boolean and return }
{ a value 1 or 0 in the same type, for true or false.  Each computes z = }
{ ((x != 0) OP (y != 0)), where x, y, and z all the same type.  These }
{ operators are useful as multiplicative operators when combined with }
{ non-boolean monoids of the same type. }
{ z = (x || y)     z = (x && y)        z = (x != y) }
{ Binary operators that operate only on boolean types: LOR, LAND, LXOR, }
{ and LXNOR.  The naming convention differs (_BOOL is not appended to the }
{ name).  They are the same as GxB_LOR_BOOL, GxB_LAND_BOOL, and }
{ GxB_LXOR_BOOL, and GrB_EQ_BOOL, respectively. }
{ z = (x || y)     z = (x && y)        z = (x != y)        z = (x == y) }
{ Operators for floating-point reals: }
{ z = atan2(x,y)   z = hypot(x,y)      z = fmod(x,y)   z = remainder(x,y) }
{ z = ldexp(x,y)   z = copysign (x,y) }
{ Bitwise operations on signed and unsigned integers: note that }
{ bitwise operations on signed integers can lead to different results, }
{ depending on your compiler; results are implementation-defined. }
{ z = (x | y)      z = (x & y)         z = (x ^ y)        z = ~(x ^ y) }
{ z = bitget(x,y)  z = bitset(x,y)     z = bitclr(x,y) }
  var
    GrB_FIRST_BOOL : TGrB_BinaryOp;cvar;external libgraphblas;
{------------------------------------------------------------------------------ }
{ z=f(x,y) where z and x have the same type, but y is GrB_INT8 }
{------------------------------------------------------------------------------ }
{ z = bitshift (x,y) computes z = x left-shifted by y bits if y >= 0, or z }
{ = x right-shifted by (-y) bits if y < 0.  z is equal to x if y is zero. }
{ z and x have the same type, as given by the suffix on the operator name. }
{ Since y must be signed, it cannot have the same type as x when x is }
{ unsigned; it is always GrB_INT8 for all 8 versions of this operator. }
{ The GxB_BSHIFT_* operators compute the arithmetic shift, and produce the }
{ same results as the bitshift.m function, for all possible inputs. }
{ z = bitshift(x,y) }
    GxB_BSHIFT_INT8 : TGrB_BinaryOp;cvar;external libgraphblas;
{------------------------------------------------------------------------------ }
{ z=f(x,y) where z is BOOL and the type of x,y is given by the suffix }
{------------------------------------------------------------------------------ }
{ Six comparators z=f(x,y) return their result as boolean, but }
{ where x and y have the same type.  The suffix in their names refers to }
{ the type of x and y since z is always boolean.  If used as multiply }
{ operators in a semiring, they can only be combined with boolean monoids. }
{ The _BOOL versions of these operators give the same results as their }
{ IS*_BOOL counterparts.  GrB_EQ_BOOL and GrB_LXNOR are identical. }
{ z = (x == y)     z = (x != y)        z = (x > y)         z = (x < y) }
{ complex: }
{ z = (x >= y)     z = (x <= y) }
    GrB_EQ_BOOL : TGrB_BinaryOp;cvar;external libgraphblas;
{------------------------------------------------------------------------------ }
{ z=f(x,y) where z is complex and the type of x,y is given by the suffix }
{------------------------------------------------------------------------------ }
{ z = cmplx (x,y) }
    GxB_CMPLX_FP32 : TGrB_BinaryOp;cvar;external libgraphblas;
{============================================================================== }
{ positional GrB_UnaryOp and GrB_BinaryOp operators }
{============================================================================== }
{ Positional operators do not depend on the value of an entry, but its row or }
{ column index in the matrix instead.  For example, for an entry A(i,j), }
{ first_i(A(i,j),y) is equal to i.  These operators are useful for returning }
{ node id's as the result of a semiring operation.  If used as a mask, zero }
{ has a special value, and thus z=first_i1(A(i,j),j) returns i+1 instead of i. }
{ This can be useful when using a positional operator to construct a mask }
{ matrix or vector for another GraphBLAS operation.  It is also essential for }
{ the @GrB interface, since the user view of matrix indices in @GrB is }
{ 1-based, not 0-based. }
{ When applied to a vector, j is always equal to 0.  For a GxB_SCALAR, }
{ both i and j are always zero. }
{ GraphBLAS defines a GrB_Index as uint64_t, but these operators return a }
{ GrB_INT32 or GrB_INT64 type, which is more flexible to use because the }
{ result of this operator can be negated, to flag an entry for example.  The }
{ value -1 can be used to denote "no node" or "no position".  GrB_INT32 is }
{ useful for graphs smaller than 2^31 nodes.  If the row or column index }
{ exceeds INT32_MAX, the result is determined by the typecast from the }
{ 64-bit index to the smaller 32-bit index. }
{ Positional operators cannot be used to construct monoids.  They can be used }
{ as multiplicative operators in semirings, and as operators for GrB_eWise*, }
{ and GrB_apply (bind first or second).  For the latter, the operator cannot }
{ depend on the bound scalar. }
{ When used as multiplicative operators in a semiring, FIRSTJ and SECONDI }
{ are identical.  If C(i,j) += t is computed where t = A(i,k)*B(k,j), then }
{ t = k in both cases.  Likewise, FIRSTJ1 and SECONDI1 are identical. }
{ z = first_i(A(i,j),y) == i }
{ z = first_i1(A(i,j),y) == i+1 }
{ z = first_j(A(i,j),y) == j }
{ z = first_j1(A(i,j),y) == j+1 }
{ z = second_i(x,B(i,j)) == i }
{ z = second_i1(x,B(i,j)) == i+1 }
{ z = second_j(x,B(i,j)) == j }
    GxB_FIRSTI_INT32 : TGrB_BinaryOp;cvar;external libgraphblas;
{ z = second_j1(x,B(i,j)) == j+1 }
{ z=position_i(A(i,j)) == i }
{ z=position_i1(A(i,j)) == i+1 }
{ z=position_j(A(i,j)) == j }
    GxB_POSITIONI_INT32 : TGrB_UnaryOp;cvar;external libgraphblas;
{ z=position_j1(A(i,j)) == j+1 }
{============================================================================== }
{ special GrB_BinaryOp for build methods only }
{============================================================================== }
{ In GrB*build* methods, passing dup as NULL means that no duplicates are }
{ tolerated.  If duplicates appear, an error is returned.  If dup is a binary }
{ operator, it is applied to reduce duplicates to a single value.  The }
{ GxB_IGNORE_DUP is a special case.  It is not an operator, but an indication }
{ that any duplicates are to be ignored. }
    GxB_IGNORE_DUP : TGrB_BinaryOp;cvar;external libgraphblas;
{============================================================================== }
{ About boolean and bitwise binary operators }
{============================================================================== }
{ Some of the boolean operators compute the same thing with different names. }
{ For example, x*y and x&&y give the same results for boolean x and y. }
{ Operations such as x < y when x and y are boolean are treated as if true=1 }
{ and false=0.  Below is the truth table for all binary operators with boolean }
{ inputs.  This table is defined by how C typecasts boolean values for }
{ non-boolean operations.  For example, if x, y, and z are boolean, x = true, }
{ and y = true, then z = x + y = true + true = true.  DIV (x/y) is defined }
{ below.  RDIV (y/x) is shown as \ in the table; it is the same as 2nd. }
{  x y  1st 2nd min max +  -  *  /  or and xor eq ne > < ge le \ pow pair }
{  0 0  0   0   0   0   0  0  0  0  0  0   0   1  0  0 0 1  1  0 1   1 }
{  0 1  0   1   0   1   1  1  0  0  1  0   1   0  1  0 1 0  1  1 0   1 }
{  1 0  1   0   0   1   1  1  0  1  1  0   1   0  1  1 0 1  0  0 1   1 }
{  1 1  1   1   1   1   1  0  1  1  1  1   0   1  0  0 0 1  1  1 1   1 }
{ GraphBLAS includes a GrB_DIV_BOOL operator in its specification, but does }
{ not define what boolean "division" means.  SuiteSparse:GraphBLAS makes the }
{ following interpretation. }
{ GraphBLAS does not generate exceptions for divide-by-zero.  Floating-point }
{ divide-by-zero follows the IEEE 754 standard: 1/0 is +Inf, -1/0 is -Inf, and }
{ 0/0 is NaN.  For integer division by zero, if x is positive, x/0 is the }
{ largest integer, -x/0 is the integer minimum (zero for unsigned integers), }
{ and 0/0 is zero.  For example, for int8, 1/0 is 127, and -1/0 is -128.  For }
{ uint8, 1/0 is 255 and 0/0 is zero. }
{ Boolean division is treated as if it were an unsigned integer type with }
{ true=1 and false=0, and with the max and min value being 1 and 0.  As a }
{ result, GrB_IDENTITY_BOOL, GrB_AINV_BOOL, and GrB_MINV_BOOL all give the }
{ same result (z = x). }
{ With this convention for boolean "division", there are 11 unique binary }
{ operators that are purely boolean.  Other named *_BOOL operators are }
{ redundant but are included in GraphBLAS so that the name space of operators }
{ is complete.  Below is a list of all operators and their equivalents. }
{                   x: 0 0 1 1 }
{                   y: 0 1 0 1 }
{                   z: see below }
{ }
{      z = 0           0 0 0 0     (zero function, not predefined) }
{      z = (x && y)    0 0 0 1     AND, MIN, TIMES }
{      z = (x > y)     0 0 1 0     GT, ISGT, and set diff (x\y) }
{      z = x           0 0 1 1     FIRST, DIV }
{ }
{      z = (x < y)     0 1 0 0     LT, ISLT, and set diff (y\x) }
{      z = y           0 1 0 1     SECOND, RDIV }
{      z = (x != y)    0 1 1 0     XOR, MINUS, RMINUS, NE, ISNE }
{      z = (x || y)    0 1 1 1     OR, MAX, PLUS }
{ }
{      z = ~(x || y)   1 0 0 0     (nor(x,y) function, not predefined) }
{      z = (x == y)    1 0 0 1     LXNOR, EQ, ISEQ }
{      z = ~y          1 0 1 0     (not(y), not predefined) }
{      z = (x >= y)    1 0 1 1     GE, ISGE, POW, and "x implies y" }
{ }
{      z = ~x          1 1 0 0     (not(x), not predefined) }
{      z = (x <= y)    1 1 0 1     LE, ISLE, and "y implies x" }
{      z = ~(x && y)   1 1 1 0     (nand(x,y) function, not predefined) }
{      z = 1           1 1 1 1     PAIR, ONEB }
{ }
{      z = any(x,y)    0 . . 1     ANY (pick x or y arbitrarily) }
{ Four more that have no _BOOL suffix are also redundant with the operators }
{ of the form GxB_*_BOOL (GrB_LOR, GrB_LAND, GrB_LXOR, and GrB_LXNOR). }
{ Note that the boolean binary operator space is not complete.  Five other }
{ boolean functions could be pre-defined as well:  z = 0, nor(x,y), }
{ nand(x,y), not(x), and not(y). }
{ Four of the possible 16 bitwise operators are pre-defined: BOR, BAND, }
{ BXOR, and BXNOR.  This assumes that the computations for each bit are }
{ entirely independent (so BSHIFT would not fit in the table above). }
{------------------------------------------------------------------------------ }
{ methods for binary operators }
{------------------------------------------------------------------------------ }
type

  TGxB_binary_function = procedure (para1:pointer; para2:pointer; para3:pointer);cdecl;
{ GrB_BinaryOp_new creates a user-defined binary op, with an automatic }
{ detection of the operator name. }
{$undef GrB_BinaryOp_new}
{$undef GrM_BinaryOp_new}
{ handle for the new binary operator }
{ pointer to the binary function }
{ type of output z }
{ type of input x }
{ type of input y }

function BinaryOp_new(binaryop:PGrB_BinaryOp; _function:TGxB_binary_function; ztype:TGrB_Type; xtype:TGrB_Type; ytype:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrB_BinaryOp_new(op,f,z,x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrM_BinaryOp_new(op,f,z,x,y : longint) : longint;

{ GxB_BinaryOp_new creates a named user-defined binary op. }
{ handle for the new binary operator }
{ pointer to the binary function }
{ type of output z }
{ type of input x }
{ type of input y }
{ name of the user function }
{ definition of the user function }
function GxB_BinaryOp_new(op:PGrB_BinaryOp; _function:TGxB_binary_function; ztype:TGrB_Type; xtype:TGrB_Type; ytype:TGrB_Type; 
           binop_name:Pchar; binop_defn:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ GB_BinaryOp_new is historical: use GxB_BinaryOp_new instead }
{ not user-callable }
{ handle for the new binary operator }
{ pointer to the binary function }
{ type of output z }
{ type of input x }
{ type of input y }
{ name of the user function }
function GB_BinaryOp_new(binaryop:PGrB_BinaryOp; _function:TGxB_binary_function; ztype:TGrB_Type; xtype:TGrB_Type; ytype:TGrB_Type; 
           binop_name:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_BinaryOp_ztype is historical.  Use GxB_BinaryOp_ztype_name instead. }
{ return the type of z }
{ return type of output z }
{ binary operator to query }
function GxB_BinaryOp_ztype(ztype:PGrB_Type; binaryop:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of z }
{ user array of size GxB_MAX_NAME_LEN }
{ binary operator to query }
function GxB_BinaryOp_ztype_name(type_name:Pchar; binaryop:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_BinaryOp_xtype is historical.  Use GxB_BinaryOp_xtype_name instead. }
{ return the type of x }
{ return type of input x }
{ binary operator to query }
function GxB_BinaryOp_xtype(xtype:PGrB_Type; binaryop:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of x }
{ user array of size GxB_MAX_NAME_LEN }
{ binary operator to query }
function GxB_BinaryOp_xtype_name(type_name:Pchar; binaryop:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_BinaryOp_ytype is historical.  Use GxB_BinaryOp_ytype_name instead. }
{ return the type of y }
{ return type of input y }
{ binary operator to query }
function GxB_BinaryOp_ytype(ytype:PGrB_Type; binaryop:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of y }
{ user array of size GxB_MAX_NAME_LEN }
{ binary operator to query }
function GxB_BinaryOp_ytype_name(type_name:Pchar; binaryop:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ free a user-created binary operator }
{ handle of binary operator to free }
function GrB_BinaryOp_free(binaryop:PGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GxB_SelectOp: select operators (historical) }
{============================================================================== }
{ GrB_IndexUnaryOp should be used instead of GxB_SelectOp. }
{ GxB_SelectOp is an operator used by GxB_select to select entries from an }
{ input matrix A that are kept in the output C.  If an entry A(i,j) in the }
{ matrix A, of size nrows-by-ncols, has the value aij, then it calls the }
{ select function as result = f (i, j, aij, thunk).  If the function returns }
{ true, the entry is kept in the output C.  If f returns false, the entry is }
{ not kept in C.  The type of x for the GxB_SelectOp operator may be any of }
{ the 11 built-in types, or any user-defined type.  It may also be GrB_NULL, }
{ to indicate that the function is type-generic and does not depend at all on }
{ the value aij.  In this case, x is passed to f as a NULL pointer. }
{ The optional Thunk parameter to GxB_select is a GrB_Scalar.  For built-in }
{ select operators (TRIL, TRIU, DIAG, and OFFDIAG), Thunk must have any }
{ built-in type, and thunk = (int64_t) Thunk is used to specify the diagonal }
{ for these operators.  Thunk may be NULL, in which case its value is treated }
{ as zero, if it has a built-in type. The value of Thunk (if present) is not }
{ modified by any built-in select operator. }
{ For user-defined select operators, Thunk is not typecasted at all.  If }
{ the user operator is defined with a non-NULL Thunk input, then it must }
{ be non-NULL and of the same type, when calling GxB_select. }
{ GxB_SelectOp:  a function z=f(i,j,x,thunk) for the GxB_Select operation. }
{ The function f must have the signature: }
{      bool f (GrB_Index i, GrB_Index j, const void *x, const void *thunk) ; }
{ The values of i and j are guaranteed to be in the range 0 to }
{ GrB_INDEX_MAX, and they can be safely typecasted to int64_t then negated, }
{ if desired, without any risk of integer overflow. }
type
  PGxB_SelectOp = ^TGxB_SelectOp;
  TGxB_SelectOp = PGB_SelectOp_opaque;
{------------------------------------------------------------------------------ }
{ built-in select operators (historical) }
{------------------------------------------------------------------------------ }
{ GxB_select (C, Mask, accum, op, A, Thunk, desc) always returns a matrix C of }
{ the same size as A (or A' if GrB_TRAN is in the descriptor). }
{ C=tril(A,thunk):   returns true if ((j-i) <= thunk) }
{ C=triu(A,thunk):   returns true if ((j-i) >= thunk) }
{ C=diag(A,thunk):   returns true if ((j-i) == thunk) }
{ C=A-diag(A,thunk): returns true if ((j-i) != thunk) }
{ C=A(A ~= 0) }
{ C=A(A == 0) }
{ C=A(A >  0) }
{ C=A(A >= 0) }
{ C=A(A <  0) }
{ C=A(A <= 0) }
{ C=A(A ~= thunk) }
{ C=A(A == thunk) }
{ C=A(A >  thunk) }
{ C=A(A >= thunk) }
{ C=A(A <  thunk) }
  var
    GxB_TRIL : TGxB_SelectOp;cvar;external libgraphblas;
{ C=A(A <= thunk) }
{ For GxB_TRIL, GxB_TRIU, GxB_DIAG, and GxB_OFFDIAG, the parameter Thunk is a }
{ GrB_Scalar of any built-in type.  If GrB_NULL, or empty, Thunk is treated as }
{ zero.  Otherwise, the single entry is typecasted as (int64_t) Thunk. }
{ These select operators do not depend on the values of A, but just their }
{ position, and they work on matrices of any type. }
{ For GxB_*ZERO, the result depends only on the value of A(i,j).  The Thunk }
{ parameter to GxB_select is ignored and may be GrB_NULL. }
{ The operators GxB_TRIL, GxB_TRIU, GxB_DIAG, GxB_OFFDIAG, GxB_NONZERO, }
{ GxB_EQ_ZERO, GxB_NE_THUNK, and GxB_EQ_THUNK work on all built-in types and }
{ all user-defined types. }
{ GxB_GT_*, GxB_GE_*, GxB_LT_*, and GxB_LE_* only work on the 11 built-in }
{ types (not complex).  They cannot be used for user-defined types. }
{------------------------------------------------------------------------------ }
{ select operators: (historical) }
{------------------------------------------------------------------------------ }
{ User-defined GxB_SelectOps are historical.  New code should use }
{ GrB_IndexUnaryOp_new instead. }
{ return true if A(i,j) is kept }
{ row index of A(i,j) }
{ column index of A(i,j) }
{ value of A(i,j) }
{ optional input for select function }
type

  TGxB_select_function = function (i:TGrB_Index; j:TGrB_Index; x:pointer; thunk:pointer):Tbool;cdecl;
{$undef GxB_SelectOp_new}
{$undef GxM_SelectOp_new}
{ create a new user-defined select operator }
{ handle for the new select operator }
{ pointer to the select function }
{ type of input x, or NULL if type-generic }
{ type of thunk, or NULL if not used }

function SelectOp_new(selectop:PGxB_SelectOp; _function:TGxB_select_function; xtype:TGrB_Type; ttype:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_SelectOp_new(op,f,x,t : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxM_SelectOp_new(op,f,x,t : longint) : longint;

{ GB_SelectOp_new should not be called directly, but only through the }
{ GxB_SelectOp_new macro (but use GrB_IndexUnaryOp_new instead). }
{ not user-callable }
{ handle for the new select operator }
{ pointer to the select function }
{ type of input x }
{ type of thunk, or NULL if not used }
{ name of the underlying function }
function GB_SelectOp_new(selectop:PGxB_SelectOp; _function:TGxB_select_function; xtype:TGrB_Type; ttype:TGrB_Type; name:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ GxB_SelectOp_xtype is historical.  Use a GrB_IndexUnaryOp instead. }
{ return the type of x }
{ return type of input x }
{ select operator }
function GxB_SelectOp_xtype(xtype:PGrB_Type; selectop:TGxB_SelectOp):TGrB_Info;cdecl;external libgraphblas;
{ GxB_SelectOp_ttype is historical.  Use a GrB_IndexUnaryOp instead. }
{ return the type of thunk }
{ return type of input thunk }
{ select operator }
function GxB_SelectOp_ttype(ttype:PGrB_Type; selectop:TGxB_SelectOp):TGrB_Info;cdecl;external libgraphblas;
{ free a user-created select operator }
{ handle of select operator to free }
function GxB_SelectOp_free(selectop:PGxB_SelectOp):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_IndexUnaryOp: a unary operator that depends on the row/col indices }
{============================================================================== }
{ The indexop has the form z = f(aij, i, j, y) where aij is the numerical }
{ value of the A(i,j) entry, i and j are its row and column index, and y }
{ is a scalar.  For vectors, it has the form z = f(vi, i, 0, y). }
type
  PGrB_IndexUnaryOp = ^TGrB_IndexUnaryOp;
  TGrB_IndexUnaryOp = PGB_IndexUnaryOp_opaque;
{ output value z, of type ztype }
{ input value x of type xtype; value of v(i) or A(i,j) }
{ row index of A(i,j) }
{ column index of A(i,j), or zero for v(i) }
{ input scalar y }

  TGxB_index_unary_function = procedure (z:pointer; x:pointer; i:TGrB_Index; j:TGrB_Index; y:pointer);cdecl;
{ GrB_IndexUnaryOp_new creates a user-defined unary op, with an automatic }
{ detection of the operator name. }
{$undef GrB_IndexUnaryOp_new}
{$undef GrM_IndexUnaryOp_new}
{ create a new user-defined IndexUnary op }
{ handle for the new IndexUnary operator }
{ pointer to IndexUnary function }
{ type of output z }
{ type of input x (the A(i,j) entry) }
{ type of input y (the scalar) }

function IndexUnaryOp_new(op:PGrB_IndexUnaryOp; _function:TGxB_index_unary_function; ztype:TGrB_Type; xtype:TGrB_Type; ytype:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrB_IndexUnaryOp_new(op,f,z,x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrM_IndexUnaryOp_new(op,f,z,x,y : longint) : longint;

{ create a named user-created IndexUnaryOp }
{ handle for the new IndexUnary operator }
{ pointer to index_unary function }
{ type of output z }
{ type of input x (the A(i,j) entry) }
{ type of input y (the scalar) }
{ name of the user function }
{ definition of the user function }
function GxB_IndexUnaryOp_new(op:PGrB_IndexUnaryOp; _function:TGxB_index_unary_function; ztype:TGrB_Type; xtype:TGrB_Type; ytype:TGrB_Type; 
           idxop_name:Pchar; idxop_defn:Pchar):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of z }
{ user array of size GxB_MAX_NAME_LEN }
{ IndexUnary operator }
function GxB_IndexUnaryOp_ztype_name(type_name:Pchar; op:TGrB_IndexUnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ For TRIL, TRIU, DIAG, OFFDIAG, COLLE, COLGT, ROWLE, and ROWGT, }
{ the xtype_name is an empty string (""), since these functions do not depend }
{ on the type of the matrix input. }
{ return the type_name of x }
{ user array of size GxB_MAX_NAME_LEN }
{ select operator }
function GxB_IndexUnaryOp_xtype_name(type_name:Pchar; op:TGrB_IndexUnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the type_name of the scalary y }
{ user array of size GxB_MAX_NAME_LEN }
{ select operator }
function GxB_IndexUnaryOp_ytype_name(type_name:Pchar; op:TGrB_IndexUnaryOp):TGrB_Info;cdecl;external libgraphblas;
{ free a user-created IndexUnaryOp }
{ handle of IndexUnary to free }
function GrB_IndexUnaryOp_free(op:PGrB_IndexUnaryOp):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ built-in IndexUnaryOps }
{------------------------------------------------------------------------------ }
{ To facilitate computations with negative integers, the indices i and j are }
{ of type int64_t.  The scalar y has the type corresponding to the suffix }
{ of the name of the operator. }
{-------------------------------------------------------------------------- }
{ Result has the integer type INT32 or INT64, the same as the suffix }
{-------------------------------------------------------------------------- }
{ These operators work on any data type, including user-defined. }
{ ROWINDEX: (i+y): row index plus y }
{ COLINDEX: (j+y): col index plus y }
{ DIAGINDEX: (j-(i+y)): diagonal index plus y }
{-------------------------------------------------------------------------- }
{ Result is bool, depending only on the indices i,j, and y }
{-------------------------------------------------------------------------- }
{ These operators work on any data type, including user-defined. }
{ The scalar y is int64. }
{ TRIL: (j <= (i+y)): lower triangular part }
{ TRIU: (j >= (i+y)): upper triangular part }
{ DIAG: (j == (i+y)): diagonal }
{ OFFDIAG: (j != (i+y)): offdiagonal }
{ COLLE: (j <= y): columns 0:y }
{ COLGT: (j > y): columns y+1:ncols-1 }
{ ROWLE: (i <= y): rows 0:y }
{ ROWGT: (i > y): rows y+1:nrows-1 }
{-------------------------------------------------------------------------- }
{ Result is bool, depending only on the value aij }
{-------------------------------------------------------------------------- }
{ These operators work on matrices and vectors of any built-in type, }
{ including complex types.  aij and the scalar y have the same type as the }
{ operator suffix. }
{ VALUEEQ: (aij == y) }
{ VALUENE: (aij != y) }
{ These operators work on matrices and vectors of any real (non-complex) }
{ built-in type. }
{ VALUELT: (aij < y) }
{ VALUELE: (aij <= y) }
{ VALUEGT: (aij > y) }
{ VALUEGE: (aij >= y) }
  var
    GrB_ROWINDEX_INT32 : TGrB_IndexUnaryOp;cvar;external libgraphblas;
{============================================================================== }
{ GrB_Monoid }
{============================================================================== }
{ A monoid is an associative operator z=op(x,y) where all three types of z, x, }
{ and y are identical.  The monoid also has an identity element, such that }
{ op(x,identity) = op(identity,x) = x. }
type
  PGrB_Monoid = ^TGrB_Monoid;
  TGrB_Monoid = PGB_Monoid_opaque;
{ create a new boolean monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }

function GrB_Monoid_new_BOOL(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tbool):TGrB_Info;cdecl;external libgraphblas;
{ create a new int8 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_INT8(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint8_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint8 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_UINT8(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint8_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new int16 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_INT16(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint16_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint16 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_UINT16(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint16_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new int32 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_INT32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint32 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_UINT32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint32_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new int64 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_INT64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint64_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint64 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_UINT64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint64_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new float monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_FP32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:single):TGrB_Info;cdecl;external libgraphblas;
{ create a new double monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_FP64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tdouble):TGrB_Info;cdecl;external libgraphblas;
{ create a new float complex monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GxB_Monoid_new_FC32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:TGxB_FC32_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new double complex monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GxB_Monoid_new_FC64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:TGxB_FC64_t):TGrB_Info;cdecl;external libgraphblas;
{ create a monoid with a user-defined type }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
function GrB_Monoid_new_UDT(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:pointer):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic method for creating a new monoid: }
{

extern
GrB_Info GrB_Monoid_new             // create a monoid
(
    GrB_Monoid *monoid,             // handle of monoid to create
    GrB_BinaryOp op,          // binary operator of the monoid
    <type> identity           // identity value of the monoid
) ;

 }
{ GxB_Monoid_terminal_new is identical to GrB_Monoid_new, except that a }
{ terminal value can be specified.  The terminal may be NULL, which indicates }
{ no terminal value (and in this case, it is identical to GrB_Monoid_new). }
{ The terminal value, if not NULL, must have the same type as the identity. }
{ create a new boolean monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_BOOL(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tbool; terminal:Tbool):TGrB_Info;cdecl;external libgraphblas;
{ create a new int8 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_INT8(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint8_t; terminal:Tint8_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint8 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_UINT8(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint8_t; terminal:Tuint8_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new int16 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_INT16(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint16_t; terminal:Tint16_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint16 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_UINT16(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint16_t; terminal:Tuint16_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new int32 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_INT32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint32_t; terminal:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint32 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_UINT32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint32_t; terminal:Tuint32_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new int64 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_INT64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tint64_t; terminal:Tint64_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new uint64 monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_UINT64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tuint64_t; terminal:Tuint64_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new float monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_FP32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:single; terminal:single):TGrB_Info;cdecl;external libgraphblas;
{ create a new double monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_FP64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:Tdouble; terminal:Tdouble):TGrB_Info;cdecl;external libgraphblas;
{ create a new float complex monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_FC32(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:TGxB_FC32_t; terminal:TGxB_FC32_t):TGrB_Info;cdecl;external libgraphblas;
{ create a new double complex monoid }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_FC64(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:TGxB_FC64_t; terminal:TGxB_FC64_t):TGrB_Info;cdecl;external libgraphblas;
{ create a monoid with a user type }
{ handle of monoid to create }
{ binary operator of the monoid }
{ identity value of the monoid }
{ terminal value of the monoid }
function GxB_Monoid_terminal_new_UDT(monoid:PGrB_Monoid; op:TGrB_BinaryOp; identity:pointer; terminal:pointer):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic method for creating a new monoid with a terminal value: }
{

extern
GrB_Info GxB_Monoid_terminal_new             // create a monoid
(
    GrB_Monoid *monoid,             // handle of monoid to create
    GrB_BinaryOp op,                // binary operator of the monoid
    <type> identity,                // identity value of the monoid
    <type> terminal                 // terminal value of the monoid
) ;

 }
{ return the monoid operator }
{ returns the binary op of the monoid }
{ monoid to query }
function GxB_Monoid_operator(op:PGrB_BinaryOp; monoid:TGrB_Monoid):TGrB_Info;cdecl;external libgraphblas;
{ return the monoid identity }
{ returns the identity of the monoid }
{ monoid to query }
function GxB_Monoid_identity(identity:pointer; monoid:TGrB_Monoid):TGrB_Info;cdecl;external libgraphblas;
{ return the monoid terminal }
{ true if the monoid has a terminal value }
{ returns the terminal of the monoid, }
{ unmodified if has_terminal is false }
{ monoid to query }
function GxB_Monoid_terminal(has_terminal:Pbool; terminal:pointer; monoid:TGrB_Monoid):TGrB_Info;cdecl;external libgraphblas;
{ free a user-created monoid }
{ handle of monoid to free }
function GrB_Monoid_free(monoid:PGrB_Monoid):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_Semiring }
{============================================================================== }
type
  PGrB_Semiring = ^TGrB_Semiring;
  TGrB_Semiring = PGB_Semiring_opaque;
{ create a semiring }
{ handle of semiring to create }
{ add monoid of the semiring }
{ multiply operator of the semiring }

function GrB_Semiring_new(semiring:PGrB_Semiring; add:TGrB_Monoid; multiply:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ return the add monoid of a semiring }
{ returns add monoid of the semiring }
{ semiring to query }
function GxB_Semiring_add(add:PGrB_Monoid; semiring:TGrB_Semiring):TGrB_Info;cdecl;external libgraphblas;
{ return multiply operator of a semiring }
{ returns multiply operator of the semiring }
{ semiring to query }
function GxB_Semiring_multiply(multiply:PGrB_BinaryOp; semiring:TGrB_Semiring):TGrB_Info;cdecl;external libgraphblas;
{ free a user-created semiring }
{ handle of semiring to free }
function GrB_Semiring_free(semiring:PGrB_Semiring):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_Scalar: a GraphBLAS scalar }
{============================================================================== }
{ GxB_Scalar has become GrB_Scalar. The older name GxB_Scalar is kept as }
{ historical, but GrB_Scalar should be used instead. }
type
  PGxB_Scalar = ^TGxB_Scalar;
  TGxB_Scalar = PGB_Scalar_opaque;
{ historical: use GrB_Scalar }

  PGrB_Scalar = ^TGrB_Scalar;
  TGrB_Scalar = PGB_Scalar_opaque;
{ use this instead }
{ These methods create, free, copy, and clear a GrB_Scalar.  The nvals, }
{ and type methods return basic information about a GrB_Scalar. }
{ create a new GrB_Scalar with no entry }
{ handle of GrB_Scalar to create }
{ type of GrB_Scalar to create }

function GrB_Scalar_new(s:PGrB_Scalar; _type:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
{ make an exact copy of a GrB_Scalar }
{ handle of output GrB_Scalar to create }
{ input GrB_Scalar to copy }
function GrB_Scalar_dup(s:PGrB_Scalar; t:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ clear a GrB_Scalar of its entry }
{ type remains unchanged. }
{ GrB_Scalar to clear }
function GrB_Scalar_clear(s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ get the number of entries in a GrB_Scalar }
{ GrB_Scalar has nvals entries (0 or 1) }
{ GrB_Scalar to query }
function GrB_Scalar_nvals(nvals:PGrB_Index; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_Scalar_type is historical.  Use GxB_Scalar_type_name instead. }
{ get the type of a GrB_Scalar }
{ returns the type of the GrB_Scalar }
{ GrB_Scalar to query }
function GxB_Scalar_type(_type:PGrB_Type; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ return the name of the type of a scalar }
{ name of the type (char array of size at least }
{ GxB_MAX_NAME_LEN, owned by the user application). }
{ GrB_Scalar to query }
function GxB_Scalar_type_name(type_name:Pchar; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ return # of bytes used for a scalar }
{ # of bytes used by the scalar s }
{ GrB_Scalar to query }
function GxB_Scalar_memoryUsage(size:Psize_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ free a GrB_Scalar }
{ handle of GrB_Scalar to free }
function GrB_Scalar_free(s:PGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ historical names identical to GrB_Scalar_methods above: }
function GxB_Scalar_new(s:PGrB_Scalar; _type:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_dup(s:PGrB_Scalar; t:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_clear(s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_nvals(nvals:PGrB_Index; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_free(s:PGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Scalar_setElement }
{------------------------------------------------------------------------------ }
{ Set a single GrB_Scalar s, from a user scalar x: s = x, typecasting from the }
{ type of x to the type of w as needed. }
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_BOOL(s:TGrB_Scalar; x:Tbool):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_INT8(s:TGrB_Scalar; x:Tint8_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_UINT8(s:TGrB_Scalar; x:Tuint8_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_INT16(s:TGrB_Scalar; x:Tint16_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_UINT16(s:TGrB_Scalar; x:Tuint16_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_INT32(s:TGrB_Scalar; x:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_UINT32(s:TGrB_Scalar; x:Tuint32_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_INT64(s:TGrB_Scalar; x:Tint64_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_UINT64(s:TGrB_Scalar; x:Tuint64_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_FP32(s:TGrB_Scalar; x:single):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_FP64(s:TGrB_Scalar; x:Tdouble):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GxB_Scalar_setElement_FC32(s:TGrB_Scalar; x:TGxB_FC32_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GxB_Scalar_setElement_FC64(s:TGrB_Scalar; x:TGxB_FC64_t):TGrB_Info;cdecl;external libgraphblas;
{ s = x }
{ GrB_Scalar to modify }
{ user scalar to assign to s }
function GrB_Scalar_setElement_UDT(s:TGrB_Scalar; x:pointer):TGrB_Info;cdecl;external libgraphblas;
{ historical names identical to GrB_Scalar_methods above: }
function GxB_Scalar_setElement_BOOL(s:TGrB_Scalar; x:Tbool):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_INT8(s:TGrB_Scalar; x:Tint8_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_INT16(s:TGrB_Scalar; x:Tint16_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_INT32(s:TGrB_Scalar; x:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_INT64(s:TGrB_Scalar; x:Tint64_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_UINT8(s:TGrB_Scalar; x:Tuint8_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_UINT16(s:TGrB_Scalar; x:Tuint16_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_UINT32(s:TGrB_Scalar; x:Tuint32_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_UINT64(s:TGrB_Scalar; x:Tuint64_t):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_FP32(s:TGrB_Scalar; x:single):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_FP64(s:TGrB_Scalar; x:Tdouble):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_setElement_UDT(s:TGrB_Scalar; x:pointer):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  x can be any supported C type or void * for a }
{ user-defined type. }
{

extern
GrB_Info GrB_Scalar_setElement          // s = x
(
    GrB_Scalar s,                       // GrB_Scalar to modify
    <type> x                            // user scalar to assign to s
) ;

 }
{------------------------------------------------------------------------------ }
{ GrB_Scalar_extractElement }
{------------------------------------------------------------------------------ }
{ Extract a single entry from a GrB_Scalar, x = s, typecasting from the type }
{ of s to the type of x as needed. }
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_BOOL(x:Pbool; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_INT8(x:Pint8_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_UINT8(x:Puint8_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_INT16(x:Pint16_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_UINT16(x:Puint16_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_INT32(x:Pint32_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_UINT32(x:Puint32_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_INT64(x:Pint64_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_UINT64(x:Puint64_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_FP32(x:Psingle; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_FP64(x:Pdouble; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GxB_Scalar_extractElement_FC32(x:PGxB_FC32_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GxB_Scalar_extractElement_FC64(x:PGxB_FC64_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ x = s }
{ user scalar extracted }
{ GrB_Scalar to extract an entry from }
function GrB_Scalar_extractElement_UDT(x:pointer; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ historical names identical to GrB_Scalar_methods above: }
function GxB_Scalar_extractElement_BOOL(x:Pbool; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_INT8(x:Pint8_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_INT16(x:Pint16_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_INT32(x:Pint32_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_INT64(x:Pint64_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_UINT8(x:Puint8_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_UINT16(x:Puint16_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_UINT32(x:Puint32_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_UINT64(x:Puint64_t; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_FP32(x:Psingle; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_FP64(x:Pdouble; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GxB_Scalar_extractElement_UDT(x:pointer; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  x can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Scalar_extractElement  // x = s
(
    <type> *x,                      // user scalar extracted
    const GrB_Scalar s              // GrB_Scalar to extract an entry from
) ;

 }
{============================================================================== }
{ GrB_Vector: a GraphBLAS vector }
{============================================================================== }
type
  PGrB_Vector = ^TGrB_Vector;
  TGrB_Vector = PGB_Vector_opaque;
{ These methods create, free, copy, and clear a vector.  The size, nvals, }
{ and type methods return basic information about a vector. }
{ create a new vector with no entries }
{ handle of vector to create }
{ type of vector to create }
{ vector dimension is n-by-1 }
{ (n must be <= GrB_INDEX_MAX+1) }

function GrB_Vector_new(v:PGrB_Vector; _type:TGrB_Type; n:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ make an exact copy of a vector }
{ handle of output vector to create }
{ input vector to copy }
function GrB_Vector_dup(w:PGrB_Vector; u:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ clear a vector of all entries; }
{ type and dimension remain unchanged. }
{ vector to clear }
function GrB_Vector_clear(v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ get the dimension of a vector }
{ vector dimension is n-by-1 }
{ vector to query }
function GrB_Vector_size(n:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ get the number of entries in a vector }
{ vector has nvals entries }
{ vector to query }
function GrB_Vector_nvals(nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_Vector_type is historical.  Use GxB_Vector_type_name instead. }
{ get the type of a vector }
{ returns the type of the vector }
{ vector to query }
function GxB_Vector_type(_type:PGrB_Type; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ return the name of the type of a vector }
{ name of the type (char array of size at least }
{ GxB_MAX_NAME_LEN, owned by the user application). }
{ vector to query }
function GxB_Vector_type_name(type_name:Pchar; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ return # of bytes used for a vector }
{ # of bytes used by the vector v }
{ vector to query }
function GxB_Vector_memoryUsage(size:Psize_t; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ return iso status of a vector }
{ true if the vector is iso-valued }
{ vector to query }
function GxB_Vector_iso(iso:Pbool; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ free a vector }
{ handle of vector to free }
function GrB_Vector_free(v:PGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Vector_build }
{------------------------------------------------------------------------------ }
{ GrB_Vector_build:  w = sparse (I,1,X), but using any }
{ associative operator to assemble duplicate entries. }
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_BOOL(w:TGrB_Vector; I:PGrB_Index; X:Pbool; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_INT8(w:TGrB_Vector; I:PGrB_Index; X:Pint8_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_UINT8(w:TGrB_Vector; I:PGrB_Index; X:Puint8_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_INT16(w:TGrB_Vector; I:PGrB_Index; X:Pint16_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_UINT16(w:TGrB_Vector; I:PGrB_Index; X:Puint16_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_INT32(w:TGrB_Vector; I:PGrB_Index; X:Pint32_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_UINT32(w:TGrB_Vector; I:PGrB_Index; X:Puint32_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_INT64(w:TGrB_Vector; I:PGrB_Index; X:Pint64_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_UINT64(w:TGrB_Vector; I:PGrB_Index; X:Puint64_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_FP32(w:TGrB_Vector; I:PGrB_Index; X:Psingle; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_FP64(w:TGrB_Vector; I:PGrB_Index; X:Pdouble; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GxB_Vector_build_FC32(w:TGrB_Vector; I:PGrB_Index; X:PGxB_FC32_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GxB_Vector_build_FC64(w:TGrB_Vector; I:PGrB_Index; X:PGxB_FC64_t; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (I,X) tuples }
{ vector to build }
{ array of row indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Vector_build_UDT(w:TGrB_Vector; I:PGrB_Index; X:pointer; nvals:TGrB_Index; dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a vector from (i,scalar) tuples }
{ vector to build }
{ array of row indices of tuples }
{ value for all tuples }
{ number of tuples }
function GxB_Vector_build_Scalar(w:TGrB_Vector; I:PGrB_Index; scalar:TGrB_Scalar; nvals:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  X can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Vector_build           // build a vector from (I,X) tuples
(
    GrB_Vector w,                   // vector to build
    const GrB_Index *I,             // array of row indices of tuples
    const <type> *X,                // array of values of tuples
    GrB_Index nvals,                // number of tuples
    const GrB_BinaryOp dup          // binary function to assemble duplicates
) ;

 }
{------------------------------------------------------------------------------ }
{ GrB_Vector_setElement }
{------------------------------------------------------------------------------ }
{ Set a single scalar in a vector, w(i) = x, typecasting from the type of x to }
{ the type of w as needed. }
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_BOOL(w:TGrB_Vector; x:Tbool; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_INT8(w:TGrB_Vector; x:Tint8_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_UINT8(w:TGrB_Vector; x:Tuint8_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_INT16(w:TGrB_Vector; x:Tint16_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_UINT16(w:TGrB_Vector; x:Tuint16_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_INT32(w:TGrB_Vector; x:Tint32_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_UINT32(w:TGrB_Vector; x:Tuint32_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_INT64(w:TGrB_Vector; x:Tint64_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_UINT64(w:TGrB_Vector; x:Tuint64_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_FP32(w:TGrB_Vector; x:single; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_FP64(w:TGrB_Vector; x:Tdouble; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GxB_Vector_setElement_FC32(w:TGrB_Vector; x:TGxB_FC32_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GxB_Vector_setElement_FC64(w:TGrB_Vector; x:TGxB_FC64_t; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_UDT(w:TGrB_Vector; x:pointer; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ w(i) = x }
{ vector to modify }
{ scalar to assign to w(i) }
{ row index }
function GrB_Vector_setElement_Scalar(w:TGrB_Vector; x:TGrB_Scalar; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  x can be any supported C type or void * for a }
{ user-defined type. }
{

extern
GrB_Info GrB_Vector_setElement          // w(i) = x
(
    GrB_Vector w,                       // vector to modify
    <type> x,                           // scalar to assign to w(i)
    GrB_Index i                         // row index
) ;

 }
{------------------------------------------------------------------------------ }
{ GrB_Vector_extractElement }
{------------------------------------------------------------------------------ }
{ Extract a single entry from a vector, x = v(i), typecasting from the type of }
{ v to the type of x as needed. }
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_BOOL(x:Pbool; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_INT8(x:Pint8_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_UINT8(x:Puint8_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_INT16(x:Pint16_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_UINT16(x:Puint16_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_INT32(x:Pint32_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_UINT32(x:Puint32_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_INT64(x:Pint64_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_UINT64(x:Puint64_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_FP32(x:Psingle; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_FP64(x:Pdouble; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GxB_Vector_extractElement_FC32(x:PGxB_FC32_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GxB_Vector_extractElement_FC64(x:PGxB_FC64_t; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_UDT(x:pointer; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = v(i) }
{ scalar extracted }
{ vector to extract an entry from }
{ row index }
function GrB_Vector_extractElement_Scalar(x:TGrB_Scalar; v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  x can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Vector_extractElement  // x = v(i)
(
    <type> *x,                      // scalar extracted
    const GrB_Vector v,             // vector to extract an entry from
    GrB_Index i                     // row index
) ;

 }
{ GxB_Vector_isStoredElement determines if v(i) is present in the structure }
{ of the vector v, as a stored element.  It does not return the value.  It }
{ returns GrB_SUCCESS if the element is present, or GrB_NO_VALUE otherwise. }
{ determine if v(i) is a stored element }
{ vector to check }
{ row index }
function GxB_Vector_isStoredElement(v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Vector_removeElement }
{------------------------------------------------------------------------------ }
{ GrB_Vector_removeElement (v,i) removes the element v(i) from the vector v. }
{ vector to remove an element from }
{ index }
function GrB_Vector_removeElement(v:TGrB_Vector; i:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Vector_extractTuples }
{------------------------------------------------------------------------------ }
{ Extracts all tuples from a vector, like [I,~,X] = find (v).  If }
{ any parameter I and/or X is NULL, then that component is not extracted.  For }
{ example, to extract just the row indices, pass I as non-NULL, and X as NULL. }
{ This is like [I,~,~] = find (v). }
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_BOOL(I:PGrB_Index; X:Pbool; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_INT8(I:PGrB_Index; X:Pint8_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_UINT8(I:PGrB_Index; X:Puint8_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_INT16(I:PGrB_Index; X:Pint16_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_UINT16(I:PGrB_Index; X:Puint16_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_INT32(I:PGrB_Index; X:Pint32_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_UINT32(I:PGrB_Index; X:Puint32_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_INT64(I:PGrB_Index; X:Pint64_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_UINT64(I:PGrB_Index; X:Puint64_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_FP32(I:PGrB_Index; X:Psingle; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_FP64(I:PGrB_Index; X:Pdouble; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GxB_Vector_extractTuples_FC32(I:PGrB_Index; X:PGxB_FC32_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GxB_Vector_extractTuples_FC64(I:PGrB_Index; X:PGxB_FC64_t; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ [I,~,X] = find (v) }
{ array for returning row indices of tuples }
{ array for returning values of tuples }
{ I, X size on input; # tuples on output }
{ vector to extract tuples from }
function GrB_Vector_extractTuples_UDT(I:PGrB_Index; X:pointer; nvals:PGrB_Index; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  X can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Vector_extractTuples           // [I,~,X] = find (v)
(
    GrB_Index *I,               // array for returning row indices of tuples
    <type> *X,                  // array for returning values of tuples
    GrB_Index *nvals,           // I, X size on input; # tuples on output
    const GrB_Vector v          // vector to extract tuples from
) ;

 }
{============================================================================== }
{ GrB_Matrix: a GraphBLAS matrix }
{============================================================================== }
type
  PGrB_Matrix = ^TGrB_Matrix;
  TGrB_Matrix = PGB_Matrix_opaque;
{ These methods create, free, copy, and clear a matrix.  The nrows, ncols, }
{ nvals, and type methods return basic information about a matrix. }
{ create a new matrix with no entries }
{ handle of matrix to create }
{ type of matrix to create }
{ matrix dimension is nrows-by-ncols }
{ (nrows and ncols must be <= GrB_INDEX_MAX+1) }

function GrB_Matrix_new(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ make an exact copy of a matrix }
{ handle of output matrix to create }
{ input matrix to copy }
function GrB_Matrix_dup(C:PGrB_Matrix; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ clear a matrix of all entries; }
{ type and dimensions remain unchanged }
{ matrix to clear }
function GrB_Matrix_clear(A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ get the number of rows of a matrix }
{ matrix has nrows rows }
{ matrix to query }
function GrB_Matrix_nrows(nrows:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ get the number of columns of a matrix }
{ matrix has ncols columns }
{ matrix to query }
function GrB_Matrix_ncols(ncols:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ get the number of entries in a matrix }
{ matrix has nvals entries }
{ matrix to query }
function GrB_Matrix_nvals(nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_Matrix_type is historical.  Use GxB_Matrix_type_name instead. }
{ get the type of a matrix }
{ returns the type of the matrix }
{ matrix to query }
function GxB_Matrix_type(_type:PGrB_Type; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ return the name of the type of a matrix }
{ name of the type (char array of size at least }
{ GxB_MAX_NAME_LEN, owned by the user application). }
{ matrix to query }
function GxB_Matrix_type_name(type_name:Pchar; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ return # of bytes used for a matrix }
{ # of bytes used by the matrix A }
{ matrix to query }
function GxB_Matrix_memoryUsage(size:Psize_t; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ return iso status of a matrix }
{ true if the matrix is iso-valued }
{ matrix to query }
function GxB_Matrix_iso(iso:Pbool; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ free a matrix }
{ handle of matrix to free }
function GrB_Matrix_free(A:PGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Matrix_build }
{------------------------------------------------------------------------------ }
{ GrB_Matrix_build:  C = sparse (I,J,X), but using any }
{ associative operator to assemble duplicate entries. }
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_BOOL(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Pbool; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_INT8(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Pint8_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_UINT8(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Puint8_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_INT16(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Pint16_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_UINT16(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Puint16_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_INT32(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Pint32_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_UINT32(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Puint32_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_INT64(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Pint64_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_UINT64(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Puint64_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_FP32(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Psingle; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_FP64(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:Pdouble; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GxB_Matrix_build_FC32(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:PGxB_FC32_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GxB_Matrix_build_FC64(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:PGxB_FC64_t; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,X) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ array of values of tuples }
{ number of tuples }
{ binary function to assemble duplicates }
function GrB_Matrix_build_UDT(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; X:pointer; nvals:TGrB_Index; 
           dup:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
{ build a matrix from (I,J,scalar) tuples }
{ matrix to build }
{ array of row indices of tuples }
{ array of column indices of tuples }
{ value for all tuples }
{ number of tuples }
function GxB_Matrix_build_Scalar(C:TGrB_Matrix; I:PGrB_Index; J:PGrB_Index; scalar:TGrB_Scalar; nvals:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  X can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Matrix_build           // build a matrix from (I,J,X) tuples
(
    GrB_Matrix C,                   // matrix to build
    const GrB_Index *I,             // array of row indices of tuples
    const GrB_Index *J,             // array of column indices of tuples
    const <type> *X,                // array of values of tuples
    GrB_Index nvals,                // number of tuples
    const GrB_BinaryOp dup          // binary function to assemble duplicates
) ;

 }
{------------------------------------------------------------------------------ }
{ GrB_Matrix_setElement }
{------------------------------------------------------------------------------ }
{ Set a single entry in a matrix, C(i,j) = x, typecasting }
{ from the type of x to the type of C, as needed. }
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_BOOL(C:TGrB_Matrix; x:Tbool; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_INT8(C:TGrB_Matrix; x:Tint8_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_UINT8(C:TGrB_Matrix; x:Tuint8_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_INT16(C:TGrB_Matrix; x:Tint16_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_UINT16(C:TGrB_Matrix; x:Tuint16_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_INT32(C:TGrB_Matrix; x:Tint32_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_UINT32(C:TGrB_Matrix; x:Tuint32_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_INT64(C:TGrB_Matrix; x:Tint64_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_UINT64(C:TGrB_Matrix; x:Tuint64_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_FP32(C:TGrB_Matrix; x:single; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_FP64(C:TGrB_Matrix; x:Tdouble; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GxB_Matrix_setElement_FC32(C:TGrB_Matrix; x:TGxB_FC32_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GxB_Matrix_setElement_FC64(C:TGrB_Matrix; x:TGxB_FC64_t; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_UDT(C:TGrB_Matrix; x:pointer; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ C (i,j) = x }
{ matrix to modify }
{ scalar to assign to C(i,j) }
{ row index }
{ column index }
function GrB_Matrix_setElement_Scalar(C:TGrB_Matrix; x:TGrB_Scalar; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  x can be any supported C type or void * for a }
{ user-defined type. }
{

extern
GrB_Info GrB_Matrix_setElement          // C (i,j) = x
(
    GrB_Matrix C,                       // matrix to modify
    <type> x,                           // scalar to assign to C(i,j)
    GrB_Index i,                        // row index
    GrB_Index j                         // column index
) ;

 }
{------------------------------------------------------------------------------ }
{ GrB_Matrix_extractElement }
{------------------------------------------------------------------------------ }
{ Extract a single entry from a matrix, x = A(i,j), typecasting from the type }
{ of A to the type of x, as needed. }
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_BOOL(x:Pbool; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_INT8(x:Pint8_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_UINT8(x:Puint8_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_INT16(x:Pint16_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_UINT16(x:Puint16_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_INT32(x:Pint32_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_UINT32(x:Puint32_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_INT64(x:Pint64_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_UINT64(x:Puint64_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_FP32(x:Psingle; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_FP64(x:Pdouble; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GxB_Matrix_extractElement_FC32(x:PGxB_FC32_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GxB_Matrix_extractElement_FC64(x:PGxB_FC64_t; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_UDT(x:pointer; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ x = A(i,j) }
{ extracted scalar }
{ matrix to extract a scalar from }
{ row index }
{ column index }
function GrB_Matrix_extractElement_Scalar(x:TGrB_Scalar; A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  x can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Matrix_extractElement      // x = A(i,j)
(
    <type> *x,                          // extracted scalar
    const GrB_Matrix A,                 // matrix to extract a scalar from
    GrB_Index i,                        // row index
    GrB_Index j                         // column index
) ;

 }
{ GxB_Matrix_isStoredElement determines if A(i,j) is present in the structure }
{ of the matrix A, as a stored element.  It does not return the value.  It }
{ returns GrB_SUCCESS if the element is present, or GrB_NO_VALUE otherwise. }
{ determine if A(i,j) is a stored element }
{ matrix to check }
{ row index }
{ column index }
function GxB_Matrix_isStoredElement(A:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Matrix_removeElement }
{------------------------------------------------------------------------------ }
{ GrB_Matrix_removeElement (A,i,j) removes the entry A(i,j) from the matrix A. }
{ matrix to remove entry from }
{ row index }
{ column index }
function GrB_Matrix_removeElement(C:TGrB_Matrix; i:TGrB_Index; j:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Matrix_extractTuples }
{------------------------------------------------------------------------------ }
{ Extracts all tuples from a matrix, like [I,J,X] = find (A).  If }
{ any parameter I, J and/or X is NULL, then that component is not extracted. }
{ For example, to extract just the row and col indices, pass I and J as }
{ non-NULL, and X as NULL.  This is like [I,J,~] = find (A). }
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_BOOL(I:PGrB_Index; J:PGrB_Index; X:Pbool; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_INT8(I:PGrB_Index; J:PGrB_Index; X:Pint8_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_UINT8(I:PGrB_Index; J:PGrB_Index; X:Puint8_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_INT16(I:PGrB_Index; J:PGrB_Index; X:Pint16_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_UINT16(I:PGrB_Index; J:PGrB_Index; X:Puint16_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_INT32(I:PGrB_Index; J:PGrB_Index; X:Pint32_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_UINT32(I:PGrB_Index; J:PGrB_Index; X:Puint32_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_INT64(I:PGrB_Index; J:PGrB_Index; X:Pint64_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_UINT64(I:PGrB_Index; J:PGrB_Index; X:Puint64_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_FP32(I:PGrB_Index; J:PGrB_Index; X:Psingle; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_FP64(I:PGrB_Index; J:PGrB_Index; X:Pdouble; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GxB_Matrix_extractTuples_FC32(I:PGrB_Index; J:PGrB_Index; X:PGxB_FC32_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GxB_Matrix_extractTuples_FC64(I:PGrB_Index; J:PGrB_Index; X:PGxB_FC64_t; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ [I,J,X] = find (A) }
{ array for returning row indices of tuples }
{ array for returning col indices of tuples }
{ array for returning values of tuples }
{ I,J,X size on input; # tuples on output }
{ matrix to extract tuples from }
function GrB_Matrix_extractTuples_UDT(I:PGrB_Index; J:PGrB_Index; X:pointer; nvals:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ Type-generic version:  X can be a pointer to any supported C type or void * }
{ for a user-defined type. }
{

extern
GrB_Info GrB_Matrix_extractTuples           // [I,J,X] = find (A)
(
    GrB_Index *I,               // array for returning row indices of tuples
    GrB_Index *J,               // array for returning col indices of tuples
    <type> *X,                  // array for returning values of tuples
    GrB_Index *nvals,           // I,J,X size on input; # tuples on output
    const GrB_Matrix A          // matrix to extract tuples from
) ;

 }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_concat and GxB_Matrix_split }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_concat concatenates an array of matrices (Tiles) into a single }
{ GrB_Matrix C. }
{ Tiles is an m-by-n dense array of matrices held in row-major format, where }
{ Tiles [i*n+j] is the (i,j)th tile, and where m > 0 and n > 0 must hold.  Let }
{ Ai,j denote the (i,j)th tile.  The matrix C is constructed by }
{ concatenating these tiles together, as: }
{  C = [ A0,0   A0,1   A0,2   ... A0,n-1 }
{        A1,0   A1,1   A1,2   ... A1,n-1 }
{        ... }
{        Am-1,0 Am-1,1 Am-1,2 ... Am-1,n-1 ] }
{ On input, the matrix C must already exist.  Any existing entries in C are }
{ discarded.  C must have dimensions nrows by ncols where nrows is the sum of }
{ # of rows in the matrices Ai,0 for all i, and ncols is the sum of the # of }
{ columns in the matrices A0,j for all j.  All matrices in any given tile }
{ row i must have the same number of rows (that is, nrows(Ai,0) must equal }
{ nrows(Ai,j) for all j), and all matrices in any given tile column j must }
{ have the same number of columns (that is, ncols(A0,j) must equal }
{ ncols(Ai,j) for all i). }
{ The type of C is unchanged, and all matrices Ai,j are typecasted into the }
{ type of C.  Any settings made to C by GxB_Matrix_Option_set (format by row }
{ or by column, bitmap switch, hyper switch, and sparsity control) are }
{ unchanged. }
{ concatenate a 2D array of matrices }
{ input/output matrix for results }
{ 2D row-major array of size m-by-n }
{ unused, except threading control }
function GxB_Matrix_concat(C:TGrB_Matrix; Tiles:PGrB_Matrix; m:TGrB_Index; n:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GxB_Matrix_split does the opposite of GxB_Matrix_concat.  It splits a single }
{ input matrix A into a 2D array of tiles.  On input, the Tiles array must be }
{ a non-NULL pointer to a previously allocated array of size at least m*n }
{ where both m and n must be > 0.  The Tiles_nrows array has size m, and }
{ Tiles_ncols has size n.  The (i,j)th tile has dimension }
{ Tiles_nrows[i]-by-Tiles_ncols[j].  The sum of Tiles_nrows [0:m-1] must equal }
{ the number of rows of A, and the sum of Tiles_ncols [0:n-1] must equal the }
{ number of columns of A.  The type of each tile is the same as the type of A; }
{ no typecasting is done. }
{ split a matrix into 2D array of matrices }
{ 2D row-major array of size m-by-n }
{ array of size m }
{ array of size n }
{ input matrix to split }
{ unused, except threading control }
function GxB_Matrix_split(Tiles:PGrB_Matrix; m:TGrB_Index; n:TGrB_Index; Tile_nrows:PGrB_Index; Tile_ncols:PGrB_Index; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_diag, GxB_Vector_diag, GrB_Matrix_diag }
{------------------------------------------------------------------------------ }
{ GrB_Matrix_diag constructs a new matrix from a vector.  Let n be the length }
{ of the v vector, from GrB_Vector_size (&n, v).  If k = 0, then C is an }
{ n-by-n diagonal matrix with the entries from v along the main diagonal of C, }
{ with C(i,i) = v(i).  If k is nonzero, C is square with dimension n+abs(k). }
{ If k is positive, it denotes diagonals above the main diagonal, with }
{ C(i,i+k) = v(i).  If k is negative, it denotes diagonals below the main }
{ diagonal of C, with C(i-k,i) = v(i).  C is constructed with the same type }
{ as v. }
{ build a diagonal matrix from a vector }
{ output matrix }
{ input vector }
function GrB_Matrix_diag(C:PGrB_Matrix; v:TGrB_Vector; k:Tint64_t):TGrB_Info;cdecl;external libgraphblas;
{ GrB_Matrix_diag is like GxB_Matrix_diag (&C, v, k, NULL), except that C must }
{ already exist on input, of the correct size.  Any existing entries in C are }
{ discarded.  The type of C is preserved, so that if the type of C and v }
{ differ, the entries are typecasted into the type of C.  Any settings made to }
{ C by GxB_Matrix_Option_set (format by row or by column, bitmap switch, hyper }
{ switch, and sparsity control) are unchanged. }
{ construct a diagonal matrix from a vector }
{ output matrix }
{ input vector }
{ to specify # of threads }
function GxB_Matrix_diag(C:TGrB_Matrix; v:TGrB_Vector; k:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GxB_Vector_diag extracts a vector v from an input matrix A, which may be }
{ rectangular.  If k = 0, the main diagonal of A is extracted; k > 0 denotes }
{ diagonals above the main diagonal of A, and k < 0 denotes diagonals below }
{ the main diagonal of A.  Let A have dimension m-by-n.  If k is in the range }
{ 0 to n-1, then v has length min(m,n-k).  If k is negative and in the range }
{ -1 to -m+1, then v has length min(m+k,n).  If k is outside these ranges, }
{ v has length 0 (this is not an error). }
{ v must already exist on input, of the correct length; that is }
{ GrB_Vector_size (&len,v) must return len = 0 if k >= n or k <= -m, len = }
{ min(m,n-k) if k is in the range 0 to n-1, and len = min(m+k,n) if k is in }
{ the range -1 to -m+1.  Any existing entries in v are discarded.  The type of }
{ v is preserved, so that if the type of A and v differ, the entries are }
{ typecasted into the type of v.  Any settings made to v by }
{ GxB_Vector_Option_set (bitmap switch and sparsity control) are unchanged. }
{ extract a diagonal from a matrix, as a vector }
{ output vector }
{ input matrix }
{ unused, except threading control }
function GxB_Vector_diag(v:TGrB_Vector; A:TGrB_Matrix; k:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ SuiteSparse:GraphBLAS options }
{============================================================================== }
{ The following options modify how SuiteSparse:GraphBLAS stores and operates }
{ on its matrices.  The GxB_*Option* methods allow the user to suggest how the }
{ internal representation of a matrix, or all matrices, should be held.  These }
{ options have no effect on the result (except for minor roundoff differences }
{ for floating-point types). They only affect the time and memory usage of the }
{ computations. }
{      GxB_Matrix_Option_set:  sets an option for a specific matrix }
{      GxB_Matrix_Option_get:  queries the current option of a specific matrix }
{      GxB_Vector_Option_set:  sets an option for a specific vector }
{      GxB_Vector_Option_get:  queries the current option of a specific vector }
{      GxB_Global_Option_set:  sets an option for all future matrices }
{      GxB_Global_Option_get:  queries current option for all future matrices }
const
  GxB_HYPER = 0;  { (historical, use GxB_HYPER_SWITCH) }
{ for global options or matrix options }
{------------------------------------------------------------ }
{ for GxB_Matrix_Option_get/set and GxB_Global_Option_get/set: }
{------------------------------------------------------------ }
{ defines switch to hypersparse (a double value) }
{ defines switch to bitmap (a double value) }
{ defines CSR/CSC format: GxB_BY_ROW or GxB_BY_COL }
{------------------------------------------------------------ }
{ for GxB_Global_Option_get only: }
{------------------------------------------------------------ }
{ mode passed to GrB_init (blocking or non-blocking) }
{ name of the library (char *) }
{ library version (3 int's) }
{ date of the library (char *) }
{ about the library (char *) }
{ URL for the library (char *) }
{ license of the library (char *) }
{ date library was compiled (char *) }
{ time library was compiled (char *) }
{ API version (3 int's) }
{ date of the API (char *) }
{ about the API (char *) }
{ URL for the API (char *) }
{ compiler version (3 int's) }
{ compiler name (char *) }
{ library compiled with OpenMP }
{------------------------------------------------------------ }
{ for GxB_Global_Option_get/set only: }
{------------------------------------------------------------ }
{ max number of threads to use }
{ If <= GxB_DEFAULT, then GraphBLAS selects the number }
{ of threads automatically. }
{ chunk size for small problems. }
{ If <= GxB_DEFAULT, then the default is used. }
{ diagnostic output (bool *) }
{ printf function diagnostic output }
{ flush function diagnostic output }
{ memory pool control }
{ print matrices as 0-based or 1-based }
{------------------------------------------------------------ }
{ for GxB_Matrix_Option_get only: }
{------------------------------------------------------------ }
{ hyper, sparse, bitmap or full (1,2,4,8) }
{ historical; use GxB_SPARSITY_STATUS }
{------------------------------------------------------------ }
{ for GxB_Matrix_Option_get/set only: }
{------------------------------------------------------------ }
{ sparsity control: 0 to 15; see below }
{------------------------------------------------------------ }
{ GPU and options (DRAFT: do not use) }
{------------------------------------------------------------ }
type
  PGxB_Option_Field = ^TGxB_Option_Field;
  TGxB_Option_Field =  Longint;
  Const
    GxB_HYPER_SWITCH = 0;
    GxB_BITMAP_SWITCH = 34;
    GxB_FORMAT = 1;
    GxB_MODE = 2;
    GxB_LIBRARY_NAME = 8;
    GxB_LIBRARY_VERSION = 9;
    GxB_LIBRARY_DATE = 10;
    GxB_LIBRARY_ABOUT = 11;
    GxB_LIBRARY_URL = 12;
    GxB_LIBRARY_LICENSE = 13;
    GxB_LIBRARY_COMPILE_DATE = 14;
    GxB_LIBRARY_COMPILE_TIME = 15;
    GxB_API_VERSION = 16;
    GxB_API_DATE = 17;
    GxB_API_ABOUT = 18;
    GxB_API_URL = 19;
    GxB_COMPILER_VERSION = 23;
    GxB_COMPILER_NAME = 24;
    GxB_LIBRARY_OPENMP = 25;
    GxB_GLOBAL_NTHREADS = GxB_NTHREADS;
    GxB_GLOBAL_CHUNK = GxB_CHUNK;
    GxB_BURBLE = 99;
    GxB_PRINTF = 101;
    GxB_FLUSH = 102;
    GxB_MEMORY_POOL = 103;
    GxB_PRINT_1BASED = 104;
    GxB_SPARSITY_STATUS = 33;
    GxB_IS_HYPER = 6;
    GxB_SPARSITY_CONTROL = 32;
    GxB_GLOBAL_GPU_CONTROL = GxB_GPU_CONTROL;
    GxB_GLOBAL_GPU_CHUNK = GxB_GPU_CHUNK;
;
{ GxB_FORMAT can be by row or by column: }
{ CSR: compressed sparse row format }
{ CSC: compressed sparse column format }
{ format not defined }
type
  PGxB_Format_Value = ^TGxB_Format_Value;
  TGxB_Format_Value =  Longint;
  Const
    GxB_BY_ROW = 0;
    GxB_BY_COL = 1;
    GxB_NO_FORMAT = -(1);
;
{ The default format is by row.  These constants are defined as extern }
{ const, so that if SuiteSparse:GraphBLAS is recompiled with a different }
{ default format, and the application is relinked but not recompiled, it will }
{ acquire the new default values. }
  var
    GxB_FORMAT_DEFAULT : TGxB_Format_Value;cvar;external libgraphblas;
{ the default hyper_switch parameter }
    GxB_HYPER_DEFAULT : Tdouble;cvar;external libgraphblas;
{ GxB_SPARSITY_CONTROL can be any sum or bitwise OR of these 4 values: }

const
  GxB_HYPERSPARSE = 1;  { store matrix in hypersparse form }
  GxB_SPARSE = 2;  { store matrix as sparse form (compressed vector) }
  GxB_BITMAP = 4;  { store matrix as a bitmap }
  GxB_FULL = 8;  { store matrix as full; all entries must be present }
{ size of b array for GxB_set/get (GxB_BITMAP_SWITCH, b) }
  GxB_NBITMAP_SWITCH = 8;  { size of bitmap_switch parameter array }
{ any sparsity value: }
  GxB_ANY_SPARSITY = ((GxB_HYPERSPARSE+GxB_SPARSE)+GxB_BITMAP)+GxB_FULL;  
{ the default sparsity control is any format: }
  GxB_AUTO_SPARSITY = GxB_ANY_SPARSITY;  
{ GxB_Matrix_Option_set (A, GxB_SPARSITY_CONTROL, scontrol) provides hints }
{ about which data structure GraphBLAS should use for the matrix A: }
{ }
{      GxB_AUTO_SPARSITY: GraphBLAS selects automatically. }
{      GxB_HYPERSPARSE: always hypersparse, taking O(nvals(A)) space. }
{      GxB_SPARSE: always in a sparse struture: compressed-sparse row/column, }
{          taking O(nrows+nvals(A)) space if stored by row, or }
{          O(ncols+nvals(A)) if stored by column. }
{      GxB_BITMAP: always in a bitmap struture, taking O(nrows*ncols) space. }
{      GxB_FULL: always in a full structure, taking O(nrows*ncols) space, }
{          unless not all entries are present, in which case the bitmap }
{          storage is used. }
{ }
{ These options can be summed.  For example, to allow a matrix to be sparse }
{ or hypersparse, but not bitmap or full, use GxB_SPARSE + GxB_HYPERSPARSE. }
{ Since GxB_FULL can only be used when all entries are present, matrices with }
{ the just GxB_FULL control setting are stored in bitmap form if any entries }
{ are not present. }
{ }
{ Only the least 4 bits of the sparsity control are considered, so the }
{ formats can be bitwise negated.  For example, to allow for any format }
{ except full, use ~GxB_FULL. }
{ }
{ GxB_Matrix_Option_get (A, GxB_SPARSITY_STATUS, &sparsity) returns the }
{ current data structure currently used for the matrix A (either hypersparse, }
{ sparse, bitmap, or full). }
{ }
{ GxB_Matrix_Option_get (A, GxB_SPARSITY_CONTROL, &scontrol) returns the hint }
{ for how A should be stored (hypersparse, sparse, bitmap, or full, or any }
{ combination). }
{ GxB_HYPER_SWITCH: }
{      If the matrix or vector structure can be sparse or hypersparse, the }
{      GxB_HYPER_SWITCH parameter controls when each of these structures are }
{      used.  The parameter is not used if the matrix or vector is full or }
{      bitmap. }
{ }
{      Let k be the actual number of non-empty vectors (with at least one }
{      entry).  This value k is not dependent on whether or not the matrix is }
{      stored in hypersparse structure.  Let n be the number of vectors (the # }
{      of columns if CSC, or rows if CSR).  Let h be the value of the }
{      GxB_HYPER_SWITCH setting of the matrix. }
{ }
{      If a matrix is currently hypersparse, it can be converted to }
{      non-hypersparse if (n <= 1  || k > 2*n*h).  Otherwise it stays }
{      hypersparse.  If (n <= 1) the matrix is always stored as }
{      non-hypersparse. }
{ }
{      If currently non-hypersparse, it can be converted to hypersparse if (n }
{      > 1 && k <= n*h).  Otherwise, it stays non-hypersparse.  If (n <= 1) }
{      the matrix always remains non-hypersparse. }
{ }
{      Setting GxB_HYPER_SWITCH to GxB_ALWAYS_HYPER or GxB_NEVER_HYPER ensures }
{      a matrix always stays hypersparse, or always stays non-hypersparse, }
{      respectively. }
  var
    GxB_ALWAYS_HYPER : Tdouble;cvar;external libgraphblas;
{ set an option in a matrix }
{ matrix to modify }
{ option to change }
{ value to change it to }

function GxB_Matrix_Option_set(A:TGrB_Matrix; field:TGxB_Option_Field; args:array of const):TGrB_Info;cdecl;external libgraphblas;
function GxB_Matrix_Option_set(A:TGrB_Matrix; field:TGxB_Option_Field):TGrB_Info;cdecl;external libgraphblas;
{ set an option in a matrix }
{ matrix to modify }
{ option to change }
{ value to change it to }
function GxB_Matrix_Option_set_INT32(A:TGrB_Matrix; field:TGxB_Option_Field; value:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
{ set an option in a matrix }
{ matrix to modify }
{ option to change }
{ value to change it to }
function GxB_Matrix_Option_set_FP64(A:TGrB_Matrix; field:TGxB_Option_Field; value:Tdouble):TGrB_Info;cdecl;external libgraphblas;
{ gets the current option of a matrix }
{ matrix to query }
{ option to query }
{ return value of the matrix option }
function GxB_Matrix_Option_get(A:TGrB_Matrix; field:TGxB_Option_Field; args:array of const):TGrB_Info;cdecl;external libgraphblas;
function GxB_Matrix_Option_get(A:TGrB_Matrix; field:TGxB_Option_Field):TGrB_Info;cdecl;external libgraphblas;
{ gets the current option of a matrix }
{ matrix to query }
{ option to query }
{ return value of the matrix option }
function GxB_Matrix_Option_get_INT32(A:TGrB_Matrix; field:TGxB_Option_Field; value:Pint32_t):TGrB_Info;cdecl;external libgraphblas;
{ gets the current option of a matrix }
{ matrix to query }
{ option to query }
{ return value of the matrix option }
function GxB_Matrix_Option_get_FP64(A:TGrB_Matrix; field:TGxB_Option_Field; value:Pdouble):TGrB_Info;cdecl;external libgraphblas;
{ set an option in a vector }
{ vector to modify }
{ option to change }
{ value to change it to }
function GxB_Vector_Option_set(A:TGrB_Vector; field:TGxB_Option_Field; args:array of const):TGrB_Info;cdecl;external libgraphblas;
function GxB_Vector_Option_set(A:TGrB_Vector; field:TGxB_Option_Field):TGrB_Info;cdecl;external libgraphblas;
{ set an option in a vector }
{ vector to modify }
{ option to change }
{ value to change it to }
function GxB_Vector_Option_set_INT32(v:TGrB_Vector; field:TGxB_Option_Field; value:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
{ set an option in a vector }
{ vector to modify }
{ option to change }
{ value to change it to }
function GxB_Vector_Option_set_FP64(v:TGrB_Vector; field:TGxB_Option_Field; value:Tdouble):TGrB_Info;cdecl;external libgraphblas;
{ gets the current option of a vector }
{ vector to query }
{ option to query }
{ return value of the vector option }
function GxB_Vector_Option_get(A:TGrB_Vector; field:TGxB_Option_Field; args:array of const):TGrB_Info;cdecl;external libgraphblas;
function GxB_Vector_Option_get(A:TGrB_Vector; field:TGxB_Option_Field):TGrB_Info;cdecl;external libgraphblas;
{ gets the current option of a vector }
{ vector to query }
{ option to query }
{ return value of the vector option }
function GxB_Vector_Option_get_INT32(v:TGrB_Vector; field:TGxB_Option_Field; value:Pint32_t):TGrB_Info;cdecl;external libgraphblas;
{ gets the current option of a vector }
{ vector to query }
{ option to query }
{ return value of the vector option }
function GxB_Vector_Option_get_FP64(v:TGrB_Vector; field:TGxB_Option_Field; value:Pdouble):TGrB_Info;cdecl;external libgraphblas;
{ GxB_Global_Option_set controls the global defaults used when a new matrix is }
{ created.  GrB_init defines the following initial settings: }
{ }
{      GxB_Global_Option_set (GxB_HYPER_SWITCH, GxB_HYPER_DEFAULT) ; }
{      GxB_Global_Option_set (GxB_BITMAP_SWITCH, NULL) ; }
{      GxB_Global_Option_set (GxB_FORMAT, GxB_FORMAT_DEFAULT) ; }
{ }
{ The compile-time constants GxB_HYPER_DEFAULT and GxB_FORMAT_DEFAULT are }
{ equal to 0.0625 and GxB_BY_ROW, by default.  That is, by default, all new }
{ matrices are held by row in CSR format.  If a matrix has fewer than n/16 }
{ columns, it can be converted to hypersparse structure.  If it has more than }
{ n/8 columns, it can be converted to a sparse structure.  Modifying these }
{ global settings via GxB_Global_Option_set has no effect on matrices already }
{ created. }
{ set a global default option }
{ option to change }
{ value to change it to }
function GxB_Global_Option_set(field:TGxB_Option_Field; args:array of const):TGrB_Info;cdecl;external libgraphblas;
function GxB_Global_Option_set(field:TGxB_Option_Field):TGrB_Info;cdecl;external libgraphblas;
{ set a global default option }
{ option to change }
{ value to change it to }
function GxB_Global_Option_set_INT32(field:TGxB_Option_Field; value:Tint32_t):TGrB_Info;cdecl;external libgraphblas;
{ set a global default option }
{ option to change }
{ value to change it to }
function GxB_Global_Option_set_FP64(field:TGxB_Option_Field; value:Tdouble):TGrB_Info;cdecl;external libgraphblas;
{ set a global default option }
{ option to change }
{ value to change it to }
function GxB_Global_Option_set_FP64_ARRAY(field:TGxB_Option_Field; value:Pdouble):TGrB_Info;cdecl;external libgraphblas;
{ set a global default option }
{ option to change }
{ value to change it to }
function GxB_Global_Option_set_INT64_ARRAY(field:TGxB_Option_Field; value:Pint64_t):TGrB_Info;cdecl;external libgraphblas;
{ set a global default option }
{ option to change }
{ value to change it to }
function GxB_Global_Option_set_FUNCTION(field:TGxB_Option_Field; value:pointer):TGrB_Info;cdecl;external libgraphblas;
{ gets the current global default option }
{ option to query }
{ return value of the global option }
function GxB_Global_Option_get(field:TGxB_Option_Field; args:array of const):TGrB_Info;cdecl;external libgraphblas;
function GxB_Global_Option_get(field:TGxB_Option_Field):TGrB_Info;cdecl;external libgraphblas;
{ gets the current global option }
{ option to query }
{ return value of the global option }
function GxB_Global_Option_get_INT32(field:TGxB_Option_Field; value:Pint32_t):TGrB_Info;cdecl;external libgraphblas;
{ gets the current global option }
{ option to query }
{ return value of the global option }
function GxB_Global_Option_get_FP64(field:TGxB_Option_Field; value:Pdouble):TGrB_Info;cdecl;external libgraphblas;
{ gets the current global option }
{ option to query }
{ return value of the global option }
function GxB_Global_Option_get_INT64(field:TGxB_Option_Field; value:Pint64_t):TGrB_Info;cdecl;external libgraphblas;
{ gets the current global option }
{ option to query }
{ return value of the global option }
function GxB_Global_Option_get_CHAR(field:TGxB_Option_Field; value:PPchar):TGrB_Info;cdecl;external libgraphblas;
{ gets the current global option }
{ option to query }
{ return value of the global option }
function GxB_Global_Option_get_FUNCTION(field:TGxB_Option_Field; value:Ppointer):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_set and GxB_get }
{------------------------------------------------------------------------------ }
{ The simplest way to set/get a value of a GrB_Descriptor is with }
{ the generic GxB_set and GxB_get functions: }
{      GxB_set (desc, field, value) ; }
{      GxB_get (desc, field, &value) ; }
{ GxB_set and GxB_get are generic methods that and set or query the options in }
{ a GrB_Matrix, a GrB_Descriptor, or in the global options.  They can be used }
{ with the following syntax.  Note that GxB_NTHREADS can be used for both the }
{ global nthreads_max, and for the # of threads in the descriptor. }
{ To set/get the global options: }
{ }
{      GxB_set (GxB_HYPER_SWITCH, double h) ; }
{      GxB_set (GxB_HYPER_SWITCH, GxB_ALWAYS_HYPER) ; }
{      GxB_set (GxB_HYPER_SWITCH, GxB_NEVER_HYPER) ; }
{      GxB_get (GxB_HYPER_SWITCH, double *h) ; }
{ }
{      double b [GxB_NBITMAP_SWITCH] ; }
{      GxB_set (GxB_BITMAP_SWITCH, b) ; }
{      GxB_set (GxB_BITMAP_SWITCH, NULL) ;     // set defaults }
{      GxB_get (GxB_BITMAP_SWITCH, b) ; }
{ }
{      GxB_set (GxB_FORMAT, GxB_BY_ROW) ; }
{      GxB_set (GxB_FORMAT, GxB_BY_COL) ; }
{      GxB_get (GxB_FORMAT, GxB_Format_Value *s) ; }
{ }
{      GxB_set (GxB_NTHREADS, nthreads_max) ; }
{      GxB_get (GxB_NTHREADS, int *nthreads_max) ; }
{ }
{      GxB_set (GxB_CHUNK, double chunk) ; }
{      GxB_get (GxB_CHUNK, double *chunk) ; }
{ }
{      GxB_set (GxB_BURBLE, bool burble) ; }
{      GxB_get (GxB_BURBLE, bool *burble) ; }
{ }
{      GxB_set (GxB_PRINTF, void *printf_function) ; }
{      GxB_get (GxB_PRINTF, void **printf_function) ; }
{ }
{      GxB_set (GxB_FLUSH, void *flush_function) ; }
{      GxB_get (GxB_FLUSH, void **flush_function) ; }
{ }
{      int64_t free_pool_limit [64] ; }
{      GxB_set (GxB_MEMORY_POOL, free_pool_limit) ; }
{      GxB_set (GxB_MEMORY_POOL, NULL) ;     // set defaults }
{      GxB_get (GxB_MEMORY_POOL, free_pool_limit) ; }
{ To get global options that can be queried but not modified: }
{ }
{      GxB_get (GxB_MODE, GrB_Mode *mode) ; }
{ To set/get a matrix option: }
{ }
{      GxB_set (GrB_Matrix A, GxB_HYPER_SWITCH, double h) ; }
{      GxB_set (GrB_Matrix A, GxB_HYPER_SWITCH, GxB_ALWAYS_HYPER) ; }
{      GxB_set (GrB_Matrix A, GxB_HYPER_SWITCH, GxB_NEVER_HYPER) ; }
{      GxB_get (GrB_Matrix A, GxB_HYPER_SWITCH, double *h) ; }
{ }
{      GxB_set (GrB_Matrix A, GxB_BITMAP_SWITCH, double b) ; }
{      GxB_get (GrB_Matrix A, GxB_BITMAP_SWITCH, double *b) ; }
{ }
{      GxB_set (GrB_Matrix A, GxB_FORMAT, GxB_BY_ROW) ; }
{      GxB_set (GrB_Matrix A, GxB_FORMAT, GxB_BY_COL) ; }
{      GxB_get (GrB_Matrix A, GxB_FORMAT, GxB_Format_Value *s) ; }
{ }
{      GxB_set (GrB_Matrix A, GxB_SPARSITY_CONTROL, GxB_AUTO_SPARSITY) ; }
{      GxB_set (GrB_Matrix A, GxB_SPARSITY_CONTROL, scontrol) ; }
{      GxB_get (GrB_Matrix A, GxB_SPARSITY_CONTROL, int *scontrol) ; }
{ }
{      GxB_get (GrB_Matrix A, GxB_SPARSITY_STATUS, int *sparsity) ; }
{ To set/get a vector option or status: }
{ }
{      GxB_set (GrB_Vector v, GxB_BITMAP_SWITCH, double b) ; }
{      GxB_get (GrB_Vector v, GxB_BITMAP_SWITCH, double *b) ; }
{ }
{      GxB_set (GrB_Vector v, GxB_FORMAT, GxB_BY_ROW) ; }
{      GxB_set (GrB_Vector v, GxB_FORMAT, GxB_BY_COL) ; }
{      GxB_get (GrB_Vector v, GxB_FORMAT, GxB_Format_Value *s) ; }
{ }
{      GxB_set (GrB_Vector v, GxB_SPARSITY_CONTROL, GxB_AUTO_SPARSITY) ; }
{      GxB_set (GrB_Vector v, GxB_SPARSITY_CONTROL, scontrol) ; }
{      GxB_get (GrB_Vector v, GxB_SPARSITY_CONTROL, int *scontrol) ; }
{ }
{      GxB_get (GrB_Vector v, GxB_SPARSITY_STATUS, int *sparsity) ; }
{ To set/get a descriptor field: }
{ }
{      GxB_set (GrB_Descriptor d, GrB_OUTP, GxB_DEFAULT) ; }
{      GxB_set (GrB_Descriptor d, GrB_OUTP, GrB_REPLACE) ; }
{      GxB_get (GrB_Descriptor d, GrB_OUTP, GrB_Desc_Value *v) ; }
{ }
{      GxB_set (GrB_Descriptor d, GrB_MASK, GxB_DEFAULT) ; }
{      GxB_set (GrB_Descriptor d, GrB_MASK, GrB_COMP) ; }
{      GxB_set (GrB_Descriptor d, GrB_MASK, GrB_STRUCTURE) ; }
{      GxB_set (GrB_Descriptor d, GrB_MASK, GrB_COMP + GrB_STRUCTURE) ; }
{      GxB_get (GrB_Descriptor d, GrB_MASK, GrB_Desc_Value *v) ; }
{ }
{      GxB_set (GrB_Descriptor d, GrB_INP0, GxB_DEFAULT) ; }
{      GxB_set (GrB_Descriptor d, GrB_INP0, GrB_TRAN) ; }
{      GxB_get (GrB_Descriptor d, GrB_INP0, GrB_Desc_Value *v) ; }
{ }
{      GxB_set (GrB_Descriptor d, GrB_INP1, GxB_DEFAULT) ; }
{      GxB_set (GrB_Descriptor d, GrB_INP1, GrB_TRAN) ; }
{      GxB_get (GrB_Descriptor d, GrB_INP1, GrB_Desc_Value *v) ; }
{ }
{      GxB_set (GrB_Descriptor d, GxB_AxB_METHOD, GxB_DEFAULT) ; }
{      GxB_set (GrB_Descriptor d, GxB_AxB_METHOD, GxB_AxB_GUSTAVSON) ; }
{      GxB_set (GrB_Descriptor d, GxB_AxB_METHOD, GxB_AxB_HASH) ; }
{      GxB_set (GrB_Descriptor d, GxB_AxB_METHOD, GxB_AxB_SAXPY) ; }
{      GxB_set (GrB_Descriptor d, GxB_AxB_METHOD, GxB_AxB_DOT) ; }
{      GxB_get (GrB_Descriptor d, GrB_AxB_METHOD, GrB_Desc_Value *v) ; }
{ }
{      GxB_set (GrB_Descriptor d, GxB_NTHREADS, nthreads) ; }
{      GxB_get (GrB_Descriptor d, GxB_NTHREADS, int *nthreads) ; }
{ }
{      GxB_set (GrB_Descriptor d, GxB_CHUNK, double chunk) ; }
{      GxB_get (GrB_Descriptor d, GxB_CHUNK, double *chunk) ; }
{ }
{      GxB_set (GrB_Descriptor d, GxB_SORT, int sort) ; }
{      GxB_get (GrB_Descriptor d, GxB_SORT, int *sort) ; }
{ }
{      GxB_set (GrB_Descriptor d, GxB_COMPRESSION, int method) ; }
{      GxB_get (GrB_Descriptor d, GxB_COMPRESSION, int *method) ; }
{ }
{      GxB_set (GrB_Descriptor d, GxB_IMPORT, int method) ; }
{      GxB_get (GrB_Descriptor d, GxB_IMPORT, int *method) ; }
{============================================================================== }
{ GrB_free: free any GraphBLAS object }
{============================================================================== }
{ for null and invalid objects }
const
  GrB_NULL = NULL;  
  GrB_INVALID_HANDLE = NULL;  
{============================================================================== }
{ GrB_wait: finish computations }
{============================================================================== }
{ establishes a happens-before relation }
{ object is complete }
type
  PGrB_WaitMode = ^TGrB_WaitMode;
  TGrB_WaitMode =  Longint;
  Const
    GrB_COMPLETE = 0;
    GrB_MATERIALIZE = 1;
;
{ Finish all pending work in a specific object. }

function GrB_Type_wait(_type:TGrB_Type; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_UnaryOp_wait(op:TGrB_UnaryOp; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_BinaryOp_wait(op:TGrB_BinaryOp; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GxB_SelectOp_wait(op:TGxB_SelectOp; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_IndexUnaryOp_wait(op:TGrB_IndexUnaryOp; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_Monoid_wait(monoid:TGrB_Monoid; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_Semiring_wait(semiring:TGrB_Semiring; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_Descriptor_wait(desc:TGrB_Descriptor; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_Scalar_wait(s:TGrB_Scalar; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_Vector_wait(v:TGrB_Vector; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
function GrB_Matrix_wait(A:TGrB_Matrix; waitmode:TGrB_WaitMode):TGrB_Info;cdecl;external libgraphblas;
{ NOTE: GxB_Scalar_wait is historical; use GrB_Scalar_wait instead }
function GxB_Scalar_wait(s:PGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_error: error handling }
{============================================================================== }
{ Each GraphBLAS method and operation returns a GrB_Info error code. }
{ GrB_error returns additional information on the error in a thread-safe }
{ null-terminated string.  The string returned by GrB_error is owned by }
{ the GraphBLAS library and must not be free'd. }
function GrB_Type_error(error:PPchar; _type:TGrB_Type):TGrB_Info;cdecl;external libgraphblas;
function GrB_UnaryOp_error(error:PPchar; op:TGrB_UnaryOp):TGrB_Info;cdecl;external libgraphblas;
function GrB_BinaryOp_error(error:PPchar; op:TGrB_BinaryOp):TGrB_Info;cdecl;external libgraphblas;
function GxB_SelectOp_error(error:PPchar; op:TGxB_SelectOp):TGrB_Info;cdecl;external libgraphblas;
function GrB_IndexUnaryOp_error(error:PPchar; op:TGrB_IndexUnaryOp):TGrB_Info;cdecl;external libgraphblas;
function GrB_Monoid_error(error:PPchar; monoid:TGrB_Monoid):TGrB_Info;cdecl;external libgraphblas;
function GrB_Semiring_error(error:PPchar; semiring:TGrB_Semiring):TGrB_Info;cdecl;external libgraphblas;
function GrB_Scalar_error(error:PPchar; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
function GrB_Vector_error(error:PPchar; v:TGrB_Vector):TGrB_Info;cdecl;external libgraphblas;
function GrB_Matrix_error(error:PPchar; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
function GrB_Descriptor_error(error:PPchar; d:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GxB_Scalar_error is historical: use GrB_Scalar_error instead }
function GxB_Scalar_error(error:PPchar; s:TGrB_Scalar):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_mxm, vxm, mxv: matrix multiplication over a semiring }
{============================================================================== }
{ C<Mask> = accum (C, A*B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '+' and '*' for A*B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_mxm(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w'<Mask> = accum (w, u'*A) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '+' and '*' for u'*A }
{ first input:  vector u }
{ second input: matrix A }
{ descriptor for w, mask, and A }
function GrB_vxm(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; u:TGrB_Vector; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<Mask> = accum (w, A*u) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '+' and '*' for A*B }
{ first input:  matrix A }
{ second input: vector u }
{ descriptor for w, mask, and A }
function GrB_mxv(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; A:TGrB_Matrix; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_eWiseMult: element-wise matrix and vector operations, set intersection }
{============================================================================== }
{ GrB_eWiseMult computes C<Mask> = accum (C, A.*B), where ".*" is the Hadamard }
{ product, and where pairs of elements in two matrices (or vectors) are }
{ pairwise "multiplied" with C(i,j) = mult (A(i,j),B(i,j)). }
{ w<Mask> = accum (w, u.*v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '.*' for t=u.*v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GrB_Vector_eWiseMult_Semiring(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; u:TGrB_Vector; 
           v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<Mask> = accum (w, u.*v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '.*' for t=u.*v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GrB_Vector_eWiseMult_Monoid(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; 
           v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<Mask> = accum (w, u.*v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '.*' for t=u.*v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GrB_Vector_eWiseMult_BinaryOp(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; mult:TGrB_BinaryOp; u:TGrB_Vector; 
           v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A.*B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '.*' for T=A.*B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_Matrix_eWiseMult_Semiring(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A.*B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '.*' for T=A.*B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_Matrix_eWiseMult_Monoid(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A.*B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '.*' for T=A.*B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_Matrix_eWiseMult_BinaryOp(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; mult:TGrB_BinaryOp; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ All 6 of the above type-specific functions are captured in a single }
{ type-generic function, GrB_eWiseMult: }
{============================================================================== }
{ GrB_eWiseAdd: element-wise matrix and vector operations, set union }
{============================================================================== }
{ GrB_eWiseAdd computes C<Mask> = accum (C, A+B), where pairs of elements in }
{ two matrices (or two vectors) are pairwise "added". }
{ w<mask> = accum (w, u+v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '+' for t=u+v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GrB_Vector_eWiseAdd_Semiring(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; u:TGrB_Vector; 
           v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, u+v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '+' for t=u+v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GrB_Vector_eWiseAdd_Monoid(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; 
           v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, u+v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '+' for t=u+v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GrB_Vector_eWiseAdd_BinaryOp(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; add:TGrB_BinaryOp; u:TGrB_Vector; 
           v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A+B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '+' for T=A+B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_Matrix_eWiseAdd_Semiring(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A+B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '+' for T=A+B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_Matrix_eWiseAdd_Monoid(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A+B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '+' for T=A+B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GrB_Matrix_eWiseAdd_BinaryOp(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; add:TGrB_BinaryOp; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GxB_eWiseUnion: a variant of GrB_eWiseAdd }
{============================================================================== }
{ GxB_eWiseUnion is a variant of eWiseAdd.  The methods create a result with }
{ the same sparsity structure.  They differ when an entry is present in A but }
{ not B, or in B but not A. }
{ eWiseAdd does the following, for a matrix, where "+" is the add binary op: }
{      if A(i,j) and B(i,j) are both present: }
{          C(i,j) = A(i,j) + B(i,j) }
{      else if A(i,j) is present but not B(i,j) }
{          C(i,j) = A(i,j) }
{      else if B(i,j) is present but not A(i,j) }
{          C(i,j) = B(i,j) }
{ by contrast, eWiseUnion always applies the operator: }
{      if A(i,j) and B(i,j) are both present: }
{          C(i,j) = A(i,j) + B(i,j) }
{      else if A(i,j) is present but not B(i,j) }
{          C(i,j) = A(i,j) + beta }
{      else if B(i,j) is present but not A(i,j) }
{          C(i,j) = alpha + B(i,j) }
{ w<mask> = accum (w, u+v) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ defines '+' for t=u+v }
{ first input:  vector u }
{ second input: vector v }
{ descriptor for w and mask }
function GxB_Vector_eWiseUnion(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; add:TGrB_BinaryOp; u:TGrB_Vector; 
           alpha:TGrB_Scalar; v:TGrB_Vector; beta:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M> = accum (C, A+B) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '+' for T=A+B }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, M, A, and B }
function GxB_Matrix_eWiseUnion(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; add:TGrB_BinaryOp; A:TGrB_Matrix; 
           alpha:TGrB_Scalar; B:TGrB_Matrix; beta:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_extract: extract a submatrix or subvector }
{============================================================================== }
{ Extract entries from a matrix or vector; T = A(I,J).  This (like most }
{ GraphBLAS methods) is then followed by C<Mask>=accum(C,T). }
{ To extract all rows of a matrix or vector, as in A (:,J), use I=GrB_ALL as }
{ the input argument.  For all columns of a matrix, use J=GrB_ALL. }
  var
    GrB_ALL : Puint64_t;cvar;external libgraphblas;
{ To extract a range of rows and columns, I and J can be a list of 2 or 3 }
{ indices that defines a range (begin:end) or a strided range (begin:inc:end). }
{ To specify the colon syntax I = begin:end, the array I has size at least 2, }
{ where I [GxB_BEGIN] = begin and I [GxB_END] = end.  The parameter ni is then }
{ passed as the special value GxB_RANGE.  To specify the colon syntax I = }
{ begin:inc:end, the array I has size at least three, with the values begin, }
{ end, and inc (in that order), and then pass in the value ni = GxB_STRIDE. }
{ The same can be done for the list J and its size, nj. }
{ These special values of ni and nj can be used for GrB_assign, }
{ GrB_extract, and GxB_subassign. }

const
  GxB_RANGE = INT64_MAX;  
  GxB_STRIDE = INT64_MAX-1;  
  GxB_BACKWARDS = INT64_MAX-2;  
{ for the strided range begin:inc:end, I [GxB_BEGIN] is the value of begin, I }
{ [GxB_END] is the value end, I [GxB_INC] is the magnitude of the stride.  If }
{ the stride is negative, use ni = GxB_BACKWARDS. }
  GxB_BEGIN = 0;  
  GxB_END = 1;  
  GxB_INC = 2;  
{ For example, the notation 10:-2:1 defines a sequence [10 8 6 4 2]. }
{ The end point of the sequence (1) need not appear in the sequence, if }
{ the last increment goes past it.  To specify the same in GraphBLAS, }
{ use: }
{      GrB_Index I [3], ni = GxB_BACKWARDS ; }
{      I [GxB_BEGIN ] = 10 ;               // the start of the sequence }
{      I [GxB_INC   ] = 2 ;                // the magnitude of the increment }
{      I [GxB_END   ] = 1 ;                // the end of the sequence }
{ w<mask> = accum (w, u(I)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ first input:  vector u }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }

function GrB_Vector_extract(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, A(I,J)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ first input:  matrix A }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C, Mask, and A }
function GrB_Matrix_extract(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; A:TGrB_Matrix; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, A(I,j)) }
{ input/output matrix for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ first input:  matrix A }
{ row indices }
{ number of row indices }
{ column index }
{ descriptor for w, mask, and A }
function GrB_Col_extract(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; A:TGrB_Matrix; I:PGrB_Index; 
           ni:TGrB_Index; j:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_extract: generic matrix/vector extraction }
{------------------------------------------------------------------------------ }
{ GrB_extract is a generic interface to the following functions: }
{ GrB_Vector_extract (w,mask,acc,u,I,ni,d)      // w<m>    = acc (w, u(I)) }
{ GrB_Col_extract    (w,mask,acc,A,I,ni,j,d)    // w<m>    = acc (w, A(I,j)) }
{ GrB_Matrix_extract (C,Mask,acc,A,I,ni,J,nj,d) // C<Mask> = acc (C, A(I,J)) }
{============================================================================== }
{ GxB_subassign: matrix and vector subassign: C(I,J)<Mask> = accum (C(I,J), A) }
{============================================================================== }
{ Assign entries in a matrix or vector; C(I,J) = A. }
{ Each GxB_subassign function is very similar to its corresponding GrB_assign }
{ function in the spec, but they differ in two ways: (1) the mask in }
{ GxB_subassign has the same size as w(I) for vectors and C(I,J) for matrices, }
{ and (2) they differ in the GrB_REPLACE option.  See the user guide for }
{ details. }
{ In GraphBLAS notation, the two methods can be described as follows: }
{ matrix and vector subassign: C(I,J)<Mask> = accum (C(I,J), A) }
{ matrix and vector    assign: C<Mask>(I,J) = accum (C(I,J), A) }
{ --- assign ------------------------------------------------------------------ }
{ }
{ GrB_Matrix_assign      C<M>(I,J) += A        M same size as matrix C. }
{                                              A is |I|-by-|J| }
{ }
{ GrB_Vector_assign      w<m>(I)   += u        m same size as column vector w. }
{                                              u is |I|-by-1 }
{ }
{ GrB_Row_assign         C<m'>(i,J) += u'      m is a column vector the same }
{                                              size as a row of C. }
{                                              u is |J|-by-1, i is a scalar. }
{ }
{ GrB_Col_assign         C<m>(I,j) += u        m is a column vector the same }
{                                              size as a column of C. }
{                                              u is |I|-by-1, j is a scalar. }
{ }
{ --- subassign --------------------------------------------------------------- }
{ }
{ GxB_Matrix_subassign   C(I,J)<M> += A        M same size as matrix A. }
{                                              A is |I|-by-|J| }
{ }
{ GxB_Vector_subassign   w(I)<m>   += u        m same size as column vector u. }
{                                              u is |I|-by-1 }
{ }
{ GxB_Row_subassign      C(i,J)<m'> += u'      m same size as column vector u. }
{                                              u is |J|-by-1, i is a scalar. }
{ }
{ GxB_Col_subassign      C(I,j)<m> += u        m same size as column vector u. }
{                                              u is |I|-by-1, j is a scalar. }
{ w(I)<mask> = accum (w(I),u) }
{ input/output matrix for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for z=accum(w(I),t) }
{ first input:  vector u }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),A) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),T) }
{ first input:  matrix A }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J), Mask, and A }
function GxB_Matrix_subassign(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; A:TGrB_Matrix; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,j)<mask> = accum (C(I,j),u) }
{ input/output matrix for results }
{ optional mask for C(I,j), unused if NULL }
{ optional accum for z=accum(C(I,j),t) }
{ input vector }
{ row indices }
{ number of row indices }
{ column index }
{ descriptor for C(I,j) and mask }
function GxB_Col_subassign(C:TGrB_Matrix; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; I:PGrB_Index; 
           ni:TGrB_Index; j:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(i,J)<mask'> = accum (C(i,J),u') }
{ input/output matrix for results }
{ optional mask for C(i,J), unused if NULL }
{ optional accum for z=accum(C(i,J),t) }
{ input vector }
{ row index }
{ column indices }
{ number of column indices }
{ descriptor for C(i,J) and mask }
function GxB_Row_subassign(C:TGrB_Matrix; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; i:TGrB_Index; 
           J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Vector_subassign_[SCALAR]:  scalar expansion assignment to subvector }
{------------------------------------------------------------------------------ }
{ Assigns a single scalar to a subvector, w(I)<mask> = accum(w(I),x).  The }
{ scalar x is implicitly expanded into a vector u of size ni-by-1, with each }
{ entry in u equal to x, and then w(I)<mask> = accum(w(I),u) is done. }
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_BOOL(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tbool; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_INT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint8_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_UINT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint8_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_INT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint16_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_UINT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint16_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_INT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint32_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_UINT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint32_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_INT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint64_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_UINT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint64_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_FP32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:single; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_FP64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tdouble; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_FC32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:TGxB_FC32_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_FC64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:TGxB_FC64_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_UDT(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:pointer; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w(I)<mask> = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w(I), unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w(I) and mask }
function GxB_Vector_subassign_Scalar(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:TGrB_Scalar; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_subassign_[SCALAR]:  scalar expansion assignment to submatrix }
{------------------------------------------------------------------------------ }
{ Assigns a single scalar to a submatrix, C(I,J)<Mask> = accum(C(I,J),x).  The }
{ scalar x is implicitly expanded into a matrix A of size ni-by-nj, with each }
{ entry in A equal to x, and then C(I,J)<Mask> = accum(C(I,J),A) is done. }
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_BOOL(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tbool; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_INT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint8_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_UINT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint8_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_INT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint16_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_UINT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint16_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_INT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint32_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_UINT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint32_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_INT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint64_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_UINT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint64_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_FP32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:single; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_FP64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tdouble; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_FC32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:TGxB_FC32_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_FC64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:TGxB_FC64_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_UDT(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:pointer; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C(I,J)<Mask> = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C(I,J), unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C(I,J) and Mask }
function GxB_Matrix_subassign_Scalar(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:TGrB_Scalar; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_subassign: generic submatrix/subvector assignment }
{------------------------------------------------------------------------------ }
{ GxB_subassign is a generic function that provides access to all specific }
{ GxB_*_subassign* functions: }
{ GxB_Vector_subassign   (w,m,acc,u,I,ni,d)      // w(I)<m>    = acc(w(I),u) }
{ GxB_Matrix_subassign   (C,M,acc,A,I,ni,J,nj,d) // C(I,J)<M>  = acc(C(I,J),A) }
{ GxB_Col_subassign      (C,m,acc,u,I,ni,j,d)    // C(I,j)<m>  = acc(C(I,j),u) }
{ GxB_Row_subassign      (C,m,acc,u,i,J,nj,d)    // C(i,J)<m'> = acc(C(i,J),u') }
{ GxB_Vector_subassign_T (w,m,acc,x,I,ni,d)      // w(I)<m>    = acc(w(I),x) }
{ GxB_Matrix_subassign_T (C,M,acc,x,I,ni,J,nj,d) // C(I,J)<M>  = acc(C(I,J),x) }
{============================================================================== }
{ GrB_assign: matrix and vector assign: C<Mask>(I,J) = accum (C(I,J), A) }
{============================================================================== }
{ Assign entries in a matrix or vector; C(I,J) = A. }
{ Each of these can be used with their generic name, GrB_assign. }
{ w<mask>(I) = accum (w(I),u) }
{ input/output matrix for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w(I),t) }
{ first input:  vector u }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),A) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),T) }
{ first input:  matrix A }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C, Mask, and A }
function GrB_Matrix_assign(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; A:TGrB_Matrix; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<mask>(I,j) = accum (C(I,j),u) }
{ input/output matrix for results }
{ optional mask for C(:,j), unused if NULL }
{ optional accum for z=accum(C(I,j),t) }
{ input vector }
{ row indices }
{ number of row indices }
{ column index }
{ descriptor for C(:,j) and mask }
function GrB_Col_assign(C:TGrB_Matrix; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; I:PGrB_Index; 
           ni:TGrB_Index; j:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<mask'>(i,J) = accum (C(i,J),u') }
{ input/output matrix for results }
{ optional mask for C(i,:), unused if NULL }
{ optional accum for z=accum(C(i,J),t) }
{ input vector }
{ row index }
{ column indices }
{ number of column indices }
{ descriptor for C(i,:) and mask }
function GrB_Row_assign(C:TGrB_Matrix; mask:TGrB_Vector; accum:TGrB_BinaryOp; u:TGrB_Vector; i:TGrB_Index; 
           J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Vector_assign_[SCALAR]:  scalar expansion assignment to subvector }
{------------------------------------------------------------------------------ }
{ Assigns a single scalar to a subvector, w<mask>(I) = accum(w(I),x).  The }
{ scalar x is implicitly expanded into a vector u of size ni-by-1, with each }
{ entry in u equal to x, and then w<mask>(I) = accum(w(I),u) is done. }
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_BOOL(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tbool; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_INT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint8_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_UINT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint8_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_INT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint16_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_UINT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint16_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_INT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint32_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_UINT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint32_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_INT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tint64_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_UINT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tuint64_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_FP32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:single; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_FP64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:Tdouble; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GxB_Vector_assign_FC32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:TGxB_FC32_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GxB_Vector_assign_FC64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:TGxB_FC64_t; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_UDT(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:pointer; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask>(I) = accum (w(I),x) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for Z=accum(w(I),x) }
{ scalar to assign to w(I) }
{ row indices }
{ number of row indices }
{ descriptor for w and mask }
function GrB_Vector_assign_Scalar(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; x:TGrB_Scalar; I:PGrB_Index; 
           ni:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_Matrix_assign_[SCALAR]:  scalar expansion assignment to submatrix }
{------------------------------------------------------------------------------ }
{ Assigns a single scalar to a submatrix, C<Mask>(I,J) = accum(C(I,J),x).  The }
{ scalar x is implicitly expanded into a matrix A of size ni-by-nj, with each }
{ entry in A equal to x, and then C<Mask>(I,J) = accum(C(I,J),A) is done. }
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_BOOL(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tbool; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_INT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint8_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_UINT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint8_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_INT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint16_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_UINT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint16_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_INT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint32_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_UINT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint32_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_INT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tint64_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_UINT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tuint64_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_FP32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:single; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_FP64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:Tdouble; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GxB_Matrix_assign_FC32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:TGxB_FC32_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GxB_Matrix_assign_FC64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:TGxB_FC64_t; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_UDT(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:pointer; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask>(I,J) = accum (C(I,J),x) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C(I,J),x) }
{ scalar to assign to C(I,J) }
{ row indices }
{ number of row indices }
{ column indices }
{ number of column indices }
{ descriptor for C and Mask }
function GrB_Matrix_assign_Scalar(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; x:TGrB_Scalar; I:PGrB_Index; 
           ni:TGrB_Index; J:PGrB_Index; nj:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_assign: generic submatrix/subvector assignment }
{------------------------------------------------------------------------------ }
{ GrB_assign is a generic function that provides access to all specific }
{ GrB_*_assign* functions: }
{ GrB_Vector_assign_T (w,m,acc,x,I,ni,d)      // w<m>(I)    = acc(w(I),x) }
{ GrB_Vector_assign   (w,m,acc,u,I,ni,d)      // w<m>(I)    = acc(w(I),u) }
{ GrB_Matrix_assign_T (C,M,acc,x,I,ni,J,nj,d) // C<M>(I,J)  = acc(C(I,J),x) }
{ GrB_Col_assign      (C,m,acc,u,I,ni,j,d)    // C<m>(I,j)  = acc(C(I,j),u) }
{ GrB_Row_assign      (C,m,acc,u,i,J,nj,d)    // C<m'>(i,J) = acc(C(i,J),u') }
{ GrB_Matrix_assign   (C,M,acc,A,I,ni,J,nj,d) // C<M>(I,J)  = acc(C(I,J),A) }
{============================================================================== }
{ GrB_apply: matrix and vector apply }
{============================================================================== }
{ Apply a unary, index_unary, or binary operator to entries in a matrix or }
{ vector, C<M> = accum (C, op (A)). }
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ descriptor for w and mask }
function GrB_Vector_apply(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_UnaryOp; u:TGrB_Vector; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, op(A)) or op(A') }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_UnaryOp; A:TGrB_Matrix; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ vector apply: binaryop variants (bind 1st) }
{------------------------------------------- }
{ Apply a binary operator to the entries in a vector, binding the first }
{ input to a scalar x, w<mask> = accum (w, op (x,u)). }
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_Scalar(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGrB_Scalar; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: identical to GxB_Vector_apply_BinaryOp1st }
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GxB_Vector_apply_BinaryOp1st(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGrB_Scalar; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_BOOL(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tbool; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_INT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint8_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_INT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint16_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_INT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint32_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_INT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint64_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_UINT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint8_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_UINT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint16_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_UINT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint32_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_UINT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint64_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_FP32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:single; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_FP64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tdouble; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GxB_Vector_apply_BinaryOp1st_FC32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGxB_FC32_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GxB_Vector_apply_BinaryOp1st_FC64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGxB_FC64_t; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(x,u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: vector u }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp1st_UDT(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:pointer; 
           u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ vector apply: binaryop variants (bind 2nd) }
{------------------------------------------- }
{ Apply a binary operator to the entries in a vector, binding the second }
{ input to a scalar y, w<mask> = accum (w, op (u,y)). }
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_Scalar(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: identical to GrB_Vector_apply_BinaryOp2nd_Scalar }
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_apply_BinaryOp2nd(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_BOOL(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_INT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_INT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_INT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_INT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_UINT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tuint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_UINT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tuint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_UINT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tuint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_UINT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tuint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_FP32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:single; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_FP64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:Tdouble; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_apply_BinaryOp2nd_FC32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:TGxB_FC32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_apply_BinaryOp2nd_FC64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:TGxB_FC64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u,y)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_BinaryOp2nd_UDT(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; 
           y:pointer; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ vector apply: IndexUnaryOp variants }
{------------------------------------------- }
{ Apply a GrB_IndexUnaryOp to the entries in a vector }
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_Scalar(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_BOOL(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_INT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_INT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_INT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_INT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_UINT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_UINT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_UINT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_UINT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_FP32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:single; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_FP64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tdouble; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_apply_IndexOp_FC32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:TGxB_FC32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_apply_IndexOp_FC64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:TGxB_FC64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_apply_IndexOp_UDT(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:pointer; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ matrix apply: binaryop variants (bind 1st) }
{------------------------------------------- }
{ Apply a binary operator to the entries in a matrix, binding the first input }
{ to a scalar x, C<Mask> = accum (C, op (x,A)), or op(x,A'). }
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_Scalar(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGrB_Scalar; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: identical to GrB_Matrix_apply_BinaryOp1st_Scalar }
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_BinaryOp1st(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGrB_Scalar; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_BOOL(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tbool; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_INT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint8_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_INT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint16_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_INT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint32_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_INT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tint64_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_UINT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint8_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_UINT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint16_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_UINT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint32_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_UINT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tuint64_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_FP32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:single; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_FP64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:Tdouble; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_BinaryOp1st_FC32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGxB_FC32_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_BinaryOp1st_FC64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:TGxB_FC64_t; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(x,A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  scalar x }
{ second input: matrix A }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp1st_UDT(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; x:pointer; 
           A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ matrix apply: binaryop variants (bind 2nd) }
{------------------------------------------- }
{ Apply a binary operator to the entries in a matrix, binding the second input }
{ to a scalar y, C<Mask> = accum (C, op (A,y)), or op(A',y). }
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_Scalar(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: identical to GrB_Matrix_apply_BinaryOp2nd_Scalar }
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_BinaryOp2nd(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_BOOL(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_INT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_INT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_INT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_INT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_UINT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tuint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_UINT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tuint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_UINT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tuint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_UINT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tuint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_FP32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:single; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_FP64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:Tdouble; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_BinaryOp2nd_FC32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:TGxB_FC32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_BinaryOp2nd_FC64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:TGxB_FC64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A,y)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_BinaryOp2nd_UDT(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           y:pointer; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ matrix apply: IndexUnaryOp variants }
{------------------------------------------- }
{ Apply a GrB_IndexUnaryOp to the entries in a matrix. }
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_Scalar(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_BOOL(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_INT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_INT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_INT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_INT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_UINT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_UINT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_UINT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_UINT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_FP32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:single; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_FP64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tdouble; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_IndexOp_FC32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:TGxB_FC32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_apply_IndexOp_FC64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:TGxB_FC64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_apply_IndexOp_UDT(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:pointer; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_apply: generic matrix/vector apply }
{------------------------------------------------------------------------------ }
{ GrB_apply is a generic function for applying a unary operator to a matrix }
{ or vector and provides access to these functions: }
{ GrB_Vector_apply (w,mask,acc,op,u,d)  // w<mask> = accum (w, op(u)) }
{ GrB_Matrix_apply (C,Mask,acc,op,A,d)  // C<Mask> = accum (C, op(A)) }
{ GrB_Vector_apply                  (w,m,acc,unop ,u,d) }
{ GrB_Vector_apply_BinaryOp1st_TYPE (w,m,acc,binop,x,u,d) }
{ GrB_Vector_apply_BinaryOp2nd_TYPE (w,m,acc,binop,u,y,d) }
{ GrB_Vector_apply_IndexOp_TYPE     (w,m,acc,idxop,u,y,d) }
{ GrB_Matrix_apply                  (C,M,acc,unop ,A,d) }
{ GrB_Matrix_apply_BinaryOp1st_TYPE (C,M,acc,binop,x,A,d) }
{ GrB_Matrix_apply_BinaryOp2nd_TYPE (C,M,acc,binop,A,y,d) }
{ GrB_Matrix_apply_IndexOp_TYPE     (C,M,acc,idxop,A,y,d) }
{============================================================================== }
{ GrB_select: matrix and vector selection using an IndexUnaryOp }
{============================================================================== }
{------------------------------------------- }
{ vector select using an IndexUnaryOp }
{------------------------------------------- }
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_Scalar(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_BOOL(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_INT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_INT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_INT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_INT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_UINT8(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_UINT16(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_UINT32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_UINT64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tuint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_FP32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:single; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_FP64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:Tdouble; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_select_FC32(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:TGxB_FC32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GxB_Vector_select_FC64(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:TGxB_FC64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w, op(u)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ second input: scalar y }
{ descriptor for w and mask }
function GrB_Vector_select_UDT(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; u:TGrB_Vector; 
           y:pointer; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------- }
{ matrix select using an IndexUnaryOp }
{------------------------------------------- }
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_Scalar(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_BOOL(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_INT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_INT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_INT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_INT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_UINT8(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint8_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_UINT16(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint16_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_UINT32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_UINT64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tuint64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_FP32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:single; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_FP64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:Tdouble; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_select_FC32(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:TGxB_FC32_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GxB_Matrix_select_FC64(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:TGxB_FC64_t; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M>=accum(C,op(A)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ second input: scalar y }
{ descriptor for C, mask, and A }
function GrB_Matrix_select_UDT(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_IndexUnaryOp; A:TGrB_Matrix; 
           y:pointer; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GrB_select is a generic method that applies an IndexUnaryOp to }
{ a matrix or vector, using any type of the scalar y. }
{ GrB_Vector_select_TYPE (w,m,acc,idxop,u,y,d) }
{ GrB_Matrix_select_TYPE (C,M,acc,idxop,A,y,d) }
{============================================================================== }
{ GxB_select: matrix and vector selection (historical) }
{============================================================================== }
{ GrB_select and with the GrB_IndexUnaryOp operators should be used instead. }
{ w<mask> = accum (w, op(u,k)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ operator to apply to the entries }
{ first input:  vector u }
{ optional input for the select operator }
{ descriptor for w and mask }
function GxB_Vector_select(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGxB_SelectOp; u:TGrB_Vector; 
           Thunk:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<Mask> = accum (C, op(A,k)) or op(A',k) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ operator to apply to the entries }
{ first input:  matrix A }
{ optional input for the select operator }
{ descriptor for C, mask, and A }
function GxB_Matrix_select(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGxB_SelectOp; A:TGrB_Matrix; 
           Thunk:TGrB_Scalar; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_reduce: matrix and vector reduction }
{============================================================================== }
{ Reduce the entries in a matrix to a vector, a column vector t such that }
{ t(i) = sum (A (i,:)), and where "sum" is a commutative and associative }
{ monoid with an identity value.  A can be transposed, which reduces down the }
{ columns instead of the rows. }
{ For GrB_Matrix_reduce_BinaryOp, the GrB_BinaryOp op must correspond to a }
{ known built-in monoid: }
{ }
{      operator                data-types (all built-in) }
{      ----------------------  --------------------------- }
{      MIN, MAX                INT*, UINT*, FP* }
{      TIMES, PLUS             INT*, UINT*, FP*, FC* }
{      ANY                     INT*, UINT*, FP*, FC*, BOOL }
{      LOR, LAND, LXOR, EQ     BOOL }
{      BOR, BAND, BXOR, BXNOR  UINT* }
{ w<mask> = accum (w,reduce(A)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ reduce operator for t=reduce(A) }
{ first input:  matrix A }
{ descriptor for w, mask, and A }
function GrB_Matrix_reduce_Monoid(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ w<mask> = accum (w,reduce(A)) }
{ input/output vector for results }
{ optional mask for w, unused if NULL }
{ optional accum for z=accum(w,t) }
{ reduce operator for t=reduce(A) }
{ first input:  matrix A }
{ descriptor for w, mask, and A }
function GrB_Matrix_reduce_BinaryOp(w:TGrB_Vector; mask:TGrB_Vector; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ reduce a vector to a scalar }
{------------------------------------------------------------------------------ }
{ Reduce entries in a vector to a scalar, c = accum (c, reduce_to_scalar(u)) }
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_BOOL(c:Pbool; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_INT8(c:Pint8_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_UINT8(c:Puint8_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_INT16(c:Pint16_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_UINT16(c:Puint16_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_INT32(c:Pint32_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_UINT32(c:Puint32_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_INT64(c:Pint64_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_UINT64(c:Puint64_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_FP32(c:Psingle; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_FP64(c:Pdouble; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GxB_Vector_reduce_FC32(c:PGxB_FC32_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GxB_Vector_reduce_FC64(c:PGxB_FC64_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_UDT(c:pointer; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum(c,reduce_to_scalar(u)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_Monoid_Scalar(c:TGrB_Scalar; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ result scalar }
{ optional accum for c=accum(c,t) }
{ binary op to do the reduction }
{ vector to reduce }
function GrB_Vector_reduce_BinaryOp_Scalar(c:TGrB_Scalar; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ reduce a matrix to a scalar }
{------------------------------------------------------------------------------ }
{ Reduce entries in a matrix to a scalar, c = accum (c, reduce_to_scalar(A)) }
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_BOOL(c:Pbool; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_INT8(c:Pint8_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_UINT8(c:Puint8_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_INT16(c:Pint16_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_UINT16(c:Puint16_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_INT32(c:Pint32_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_UINT32(c:Puint32_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_INT64(c:Pint64_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_UINT64(c:Puint64_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_FP32(c:Psingle; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_FP64(c:Pdouble; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GxB_Matrix_reduce_FC32(c:PGxB_FC32_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GxB_Matrix_reduce_FC64(c:PGxB_FC64_t; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum (c, reduce_to_scalar (A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_UDT(c:pointer; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ c = accum(c,reduce_to_scalar(A)) }
{ result scalar }
{ optional accum for c=accum(c,t) }
{ monoid to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_Monoid_Scalar(c:TGrB_Scalar; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ result scalar }
{ optional accum for c=accum(c,t) }
{ binary op to do the reduction }
{ matrix to reduce }
function GrB_Matrix_reduce_BinaryOp_Scalar(S:TGrB_Scalar; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_reduce: generic matrix/vector reduction to a vector or scalar }
{------------------------------------------------------------------------------ }
{ GrB_reduce is a generic function that provides access to all GrB_*reduce* }
{ functions: }
{ reduce matrix to vector: }
{ GrB_Matrix_reduce_Monoid   (w,mask,acc,mo,A,d) // w<mask> = acc (w,reduce(A)) }
{ GrB_Matrix_reduce_BinaryOp (w,mask,acc,op,A,d) // w<mask> = acc (w,reduce(A)) }
{ reduce matrix to scalar: }
{ GrB_Vector_reduce_[SCALAR] (c,acc,monoid,u,d)  // c = acc (c,reduce(u)) }
{ GrB_Matrix_reduce_[SCALAR] (c,acc,monoid,A,d)  // c = acc (c,reduce(A)) }
{ GrB_Vector_reduce_Monoid_Scalar (s,acc,monoid,u,d)   // s = acc (s,reduce(u)) }
{ GrB_Matrix_reduce_Monoid_Scalar (s,acc,monoid,A,d)   // s = acc (s,reduce(A)) }
{ GrB_Vector_reduce_BinaryOp_Scalar (s,acc,op,u,d)     // s = acc (s,reduce(u)) }
{ GrB_Matrix_reduce_BinaryOp_Scalar (s,acc,op,A,d)     // s = acc (s,reduce(A)) }
{============================================================================== }
{ GrB_transpose: matrix transpose }
{============================================================================== }
{ C<Mask> = accum (C, A') }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ first input:  matrix A }
{ descriptor for C, Mask, and A }
function GrB_transpose(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_kronecker:  Kronecker product }
{============================================================================== }
{ GxB_kron is historical; use GrB_kronecker instead }
{ C<Mask> = accum(C,kron(A,B)) (historical) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '*' for T=kron(A,B) }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, Mask, A, and B }
function GxB_kron(C:TGrB_Matrix; Mask:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M> = accum (C, kron(A,B)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '*' for T=kron(A,B) }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, M, A, and B }
function GrB_Matrix_kronecker_BinaryOp(C:TGrB_Matrix; M:TGrB_Matrix; accum:TGrB_BinaryOp; op:TGrB_BinaryOp; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M> = accum (C, kron(A,B)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '*' for T=kron(A,B) }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, M, A, and B }
function GrB_Matrix_kronecker_Monoid(C:TGrB_Matrix; M:TGrB_Matrix; accum:TGrB_BinaryOp; monoid:TGrB_Monoid; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ C<M> = accum (C, kron(A,B)) }
{ input/output matrix for results }
{ optional mask for C, unused if NULL }
{ optional accum for Z=accum(C,T) }
{ defines '*' for T=kron(A,B) }
{ first input:  matrix A }
{ second input: matrix B }
{ descriptor for C, M, A, and B }
function GrB_Matrix_kronecker_Semiring(C:TGrB_Matrix; M:TGrB_Matrix; accum:TGrB_BinaryOp; semiring:TGrB_Semiring; A:TGrB_Matrix; 
           B:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB_Monoid: built-in monoids }
{============================================================================== }
{-------------------------------------------------------------------------- }
{ 10 MIN monoids: (not for complex types) }
{-------------------------------------------------------------------------- }
{ GxB_MIN monoids, historical, use GrB_MIN_MONOID_* instead: }
{ identity: INT8_MAX     terminal: INT8_MIN }
{ identity: INT16_MAX    terminal: INT16_MIN }
{ identity: INT32_MAX    terminal: INT32_MIN }
{ identity: INT64_MAX    terminal: INT32_MIN }
{ identity: UINT8_MAX    terminal: 0 }
{ identity: UINT16_MAX   terminal: 0 }
{ identity: UINT32_MAX   terminal: 0 }
{ identity: UINT64_MAX   terminal: 0 }
{ identity: INFINITY     terminal: -INFINITY }
{ identity: INFINITY     terminal: -INFINITY }
{ preferred names from the v1.3 spec: }
{ identity: INT8_MAX     terminal: INT8_MIN }
{ identity: INT16_MAX    terminal: INT16_MIN }
{ identity: INT32_MAX    terminal: INT32_MIN }
{ identity: INT64_MAX    terminal: INT32_MIN }
{ identity: UINT8_MAX    terminal: 0 }
{ identity: UINT16_MAX   terminal: 0 }
{ identity: UINT32_MAX   terminal: 0 }
{ identity: UINT64_MAX   terminal: 0 }
{ identity: INFINITY     terminal: -INFINITY }
{ identity: INFINITY     terminal: -INFINITY }
{-------------------------------------------------------------------------- }
{ 10 MAX monoids: }
{-------------------------------------------------------------------------- }
{ GxB_MAX monoids, historical, use GrB_MAX_MONOID_* instead: }
{ identity: INT8_MIN     terminal: INT8_MAX }
{ identity: INT16_MIN    terminal: INT16_MAX }
{ identity: INT32_MIN    terminal: INT32_MAX }
{ identity: INT64_MIN    terminal: INT64_MAX }
{ identity: 0            terminal: UINT8_MAX }
{ identity: 0            terminal: UINT16_MAX }
{ identity: 0            terminal: UINT32_MAX }
{ identity: 0            terminal: UINT64_MAX }
{ identity: -INFINITY    terminal: INFINITY }
{ identity: -INFINITY    terminal: INFINITY }
{ preferred names from the v1.3 spec: }
{ identity: INT8_MIN     terminal: INT8_MAX }
{ identity: INT16_MIN    terminal: INT16_MAX }
{ identity: INT32_MIN    terminal: INT32_MAX }
{ identity: INT64_MIN    terminal: INT64_MAX }
{ identity: 0            terminal: UINT8_MAX }
{ identity: 0            terminal: UINT16_MAX }
{ identity: 0            terminal: UINT32_MAX }
{ identity: 0            terminal: UINT64_MAX }
{ identity: -INFINITY    terminal: INFINITY }
{ identity: -INFINITY    terminal: INFINITY }
{-------------------------------------------------------------------------- }
{ 12 PLUS monoids: }
{-------------------------------------------------------------------------- }
{ GxB_PLUS monoids, historical, use GrB_PLUS_MONOID_* instead: }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ preferred names from the v1.3 spec: }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ complex monoids: }
{ identity: 0 }
{ identity: 0 }
{-------------------------------------------------------------------------- }
{ 12 TIMES monoids: identity value is 1, int* and uint* are terminal }
{-------------------------------------------------------------------------- }
{ GxB_TIMES monoids, historical, use GrB_TIMES_MONOID_* instead: }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1 }
{ identity: 1 }
{ preferred names from the v1.3 spec: }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1            terminal: 0 }
{ identity: 1 }
{ identity: 1 }
{ complex monoids: }
{ identity: 1 }
{ identity: 1 }
{-------------------------------------------------------------------------- }
{ 13 ANY monoids: }
{-------------------------------------------------------------------------- }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{ identity: any value    terminal: any value }
{-------------------------------------------------------------------------- }
{ 4 Boolean monoids: (see also the GxB_ANY_BOOL_MONOID above) }
{-------------------------------------------------------------------------- }
{ GxB_* boolean monoids, historical, use GrB_* instead: }
{ identity: false        terminal: true }
{ identity: true         terminal: false }
{ identity: false }
{ identity: true }
{ (alternative name for GrB_LXNOR_MONOID_BOOL) }
{ preferred names from the v1.3 spec: }
{ identity: false        terminal: true }
{ identity: true         terminal: false }
{ identity: false }
{ identity: true }
{-------------------------------------------------------------------------- }
{ 16 Bitwise-or monoids: }
{-------------------------------------------------------------------------- }
{ BOR monoids (bitwise or): }
{ identity: 0   terminal: 0xFF }
{ identity: 0   terminal: 0xFFFF }
{ identity: 0   terminal: 0xFFFFFFFF }
{ identity: 0   terminal: 0xFFFFFFFFFFFFFFFF }
{ BAND monoids (bitwise and): }
{ identity: 0xFF               terminal: 0 }
{ identity: 0xFFFF             terminal: 0 }
{ identity: 0xFFFFFFFF         terminal: 0 }
{ identity: 0xFFFFFFFFFFFFFFFF terminal: 0 }
{ BXOR monoids (bitwise xor): }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ identity: 0 }
{ BXNOR monoids (bitwise xnor): }
{ identity: 0xFF }
{ identity: 0xFFFF }
{ identity: 0xFFFFFFFF }
  var
    GxB_MIN_INT8_MONOID : TGrB_Monoid;cvar;external libgraphblas;
{ identity: 0xFFFFFFFFFFFFFFFF }
{============================================================================== }
{ GrB_Semiring: built-in semirings }
{============================================================================== }
{ Using built-in types and operators, SuiteSparse:GraphBLAS provides }
{ 1553 pre-defined, built-in semirings: }
{ 1000 semirings with a multiply operator TxT -> T where T is non-Boolean, }
{ from the complete cross product of: }
{      5 monoids: MIN, MAX, PLUS, TIMES, ANY }
{      20 multiply operators: }
{          FIRST, SECOND, PAIR (=ONEB), MIN, MAX, PLUS, MINUS, TIMES, DIV, }
{          RDIV, RMINUS }
{          ISEQ, ISNE, ISGT, ISLT, ISGE, ISLE, }
{          LOR, LAND, LXOR }
{      10 non-Boolean real types, T }
{ }
{      Note that min_pair, max_pair, times_pair are all identical to any_pair. }
{      These 30 semirings are named below, but are internally remapped to }
{      their corresponding any_pair semiring. }
{ 300 semirings with a comparator TxT -> bool, where T is }
{ non-Boolean, from the complete cross product of: }
{      5 Boolean monoids: LAND, LOR, LXOR, EQ (=LXNOR), ANY }
{      6 multiply operators: EQ, NE, GT, LT, GE, LE }
{      10 non-Boolean real types, T }
{ 55 semirings with purely Boolean types, bool x bool -> bool, from the }
{ complete cross product of: }
{      5 Boolean monoids LAND, LOR, LXOR, EQ (=LXNOR), ANY }
{      11 multiply operators: }
{          FIRST, SECOND, LOR, LAND, LXOR, EQ (=LXNOR), GT, LT, GE, LE, }
{          PAIR (=ONEB) }
{ }
{      Note that lor_pair, land_pair, and eq_pair are all identical to }
{      any_pair.  These 3 semirings are named below, but are internally }
{      remapped to any_pair_bool semiring. }
{ 54 complex semirings: TxT -> T where T is float complex or double complex: }
{      3 complex monoids: PLUS, TIMES, ANY }
{      9 complex multiply operators: }
{          FIRST, SECOND, PAIR (=ONEB), PLUS, MINUS, TIMES, DIV, RDIV, RMINUS }
{      2 complex types }
{ }
{      Note that times_pair is identical to any_pair. }
{      These 2 semirings are named below, but are internally remapped to }
{      their corresponding any_pair semiring. }
{ 64 bitwise semirings: TxT -> T where T is an unsigned integer: }
{      4 bitwise monoids: BOR, BAND, BXOR, BXNOR }
{      4 bitwise multiply operators: BOR, BAND, BXOR, BXNOR }
{      4 unsigned integer types: UINT8, UINT16, UINT32, UINT64 }
{ 80 positional semirings: XxX -> T where T is int64 or int32, and the type of }
{ X is ignored: }
{      5 monoids: MIN, MAX, PLUS, TIMES, ANY }
{      8 multiply operators: }
{          FIRSTI, FIRSTI1, FIRSTJ, FIRSTJ1, }
{          SECONDI, SECONDI1, SECONDJ, SECONDJ1 }
{      2 types: int32, int64 }
{ The ANY operator is also valid to use as a multiplicative operator in a }
{ semiring, but serves no purpose in that case.  The ANY operator is meant as }
{ a fast additive operator for a monoid, that terminates, or short-circuits, }
{ as soon as any value is found.  A valid user semiring can be constructed }
{ with ANY as the multiply operator, but they are not predefined below. }
{ Likewise, additional built-in operators can be used as multiplicative }
{ operators for floating-point semirings (POW, ATAN2, HYPOT, ...) and many }
{ more semirings can be constructed from bitwise monoids and many integer }
{ binary (non-bitwise) multiplicative operators, but these are not }
{ pre-defined. }
{ In the names below, each semiring has a name of the form GxB_add_mult_T }
{ where add is the additive monoid, mult is the multiply operator, and T is }
{ the type.  The type T is always the type of x and y for the z=mult(x,y) }
{ operator.  The monoid's three types and the ztype of the mult operator are }
{ always the same.  This is the type T for the first set, and Boolean for }
{ the second and third sets of semirngs. }
{ 1553 = 1000 + 300 + 55 + 54 + 64 + 80 semirings are named below, but 35 = 30 }
{ + 3 + 2 are identical to the corresponding any_pair semirings of the same }
{ type.  For positional semirings, the mulitiply ops FIRSTJ and SECONDI are }
{ identical, as are FIRSTJ1 and SECONDI1.  These semirings still appear as }
{ predefined, for convenience. }
{------------------------------------------------------------------------------ }
{ 1000 non-Boolean semirings where all types are the same, given by suffix _T }
{------------------------------------------------------------------------------ }
{ semirings with multiply op: z = FIRST (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = SECOND (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = PAIR (x,y), all types x,y,z the same: }
{ (note that min_pair, max_pair, times_pair are all identical to any_pair, and are marked below) }
{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ }{ semirings with multiply op: z = MIN (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = MAX (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = PLUS (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = MINUS (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = TIMES (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = DIV (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = RDIV (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = RMINUS (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = ISEQ (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = ISNE (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = ISGT (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = ISLT (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = ISGE (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = ISLE (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = LOR (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = LAND (x,y), all types x,y,z the same: }
{ semirings with multiply op: z = LXOR (x,y), all types x,y,z the same: }
{------------------------------------------------------------------------------ }
{ 300 semirings with a comparator TxT -> bool, where T is non-Boolean }
{------------------------------------------------------------------------------ }
{ In the 4th column the GxB_EQ_*_* semirings could also be called }
{ GxB_LXNOR_*_*, since the EQ and LXNOR boolean operators are identical }
{ but those names are not included. }
{ semirings with multiply op: z = EQ (x,y), where z is boolean and x,y are given by the suffix: }
{ semirings with multiply op: z = NE (x,y), where z is boolean and x,y are given by the suffix: }
{ semirings with multiply op: z = GT (x,y), where z is boolean and x,y are given by the suffix: }
{ semirings with multiply op: z = LT (x,y), where z is boolean and x,y are given by the suffix: }
{ semirings with multiply op: z = GE (x,y), where z is boolean and x,y are given by the suffix: }
{ semirings with multiply op: z = LE (x,y), where z is boolean and x,y are given by the suffix: }
{------------------------------------------------------------------------------ }
{ 55 semirings with purely Boolean types, bool x bool -> bool }
{------------------------------------------------------------------------------ }
{ Note that lor_pair, land_pair, and eq_pair are all identical to any_pair. }
{ These 3 are marked below.  GxB_EQ_*_BOOL could be called }
{ GxB_LXNOR_*_BOOL, and GxB_*_EQ_BOOL could be called GxB_*_LXNOR_BOOL, }
{ but those names are not included. }
{ purely boolean semirings in the form GxB_(add monoid)_(multiply operator)_BOOL: }
{ }{ }{ }{------------------------------------------------------------------------------ }
{ 54 complex semirings }
{------------------------------------------------------------------------------ }
{ 3 monoids (plus, times, any), 2 types (FC32 and FC64), and 9 }
{ multiplicative operators. }
{ Note that times_pair is identical to any_pair. }
{ These 2 are marked below. }
{ }{ }{------------------------------------------------------------------------------ }
{ 64 bitwise semirings }
{------------------------------------------------------------------------------ }
{ monoids: (BOR, BAND, BXOR, BXNOR) x }
{ mult:    (BOR, BAND, BXOR, BXNOR) x }
{ types:   (UINT8, UINT16, UINT32, UINT64) }
{------------------------------------------------------------------------------ }
{ 80 positional semirings }
{------------------------------------------------------------------------------ }
{ monoids: (MIN, MAX, ANY, PLUS, TIMES) x }
{ mult:    (FIRSTI, FIRSTI1, FIRSTJ, FIRSTJ1, SECONDI, SECONDI1, SECONDJ, SECONDJ1) }
{ types:   (INT32, INT64) }
    GxB_MIN_FIRST_INT8 : TGrB_Semiring;cvar;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GrB_* semirings }
{------------------------------------------------------------------------------ }
{ The v1.3 C API for GraphBLAS adds the following 124 predefined semirings, }
{ with GrB_* names.  They are identical to 124 GxB_* semirings defined above, }
{ with the same name, except that GrB_LXNOR_LOR_SEMIRING_BOOL is identical to }
{ GxB_EQ_LOR_BOOL (since GrB_EQ_BOOL == GrB_LXNOR).  The old names are listed }
{ below alongside each new name; the new GrB_* names are preferred. }
{ 12 kinds of GrB_* semirings are available for all 10 real non-boolean types: }
{ PLUS_TIMES, PLUS_MIN, }
{ MIN_PLUS, MIN_TIMES, MIN_FIRST, MIN_SECOND, MIN_MAX, }
{ MAX_PLUS, MAX_TIMES, MAX_FIRST, MAX_SECOND, MAX_MIN }
{ and 4 semirings for boolean only: }
{ LOR_LAND, LAND_LOR, LXOR_LAND, LXNOR_LOR. }
{ GxB_* semirings corresponding to the equivalent GrB_* semiring are }
{ historical. }
{-------------------------------------------------------------------------- }
{ 20 semirings with PLUS monoids }
{-------------------------------------------------------------------------- }
{ PLUS_TIMES semirings for all 10 real, non-boolean types: }
{ GxB_PLUS_TIMES_INT8 }
{ GxB_PLUS_TIMES_INT16 }
{ GxB_PLUS_TIMES_INT32 }
{ GxB_PLUS_TIMES_INT64 }
{ GxB_PLUS_TIMES_UINT8 }
{ GxB_PLUS_TIMES_UINT16 }
{ GxB_PLUS_TIMES_UINT32 }
{ GxB_PLUS_TIMES_UINT64 }
{ GxB_PLUS_TIMES_FP32 }
{ GxB_PLUS_TIMES_FP64 }
{ PLUS_MIN semirings for all 10 real, non-boolean types: }
{ GxB_PLUS_MIN_INT8 }
{ GxB_PLUS_MIN_INT16 }
{ GxB_PLUS_MIN_INT32 }
{ GxB_PLUS_MIN_INT64 }
{ GxB_PLUS_MIN_UINT8 }
{ GxB_PLUS_MIN_UINT16 }
{ GxB_PLUS_MIN_UINT32 }
{ GxB_PLUS_MIN_UINT64 }
{ GxB_PLUS_MIN_FP32 }
{ GxB_PLUS_MIN_FP64 }
{-------------------------------------------------------------------------- }
{ 50 semirings with MIN monoids }
{-------------------------------------------------------------------------- }
{ MIN_PLUS semirings for all 10 real, non-boolean types: }
{ GxB_MIN_PLUS_INT8 }
{ GxB_MIN_PLUS_INT16 }
{ GxB_MIN_PLUS_INT32 }
{ GxB_MIN_PLUS_INT64 }
{ GxB_MIN_PLUS_UINT8 }
{ GxB_MIN_PLUS_UINT16 }
{ GxB_MIN_PLUS_UINT32 }
{ GxB_MIN_PLUS_UINT64 }
{ GxB_MIN_PLUS_FP32 }
{ GxB_MIN_PLUS_FP64 }
{ MIN_TIMES semirings for all 10 real, non-boolean types: }
{ GxB_MIN_TIMES_INT8 }
{ GxB_MIN_TIMES_INT16 }
{ GxB_MIN_TIMES_INT32 }
{ GxB_MIN_TIMES_INT64 }
{ GxB_MIN_TIMES_UINT8 }
{ GxB_MIN_TIMES_UINT16 }
{ GxB_MIN_TIMES_UINT32 }
{ GxB_MIN_TIMES_UINT64 }
{ GxB_MIN_TIMES_FP32 }
{ GxB_MIN_TIMES_FP64 }
{ MIN_FIRST semirings for all 10 real, non-boolean types: }
{ GxB_MIN_FIRST_INT8 }
{ GxB_MIN_FIRST_INT16 }
{ GxB_MIN_FIRST_INT32 }
{ GxB_MIN_FIRST_INT64 }
{ GxB_MIN_FIRST_UINT8 }
{ GxB_MIN_FIRST_UINT16 }
{ GxB_MIN_FIRST_UINT32 }
{ GxB_MIN_FIRST_UINT64 }
{ GxB_MIN_FIRST_FP32 }
{ GxB_MIN_FIRST_FP64 }
{ MIN_SECOND semirings for all 10 real, non-boolean types: }
{ GxB_MIN_SECOND_INT8 }
{ GxB_MIN_SECOND_INT16 }
{ GxB_MIN_SECOND_INT32 }
{ GxB_MIN_SECOND_INT64 }
{ GxB_MIN_SECOND_UINT8 }
{ GxB_MIN_SECOND_UINT16 }
{ GxB_MIN_SECOND_UINT32 }
{ GxB_MIN_SECOND_UINT64 }
{ GxB_MIN_SECOND_FP32 }
{ GxB_MIN_SECOND_FP64 }
{ MIN_MAX semirings for all 10 real, non-boolean types: }
{ GxB_MIN_MAX_INT8 }
{ GxB_MIN_MAX_INT16 }
{ GxB_MIN_MAX_INT32 }
{ GxB_MIN_MAX_INT64 }
{ GxB_MIN_MAX_UINT8 }
{ GxB_MIN_MAX_UINT16 }
{ GxB_MIN_MAX_UINT32 }
{ GxB_MIN_MAX_UINT64 }
{ GxB_MIN_MAX_FP32 }
{ GxB_MIN_MAX_FP64 }
{-------------------------------------------------------------------------- }
{ 50 semirings with MAX monoids }
{-------------------------------------------------------------------------- }
{ MAX_PLUS semirings for all 10 real, non-boolean types }
{ GxB_MAX_PLUS_INT8 }
{ GxB_MAX_PLUS_INT16 }
{ GxB_MAX_PLUS_INT32 }
{ GxB_MAX_PLUS_INT64 }
{ GxB_MAX_PLUS_UINT8 }
{ GxB_MAX_PLUS_UINT16 }
{ GxB_MAX_PLUS_UINT32 }
{ GxB_MAX_PLUS_UINT64 }
{ GxB_MAX_PLUS_FP32 }
{ GxB_MAX_PLUS_FP64 }
{ MAX_TIMES semirings for all 10 real, non-boolean types: }
{ GxB_MAX_TIMES_INT8 }
{ GxB_MAX_TIMES_INT16 }
{ GxB_MAX_TIMES_INT32 }
{ GxB_MAX_TIMES_INT64 }
{ GxB_MAX_TIMES_UINT8 }
{ GxB_MAX_TIMES_UINT16 }
{ GxB_MAX_TIMES_UINT32 }
{ GxB_MAX_TIMES_UINT64 }
{ GxB_MAX_TIMES_FP32 }
{ GxB_MAX_TIMES_FP64 }
{ MAX_FIRST semirings for all 10 real, non-boolean types: }
{ GxB_MAX_FIRST_INT8 }
{ GxB_MAX_FIRST_INT16 }
{ GxB_MAX_FIRST_INT32 }
{ GxB_MAX_FIRST_INT64 }
{ GxB_MAX_FIRST_UINT8 }
{ GxB_MAX_FIRST_UINT16 }
{ GxB_MAX_FIRST_UINT32 }
{ GxB_MAX_FIRST_UINT64 }
{ GxB_MAX_FIRST_FP32 }
{ GxB_MAX_FIRST_FP64 }
{ MAX_SECOND semirings for all 10 real, non-boolean types: }
{ GxB_MAX_SECOND_INT8 }
{ GxB_MAX_SECOND_INT16 }
{ GxB_MAX_SECOND_INT32 }
{ GxB_MAX_SECOND_INT64 }
{ GxB_MAX_SECOND_UINT8 }
{ GxB_MAX_SECOND_UINT16 }
{ GxB_MAX_SECOND_UINT32 }
{ GxB_MAX_SECOND_UINT64 }
{ GxB_MAX_SECOND_FP32 }
{ GxB_MAX_SECOND_FP64 }
{ MAX_MIN semirings for all 10 real, non-boolean types: }
{ GxB_MAX_MIN_INT8 }
{ GxB_MAX_MIN_INT16 }
{ GxB_MAX_MIN_INT32 }
{ GxB_MAX_MIN_INT64 }
{ GxB_MAX_MIN_UINT8 }
{ GxB_MAX_MIN_UINT16 }
{ GxB_MAX_MIN_UINT32 }
{ GxB_MAX_MIN_UINT64 }
{ GxB_MAX_MIN_FP32 }
{ GxB_MAX_MIN_FP64 }
{-------------------------------------------------------------------------- }
{ 4 boolean semirings: }
{-------------------------------------------------------------------------- }
{ GxB_LOR_LAND_BOOL }
{ GxB_LAND_LOR_BOOL }
{ GxB_LXOR_LAND_BOOL }
    GrB_PLUS_TIMES_SEMIRING_INT8 : TGrB_Semiring;cvar;external libgraphblas;
{ GxB_EQ_LOR_BOOL (note EQ == LXNOR) }
{============================================================================== }
{ GrB_*_resize:  change the size of a matrix or vector }
{============================================================================== }
{ If the dimensions decrease, entries that fall outside the resized matrix or }
{ vector are deleted. }
{ change the size of a matrix }
{ matrix to modify }
{ new number of rows in matrix }
{ new number of columns in matrix }

function GrB_Matrix_resize(C:TGrB_Matrix; nrows_new:TGrB_Index; ncols_new:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ change the size of a vector }
{ vector to modify }
{ new number of rows in vector }
function GrB_Vector_resize(w:TGrB_Vector; nrows_new:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ GxB_*_resize are identical to the GrB_*resize methods above }
{ change the size of a matrix (historical) }
{ matrix to modify }
{ new number of rows in matrix }
{ new number of columns in matrix }
function GxB_Matrix_resize(C:TGrB_Matrix; nrows_new:TGrB_Index; ncols_new:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ change the size of a vector (historical) }
{ vector to modify }
{ new number of rows in vector }
function GxB_Vector_resize(w:TGrB_Vector; nrows_new:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ GxB_resize is a generic function for resizing a matrix or vector: }
{ GrB_Vector_resize (u,nrows_new) }
{ GrB_Matrix_resize (A,nrows_new,ncols_new) }
{============================================================================== }
{ GxB_fprint and GxB_print: print the contents of a GraphBLAS object }
{============================================================================== }
{ GxB_fprint (object, GxB_Print_Level pr, FILE *f) prints the contents of any }
{ of the 9 GraphBLAS objects to the file f, and also does an extensive test on }
{ the object to determine if it is valid.  It returns one of the following }
{ error conditions: }
{ }
{      GrB_SUCCESS               object is valid }
{      GrB_UNINITIALIZED_OBJECT  object is not initialized }
{      GrB_INVALID_OBJECT        object is not valid }
{      GrB_NULL_POINTER          object is a NULL pointer }
{      GrB_INVALID_VALUE         fprintf returned an I/O error; see the ANSI C }
{                                errno or GrB_error( )for details. }
{ }
{ GxB_fprint does not modify the status of any object.  If a matrix or vector }
{ has not been completed, the pending computations are guaranteed to *not* be }
{ performed by GxB_fprint.  The reason is simple.  It is possible for a bug in }
{ the user application (such as accessing memory outside the bounds of an }
{ array) to mangle the internal content of a GraphBLAS object, and GxB_fprint }
{ can be a helpful tool to track down this bug.  If GxB_fprint attempted to }
{ complete any computations prior to printing or checking the contents of the }
{ matrix or vector, then further errors could occur, including a segfault. }
{ }
{ The type-specific functions include an additional argument, the name string. }
{ The name is printed at the beginning of the display (assuming pr is not }
{ GxB_SILENT) so that the object can be more easily identified in the output. }
{ For the type-generic methods GxB_fprint and GxB_print, the name string is }
{ the variable name of the object itself. }
{ }
{ If f is NULL, stdout is used; this is not an error condition.  If pr is }
{ outside the bounds 0 to 3, negative values are treated as GxB_SILENT, and }
{ values > 3 are treated as GxB_COMPLETE.  If name is NULL, it is treated as }
{ the empty string. }
{ }
{ GxB_print (object, GxB_Print_Level pr) is the same as GxB_fprint, except }
{ that it prints the contents with printf instead of fprintf to a file f. }
{ }
{ The exact content and format of what is printed is implementation-dependent, }
{ and will change from version to version of SuiteSparse:GraphBLAS.  Do not }
{ attempt to rely on the exact content or format by trying to parse the }
{ resulting output via another program.  The intent of these functions is to }
{ produce a report of the object for visual inspection. }
{ nothing is printed, just check the object }
{ print a terse summary }
{ short description, about 30 entries of a matrix }
{ print the entire contents of the object }
{ GxB_SHORT but with "%.15g" for doubles }
{ GxB_COMPLETE but with "%.15g" for doubles }
type
  PGxB_Print_Level = ^TGxB_Print_Level;
  TGxB_Print_Level =  Longint;
  Const
    GxB_SILENT = 0;
    GxB_SUMMARY = 1;
    GxB_SHORT = 2;
    GxB_COMPLETE = 3;
    GxB_SHORT_VERBOSE = 4;
    GxB_COMPLETE_VERBOSE = 5;
;
{ print and check a GrB_Type }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }

function GxB_Type_fprint(_type:TGrB_Type; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_UnaryOp }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_UnaryOp_fprint(unaryop:TGrB_UnaryOp; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_BinaryOp }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_BinaryOp_fprint(binaryop:TGrB_BinaryOp; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_IndexUnaryOp }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_IndexUnaryOp_fprint(op:TGrB_IndexUnaryOp; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GxB_SelectOp }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_SelectOp_fprint(selectop:TGxB_SelectOp; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_Monoid }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_Monoid_fprint(monoid:TGrB_Monoid; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_Semiring }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_Semiring_fprint(semiring:TGrB_Semiring; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_Descriptor }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_Descriptor_fprint(descriptor:TGrB_Descriptor; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_Matrix }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_Matrix_fprint(A:TGrB_Matrix; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_Vector }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_Vector_fprint(v:TGrB_Vector; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{ print and check a GrB_Scalar }
{ object to print and check }
{ name of the object }
{ print level }
{ file for output }
function GxB_Scalar_fprint(s:TGrB_Scalar; name:Pchar; pr:TGxB_Print_Level; f:PFILE):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ Matrix and vector import/export/pack/unpack }
{============================================================================== }
{ The import/export/pack/unpack functions allow the user application to create }
{ a GrB_Matrix or GrB_Vector object, and to extract its contents, faster and }
{ with less memory overhead than the GrB_*_build and GrB_*_extractTuples }
{ functions. }
{ The semantics of import/export/pack/unpack are the same as the "move }
{ constructor" in C++.  On import, the user provides a set of arrays that have }
{ been previously allocated via the ANSI C malloc function.  The arrays define }
{ the content of the matrix or vector.  Unlike GrB_*_build, the GraphBLAS }
{ library then takes ownership of the user's input arrays and may either (a) }
{ incorporate them into its internal data structure for the new GrB_Matrix or }
{ GrB_Vector, potentially creating the GrB_Matrix or GrB_Vector in constant }
{ time with no memory copying performed, or (b) if the library does not }
{ support the import format directly, then it may convert the input to its }
{ internal format, and then free the user's input arrays.  GraphBLAS may also }
{ choose to use a mix of the two strategies.  In either case, the input arrays }
{ are no longer "owned" by the user application.  If A is a GrB_Matrix created }
{ by an import/pack, the user input arrays are freed no later than GrB_free }
{ (&A), and may be freed earlier, at the discretion of the GraphBLAS library. }
{ The data structure of the GrB_Matrix and GrB_Vector remain opaque. }
{ The export/unpack of a GrB_Matrix or GrB_Vector is symmetric with the import }
{ operation.  The export is destructive, where the GrB_Matrix or GrB_Vector no }
{ longer exists when the export completes.  The GrB_Matrix or GrB_Vector }
{ exists after an unpack operation, just with no entries.  In both export and }
{ unpack, the user is returned several arrays that contain the matrix or }
{ vector in the requested format.  Ownership of these arrays is given to the }
{ user application, which is then responsible for freeing them via the ANSI C }
{ free function.  If the output format is supported by the GraphBLAS library, }
{ then these arrays may be returned to the user application in O(1) time and }
{ with no memory copying performed.  Otherwise, the GraphBLAS library will }
{ create the output arrays for the user (via the ANSI C malloc function), fill }
{ them with the GrB_Matrix or GrB_Vector data, and then return the newly }
{ allocated arrays to the user. }
{ Eight different formats are provided for import/export.  For each format, }
{ the Ax array has a C-type <type> corresponding to one of the 13 built-in }
{ types in GraphBLAS (bool, int*_t, uint*_t, float, double, float complex, or }
{ double complex), or a user-defined type. }
{ On import/pack, the required user arrays Ah, Ap, Ab, Ai, Aj, and/or Ax must }
{ be non-NULL pointers to memory space allocated by the ANSI C malloc (or }
{ calloc, or realloc), unless nzmax is zero (in which case the Ab, Ai, Aj, Ax, }
{ vb, vi, and vx arrays may all be NULL).  For the import, A (or GrB_Vector v) }
{ is undefined on input, just like GrB_*_new, the GrB_Matrix.  If the import }
{ is successful, the GrB_Matrix A or GrB_Vector v is created, and the pointers }
{ to the user input arrays have been set to NULL.  These user arrays have }
{ either been incorporated directly into the GrB_Matrix A or GrB_Vector v, in }
{ which case the user input arrays will eventually be freed by GrB_free (&A), }
{ or their contents have been copied and the arrays freed.  This decision is }
{ made by the GraphBLAS library itself, and the user application has no }
{ control over this decision. }
{ If any of the arrays Ab, Aj, Ai, Ax, vb, vi, or vx have zero size (with }
{ nzmax of zero), they are allowed to be be NULL pointers on input. }
{ A matrix or vector may be "iso", where all entries present in the pattern }
{ have the same value.  In this case, the boolean iso flag is true, and the }
{ corresponding numerical array (Ax for matrices, vx for vectors, below) need }
{ be only large enough to hold a single value. }
{ No error checking is performed on the content of the user input arrays.  If }
{ the user input arrays do not conform to the precise specifications above, }
{ results are undefined.  No typecasting of the values of the matrix or vector }
{ entries is performed on import or export. }
{ SuiteSparse:GraphBLAS supports all eight formats natively (CSR, CSC, }
{ HyperCSR, and HyperCSC, BitmapR, BitmapC, FullR, FullC).  For vectors, only }
{ CSC, BitmapC, and FullC formats are used.  On import, the all eight formats }
{ take O(1) time and memory to import.  On export, if the GrB_Matrix or }
{ GrB_Vector is already in this particular format, then the export takes O(1) }
{ time and no memory copying is performed. }
{ If the import is not successful, the GxB_Matrix_import_* functions return A }
{ as NULL, GxB_Vector_import returns v as NULL, and the user input arrays are }
{ neither modified nor freed.  They are still owned by the user application. }
{ If the input data is untrusted, use the following descriptor setting for }
{ GxB_Matrix_import* and GxB_Matrix_pack*.  The import/pack will be slower, }
{ but secure.  GrB_Matrix_import uses the slow, secure method, since it has }
{ no descriptor input. }
{ }
{      GxB_set (desc, GxB_IMPORT, GxB_SECURE_IMPORT) ; }
{ As of v5.2.0, GxB_*import* and GxB_*export* are declared historical.  Use }
{ GxB_*pack* and GxB_*unpack* instead.  The GxB import/export will be kept }
{ but only documented here, not in the User Guide. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_CSR: pack a CSR matrix }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_CSR }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ row "pointers", Ap_size >= (nrows+1)* sizeof(int64_t) }
{ column indices, Aj_size >= nvals(A) * sizeof(int64_t) }
{ values, Ax_size >= nvals(A) * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_import_CSR(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PPGrB_Index; 
           Aj:PPGrB_Index; Ax:Ppointer; Ap_size:TGrB_Index; Aj_size:TGrB_Index; Ax_size:TGrB_Index; 
           iso:Tbool; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a CSR matrix }
{ matrix to create (type, nrows, ncols unchanged) }
{ row "pointers", Ap_size >= (nrows+1)* sizeof(int64_t) }
{ column indices, Aj_size >= nvals(A) * sizeof(int64_t) }
{ values, Ax_size >= nvals(A) * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_pack_CSR(A:TGrB_Matrix; Ap:PPGrB_Index; Aj:PPGrB_Index; Ax:Ppointer; Ap_size:TGrB_Index; 
           Aj_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ CSR:  an nrows-by-ncols matrix with nvals entries in CSR format consists }
{ of 3 arrays, where nvals = Ap [nrows]: }
{ }
{          GrB_Index Ap [nrows+1], Aj [nvals] ; <type> Ax [nvals] ; }
{ }
{      The column indices of entries in the ith row of the matrix are held }
{      in Aj [Ap [i] ... Ap[i+1]], and the corresponding values are held }
{      in the same positions in Ax.  Column indices must be in the range 0 }
{      to ncols-1.  If jumbled is false, the column indices must appear in }
{      sorted order within each row.  No duplicate column indices may }
{      appear in any row.  Ap [0] must equal zero, and Ap [nrows] must }
{      equal nvals.  The Ap array must be of size nrows+1 (or larger), and }
{      the Aj and Ax arrays must have size at least nvals.  If nvals is }
{      zero, then the Aj and Ax arrays need not be present and can be }
{      NULL. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_CSC: pack a CSC matrix }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_CSC }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ col "pointers", Ap_size >= (ncols+1)*sizeof(int64_t) }
{ row indices, Ai_size >= nvals(A)*sizeof(int64_t) }
{ values, Ax_size >= nvals(A) * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_import_CSC(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PPGrB_Index; 
           Ai:PPGrB_Index; Ax:Ppointer; Ap_size:TGrB_Index; Ai_size:TGrB_Index; Ax_size:TGrB_Index; 
           iso:Tbool; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a CSC matrix }
{ matrix to create (type, nrows, ncols unchanged) }
{ col "pointers", Ap_size >= (ncols+1)*sizeof(int64_t) }
{ row indices, Ai_size >= nvals(A)*sizeof(int64_t) }
{ values, Ax_size >= nvals(A) * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_pack_CSC(A:TGrB_Matrix; Ap:PPGrB_Index; Ai:PPGrB_Index; Ax:Ppointer; Ap_size:TGrB_Index; 
           Ai_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ CSC:  an nrows-by-ncols matrix with nvals entries in CSC format consists }
{ of 3 arrays, where nvals = Ap [ncols]: }
{ }
{          GrB_Index Ap [ncols+1], Ai [nvals] ; <type> Ax [nvals] ; }
{ }
{      The row indices of entries in the jth column of the matrix are held }
{      in Ai [Ap [j] ... Ap[j+1]], and the corresponding values are held }
{      in the same positions in Ax.  Row indices must be in the range 0 to }
{      nrows-1.  If jumbled is false, the row indices must appear in }
{      sorted order within each column.  No duplicate row indices may }
{      appear in any column.  Ap [0] must equal zero, and Ap [ncols] must }
{      equal nvals.  The Ap array must be of size ncols+1 (or larger), and }
{      the Ai and Ax arrays must have size at least nvals.  If nvals is }
{      zero, then the Ai and Ax arrays need not be present and can be }
{      NULL. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_HyperCSR: pack a hypersparse CSR matrix }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_HyperCSR }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ row "pointers", Ap_size >= (nvec+1)*sizeof(int64_t) }
{ row indices, Ah_size >= nvec*sizeof(int64_t) }
{ column indices, Aj_size >= nvals(A)*sizeof(int64_t) }
{ values, Ax_size >= nvals(A) * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of rows that appear in Ah }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_import_HyperCSR(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PPGrB_Index; 
           Ah:PPGrB_Index; Aj:PPGrB_Index; Ax:Ppointer; Ap_size:TGrB_Index; Ah_size:TGrB_Index; 
           Aj_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; nvec:TGrB_Index; jumbled:Tbool; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a hypersparse CSR matrix }
{ matrix to create (type, nrows, ncols unchanged) }
{ row "pointers", Ap_size >= (nvec+1)*sizeof(int64_t) }
{ row indices, Ah_size >= nvec*sizeof(int64_t) }
{ column indices, Aj_size >= nvals(A)*sizeof(int64_t) }
{ values, Ax_size >= nvals(A) * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of rows that appear in Ah }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_pack_HyperCSR(A:TGrB_Matrix; Ap:PPGrB_Index; Ah:PPGrB_Index; Aj:PPGrB_Index; Ax:Ppointer; 
           Ap_size:TGrB_Index; Ah_size:TGrB_Index; Aj_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; 
           nvec:TGrB_Index; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ HyperCSR: an nrows-by-ncols matrix with nvals entries and nvec }
{ rows that may have entries in HyperCSR format consists of 4 arrays, }
{ where nvals = Ap [nvec]: }
{ }
{          GrB_Index Ah [nvec], Ap [nvec+1], Aj [nvals] ; }
{          <type> Ax [nvals] ; }
{ }
{      The Aj and Ax arrays are the same for a matrix in CSR or HyperCSR }
{      format.  Only Ap and Ah differ. }
{ }
{      The Ah array is a list of the row indices of rows that appear in }
{      the matrix.  It }
{      must appear in sorted order, and no duplicates may appear.  If i = }
{      Ah [k] is the kth row, then the column indices of the ith }
{      row appear in Aj [Ap [k] ... Ap [k+1]], and the corresponding }
{      values appear in the same locations in Ax.  Column indices must be }
{      in the range 0 to ncols-1, and must appear in sorted order within }
{      each row.  No duplicate column indices may appear in any row.  nvec }
{      may be zero, to denote an array with no entries.  The Ah array must }
{      be of size at least nvec, Ap must be of size at least nvec+1, and }
{      Aj and Ax must be at least of size nvals.  If nvals is zero, then }
{      the Aj and Ax arrays need not be present and can be NULL. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_HyperCSC: pack a hypersparse CSC matrix }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_HyperCSC }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ col "pointers", Ap_size >= (nvec+1)*sizeof(int64_t) }
{ column indices, Ah_size >= nvec*sizeof(int64_t) }
{ row indices, Ai_size >= nvals(A)*sizeof(int64_t) }
{ values, Ax_size >= nvals(A)*(type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of columns that appear in Ah }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_import_HyperCSC(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PPGrB_Index; 
           Ah:PPGrB_Index; Ai:PPGrB_Index; Ax:Ppointer; Ap_size:TGrB_Index; Ah_size:TGrB_Index; 
           Ai_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; nvec:TGrB_Index; jumbled:Tbool; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a hypersparse CSC matrix }
{ matrix to create (type, nrows, ncols unchanged) }
{ col "pointers", Ap_size >= (nvec+1)*sizeof(int64_t) }
{ column indices, Ah_size >= nvec*sizeof(int64_t) }
{ row indices, Ai_size >= nvals(A)*sizeof(int64_t) }
{ values, Ax_size >= nvals(A)*(type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of columns that appear in Ah }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_pack_HyperCSC(A:TGrB_Matrix; Ap:PPGrB_Index; Ah:PPGrB_Index; Ai:PPGrB_Index; Ax:Ppointer; 
           Ap_size:TGrB_Index; Ah_size:TGrB_Index; Ai_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; 
           nvec:TGrB_Index; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ HyperCSC: an nrows-by-ncols matrix with nvals entries and nvec }
{ columns that may have entries in HyperCSC format consists of 4 arrays, }
{ where nvals = Ap [nvec]: }
{ }
{ }
{          GrB_Index Ah [nvec], Ap [nvec+1], Ai [nvals] ; }
{          <type> Ax [nvals] ; }
{ }
{      The Ai and Ax arrays are the same for a matrix in CSC or HyperCSC }
{      format.  Only Ap and Ah differ. }
{ }
{      The Ah array is a list of the column indices of non-empty columns. }
{      It must appear in sorted order, and no duplicates may appear.  If j }
{      = Ah [k] is the kth non-empty column, then the row indices of the }
{      jth column appear in Ai [Ap [k] ... Ap [k+1]], and the }
{      corresponding values appear in the same locations in Ax.  Row }
{      indices must be in the range 0 to nrows-1, and must appear in }
{      sorted order within each column.  No duplicate row indices may }
{      appear in any column.  nvec may be zero, to denote an array with no }
{      entries.  The Ah array must be of size at least nvec, Ap must be of }
{      size at least nvec+1, and Ai and Ax must be at least of size nvals. }
{      If nvals is zero, then the Ai and Ax arrays need not be present and }
{      can be NULL. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_BitmapR: pack a bitmap matrix, held by row }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_BitmapR }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ bitmap, Ab_size >= nrows*ncols }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_import_BitmapR(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ab:PPint8_t; 
           Ax:Ppointer; Ab_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; nvals:TGrB_Index; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a bitmap matrix, held by row }
{ matrix to create (type, nrows, ncols unchanged) }
{ bitmap, Ab_size >= nrows*ncols }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_pack_BitmapR(A:TGrB_Matrix; Ab:PPint8_t; Ax:Ppointer; Ab_size:TGrB_Index; Ax_size:TGrB_Index; 
           iso:Tbool; nvals:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ BitmapR: a dense format, but able to represent sparsity structure of A. }
{ }
{          int8_t Ab [nrows*ncols] ; }
{          <type> Ax [nrows*ncols] ; }
{ }
{      Ab and Ax are both of size nrows*ncols.  Ab [i*ncols+j] = 1 if the }
{      A(i,j) entry is present with value Ax [i*ncols+j], or 0 if A(i,j) }
{      is not present.  nvals must equal the number of 1's in the Ab }
{      array. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_BitmapC: pack a bitmap matrix, held by column }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_BitmapC }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ bitmap, Ab_size >= nrows*ncols }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_import_BitmapC(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ab:PPint8_t; 
           Ax:Ppointer; Ab_size:TGrB_Index; Ax_size:TGrB_Index; iso:Tbool; nvals:TGrB_Index; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a bitmap matrix, held by column }
{ matrix to create (type, nrows, ncols unchanged) }
{ bitmap, Ab_size >= nrows*ncols }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_pack_BitmapC(A:TGrB_Matrix; Ab:PPint8_t; Ax:Ppointer; Ab_size:TGrB_Index; Ax_size:TGrB_Index; 
           iso:Tbool; nvals:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ BitmapC: a dense format, but able to represent sparsity structure of A. }
{ }
{          int8_t Ab [nrows*ncols] ; }
{          <type> Ax [nrows*ncols] ; }
{ }
{      Ab and Ax are both of size nrows*ncols.  Ab [i+j*nrows] = 1 if the }
{      A(i,j) entry is present with value Ax [i+j*nrows], or 0 if A(i,j) }
{      is not present.  nvals must equal the number of 1's in the Ab }
{      array. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_FullR:  pack a full matrix, held by row }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_FullR }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_import_FullR(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ax:Ppointer; 
           Ax_size:TGrB_Index; iso:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a full matrix, held by row }
{ matrix to create (type, nrows, ncols unchanged) }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_pack_FullR(A:TGrB_Matrix; Ax:Ppointer; Ax_size:TGrB_Index; iso:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ FullR: an nrows-by-ncols full matrix held in row-major order: }
{ }
{  <type> Ax [nrows*ncols] ; }
{ }
{      Ax is an array of size nrows*ncols, where A(i,j) is held in }
{      Ax [i*ncols+j].  All entries in A are present. }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_pack_FullC: pack a full matrix, held by column }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Matrix_pack_FullC }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_import_FullC(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ax:Ppointer; 
           Ax_size:TGrB_Index; iso:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a full matrix, held by column }
{ matrix to create (type, nrows, ncols unchanged) }
{ values, Ax_size >= nrows*ncols * (type size) }
{ or Ax_size >= (type size), if iso is true }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_pack_FullC(A:TGrB_Matrix; Ax:Ppointer; Ax_size:TGrB_Index; iso:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ FullC: an nrows-by-ncols full matrix held in column-major order: }
{ }
{  <type> Ax [nrows*ncols] ; }
{ }
{      Ax is an array of size nrows*ncols, where A(i,j) is held in }
{      Ax [i+j*nrows].  All entries in A are present. }
{------------------------------------------------------------------------------ }
{ GxB_Vector_pack_CSC: import/pack a vector in CSC format }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Vector_pack_CSC }
{ handle of vector to create }
{ type of vector to create }
{ vector length }
{ indices, vi_size >= nvals(v) * sizeof(int64_t) }
{ values, vx_size >= nvals(v) * (type size) }
{ or vx_size >= (type size), if iso is true }
{ size of vi in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in vector }
{ if true, indices may be unsorted }
function GxB_Vector_import_CSC(v:PGrB_Vector; _type:TGrB_Type; n:TGrB_Index; vi:PPGrB_Index; vx:Ppointer; 
           vi_size:TGrB_Index; vx_size:TGrB_Index; iso:Tbool; nvals:TGrB_Index; jumbled:Tbool; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a vector in CSC format }
{ vector to create (type and length unchanged) }
{ indices, vi_size >= nvals(v) * sizeof(int64_t) }
{ values, vx_size >= nvals(v) * (type size) }
{ or vx_size >= (type size), if iso is true }
{ size of vi in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in vector }
{ if true, indices may be unsorted }
function GxB_Vector_pack_CSC(v:TGrB_Vector; vi:PPGrB_Index; vx:Ppointer; vi_size:TGrB_Index; vx_size:TGrB_Index; 
           iso:Tbool; nvals:TGrB_Index; jumbled:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ The GrB_Vector is treated as if it was a single column of an n-by-1 }
{ matrix in CSC format, except that no vp array is required.  If nvals is }
{ zero, then the vi and vx arrays need not be present and can be NULL. }
{------------------------------------------------------------------------------ }
{ GxB_Vector_pack_Bitmap: pack a vector in bitmap format }
{------------------------------------------------------------------------------ }
{ historical: GxB_Vector_pack_Bitmap }
{ handle of vector to create }
{ type of vector to create }
{ vector length }
{ bitmap, vb_size >= n }
{ values, vx_size >= n * (type size) }
{ or vx_size >= (type size), if iso is true }
{ size of vb in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in bitmap }
function GxB_Vector_import_Bitmap(v:PGrB_Vector; _type:TGrB_Type; n:TGrB_Index; vb:PPint8_t; vx:Ppointer; 
           vb_size:TGrB_Index; vx_size:TGrB_Index; iso:Tbool; nvals:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a bitmap vector }
{ vector to create (type and length unchanged) }
{ bitmap, vb_size >= n }
{ values, vx_size >= n * (type size) }
{ or vx_size >= (type size), if iso is true }
{ size of vb in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in bitmap }
function GxB_Vector_pack_Bitmap(v:TGrB_Vector; vb:PPint8_t; vx:Ppointer; vb_size:TGrB_Index; vx_size:TGrB_Index; 
           iso:Tbool; nvals:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ The GrB_Vector is treated as if it was a single column of an n-by-1 }
{ matrix in BitmapC format. }
{------------------------------------------------------------------------------ }
{ GxB_Vector_pack_Full: pack a vector in full format }
{------------------------------------------------------------------------------ }
{ historical: use GxB_Vector_pack_Full }
{ handle of vector to create }
{ type of vector to create }
{ vector length }
{ values, vx_size >= nvals(v) * (type size) }
{ or vx_size >= (type size), if iso is true }
{ size of vx in bytes }
{ if true, v is iso }
function GxB_Vector_import_Full(v:PGrB_Vector; _type:TGrB_Type; n:TGrB_Index; vx:Ppointer; vx_size:TGrB_Index; 
           iso:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ pack a full vector }
{ vector to create (type and length unchanged) }
{ values, vx_size >= nvals(v) * (type size) }
{ or vx_size >= (type size), if iso is true }
{ size of vx in bytes }
{ if true, v is iso }
function GxB_Vector_pack_Full(v:TGrB_Vector; vx:Ppointer; vx_size:TGrB_Index; iso:Tbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ The GrB_Vector is treated as if it was a single column of an n-by-1 }
{ matrix in FullC format. }
{------------------------------------------------------------------------------ }
{ GxB* export/unpack }
{------------------------------------------------------------------------------ }
{ The GxB_*_export/unpack functions are symmetric with the GxB_*_import/pack }
{ functions.  The export/unpack functions force completion of any pending }
{ operations, prior to the export, except if the only pending operation is to }
{ unjumble the matrix. }
{ }
{ If there are no entries in the matrix or vector, then the index arrays (Ai, }
{ Aj, or vi) and value arrays (Ax or vx) are returned as NULL.  This is not an }
{ error condition. }
{ }
{ A GrB_Matrix may be exported/unpacked in any one of four different formats. }
{ On successful export, the input GrB_Matrix A is freed, and the output arrays }
{ Ah, Ap, Ai, Aj, and/or Ax are returned to the user application as arrays }
{ allocated by the ANSI C malloc function.  The four formats are the same as }
{ the import formats for GxB_Matrix_import/pack. }
{ }
{ If jumbled is NULL on input, this indicates to GxB_*export/unpack* that the }
{ exported/unpacked matrix cannot be returned in a jumbled format.  In this }
{ case, if the matrix is jumbled, it is sorted before exporting it to the }
{ caller. }
{ }
{ If iso is NULL on input, this indicates to the export/unpack methods that }
{ the exported/unpacked matrix cannot be returned in a iso format, with an Ax }
{ array with just one entry.  In this case, if the matrix is iso, it is }
{ expanded before exporting/unpacking it to the caller. }
{ }
{ For the export/unpack*Full* methods, all entries in the matrix or must be }
{ present.  That is, GrB_*_nvals must report nvals equal to nrows*ncols or a }
{ matrix.  If this condition does not hold, the matrix/vector is not exported, }
{ and GrB_INVALID_VALUE is returned. }
{ }
{ If the export/unpack is not successful, the export/unpack functions do not }
{ modify matrix or vector and the user arrays are returned as NULL. }
{ historical: use GxB_Matrix_unpack_CSR }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ row "pointers" }
{ column indices }
{ values }
{ size of Ap in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_export_CSR(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ap:PPGrB_Index; 
           Aj:PPGrB_Index; Ax:Ppointer; Ap_size:PGrB_Index; Aj_size:PGrB_Index; Ax_size:PGrB_Index; 
           iso:Pbool; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a CSR matrix }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ row "pointers" }
{ column indices }
{ values }
{ size of Ap in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_unpack_CSR(A:TGrB_Matrix; Ap:PPGrB_Index; Aj:PPGrB_Index; Ax:Ppointer; Ap_size:PGrB_Index; 
           Aj_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_CSC }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ column "pointers" }
{ row indices }
{ values }
{ size of Ap in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_export_CSC(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ap:PPGrB_Index; 
           Ai:PPGrB_Index; Ax:Ppointer; Ap_size:PGrB_Index; Ai_size:PGrB_Index; Ax_size:PGrB_Index; 
           iso:Pbool; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a CSC matrix }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ column "pointers" }
{ row indices }
{ values }
{ size of Ap in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_unpack_CSC(A:TGrB_Matrix; Ap:PPGrB_Index; Ai:PPGrB_Index; Ax:Ppointer; Ap_size:PGrB_Index; 
           Ai_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_HyperCSR }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ row "pointers" }
{ row indices }
{ column indices }
{ values }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of rows that appear in Ah }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_export_HyperCSR(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ap:PPGrB_Index; 
           Ah:PPGrB_Index; Aj:PPGrB_Index; Ax:Ppointer; Ap_size:PGrB_Index; Ah_size:PGrB_Index; 
           Aj_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; nvec:PGrB_Index; jumbled:Pbool; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a hypersparse CSR matrix }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ row "pointers" }
{ row indices }
{ column indices }
{ values }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Aj in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of rows that appear in Ah }
{ if true, indices in each row may be unsorted }
function GxB_Matrix_unpack_HyperCSR(A:TGrB_Matrix; Ap:PPGrB_Index; Ah:PPGrB_Index; Aj:PPGrB_Index; Ax:Ppointer; 
           Ap_size:PGrB_Index; Ah_size:PGrB_Index; Aj_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; 
           nvec:PGrB_Index; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_HyperCSC }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ column "pointers" }
{ column indices }
{ row indices }
{ values }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of columns that appear in Ah }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_export_HyperCSC(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ap:PPGrB_Index; 
           Ah:PPGrB_Index; Ai:PPGrB_Index; Ax:Ppointer; Ap_size:PGrB_Index; Ah_size:PGrB_Index; 
           Ai_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; nvec:PGrB_Index; jumbled:Pbool; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a hypersparse CSC matrix }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ column "pointers" }
{ column indices }
{ row indices }
{ values }
{ size of Ap in bytes }
{ size of Ah in bytes }
{ size of Ai in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ number of columns that appear in Ah }
{ if true, indices in each column may be unsorted }
function GxB_Matrix_unpack_HyperCSC(A:TGrB_Matrix; Ap:PPGrB_Index; Ah:PPGrB_Index; Ai:PPGrB_Index; Ax:Ppointer; 
           Ap_size:PGrB_Index; Ah_size:PGrB_Index; Ai_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; 
           nvec:PGrB_Index; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_BitmapR }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ bitmap }
{ values }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_export_BitmapR(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ab:PPint8_t; 
           Ax:Ppointer; Ab_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; nvals:PGrB_Index; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a bitmap matrix, by row }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ bitmap }
{ values }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_unpack_BitmapR(A:TGrB_Matrix; Ab:PPint8_t; Ax:Ppointer; Ab_size:PGrB_Index; Ax_size:PGrB_Index; 
           iso:Pbool; nvals:PGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_BitmapC }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ bitmap }
{ values }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_export_BitmapC(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ab:PPint8_t; 
           Ax:Ppointer; Ab_size:PGrB_Index; Ax_size:PGrB_Index; iso:Pbool; nvals:PGrB_Index; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a bitmap matrix, by col }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ bitmap }
{ values }
{ size of Ab in bytes }
{ size of Ax in bytes }
{ if true, A is iso }
{ # of entries in bitmap }
function GxB_Matrix_unpack_BitmapC(A:TGrB_Matrix; Ab:PPint8_t; Ax:Ppointer; Ab_size:PGrB_Index; Ax_size:PGrB_Index; 
           iso:Pbool; nvals:PGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_FullR }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ values }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_export_FullR(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ax:Ppointer; 
           Ax_size:PGrB_Index; iso:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a full matrix, by row }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ values }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_unpack_FullR(A:TGrB_Matrix; Ax:Ppointer; Ax_size:PGrB_Index; iso:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Matrix_unpack_FullC }
{ handle of matrix to export and free }
{ type of matrix exported }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ values }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_export_FullC(A:PGrB_Matrix; _type:PGrB_Type; nrows:PGrB_Index; ncols:PGrB_Index; Ax:Ppointer; 
           Ax_size:PGrB_Index; iso:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a full matrix, by column }
{ matrix to unpack (type, nrows, ncols unchanged) }
{ values }
{ size of Ax in bytes }
{ if true, A is iso }
function GxB_Matrix_unpack_FullC(A:TGrB_Matrix; Ax:Ppointer; Ax_size:PGrB_Index; iso:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Vector_unpack_CSC }
{ handle of vector to export and free }
{ type of vector exported }
{ length of the vector }
{ indices }
{ values }
{ size of vi in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in vector }
{ if true, indices may be unsorted }
function GxB_Vector_export_CSC(v:PGrB_Vector; _type:PGrB_Type; n:PGrB_Index; vi:PPGrB_Index; vx:Ppointer; 
           vi_size:PGrB_Index; vx_size:PGrB_Index; iso:Pbool; nvals:PGrB_Index; jumbled:Pbool; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a CSC vector }
{ vector to unpack (type and length unchanged) }
{ indices }
{ values }
{ size of vi in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in vector }
{ if true, indices may be unsorted }
function GxB_Vector_unpack_CSC(v:TGrB_Vector; vi:PPGrB_Index; vx:Ppointer; vi_size:PGrB_Index; vx_size:PGrB_Index; 
           iso:Pbool; nvals:PGrB_Index; jumbled:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Vector_unpack_Bitmap }
{ handle of vector to export and free }
{ type of vector exported }
{ length of the vector }
{ bitmap }
{ values }
{ size of vb in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in bitmap }
function GxB_Vector_export_Bitmap(v:PGrB_Vector; _type:PGrB_Type; n:PGrB_Index; vb:PPint8_t; vx:Ppointer; 
           vb_size:PGrB_Index; vx_size:PGrB_Index; iso:Pbool; nvals:PGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a bitmap vector }
{ vector to unpack (type and length unchanged) }
{ bitmap }
{ values }
{ size of vb in bytes }
{ size of vx in bytes }
{ if true, v is iso }
{ # of entries in bitmap }
function GxB_Vector_unpack_Bitmap(v:TGrB_Vector; vb:PPint8_t; vx:Ppointer; vb_size:PGrB_Index; vx_size:PGrB_Index; 
           iso:Pbool; nvals:PGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ historical: use GxB_Vector_unpack_Full }
{ handle of vector to export and free }
{ type of vector exported }
{ length of the vector }
{ values }
{ size of vx in bytes }
{ if true, v is iso }
function GxB_Vector_export_Full(v:PGrB_Vector; _type:PGrB_Type; n:PGrB_Index; vx:Ppointer; vx_size:PGrB_Index; 
           iso:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ unpack a full vector }
{ vector to unpack (type and length unchanged) }
{ values }
{ size of vx in bytes }
{ if true, v is iso }
function GxB_Vector_unpack_Full(v:TGrB_Vector; vx:Ppointer; vx_size:PGrB_Index; iso:Pbool; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB hyper_hash pack/unpack }
{------------------------------------------------------------------------------ }
{ SuiteSparse:GraphBLAS v7.3.0 adds a new internal component to the }
{ hypersparse matrix format: the hyper_hash GrB_Matrix A->Y.  The matrix }
{ provides a fast lookup into the hyperlist Ah. }
{ GxB_unpack_HyperHash unpacks the hyper_hash from the hypersparse matrix A. }
{ Normally, this method is called immediately before calling one of the four }
{ methods GxB_Matrix_(export/unpack)_Hyper(CSR/CSC).  For example, to unpack }
{ then pack a hypersparse CSC matrix: }
{      GrB_Matrix Y = NULL ; }
{ }
{      // to unpack all of A: }
{      GxB_unpack_HyperHash (A, &Y, desc) ;    // first unpack A->Y into Y }
{      GxB_Matrix_unpack_HyperCSC (A,          // then unpack the rest of A }
{          &Ap, &Ah, &Ai, &Ax, &Ap_size, &Ah_size, &Ai_size, &Ax_size, }
{          &iso, &nvec, &jumbled, descriptor) ; }
{ }
{      // use the unpacked contents of A here, but do not change Ah or nvec. }
{      ... }
{       }
{      // to pack the data back into A: }
{      GxB_Matrix_pack_HyperCSC (A, ...) ;     // pack most of A, except A->Y  }
{      GxB_pack_HyperHash (A, &Y, desc) ;      // then pack A->Y }
{ The same process is used with GxB_Matrix_unpack_HyperCSR, }
{ an the GxB_Matrix_export_Hyper* and GxB_Matrix_import_Hyper* methods. }
{ If A is not hypersparse on input to GxB_unpack_HyperHash, or if A is }
{ hypersparse but does yet not have a hyper_hash, then Y is returned as NULL. }
{ This is not an error condition, and GrB_SUCCESS is returned.  The hyper_hash }
{ of a hypersparse matrix A is a matrix that provides quick access to the }
{ inverse of Ah.  It is not always needed and may not be present.  It is left }
{ as pending work to be computed when needed.  GrB_Matrix_wait (A) will ensure }
{ that the hyper_hash is constructed, if A is hypersparse. }
{ If Y is moved from A and returned as non-NULL to the caller, then it is }
{ the responsibility of the user application to free it, or to re-pack it back }
{ into A via GxB_pack_HyperHash, as shown in the example above. }
{ If this method is called to remove the hyper_hash Y from the hypersparse }
{ matrix A, and then GrB_Matrix_wait (A) is called, a new hyper_hash matrix is }
{ constructed for A. }
{ move A->Y into Y }
{ matrix to modify }
{ hyper_hash matrix to move from A }
{ unused }
function GxB_unpack_HyperHash(A:TGrB_Matrix; Y:PGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GxB_pack_HyperHash assigns the input Y matrix as the A->Y hyper_hash of the }
{ hypersparse matrix A.  Normally, this method is called immediately after }
{ calling one of the four methods GxB_Matrix_(import/pack)_Hyper(CSR/CSC). }
{ If A is not hypersparse on input to GxB_pack_HyperHash, or if A already has }
{ a hyper_hash matrix, or if Y is NULL on input, then nothing happens and Y is }
{ unchanged.  This is not an error condition and this method returns }
{ GrB_SUCCESS.  In this case, if Y is non-NULL after calling this method, it }
{ owned by the user application and freeing it is the responsibility of the }
{ user application. }
{ Basic checks are perfomed on Y: Y must have the right dimensions:  if A is }
{ HyperCSR and m-by-n with nvec vectors present in Ah, then Y must be n-by-v }
{ where v is a power of 2; if A is HyperCSR and m-by-n, then Y must be m-by-v. }
{ nvals(Y) must equal nvec.  Y must be sparse, held by column, and have type }
{ int64.  It cannot have any pending work.  It cannot have a hyper_hash }
{ of its own.  If any of these conditions hold, GrB_INVALID is returned and }
{ A and Y are unchanged. }
{ If Y is moved into A as its hyper_hash, then the caller's Y is set to NULL }
{ to indicate that it has been moved into A.  It is no longer owned by the }
{ caller, but is instead an opaque component of the A matrix.  It will be }
{ freed by SuiteSparse:GraphBLAS if A is modified or freed. }
{ Results are undefined if the input Y was not created by GxB_unpack_HyperHash }
{ (see the example above) or if the Ah contents or nvec of the matrix A are }
{ modified after they were exported/unpacked by }
{ GxB_Matrix_(export/unpack)_Hyper(CSR/CSC). }
{ move Y into A->Y }
{ matrix to modify }
{ hyper_hash matrix to pack into A }
{ unused }
function GxB_pack_HyperHash(A:TGrB_Matrix; Y:PGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GrB import/export }
{============================================================================== }
{ The GrB_Matrix_import method copies from user-provided arrays into an }
{ opaque GrB_Matrix and GrB_Matrix_export copies data out, from an opaque }
{ GrB_Matrix into user-provided arrays.  Unlike the GxB pack/unpack methods, }
{ memory is not handed off between the user application and GraphBLAS. }
{ These methods are much slower than the GxB pack/unpack methods, since they }
{ require a copy of the data to be made.  GrB_Matrix_import also must assume }
{ its input data cannot be trusted, and so it does extensive checks.  The GxB }
{ pack takes O(1) time in all cases (unless it is told the input data is }
{ untrusted, via the descriptor).  GxB unpack takes O(1) time unless the }
{ matrix is exported in a different format than it currently has. }
{ No typecasting of the values is done on import or export. }
{ The GrB C API specification supports 3 formats: }
{ CSR format (equiv to GxB_SPARSE with GxB_BY_ROW) }
{ CSC format (equiv to GxB_SPARSE with GxB_BY_COL) }
{ triplet format (like input to GrB*build) }
type
  PGrB_Format = ^TGrB_Format;
  TGrB_Format =  Longint;
  Const
    GrB_CSR_FORMAT = 0;
    GrB_CSC_FORMAT = 1;
    GrB_COO_FORMAT = 2;
;
{ import a GrB_BOOL matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_BOOL) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }

function GrB_Matrix_import_BOOL(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Pbool; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_INT8 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_iNT8) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_INT8(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Pint8_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_INT16 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_INT16) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_INT16(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Pint16_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_INT32 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_INT32) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_INT32(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Pint32_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_INT64 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_INT64) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_INT64(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Pint64_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_UINT8 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_UINT8) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_UINT8(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Puint8_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_UINT16 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_UINT16) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_UINT16(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Puint16_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_UINT32 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_UINT32) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_UINT32(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Puint32_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_UINT64 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_UINT64) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_UINT64(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Puint64_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_FP32 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_FP32) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_FP32(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Psingle; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GrB_FP64 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GrB_FP64) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_FP64(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:Pdouble; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GxB_FC32 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GxB_FC32) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GxB_Matrix_import_FC32(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:PGxB_FC32_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a GxB_FC64 matrix }
{ handle of matrix to create }
{ type of matrix to create (must be GxB_FC64) }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GxB_Matrix_import_FC64(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:PGxB_FC64_t; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ import a matrix with a user-defined type }
{ handle of matrix to create }
{ type of matrix to create }
{ number of rows of the matrix }
{ number of columns of the matrix }
{ pointers for CSR, CSC, column indices for COO }
{ row indices for CSR, CSC }
{ values (must match the type parameter) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ import format }
function GrB_Matrix_import_UDT(A:PGrB_Matrix; _type:TGrB_Type; nrows:TGrB_Index; ncols:TGrB_Index; Ap:PGrB_Index; 
           Ai:PGrB_Index; Ax:pointer; Ap_len:TGrB_Index; Ai_len:TGrB_Index; Ax_len:TGrB_Index; 
           format:TGrB_Format):TGrB_Info;cdecl;external libgraphblas;
{ For GrB_Matrix_export_T: on input, Ap_len, Ai_len, and Ax_len are }
{ the size of the 3 arrays Ap, Ai, and Ax, in terms of the # of entries. }
{ On output, these 3 values are modified to be the # of entries copied }
{ into those 3 arrays. }
{ export a GrB_BOOL matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_BOOL) }
function GrB_Matrix_export_BOOL(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Pbool; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_INT8 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_INT8) }
function GrB_Matrix_export_INT8(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Pint8_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_INT16 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_INT16) }
function GrB_Matrix_export_INT16(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Pint16_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_INT32 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_INT32) }
function GrB_Matrix_export_INT32(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Pint32_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_INT64 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_INT64) }
function GrB_Matrix_export_INT64(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Pint64_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_UINT8 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_UINT8) }
function GrB_Matrix_export_UINT8(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Puint8_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_UINT16 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_UINT16) }
function GrB_Matrix_export_UINT16(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Puint16_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_UINT32 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_UINT32) }
function GrB_Matrix_export_UINT32(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Puint32_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_UINT64 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_UINT64) }
function GrB_Matrix_export_UINT64(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Puint64_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_FP32 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_FP32) }
function GrB_Matrix_export_FP32(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Psingle; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_FP64 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_FP64) }
function GrB_Matrix_export_FP64(Ap:PGrB_Index; Ai:PGrB_Index; Ax:Pdouble; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_FC32 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_FC32) }
function GxB_Matrix_export_FC32(Ap:PGrB_Index; Ai:PGrB_Index; Ax:PGxB_FC32_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a GrB_FC64 matrix }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export (must be of type GrB_FC64) }
function GxB_Matrix_export_FC64(Ap:PGrB_Index; Ai:PGrB_Index; Ax:PGxB_FC64_t; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ export a matrix with a user-defined type }
{ pointers for CSR, CSC, column indices for COO }
{ col indices for CSR/COO, row indices for CSC }
{ values (must match the type of A) }
{ number of entries in Ap (not # of bytes) }
{ number of entries in Ai (not # of bytes) }
{ number of entries in Ax (not # of bytes) }
{ export format }
{ matrix to export }
function GrB_Matrix_export_UDT(Ap:PGrB_Index; Ai:PGrB_Index; Ax:pointer; Ap_len:PGrB_Index; Ai_len:PGrB_Index; 
           Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ determine sizes of user arrays for export }
{ # of entries required for Ap (not # of bytes) }
{ # of entries required for Ai (not # of bytes) }
{ # of entries required for Ax (not # of bytes) }
{ export format }
{ matrix to export }
function GrB_Matrix_exportSize(Ap_len:PGrB_Index; Ai_len:PGrB_Index; Ax_len:PGrB_Index; format:TGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ suggest the best export format }
{ export format }
{ matrix to export }
function GrB_Matrix_exportHint(format:PGrB_Format; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ serialize/deserialize }
{============================================================================== }
{ GxB_Matrix_serialize copies the contents of a GrB_Matrix into a single array }
{ of bytes (the "blob").  The contents of the blob are implementation }
{ dependent.  The blob can be saved to a file, or sent across a communication }
{ channel, and then a GrB_Matrix can be reconstructed from the blob, even on }
{ another process or another machine, using the same version of }
{ SuiteSparse:GraphBLAS (v5.2.0 or later).  The goal is that future versions }
{ of SuiteSparse:GraphBLAS should be able to read in the blob as well, and }
{ reconstruct a matrix.  The matrix can be reconstructed from the blob using }
{ GxB_Matrix_deserialize.  The blob is compressed, by default, and }
{ uncompressed by GxB_Matrix_deserialize. }
{ GrB_Matrix_serialize/deserialize are slightly different from their GxB* }
{ counterparts.  The blob is allocated by GxB_Matrix_serialize, and must be }
{ freed by the same free() method passed to GxB_init (or the ANSI C11 free() }
{ if GrB_init was used).  By contrast, the GrB* methods require the user }
{ application to pass in a preallocated blob to GrB_Matrix_serialize, whose }
{ size can be given by GrB_Matrix_serializeSize (as a loose upper bound). }
{ The GrB* and GxB* methods can be mixed.  GrB_Matrix_serialize and }
{ GxB_Matrix_serialize construct the same blob (assuming they are given the }
{ same # of threads to do the work).  Both GrB_Matrix_deserialize and }
{ GxB_Matrix_deserialize can deserialize a blob coming from either }
{ GrB_Matrix_serialize or GxB_Matrix_serialize. }
{ Deserialization of untrusted data is a common security problem; see }
{ https://cwe.mitre.org/data/definitions/502.html. The deserialization methods }
{ below do a few basic checks so that no out-of-bounds access occurs during }
{ deserialization, but the output matrix itself may still be corrupted.  If }
{ the data is untrusted, use this to check the matrix: }
{      GxB_Matrix_fprint (A, "A deserialized", GrB_SILENT, NULL) }
{ Example usage: }
{
    //--------------------------------------------------------------------------
    // using GxB serialize/deserialize
    //--------------------------------------------------------------------------

    // Given a GrB_Matrix A: assuming a user-defined type:
    void *blob ;
    GrB_Index blob_size ;
    GxB_Matrix_serialize (&blob, &blob_size, A, NULL) ;
    FILE *f = fopen ("myblob", "w") ;
    fwrite (blob_size, sizeof (size_t), 1, f) ;
    fwrite (blob, sizeof (uint8_t), blob_size, f) ;
    fclose (f) ;
    GrB_Matrix_free (&A) ;
    // B is a copy of A
    GxB_Matrix_deserialize (&B, MyQtype, blob, blob_size, NULL) ;
    GrB_Matrix_free (&B) ;
    free (blob) ;
    GrB_finalize ( ) ;

    // --- in another process, to recreate the GrB_Matrix A:
    GrB_init (GrB_NONBLOCKING) ;
    FILE *f = fopen ("myblob", "r") ;
    fread (&blob_size, sizeof (size_t), 1, f) ;
    blob = malloc (blob_size) ;
    fread (blob, sizeof (uint8_t), blob_size, f) ;
    fclose (f) ;
    char type_name [GxB_MAX_NAME_LEN] ;
    GxB_deserialize_type_name (type_name, blob, blob_size) ;
    printf ("blob type is: %s\n", type_name) ;
    GrB_Type user_type = NULL ;
    if (strncmp (type_name, "myquaternion", GxB_MAX_NAME_LEN) == 0)
        user_type = MyQtype ;
    GxB_Matrix_deserialize (&A, user_type, blob, blob_size, NULL) ;
    free (blob) ;               // note, freed by the user, not GraphBLAS

    //--------------------------------------------------------------------------
    // using GrB serialize/deserialize
    //--------------------------------------------------------------------------

    // Given a GrB_Matrix A: assuming a user-defined type, MyQType:
    void *blob = NULL ;
    GrB_Index blob_size = 0 ;
    GrB_Matrix A, B = NULL ;
    // construct a matrix A, then serialized it:
    GrB_Matrix_serializeSize (&blob_size, A) ;      // loose upper bound
    blob = malloc (blob_size) ;
    GrB_Matrix_serialize (blob, &blob_size, A) ;    // returns actual size
    blob = realloc (blob, blob_size) ;              // user can shrink the blob
    FILE *f = fopen ("myblob", "w") ;
    fwrite (blob_size, sizeof (size_t), 1, f) ;
    fwrite (blob, sizeof (uint8_t), blob_size, f) ;
    fclose (f) ;
    GrB_Matrix_free (&A) ;
    // B is a copy of A:
    GrB_Matrix_deserialize (&B, MyQtype, blob, blob_size) ;
    GrB_Matrix_free (&B) ;
    free (blob) ;
    GrB_finalize ( ) ;

    // --- in another process, to recreate the GrB_Matrix A:
    GrB_init (GrB_NONBLOCKING) ;
    FILE *f = fopen ("myblob", "r") ;
    fread (&blob_size, sizeof (size_t), 1, f) ;
    blob = malloc (blob_size) ;
    fread (blob, sizeof (uint8_t), blob_size, f) ;
    fclose (f) ;
    // the user must know the type of A is MyQType
    GrB_Matrix_deserialize (&A, MyQtype, blob, blob_size) ;
    free (blob) ;
 }
{ Currently implemented: no compression, LZ4, LZ4HC, and ZSTD }
const
  GxB_COMPRESSION_NONE = -(1);  { no compression }
  GxB_COMPRESSION_DEFAULT = 0;  { ZSTD (level 1) }
  GxB_COMPRESSION_LZ4 = 1000;  { LZ4 }
  GxB_COMPRESSION_LZ4HC = 2000;  { LZ4HC, with default level 9 }
  GxB_COMPRESSION_ZSTD = 3000;  { ZSTD, with default level 1 }
  GxB_COMPRESSION_INTEL = 1000000;  { not yet supported }
{ Most of the above methods have a level parameter that controls the tradeoff }
{ between run time and the amount of compression obtained.  Higher levels }
{ result in a more compact result, at the cost of higher run time: }
{  LZ4     no level setting }
{  LZ4HC   1: fast, 9: default, 9: max }
{  ZSTD:   1: fast, 1: default, 19: max }
{ For all methods, a level of zero results in the default level setting. }
{ These settings can be added, so to use LZ4HC at level 5, use method = }
{ GxB_COMPRESSION_LZ4HC + 5. }
{ If the level setting is out of range, the default is used for that method. }
{ If the method is negative, no compression is performed.  If the method is }
{ positive but unrecognized, the default is used (GxB_COMPRESSION_ZSTD, }
{ level 1). }
{ serialize a GrB_Matrix to a blob }
{ output: }
{ the blob, allocated on output }
{ size of the blob on output }
{ input: }
{ matrix to serialize }
{ descriptor to select compression method }
{ and to control # of threads used }

function GxB_Matrix_serialize(blob_handle:Ppointer; blob_size_handle:PGrB_Index; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ serialize a GrB_Matrix to a blob }
{ output: }
{ the blob, already allocated in input }
{ input/output: }
{ size of the blob on input.  On output, }
{ the # of bytes used in the blob. }
{ input: }
{ matrix to serialize }
function GrB_Matrix_serialize(blob:pointer; blob_size_handle:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ serialize a GrB_Vector to a blob }
{ output: }
{ the blob, allocated on output }
{ size of the blob on output }
{ input: }
{ vector to serialize }
{ descriptor to select compression method }
{ and to control # of threads used }
function GxB_Vector_serialize(blob_handle:Ppointer; blob_size_handle:PGrB_Index; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ estimate the size of a blob }
{ output: }
{ upper bound on the required size of the }
{ blob on output. }
{ input: }
{ matrix to serialize }
function GrB_Matrix_serializeSize(blob_size_handle:PGrB_Index; A:TGrB_Matrix):TGrB_Info;cdecl;external libgraphblas;
{ The GrB* and GxB* deserialize methods are nearly identical.  The GxB* }
{ deserialize methods simply add the descriptor, which allows for optional }
{ control of the # of threads used to deserialize the blob. }
{ deserialize blob into a GrB_Matrix }
{ output: }
{ output matrix created from the blob }
{ input: }
{ type of the matrix C.  Required if the blob holds a }
{ matrix of user-defined type.  May be NULL if blob }
{ holds a built-in type; otherwise must match the }
{ type of C. }
{ the blob }
{ size of the blob }
{ to control # of threads used }
function GxB_Matrix_deserialize(C:PGrB_Matrix; _type:TGrB_Type; blob:pointer; blob_size:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ deserialize blob into a GrB_Matrix }
{ output: }
{ output matrix created from the blob }
{ input: }
{ type of the matrix C.  Required if the blob holds a }
{ matrix of user-defined type.  May be NULL if blob }
{ holds a built-in type; otherwise must match the }
{ type of C. }
{ the blob }
{ size of the blob }
function GrB_Matrix_deserialize(C:PGrB_Matrix; _type:TGrB_Type; blob:pointer; blob_size:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ deserialize blob into a GrB_Vector }
{ output: }
{ output vector created from the blob }
{ input: }
{ type of the vector w.  Required if the blob holds a }
{ vector of user-defined type.  May be NULL if blob }
{ holds a built-in type; otherwise must match the }
{ type of w. }
{ the blob }
{ size of the blob }
{ to control # of threads used }
function GxB_Vector_deserialize(w:PGrB_Vector; _type:TGrB_Type; blob:pointer; blob_size:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GxB_deserialize_type_name extracts the type_name of the GrB_Type of the }
{ GrB_Matrix or GrB_Vector held in a serialized blob.  On input, type_name }
{ must point to a user-owned char array of size at least GxB_MAX_NAME_LEN (it }
{ must not point into the blob itself).  On output, type_name will contain a }
{ null-terminated string with the corresponding C type name.  If the blob }
{ holds a matrix of a built-in type, the name is returned as "bool" for }
{ GrB_BOOL, "uint8_t" for GrB_UINT8, "float complex" for GxB_FC32, etc. }
{ See GxB_Type_name to convert this name into a GrB_Type. }
{ return the type name of a blob }
{ output: }
{ name of the type (char array of size at least }
{ GxB_MAX_NAME_LEN, owned by the user application). }
{ input, not modified: }
{ the blob }
{ size of the blob }
function GxB_deserialize_type_name(type_name:Pchar; blob:pointer; blob_size:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GxB_Vector_sort and GxB_Matrix_sort: sort a matrix or vector }
{============================================================================== }
{ output: }
{ vector of sorted values }
{ vector containing the permutation }
{ input }
{ comparator op }
{ vector to sort }
function GxB_Vector_sort(w:TGrB_Vector; p:TGrB_Vector; op:TGrB_BinaryOp; u:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ output: }
{ matrix of sorted values }
{ matrix containing the permutations }
{ input }
{ comparator op }
{ matrix to sort }
function GxB_Matrix_sort(C:TGrB_Matrix; P:TGrB_Matrix; op:TGrB_BinaryOp; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GxB_Matrix_reshape and GxB_Matrix_reshapeDup:  reshape a matrix }
{============================================================================== }
{ GxB_Matrix_reshape changes the dimensions of a matrix, reshaping the entries }
{ by row or by column. }
{ For example, if C is 3-by-4 on input, and is reshaped by column to have }
{ dimensions 2-by-6: }
{      C on input      C on output (by_col true) }
{      00 01 02 03     00 20 11 02 22 13 }
{      10 11 12 13     10 01 21 12 03 23 }
{      20 21 22 23 }
{ If the same C on input is reshaped by row to dimensions 2-by-6: }
{      C on input      C on output (by_col false) }
{      00 01 02 03     00 01 02 03 10 11 }
{      10 11 12 13     12 13 20 21 22 23 }
{      20 21 22 23 }
{ If the input matrix is nrows-by-ncols, and the size of the reshaped matrix }
{ is nrows_new-by-ncols_new, then nrows*ncols must equal nrows_new*ncols_new. }
{ The format of the input matrix (by row or by column) is unchanged; this }
{ format need not match the by_col input parameter. }
{ reshape a GrB_Matrix in place }
{ input/output: }
{ input/output matrix, reshaped in place }
{ input: }
{ true if reshape by column, false if by row }
{ new number of rows of C }
{ new number of columns of C }
{ to control # of threads used }
function GxB_Matrix_reshape(C:TGrB_Matrix; by_col:Tbool; nrows_new:TGrB_Index; ncols_new:TGrB_Index; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ GxB_Matrix_reshapeDup reshapes a matrix into another matrix. }
{ If the input matrix A is nrows-by-ncols, and the size of the newly-created }
{ matrix C is nrows_new-by-ncols_new, then nrows*ncols must equal }
{ nrows_new*ncols_new.  The format of the input matrix A (by row or by column) }
{ determines the format of the output matrix C, which need not match the }
{ by_col input parameter. }
{ reshape a GrB_Matrix into another GrB_Matrix }
{ output: }
{ newly created output matrix, not in place }
{ input: }
{ input matrix, not modified }
{ true if reshape by column, false if by row }
{ number of rows of C }
{ number of columns of C }
{ to control # of threads used }
function GxB_Matrix_reshapeDup(C:PGrB_Matrix; A:TGrB_Matrix; by_col:Tbool; nrows_new:TGrB_Index; ncols_new:TGrB_Index; 
           desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GxB_Iterator: an object that iterates over the entries of a matrix or vector }
{============================================================================== }
{ Example usage:

single thread iteration of a whole matrix, one row at a time (in the
outer loop), and one entry at a time within the row (in the inner loop):

    // create an iterator
    GxB_Iterator iterator ;
    GxB_Iterator_new (&iterator) ;
    // attach it to the matrix A, known to be type GrB_FP64
    GrB_Info info = GxB_rowIterator_attach (iterator, A, NULL) ;
    if (info < 0)  handle the failure ... 
    // seek to A(0,:)
    info = GxB_rowIterator_seekRow (iterator, 0) ;
    while (info != GxB_EXHAUSTED)
    
        // iterate over entries in A(i,:)
        GrB_Index i = GxB_rowIterator_getRowIndex (iterator) ;
        while (info == GrB_SUCCESS)
        
            // get the entry A(i,j)
            GrB_Index j = GxB_rowIterator_getColIndex (iterator) ;
            double  aij = GxB_Iterator_get_FP64 (iterator) ;
            // move to the next entry in A(i,:)
            info = GxB_rowIterator_nextCol (iterator) ;
        
        // move to the next row, A(i+1,:)
        info = GxB_rowIterator_nextRow (iterator) ;
    
    GrB_free (&iterator) ;

parallel iteration using 4 threads (work may be imbalanced however):

    GrB_Index nrows ;
    GrB_wait (A, GrB_MATERIALIZE) ;     // this is essential
    GrB_Matrix_nrows (&nrows, A) ;
    #pragma omp parallel for num_threads(4)
    for (int tid = 0 ; tid < 4 ; tid++)
    
        // thread tid operates on A(row1:row2-1,:)
        GrB_Index row1 = tid * (nrows / 4) ;
        GrB_Index row2 = (tid == 3) ? nrows : ((tid+1) * (nrows / 4)) ;
        GxB_Iterator iterator ;
        GxB_Iterator_new (&iterator) ;
        GrB_Info info = GxB_rowIterator_attach (iterator, A, NULL) ;
        if (info < 0)  handle the failure ... 
        // seek to A(row1,:)
        info = GxB_rowIterator_seekRow (iterator, row1) ;
        while (info != GxB_EXHAUSTED)
        
            // iterate over entries in A(i,:)
            GrB_Index i = GxB_rowIterator_getRowIndex (iterator) ;
            if (i >= row2) break ;
            while (info == GrB_SUCCESS)
            
                // get the entry A(i,j)
                GrB_Index j = GxB_rowIterator_getColIndex (iterator) ;
                double  aij = GxB_Iterator_get_FP64 (iterator) ;
                // move to the next entry in A(i,:)
                info = GxB_rowIterator_nextCol (iterator) ;
            
            // move to the next row, A(i+1,:)
            info = GxB_rowIterator_nextRow (iterator) ;
        
        GrB_free (&iterator) ;
    

    In the parallel example above, a more balanced work distribution can be
    obtained by first computing the row degree via GrB_mxv (see LAGraph), and
    then compute the cumulative sum (ideally in parallel).  Next, partition the
    cumulative sum into one part per thread via binary search, and divide the
    rows into parts accordingly.

 }
{------------------------------------------------------------------------------ }
{ GxB_Iterator: definition and new/free methods }
{------------------------------------------------------------------------------ }
{ The contents of an iterator must not be directly accessed by the user }
{ application.  Only the functions and macros provided here may access }
{ "iterator->..." contents.  The iterator is defined here only so that macros }
{ can be used to speed up the use of the iterator methods.  User applications }
{ must not use "iterator->..." directly. }
{ these components change as the iterator moves (via seek or next): }
{ the start of the current vector }
{ the end of the current vector }
{ position of the current entry }
{ the current vector }
{ only changes when the iterator is created: }
{ size of this iterator object }
{ these components only change when the iterator is attached: }
{ avlen*avdim for bitmap; nvals(A) otherwise }
{ length of each vector in the matrix }
{ number of vectors in the matrix dimension }
{ # of vectors present in the matrix }
{ pointers for sparse and hypersparse }
{ vector names for hypersparse }
{ bitmap }
{ indices for sparse and hypersparse }
{ values for all 4 data structures }
{ size of the type of A }
{ sparse, hyper, bitmap, or full }
{ true if A is iso-valued, false otherwise }
{ true if A is held by column, false if by row }
type
  PGB_Iterator_opaque = ^TGB_Iterator_opaque;
  TGB_Iterator_opaque = record
      pstart : Tint64_t;
      pend : Tint64_t;
      p : Tint64_t;
      k : Tint64_t;
      header_size : Tsize_t;
      pmax : Tint64_t;
      avlen : Tint64_t;
      avdim : Tint64_t;
      anvec : Tint64_t;
      Ap : Pint64_t;
      Ah : Pint64_t;
      Ab : Pint8_t;
      Ai : Pint64_t;
      Ax : pointer;
      type_size : Tsize_t;
      A_sparsity : longint;
      iso : Tbool;
      by_col : Tbool;
    end;


  PGxB_Iterator = ^TGxB_Iterator;
  TGxB_Iterator = PGB_Iterator_opaque;
{ GxB_Iterator_new: create a new iterator, not attached to any matrix/vector }

function GxB_Iterator_new(iterator:PGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{ GxB_Iterator_free: free an iterator }
function GxB_Iterator_free(iterator:PGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{============================================================================== }
{ GB_Iterator_*: implements user-callable GxB_*Iterator_* methods }
{============================================================================== }
{ GB_* methods are not user-callable.  These methods appear here so that the }
{ iterator methods can be done via macros. }
{------------------------------------------------------------------------------ }
{ GB_Iterator_attach: attach a row/col/entry iterator to a matrix }
{------------------------------------------------------------------------------ }
{ iterator to attach to the matrix A }
{ matrix to attach }
{ by row, by col, or by entry (GxB_NO_FORMAT) }
function GB_Iterator_attach(iterator:TGxB_Iterator; A:TGrB_Matrix; format:TGxB_Format_Value; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GB_Iterator_rc_seek: seek a row/col iterator to a particular vector }
{------------------------------------------------------------------------------ }
function GB_Iterator_rc_seek(iterator:TGxB_Iterator; j:TGrB_Index; jth_vector:Tbool):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GB_Iterator_rc_bitmap_next: move a row/col iterator to next entry in bitmap }
{------------------------------------------------------------------------------ }
function GB_Iterator_rc_bitmap_next(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GB_Iterator_rc_knext: move a row/col iterator to the next vector }
{------------------------------------------------------------------------------ }
{============================================================================== }
{ GxB_rowIterator_*: iterate over the rows of a matrix }
{============================================================================== }
{$undef GxB_rowIterator_attach}
{$undef GxB_rowIterator_kount}
{$undef GxB_rowIterator_seekRow}
{$undef GxB_rowIterator_kseek}
{$undef GxB_rowIterator_nextRow}
{$undef GxB_rowIterator_nextCol}
{$undef GxB_rowIterator_getRowIndex}
{$undef GxB_rowIterator_getColIndex}
{------------------------------------------------------------------------------ }
{ GxB_rowIterator_attach: attach a row iterator to a matrix }
{------------------------------------------------------------------------------ }
{ On input, the iterator must already exist, having been created by }
{ GxB_Iterator_new. }
{ GxB_rowIterator_attach attaches a row iterator to a matrix.  If the iterator }
{ is already attached to a matrix, it is detached and then attached to the }
{ given matrix A. }
{ The following error conditions are returned: }
{ GrB_NULL_POINTER:    if the iterator or A are NULL. }
{ GrB_INVALID_OBJECT:  if the matrix A is invalid. }
{ GrB_NOT_IMPLEMENTED: if the matrix A cannot be iterated by row. }
{ GrB_OUT_OF_MEMORY:   if the method runs out of memory. }
{ If successful, the row iterator is attached to the matrix, but not to any }
{ specific row.  Use GxB_rowIterator_*seek* to move the iterator to a row. }
function GxB_rowIterator_attach(iterator:TGxB_Iterator; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_attach(iterator,A,desc : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_kount: upper bound on the # of nonempty rows of a matrix }
{------------------------------------------------------------------------------ }
{ On input, the row iterator must be attached to a matrix, but need not be at }
{ any specific row; results are undefined if this condition is not met. }
{ GxB_rowIterator_kount returns an upper bound on the # of non-empty rows of a }
{ matrix.  A GraphBLAS library may always return this as simply nrows(A), but }
{ in some libraries, it may be a value between the # of rows with at least one }
{ entry, and nrows(A), inclusive.  Any value in this range is a valid return }
{ value from this function. }
{ For SuiteSparse:GraphBLAS: If A is m-by-n, and sparse, bitmap, or full, then }
{ kount == m.  If A is hypersparse, kount is the # of vectors held in the data }
{ structure for the matrix, some of which may be empty, and kount <= m. }
function GxB_rowIterator_kount(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_kount(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_seekRow:  move a row iterator to a different row of a matrix }
{------------------------------------------------------------------------------ }
{ On input, the row iterator must be attached to a matrix, but need not be at }
{ any specific row; results are undefined if this condition is not met. }
{ GxB_rowIterator_seekRow moves a row iterator to the first entry of A(row,:). }
{ If A(row,:) has no entries, the iterator may move to the first entry of next }
{ nonempty row i for some i > row.  The row index can be determined by }
{ GxB_rowIterator_getRowIndex. }
{ For SuiteSparse:GraphBLAS: If the matrix is hypersparse, and the row }
{ does not appear in the hyperlist, then the iterator is moved to the first }
{ row after the given row that does appear in the hyperlist. }
{ The method is always successful; the following are conditions are returned: }
{ GxB_EXHAUSTED:   if the row index is >= nrows(A); the row iterator is }
{                  exhausted, but is still attached to the matrix. }
{ GrB_NO_VALUE:    if the row index is valid but A(row,:) has no entries; the }
{                  row iterator is positioned at A(row,:). }
{ GrB_SUCCESS:     if the row index is valid and A(row,:) has at least one }
{                  entry. The row iterator is positioned at A(row,:). }
{                  GxB_rowIterator_get* can be used to return the indices of }
{                  the first entry in A(row,:), and GxB_Iterator_get* can }
{                  return its value. }
function GxB_rowIterator_seekRow(iterator:TGxB_Iterator; row:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_seekRow(iterator,row : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_kseek:  move a row iterator to a different row of a matrix }
{------------------------------------------------------------------------------ }
{ On input, the row iterator must be attached to a matrix, but need not be at }
{ any specific row; results are undefined if this condition is not met. }
{ GxB_rowIterator_kseek is identical to GxB_rowIterator_seekRow, except for }
{ how the row index is specified.  The row is the kth non-empty row of A. }
{ More precisely, k is in the range 0 to kount-1, where kount is the value }
{ returned by GxB_rowIterator_kount. }
function GxB_rowIterator_kseek(iterator:TGxB_Iterator; k:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_kseek(iterator,k : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_nextRow: move a row iterator to the next row of a matrix }
{------------------------------------------------------------------------------ }
{ On input, the row iterator must already be attached to a matrix via a prior }
{ call to GxB_rowIterator_attach, and the iterator must be at a specific row, }
{ via a prior call to GxB_rowIterator_*seek* or GxB_rowIterator_nextRow; }
{ results are undefined if this condition is not met. }
{ If the the row iterator is currently at A(row,:), it is moved to A(row+1,:), }
{ or to the first non-empty row after A(row,:), at the discretion of this }
{ method.  That is, empty rows may be skipped. }
{ The method is always successful, and the return conditions are identical to }
{ the return conditions of GxB_rowIterator_seekRow. }
function GxB_rowIterator_nextRow(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_nextRow(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_nextCol: move a row iterator to the next entry in A(row,:) }
{------------------------------------------------------------------------------ }
{ On input, the row iterator must already be attached to a matrix via a prior }
{ call to GxB_rowIterator_attach, and the iterator must be at a specific row, }
{ via a prior call to GxB_rowIterator_*seek* or GxB_rowIterator_nextRow; }
{ results are undefined if this condition is not met. }
{ The method is always successful, and returns the following conditions: }
{ GrB_NO_VALUE:    If the iterator is already exhausted, or if there is no }
{                  entry in the current A(row,;), }
{ GrB_SUCCESS:     If the row iterator has been moved to the next entry in }
{                  A(row,:). }
function GxB_rowIterator_nextCol(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_nextCol(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_getRowIndex: get current row index of a row iterator }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already successfully attached to matrix as a }
{ row iterator; results are undefined if this condition is not met. }
{ The method returns nrows(A) if the iterator is exhausted, or the current }
{ row index otherwise.  There need not be any entry in the current row. }
{ Zero is returned if the iterator is attached to the matrix but }
{ GxB_rowIterator_*seek* has not been called, but this does not mean the }
{ iterator is positioned at row zero. }
function GxB_rowIterator_getRowIndex(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_getRowIndex(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_rowIterator_getColIndex: get current column index of a row iterator }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already successfully attached to matrix as a }
{ row iterator, and in addition, the row iterator must be positioned at a }
{ valid entry present in the matrix.  That is, the last call to }
{ GxB_rowIterator_*seek* or GxB_rowIterator_*next*, must have returned }
{ GrB_SUCCESS.  Results are undefined if this condition is not met. }
function GxB_rowIterator_getColIndex(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_getColIndex(iterator : longint) : longint;

{============================================================================== }
{ GxB_colIterator_*: iterate over columns of a matrix }
{============================================================================== }
{ The column iterator is analoguous to the row iterator. }
{$undef GxB_colIterator_attach}
{$undef GxB_colIterator_kount}
{$undef GxB_colIterator_seekCol}
{$undef GxB_colIterator_kseek}
{$undef GxB_colIterator_nextCol}
{$undef GxB_colIterator_nextRow}
{$undef GxB_colIterator_getColIndex}
{$undef GxB_colIterator_getRowIndex}
{ GxB_colIterator_attach: attach a column iterator to a matrix }
function GxB_colIterator_attach(iterator:TGxB_Iterator; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_attach(iterator,A,desc : longint) : longint;

{ GxB_colIterator_kount: return # of nonempty columns of the matrix }
function GxB_colIterator_kount(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_kount(iterator : longint) : longint;

{ GxB_colIterator_seekCol: move a column iterator to A(:,col) }
function GxB_colIterator_seekCol(iterator:TGxB_Iterator; col:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_seekCol(iterator,col : longint) : longint;

{ GxB_colIterator_kseek: move a column iterator to kth non-empty column of A }
function GxB_colIterator_kseek(iterator:TGxB_Iterator; k:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_kseek(iterator,k : longint) : longint;

{ GxB_colIterator_nextCol: move a column iterator to first entry of next column }
function GxB_colIterator_nextCol(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_nextCol(iterator : longint) : longint;

{ GxB_colIterator_nextRow: move a column iterator to next entry in column }
function GxB_colIterator_nextRow(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_nextRow(iterator : longint) : longint;

{ GxB_colIterator_getColIndex: return the column index of current entry }
function GxB_colIterator_getColIndex(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_getColIndex(iterator : longint) : longint;

{ GxB_colIterator_getRowIndex: return the row index of current entry }
function GxB_colIterator_getRowIndex(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_getRowIndex(iterator : longint) : longint;

{============================================================================== }
{ GxB_Matrix_Iterator_*: iterate over the entries of a matrix }
{============================================================================== }
{ Example usage: }
{ single thread iteration of a whole matrix, one entry at at time }
{
    // create an iterator
    GxB_Iterator iterator ;
    GxB_Iterator_new (&iterator) ;
    // attach it to the matrix A, known to be type GrB_FP64
    GrB_Info info = GxB_Matrix_Iterator_attach (iterator, A, NULL) ;
    if (info < 0)  handle the failure ... 
    // seek to the first entry
    info = GxB_Matrix_Iterator_seek (iterator, 0) ;
    while (info != GxB_EXHAUSTED)
    
        // get the entry A(i,j)
        GrB_Index i, j ;
        GxB_Matrix_Iterator_getIndex (iterator, &i, &j) ;
        double aij = GxB_Iterator_get_FP64 (iterator) ;
        // move to the next entry in A
        info = GxB_Matrix_Iterator_next (iterator) ;
    
    GrB_free (&iterator) ;
 }
{------------------------------------------------------------------------------ }
{ GxB_Matrix_Iterator_attach: attach an entry iterator to a matrix }
{------------------------------------------------------------------------------ }
{ On input, the iterator must already exist, having been created by }
{ GxB_Iterator_new. }
{ GxB_Matrix_Iterator_attach attaches an entry iterator to a matrix.  If the }
{ iterator is already attached to a matrix, it is detached and then attached }
{ to the given matrix A. }
{ The following error conditions are returned: }
{ GrB_NULL_POINTER:    if the iterator or A are NULL. }
{ GrB_INVALID_OBJECT:  if the matrix A is invalid. }
{ GrB_OUT_OF_MEMORY:   if the method runs out of memory. }
{ If successful, the entry iterator is attached to the matrix, but not to any }
{ specific entry.  Use GxB_Matrix_Iterator_*seek* to move the iterator to a }
{ particular entry. }
function GxB_Matrix_Iterator_attach(iterator:TGxB_Iterator; A:TGrB_Matrix; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_Iterator_getpmax: return the range of the iterator }
{------------------------------------------------------------------------------ }
{ On input, the entry iterator must be already attached to a matrix via }
{ GxB_Matrix_Iterator_attach; results are undefined if this condition is not }
{ met. }
{ Entries in a matrix are given an index p, ranging from 0 to pmax-1, where }
{ pmax >= nvals(A).  For sparse, hypersparse, and full matrices, pmax is equal }
{ to nvals(A).  For an m-by-n bitmap matrix, pmax=m*n, or pmax=0 if the }
{ matrix has no entries. }
function GxB_Matrix_Iterator_getpmax(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_Iterator_seek: seek to a specific entry }
{------------------------------------------------------------------------------ }
{ On input, the entry iterator must be already attached to a matrix via }
{ GxB_Matrix_Iterator_attach; results are undefined if this condition is not }
{ met. }
{ The input p is in range 0 to pmax-1, which points to an entry in the matrix, }
{ or p >= pmax if the iterator is exhausted, where pmax is the return value }
{ from GxB_Matrix_Iterator_getpmax. }
{ Returns GrB_SUCCESS if the iterator is at an entry that exists in the }
{ matrix, or GxB_EXHAUSTED if the iterator is exhausted. }
function GxB_Matrix_Iterator_seek(iterator:TGxB_Iterator; p:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_Iterator_next: move to the next entry of a matrix }
{------------------------------------------------------------------------------ }
{ On input, the entry iterator must be already attached to a matrix via }
{ GxB_Matrix_Iterator_attach, and the position of the iterator must also have }
{ been defined by a prior call to GxB_Matrix_Iterator_seek or }
{ GxB_Matrix_Iterator_next.  Results are undefined if these conditions are not }
{ met. }
{ Returns GrB_SUCCESS if the iterator is at an entry that exists in the }
{ matrix, or GxB_EXHAUSTED if the iterator is exhausted. }
function GxB_Matrix_Iterator_next(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_Iterator_getp: get the current position of a matrix iterator }
{------------------------------------------------------------------------------ }
{ On input, the entry iterator must be already attached to a matrix via }
{ GxB_Matrix_Iterator_attach, and the position of the iterator must also have }
{ been defined by a prior call to GxB_Matrix_Iterator_seek or }
{ GxB_Matrix_Iterator_next.  Results are undefined if these conditions are not }
{ met. }
function GxB_Matrix_Iterator_getp(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Matrix_Iterator_getIndex: get the row and column index of a matrix entry }
{------------------------------------------------------------------------------ }
{ On input, the entry iterator must be already attached to a matrix via }
{ GxB_Matrix_Iterator_attach, and the position of the iterator must also have }
{ been defined by a prior call to GxB_Matrix_Iterator_seek or }
{ GxB_Matrix_Iterator_next, with a return value of GrB_SUCCESS.  Results are }
{ undefined if these conditions are not met. }
procedure GxB_Matrix_Iterator_getIndex(iterator:TGxB_Iterator; row:PGrB_Index; col:PGrB_Index);cdecl;external libgraphblas;
{============================================================================== }
{ GxB_Vector_Iterator_*: iterate over the entries of a vector }
{============================================================================== }
{ Example usage:

single thread iteration of a whole vector, one entry at at time

    // create an iterator
    GxB_Iterator iterator ;
    GxB_Iterator_new (&iterator) ;
    // attach it to the vector v, known to be type GrB_FP64
    GrB_Info info = GxB_Vector_Iterator_attach (iterator, v, NULL) ;
    if (info < 0)  handle the failure ... 
    // seek to the first entry
    info = GxB_Vector_Iterator_seek (iterator, 0) ;
    while (info != GxB_EXHAUSTED)
    
        // get the entry v(i)
        GrB_Index i = GxB_Vector_Iterator_getIndex (iterator) ;
        double vi = GxB_Iterator_get_FP64 (iterator) ;
        // move to the next entry in v
        info = GxB_Vector_Iterator_next (iterator) ;
    
    GrB_free (&iterator) ;

 }
{$undef GxB_Vector_Iterator_getpmax}
{$undef GxB_Vector_Iterator_seek}
{$undef GxB_Vector_Iterator_next}
{$undef GxB_Vector_Iterator_getp}
{$undef GxB_Vector_Iterator_getIndex}
{------------------------------------------------------------------------------ }
{ GxB_Vector_Iterator_attach: attach an iterator to a vector }
{------------------------------------------------------------------------------ }
{ On input, the iterator must already exist, having been created by }
{ GxB_Iterator_new. }
{ GxB_Vector_Iterator_attach attaches an iterator to a vector.  If the }
{ iterator is already attached to a vector or matrix, it is detached and then }
{ attached to the given vector v. }
{ The following error conditions are returned: }
{ GrB_NULL_POINTER:    if the iterator or v are NULL. }
{ GrB_INVALID_OBJECT:  if the vector v is invalid. }
{ GrB_OUT_OF_MEMORY:   if the method runs out of memory. }
{ If successful, the iterator is attached to the vector, but not to any }
{ specific entry.  Use GxB_Vector_Iterator_seek to move the iterator to a }
{ particular entry. }
function GxB_Vector_Iterator_attach(iterator:TGxB_Iterator; v:TGrB_Vector; desc:TGrB_Descriptor):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Vector_Iterator_getpmax: return the range of the vector iterator }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already attached to a vector via }
{ GxB_Vector_Iterator_attach; results are undefined if this condition is not }
{ met. }
{ Entries in a vector are given an index p, ranging from 0 to pmax-1, where }
{ pmax >= nvals(v).  For sparse and full vectors, pmax is equal to nvals(v). }
{ For a size-m bitmap vector, pmax=m, or pmax=0 if the vector has no entries. }
function GxB_Vector_Iterator_getpmax(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Vector_Iterator_getpmax(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_Vector_Iterator_seek: seek to a specific entry in the vector }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already attached to a vector via }
{ GxB_Vector_Iterator_attach; results are undefined if this condition is not }
{ met. }
{ The input p is in range 0 to pmax-1, which points to an entry in the vector, }
{ or p >= pmax if the iterator is exhausted, where pmax is the return value }
{ from GxB_Vector_Iterator_getpmax. }
{ Returns GrB_SUCCESS if the iterator is at an entry that exists in the }
{ vector, or GxB_EXHAUSTED if the iterator is exhausted. }
function GB_Vector_Iterator_bitmap_seek(iterator:TGxB_Iterator; unused:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{ unused parameter to be removed in v8.x }
function GxB_Vector_Iterator_seek(iterator:TGxB_Iterator; p:TGrB_Index):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Vector_Iterator_next: move to the next entry of a vector }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already attached to a vector via }
{ GxB_Vector_Iterator_attach, and the position of the iterator must also have }
{ been defined by a prior call to GxB_Vector_Iterator_seek or }
{ GxB_Vector_Iterator_next.  Results are undefined if these conditions are not }
{ met. }
{ Returns GrB_SUCCESS if the iterator is at an entry that exists in the }
{ vector, or GxB_EXHAUSTED if the iterator is exhausted. }
function GxB_Vector_Iterator_next(iterator:TGxB_Iterator):TGrB_Info;cdecl;external libgraphblas;
{------------------------------------------------------------------------------ }
{ GxB_Vector_Iterator_getp: get the current position of a vector iterator }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already attached to a vector via }
{ GxB_Vector_Iterator_attach, and the position of the iterator must also have }
{ been defined by a prior call to GxB_Vector_Iterator_seek or }
{ GxB_Vector_Iterator_next.  Results are undefined if these conditions are not }
{ met. }
function GxB_Vector_Iterator_getp(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Vector_Iterator_getp(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ GxB_Vector_Iterator_getIndex: get the index of a vector entry }
{------------------------------------------------------------------------------ }
{ On input, the iterator must be already attached to a vector via }
{ GxB_Vector_Iterator_attach, and the position of the iterator must also have }
{ been defined by a prior call to GxB_Vector_Iterator_seek or }
{ GxB_Vector_Iterator_next, with a return value of GrB_SUCCESS.  Results are }
{ undefined if these conditions are not met. }
function GxB_Vector_Iterator_getIndex(iterator:TGxB_Iterator):TGrB_Index;cdecl;external libgraphblas;
{============================================================================== }
{ GxB_Iterator_get_TYPE: get value of the current entry for any iterator }
{============================================================================== }
{ On input, the prior call to GxB_*Iterator_*seek*, or GxB_*Iterator_*next* }
{ must have returned GrB_SUCCESS, indicating that the iterator is at a valid }
{ current entry for either a matrix or vector. }
{ Returns the value of the current entry at the position determined by the }
{ iterator.  No typecasting is permitted; the method name must match the }
{ type of the matrix or vector. }
{$undef GxB_Iterator_get_BOOL}
{$undef GxB_Iterator_get_INT8}
{$undef GxB_Iterator_get_INT16}
{$undef GxB_Iterator_get_INT32}
{$undef GxB_Iterator_get_INT64}
{$undef GxB_Iterator_get_UINT8}
{$undef GxB_Iterator_get_UINT16}
{$undef GxB_Iterator_get_UINT32}
{$undef GxB_Iterator_get_UINT64}
{$undef GxB_Iterator_get_FP32}
{$undef GxB_Iterator_get_FP64}
{$undef GxB_Iterator_get_FC32}
{$undef GxB_Iterator_get_FC64}
{$undef GxB_Iterator_get_UDT}
function GxB_Iterator_get_BOOL(iterator:TGxB_Iterator):Tbool;cdecl;external libgraphblas;
function GxB_Iterator_get_INT8(iterator:TGxB_Iterator):Tint8_t;cdecl;external libgraphblas;
function GxB_Iterator_get_INT16(iterator:TGxB_Iterator):Tint16_t;cdecl;external libgraphblas;
function GxB_Iterator_get_INT32(iterator:TGxB_Iterator):Tint32_t;cdecl;external libgraphblas;
function GxB_Iterator_get_INT64(iterator:TGxB_Iterator):Tint64_t;cdecl;external libgraphblas;
function GxB_Iterator_get_UINT8(iterator:TGxB_Iterator):Tuint8_t;cdecl;external libgraphblas;
function GxB_Iterator_get_UINT16(iterator:TGxB_Iterator):Tuint16_t;cdecl;external libgraphblas;
function GxB_Iterator_get_UINT32(iterator:TGxB_Iterator):Tuint32_t;cdecl;external libgraphblas;
function GxB_Iterator_get_UINT64(iterator:TGxB_Iterator):Tuint64_t;cdecl;external libgraphblas;
function GxB_Iterator_get_FP32(iterator:TGxB_Iterator):single;cdecl;external libgraphblas;
function GxB_Iterator_get_FP64(iterator:TGxB_Iterator):Tdouble;cdecl;external libgraphblas;
function GxB_Iterator_get_FC32(iterator:TGxB_Iterator):TGxB_FC32_t;cdecl;external libgraphblas;
function GxB_Iterator_get_FC64(iterator:TGxB_Iterator):TGxB_FC64_t;cdecl;external libgraphblas;
procedure GxB_Iterator_get_UDT(iterator:TGxB_Iterator; value:pointer);cdecl;external libgraphblas;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_BOOL(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT8(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT16(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT32(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT64(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT8(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT16(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT32(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT64(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FP32(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FP64(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FC32(iterator : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FC64(iterator : longint) : longint;

{------------------------------------------------------------------------------ }
{ Rapids Memory Manager wrappers for SuiteSparse:GraphBLAS }
{------------------------------------------------------------------------------ }
{$ifndef RMM_WRAP_H}
{$define RMM_WRAP_H}
{ C++ extern C conditionnal removed }
{ TODO describe the modes }
type
  PRMM_MODE = ^TRMM_MODE;
  TRMM_MODE =  Longint;
  Const
    rmm_wrap_host = 0;
    rmm_wrap_host_pinned = 1;
    rmm_wrap_device = 2;
    rmm_wrap_managed = 3;
;

procedure rmm_wrap_finalize;cdecl;external libgraphblas;
function rmm_wrap_initialize(mode:TRMM_MODE; init_pool_size:Tsize_t; max_pool_size:Tsize_t):longint;cdecl;external libgraphblas;
{ example usage: }
{  rmm_wrap_initialize (rmm_wrap_managed, INT32_MAX, INT64_MAX) ; }
{  GxB_init (GxB_NONBLOCKING_GPU, rmm_wrap_malloc, rmm_wrap_calloc, }
{      rmm_wrap_realloc, rmm_wrap_free) ; }
{  use GraphBLAS ... with the GPU }
{  GrB_finalize ( ) ; }
{  rmm_wrap_finalize ( ) ; }
{ The two PMR-based allocate/deallocate signatures (C-style): }
function rmm_wrap_allocate(size:Psize_t):pointer;cdecl;external libgraphblas;
procedure rmm_wrap_deallocate(p:pointer; size:Tsize_t);cdecl;external libgraphblas;
{ The four malloc/calloc/realloc/free signatures: }
function rmm_wrap_malloc(size:Tsize_t):pointer;cdecl;external libgraphblas;
function rmm_wrap_calloc(n:Tsize_t; size:Tsize_t):pointer;cdecl;external libgraphblas;
function rmm_wrap_realloc(p:pointer; newsize:Tsize_t):pointer;cdecl;external libgraphblas;
procedure rmm_wrap_free(p:pointer);cdecl;external libgraphblas;
{ C++ end of extern C conditionnal removed }
{$endif}
{$endif}

// === Konventiert am: 27-12-25 15:36:01 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_VERSION(major,minor,sub : longint) : longint;
begin
  GxB_VERSION:=(((major*1000)+minor)*1000)+sub;
end;

{ was #define dname def_expr }
function GxB_IMPLEMENTATION : longint; { return type might be wrong }
  begin
    GxB_IMPLEMENTATION:=GxB_VERSION(GxB_IMPLEMENTATION_MAJOR,GxB_IMPLEMENTATION_MINOR,GxB_IMPLEMENTATION_SUB);
  end;

{ was #define dname def_expr }
function GxB_SPEC_VERSION : longint; { return type might be wrong }
  begin
    GxB_SPEC_VERSION:=GxB_VERSION(GxB_SPEC_MAJOR,GxB_SPEC_MINOR,GxB_SPEC_SUB);
  end;

{ was #define dname def_expr }
function GrB_INDEX_MAX : longint; { return type might be wrong }
  begin
    GrB_INDEX_MAX:=(TGrB_Index(1 shl 60))-1;
  end;

{ was #define dname def_expr }
function GxB_INDEX_MAX : TGrB_Index;
  begin
    GxB_INDEX_MAX:=TGrB_Index(1 shl 60);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrB_BinaryOp_new(op,f,z,x,y : longint) : longint;
begin
  GrB_BinaryOp_new:=GxB_BinaryOp_new(op,f,z,x,y,GB_STR(f),NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrM_BinaryOp_new(op,f,z,x,y : longint) : longint;
begin
  GrM_BinaryOp_new:=GxM_BinaryOp_new(op,f,z,x,y,GB_STR(f),NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_SelectOp_new(op,f,x,t : longint) : longint;
begin
  GxB_SelectOp_new:=GB_SelectOp_new(op,f,x,t,GB_STR(f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxM_SelectOp_new(op,f,x,t : longint) : longint;
begin
  GxM_SelectOp_new:=GM_SelectOp_new(op,f,x,t,GB_STR(f));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrB_IndexUnaryOp_new(op,f,z,x,y : longint) : longint;
begin
  GrB_IndexUnaryOp_new:=GxB_IndexUnaryOp_new(op,f,z,x,y,GB_STR(f),NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GrM_IndexUnaryOp_new(op,f,z,x,y : longint) : longint;
begin
  GrM_IndexUnaryOp_new:=GxM_IndexUnaryOp_new(op,f,z,x,y,GB_STR(f),NULL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_attach(iterator,A,desc : longint) : longint;
begin
  GxB_rowIterator_attach:=GB_Iterator_attach(iterator,A,GxB_BY_ROW,desc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_kount(iterator : longint) : longint;
begin
  GxB_rowIterator_kount:=iterator^.anvec;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_seekRow(iterator,row : longint) : longint;
begin
  GxB_rowIterator_seekRow:=GB_Iterator_rc_seek(iterator,row,_false);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_kseek(iterator,k : longint) : longint;
begin
  GxB_rowIterator_kseek:=GB_Iterator_rc_seek(iterator,k,_true);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_nextRow(iterator : longint) : longint;
begin
  GxB_rowIterator_nextRow:=GB_Iterator_rc_knext(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_nextCol(iterator : longint) : longint;
begin
  GxB_rowIterator_nextCol:=GB_Iterator_rc_inext(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_getRowIndex(iterator : longint) : longint;
begin
  GxB_rowIterator_getRowIndex:=GB_Iterator_rc_getj(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_rowIterator_getColIndex(iterator : longint) : longint;
begin
  GxB_rowIterator_getColIndex:=GB_Iterator_rc_geti(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_attach(iterator,A,desc : longint) : longint;
begin
  GxB_colIterator_attach:=GB_Iterator_attach(iterator,A,GxB_BY_COL,desc);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_kount(iterator : longint) : longint;
begin
  GxB_colIterator_kount:=iterator^.anvec;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_seekCol(iterator,col : longint) : longint;
begin
  GxB_colIterator_seekCol:=GB_Iterator_rc_seek(iterator,col,_false);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_kseek(iterator,k : longint) : longint;
begin
  GxB_colIterator_kseek:=GB_Iterator_rc_seek(iterator,k,_true);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_nextCol(iterator : longint) : longint;
begin
  GxB_colIterator_nextCol:=GB_Iterator_rc_knext(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_nextRow(iterator : longint) : longint;
begin
  GxB_colIterator_nextRow:=GB_Iterator_rc_inext(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_getColIndex(iterator : longint) : longint;
begin
  GxB_colIterator_getColIndex:=GB_Iterator_rc_getj(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_colIterator_getRowIndex(iterator : longint) : longint;
begin
  GxB_colIterator_getRowIndex:=GB_Iterator_rc_geti(iterator);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Vector_Iterator_getpmax(iterator : longint) : longint;
begin
  GxB_Vector_Iterator_getpmax:=iterator^.pmax;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Vector_Iterator_getp(iterator : longint) : longint;
begin
  GxB_Vector_Iterator_getp:=iterator^.p;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_BOOL(iterator : longint) : longint;
begin
  GxB_Iterator_get_BOOL:=GB_Iterator_get(iterator,bool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT8(iterator : longint) : longint;
begin
  GxB_Iterator_get_INT8:=GB_Iterator_get(iterator,int8_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT16(iterator : longint) : longint;
begin
  GxB_Iterator_get_INT16:=GB_Iterator_get(iterator,int16_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT32(iterator : longint) : longint;
begin
  GxB_Iterator_get_INT32:=GB_Iterator_get(iterator,int32_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_INT64(iterator : longint) : longint;
begin
  GxB_Iterator_get_INT64:=GB_Iterator_get(iterator,int64_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT8(iterator : longint) : longint;
begin
  GxB_Iterator_get_UINT8:=GB_Iterator_get(iterator,uint8_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT16(iterator : longint) : longint;
begin
  GxB_Iterator_get_UINT16:=GB_Iterator_get(iterator,uint16_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT32(iterator : longint) : longint;
begin
  GxB_Iterator_get_UINT32:=GB_Iterator_get(iterator,uint32_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_UINT64(iterator : longint) : longint;
begin
  GxB_Iterator_get_UINT64:=GB_Iterator_get(iterator,uint64_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FP32(iterator : longint) : longint;
begin
  GxB_Iterator_get_FP32:=GB_Iterator_get(iterator,single);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FP64(iterator : longint) : longint;
begin
  GxB_Iterator_get_FP64:=GB_Iterator_get(iterator,double);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FC32(iterator : longint) : longint;
begin
  GxB_Iterator_get_FC32:=GB_Iterator_get(iterator,GxB_FC32_t);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GxB_Iterator_get_FC64(iterator : longint) : longint;
begin
  GxB_Iterator_get_FC64:=GB_Iterator_get(iterator,GxB_FC64_t);
end;


end.
