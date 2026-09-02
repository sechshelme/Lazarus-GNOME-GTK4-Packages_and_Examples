unit fftw3;

interface

uses
  fp_fftw;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tfftw_r2r_kind_do_not_use_me = longint;
const
  FFTW_R2HC = 0;
  FFTW_HC2R = 1;
  FFTW_DHT = 2;
  FFTW_REDFT00 = 3;
  FFTW_REDFT01 = 4;
  FFTW_REDFT10 = 5;
  FFTW_REDFT11 = 6;
  FFTW_RODFT00 = 7;
  FFTW_RODFT01 = 8;
  FFTW_RODFT10 = 9;
  FFTW_RODFT11 = 10;

type
  Pfftw_iodim_do_not_use_me = ^Tfftw_iodim_do_not_use_me;
  Tfftw_iodim_do_not_use_me = record
    n: longint;
    is_: longint;
    os: longint;
  end;

type
  Pfftw_iodim64_do_not_use_me = ^Tfftw_iodim64_do_not_use_me;
  Tfftw_iodim64_do_not_use_me = record
    n: Tptrdiff_t;
    is_: Tptrdiff_t;
    os: Tptrdiff_t;
  end;

  Tfftw_write_char_func_do_not_use_me = procedure(c: char; para2: pointer); cdecl;
  Tfftw_read_char_func_do_not_use_me = function(para1: pointer): longint; cdecl;
{

#define FFTW_DEFINE_API(X, R, C)                                        \
                                                                        \
FFTW_DEFINE_COMPLEX(R, C);                                              \
                                                                        \
typedef struct X(plan_s) *X(plan);                                      \
                                                                        \
typedef struct fftw_iodim_do_not_use_me X(iodim);                       \
typedef struct fftw_iodim64_do_not_use_me X(iodim64);                   \
                                                                        \
typedef enum fftw_r2r_kind_do_not_use_me X(r2r_kind);                   \
                                                                        \
typedef fftw_write_char_func_do_not_use_me X(write_char_func);          \
typedef fftw_read_char_func_do_not_use_me X(read_char_func);            \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute)(const X(plan) p);                                 \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft)(int rank, const int *n,                          \
                       C *in, C *out, int sign, unsigned flags);        \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_1d)(int n, C *in, C *out, int sign,               \
                          unsigned flags);                              \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_2d)(int n0, int n1,                               \
                          C *in, C *out, int sign, unsigned flags);     \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_3d)(int n0, int n1, int n2,                       \
                          C *in, C *out, int sign, unsigned flags);     \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_many_dft)(int rank, const int *n,                     \
                            int howmany,                                \
                            C *in, const int *inembed,                  \
                            int istride, int idist,                     \
                            C *out, const int *onembed,                 \
                            int ostride, int odist,                     \
                            int sign, unsigned flags);                  \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_dft)(int rank, const X(iodim) *dims,             \
                            int howmany_rank,                           \
                            const X(iodim) *howmany_dims,               \
                            C *in, C *out,                              \
                            int sign, unsigned flags);                  \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_split_dft)(int rank, const X(iodim) *dims,       \
                                  int howmany_rank,                     \
                                  const X(iodim) *howmany_dims,         \
                                  R *ri, R *ii, R *ro, R *io,           \
                                  unsigned flags);                      \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_dft)(int rank,                                 \
                              const X(iodim64) *dims,                   \
                              int howmany_rank,                         \
                              const X(iodim64) *howmany_dims,           \
                              C *in, C *out,                            \
                              int sign, unsigned flags);                \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_split_dft)(int rank,                           \
                                    const X(iodim64) *dims,             \
                                    int howmany_rank,                   \
                                    const X(iodim64) *howmany_dims,     \
                                    R *ri, R *ii, R *ro, R *io,         \
                                    unsigned flags);                    \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_dft)(const X(plan) p, C *in, C *out);              \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_split_dft)(const X(plan) p, R *ri, R *ii,          \
                                      R *ro, R *io);                    \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_many_dft_r2c)(int rank, const int *n,                 \
                                int howmany,                            \
                                R *in, const int *inembed,              \
                                int istride, int idist,                 \
                                C *out, const int *onembed,             \
                                int ostride, int odist,                 \
                                unsigned flags);                        \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_r2c)(int rank, const int *n,                      \
                           R *in, C *out, unsigned flags);              \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_r2c_1d)(int n,R *in,C *out,unsigned flags);       \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_r2c_2d)(int n0, int n1,                           \
                              R *in, C *out, unsigned flags);           \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_r2c_3d)(int n0, int n1,                           \
                              int n2,                                   \
                              R *in, C *out, unsigned flags);           \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_many_dft_c2r)(int rank, const int *n,                 \
                                int howmany,                            \
                                C *in, const int *inembed,              \
                                int istride, int idist,                 \
                                R *out, const int *onembed,             \
                                int ostride, int odist,                 \
                                unsigned flags);                        \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_c2r)(int rank, const int *n,                      \
                           C *in, R *out, unsigned flags);              \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_c2r_1d)(int n,C *in,R *out,unsigned flags);       \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_c2r_2d)(int n0, int n1,                           \
                              C *in, R *out, unsigned flags);           \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_dft_c2r_3d)(int n0, int n1,                           \
                              int n2,                                   \
                              C *in, R *out, unsigned flags);           \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_dft_r2c)(int rank, const X(iodim) *dims,         \
                                int howmany_rank,                       \
                                const X(iodim) *howmany_dims,           \
                                R *in, C *out,                          \
                                unsigned flags);                        \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_dft_c2r)(int rank, const X(iodim) *dims,         \
                                int howmany_rank,                       \
                                const X(iodim) *howmany_dims,           \
                                C *in, R *out,                          \
                                unsigned flags);                        \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_split_dft_r2c)(int rank, const X(iodim) *dims,   \
                                      int howmany_rank,                 \
                                      const X(iodim) *howmany_dims,     \
                                      R *in, R *ro, R *io,              \
                                      unsigned flags);                  \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_split_dft_c2r)(int rank, const X(iodim) *dims,   \
                                      int howmany_rank,                 \
                                      const X(iodim) *howmany_dims,     \
                                      R *ri, R *ii, R *out,             \
                                      unsigned flags);                  \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_dft_r2c)(int rank,                             \
                                  const X(iodim64) *dims,               \
                                  int howmany_rank,                     \
                                  const X(iodim64) *howmany_dims,       \
                                  R *in, C *out,                        \
                                  unsigned flags);                      \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_dft_c2r)(int rank,                             \
                                  const X(iodim64) *dims,               \
                                  int howmany_rank,                     \
                                  const X(iodim64) *howmany_dims,       \
                                  C *in, R *out,                        \
                                  unsigned flags);                      \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_split_dft_r2c)(int rank, const X(iodim64) *dims, \
                                        int howmany_rank,               \
                                        const X(iodim64) *howmany_dims, \
                                        R *in, R *ro, R *io,            \
                                        unsigned flags);                \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_split_dft_c2r)(int rank, const X(iodim64) *dims, \
                                        int howmany_rank,               \
                                        const X(iodim64) *howmany_dims, \
                                        R *ri, R *ii, R *out,           \
                                        unsigned flags);                \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_dft_r2c)(const X(plan) p, R *in, C *out);          \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_dft_c2r)(const X(plan) p, C *in, R *out);          \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_split_dft_r2c)(const X(plan) p,                    \
                                    R *in, R *ro, R *io);               \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_split_dft_c2r)(const X(plan) p,                    \
                                    R *ri, R *ii, R *out);              \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_many_r2r)(int rank, const int *n,                     \
                            int howmany,                                \
                            R *in, const int *inembed,                  \
                            int istride, int idist,                     \
                            R *out, const int *onembed,                 \
                            int ostride, int odist,                     \
                            const X(r2r_kind) *kind, unsigned flags);   \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_r2r)(int rank, const int *n, R *in, R *out,           \
                       const X(r2r_kind) *kind, unsigned flags);        \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_r2r_1d)(int n, R *in, R *out,                         \
                          X(r2r_kind) kind, unsigned flags);            \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_r2r_2d)(int n0, int n1, R *in, R *out,                \
                          X(r2r_kind) kind0, X(r2r_kind) kind1,         \
                          unsigned flags);                              \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_r2r_3d)(int n0, int n1, int n2,                       \
                          R *in, R *out, X(r2r_kind) kind0,             \
                          X(r2r_kind) kind1, X(r2r_kind) kind2,         \
                          unsigned flags);                              \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru_r2r)(int rank, const X(iodim) *dims,             \
                            int howmany_rank,                           \
                            const X(iodim) *howmany_dims,               \
                            R *in, R *out,                              \
                            const X(r2r_kind) *kind, unsigned flags);   \
                                                                        \
