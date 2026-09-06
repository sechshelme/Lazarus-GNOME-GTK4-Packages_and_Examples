program project1;

(*

// nm -D libflint.so | grep padic_fprint

Bei flint.h einfügen
#define FLINT_FORCE_INLINE __attribute__((weak)) extern

#define FMPZ_MOD_MPOLY_Q_INLINE __attribute__((weak)) extern
#define RADIX_INLINE __attribute__((weak)) extern
#define FQ_ZECH_POLY_INLINE __attribute__((weak)) extern
#define DLOG_INLINE __attribute__((weak)) extern




/home/tux/Schreibtisch/von_Git/flint/flint/src/fmpz_mod_mpoly_q.h
fmpz_mod_mpoly_q_is_fmpz_mod(const fmpz_mod_mpoly_q_t x, const fmpz_mod_mpoly_ctx_t ctx)
fmpz_mod_mpoly_q_is_fmpz_mod
not found


/home/tux/Schreibtisch/von_Git/flint/flint/src/radix.h
radix_add_1(nn_ptr res, nn_srcptr a, slong n, ulong c, const radix_t radix)
radix_add_1
not found

radix_sub_1(nn_ptr res, nn_srcptr a, slong n, ulong c, const radix_t radix)
radix_sub_1
not found



*)

  procedure radix_mulmid(res: Pointer; a: Pointer; an: int64; b: Pointer; bn: int64; lo: int64; hi: int64; radix: Pointer); cdecl; external 'libflint.so.123';

  procedure main;
  begin
    radix_mulmid(nil, nil, 0, nil, 0, 0, 0, nil);
  end;


begin
  main;
end.