FFTW_EXTERN X(plan)                                                     \
FFTW_CDECL X(plan_guru64_r2r)(int rank, const X(iodim64) *dims,         \
                              int howmany_rank,                         \
                              const X(iodim64) *howmany_dims,           \
                              R *in, R *out,                            \
                              const X(r2r_kind) *kind, unsigned flags); \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(execute_r2r)(const X(plan) p, R *in, R *out);              \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(destroy_plan)(X(plan) p);                                  \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(forget_wisdom)(void);                                      \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(cleanup)(void);                                            \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(set_timelimit)(double t);                                  \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(plan_with_nthreads)(int nthreads);                         \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(planner_nthreads)(void);                                   \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(init_threads)(void);                                       \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(cleanup_threads)(void);                                    \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(threads_set_callback)(                                     \
     void (*parallel_loop)(void *(*work)(char *),                       \
     char *jobdata, size_t elsize, int njobs, void *data), void *data); \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(make_planner_thread_safe)(void);                           \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(export_wisdom_to_filename)(const char *filename);          \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(export_wisdom_to_file)(FILE *output_file);                 \
                                                                        \
FFTW_EXTERN char *                                                      \
FFTW_CDECL X(export_wisdom_to_string)(void);                            \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(export_wisdom)(X(write_char_func) write_char,              \
                                  void *data);                          \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(import_system_wisdom)(void);                               \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(import_wisdom_from_filename)(const char *filename);        \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(import_wisdom_from_file)(FILE *input_file);                \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(import_wisdom_from_string)(const char *input_string);      \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(import_wisdom)(X(read_char_func) read_char, void *data);   \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(fprint_plan)(const X(plan) p, FILE *output_file);          \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(print_plan)(const X(plan) p);                              \
                                                                        \
FFTW_EXTERN char *                                                      \
FFTW_CDECL X(sprint_plan)(const X(plan) p);                             \
                                                                        \
FFTW_EXTERN void *                                                      \
FFTW_CDECL X(malloc)(size_t n);                                         \
                                                                        \
FFTW_EXTERN R *                                                         \
FFTW_CDECL X(alloc_real)(size_t n);                                     \
FFTW_EXTERN C *                                                         \
FFTW_CDECL X(alloc_complex)(size_t n);                                  \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(free)(void *p);                                            \
                                                                        \
FFTW_EXTERN void                                                        \
FFTW_CDECL X(flops)(const X(plan) p,                                    \
                    double *add, double *mul, double *fmas);            \
FFTW_EXTERN double                                                      \
FFTW_CDECL X(estimate_cost)(const X(plan) p);                           \
                                                                        \
FFTW_EXTERN double                                                      \
FFTW_CDECL X(cost)(const X(plan) p);                                    \
                                                                        \
FFTW_EXTERN int                                                         \
FFTW_CDECL X(alignment_of)(R *p);                                       \
                                                                        \
FFTW_EXTERN const char X(version)[];                                    \
FFTW_EXTERN const char X(cc)[];                                         \
FFTW_EXTERN const char X(codelet_optim)[];



FFTW_DEFINE_API(FFTW_MANGLE_DOUBLE, double, fftw_complex)
FFTW_DEFINE_API(FFTW_MANGLE_FLOAT, float, fftwf_complex)
FFTW_DEFINE_API(FFTW_MANGLE_LONG_DOUBLE, long double, fftwl_complex)
FFTW_DEFINE_API(FFTW_MANGLE_QUAD, __float128, fftwq_complex)

 }

const
  FFTW_FORWARD = -(1);
  FFTW_BACKWARD = (1);

const
  FFTW_NO_TIMELIMIT = -(1.0);
  FFTW_MEASURE = 0;
  FFTW_DESTROY_INPUT = 1 shl 0;
  FFTW_UNALIGNED = 1 shl 1;
  FFTW_CONSERVE_MEMORY = 1 shl 2;
  FFTW_EXHAUSTIVE = 1 shl 3;
  FFTW_PRESERVE_INPUT = 1 shl 4;
  FFTW_PATIENT = 1 shl 5;
  FFTW_ESTIMATE = 1 shl 6;
  FFTW_WISDOM_ONLY = 1 shl 21;
  FFTW_ESTIMATE_PATIENT = 1 shl 7;
  FFTW_BELIEVE_PCOST = 1 shl 8;
  FFTW_NO_DFT_R2HC = 1 shl 9;
  FFTW_NO_NONTHREADED = 1 shl 10;
  FFTW_NO_BUFFERING = 1 shl 11;
  FFTW_NO_INDIRECT_OP = 1 shl 12;
  FFTW_ALLOW_LARGE_GENERIC = 1 shl 13;
  FFTW_NO_RANK_SPLITS = 1 shl 14;
  FFTW_NO_VRANK_SPLITS = 1 shl 15;
  FFTW_NO_VRECURSE = 1 shl 16;
  FFTW_NO_SIMD = 1 shl 17;
  FFTW_NO_SLOW = 1 shl 18;
  FFTW_NO_FIXED_RADIX_LARGE_N = 1 shl 19;
  FFTW_ALLOW_PRUNING = 1 shl 20;

  // === Konventiert am: 2-9-26 15:02:50 ===


implementation

end.
