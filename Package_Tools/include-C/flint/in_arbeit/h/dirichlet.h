/*
    Copyright (C) 2016 Pascal Molin

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/


#define MAX_FACTORS 15

/* should this dlog pointer be in the prime or the global group? */
typedef struct
{
    ulong p;    /* underlying prime */
    int e;      /* exponent */
    nmod_t pe;  /* modulus */
    nmod_t phi;  /* phi(p^e) */
    ulong g;    /* conrey generator */
    dlog_precomp_struct * dlog;  /* precomputed data for discrete log mod p^e */
}
dirichlet_prime_group_struct;

typedef struct
{
    ulong q;                /* modulus */
    ulong q_even;           /* even part of modulus */
    nmod_t mod;             /* modulus with precomputed inverse */
    ulong rad_q;            /* radical = product of odd primes */
    ulong phi_q;            /* phi(q) = group size */
    slong neven;            /* number of even components (in 0,1,2)*/
    slong num;              /* number of prime components (even + odd) */
    ulong expo;             /* exponent = largest order in G */
    dirichlet_prime_group_struct * P;
    ulong * generators;     /* generators lifted mod q */
    ulong * PHI;            /* PHI(k) = expo / phi(k)        */
}
dirichlet_group_struct;

typedef dirichlet_group_struct dirichlet_group_t[1];

extern ulong
dirichlet_group_size(const dirichlet_group_t G)
;

ulong dirichlet_group_num_primitive(const dirichlet_group_t G);

int dirichlet_group_init(dirichlet_group_t G, ulong q);
void dirichlet_subgroup_init(dirichlet_group_t H, const dirichlet_group_t G, ulong h);
void dirichlet_group_clear(dirichlet_group_t G);
void dirichlet_group_dlog_precompute(dirichlet_group_t G, ulong num);
void dirichlet_group_dlog_clear(dirichlet_group_t G);

/* properties of elements without log */

ulong dirichlet_conductor_ui(const dirichlet_group_t G, ulong a);
int dirichlet_parity_ui(const dirichlet_group_t G, ulong a);
ulong dirichlet_order_ui(const dirichlet_group_t G, ulong a);

/* characters, keep both number and log */
typedef struct
{
    ulong n;           /* number */
    ulong * log;       /* s.t. prod generators[k]^log[k] = number */
}
dirichlet_char_struct;

typedef dirichlet_char_struct dirichlet_char_t[1];

void dirichlet_char_init(dirichlet_char_t x, const dirichlet_group_t G);
void dirichlet_char_clear(dirichlet_char_t x);
void dirichlet_char_print(const dirichlet_group_t G, const dirichlet_char_t x);

extern void
dirichlet_char_set(dirichlet_char_t x, const dirichlet_group_t G, const dirichlet_char_t y)
;

extern int
dirichlet_char_eq(const dirichlet_char_t x, const dirichlet_char_t y)
;

int dirichlet_char_eq_deep(const dirichlet_group_t G, const dirichlet_char_t x, const dirichlet_char_t y);
int dirichlet_parity_char(const dirichlet_group_t G, const dirichlet_char_t x);
ulong dirichlet_conductor_char(const dirichlet_group_t G, const dirichlet_char_t x);
ulong dirichlet_order_char(const dirichlet_group_t G, const dirichlet_char_t x);

void dirichlet_char_log(dirichlet_char_t x, const dirichlet_group_t G, ulong m);

extern ulong
dirichlet_char_exp(const dirichlet_group_t G, const dirichlet_char_t x)
;

ulong _dirichlet_char_exp(dirichlet_char_t x, const dirichlet_group_t G);

void dirichlet_char_index(dirichlet_char_t x, const dirichlet_group_t G, ulong j);
ulong dirichlet_index_char(const dirichlet_group_t G, const dirichlet_char_t x);

void dirichlet_char_one(dirichlet_char_t x, const dirichlet_group_t G);
void dirichlet_char_first_primitive(dirichlet_char_t x, const dirichlet_group_t G);

int dirichlet_char_next(dirichlet_char_t x, const dirichlet_group_t G);
int dirichlet_char_next_primitive(dirichlet_char_t x, const dirichlet_group_t G);

void dirichlet_char_mul(dirichlet_char_t c, const dirichlet_group_t G, const dirichlet_char_t a, const dirichlet_char_t b);
void dirichlet_char_pow(dirichlet_char_t c, const dirichlet_group_t G, const dirichlet_char_t a, ulong n);

void dirichlet_char_lower(dirichlet_char_t y, const dirichlet_group_t H, const dirichlet_char_t x, const dirichlet_group_t G);
void dirichlet_char_lift(dirichlet_char_t y, const dirichlet_group_t G, const dirichlet_char_t x, const dirichlet_group_t H);

#define DIRICHLET_CHI_NULL UWORD_MAX

ulong dirichlet_pairing(const dirichlet_group_t G, ulong m, ulong n);
ulong dirichlet_pairing_char(const dirichlet_group_t G, const dirichlet_char_t a, const dirichlet_char_t b);

extern int
dirichlet_char_is_principal(const dirichlet_group_t G, const dirichlet_char_t chi)
;

extern int
dirichlet_char_is_real(const dirichlet_group_t G, const dirichlet_char_t chi)
;

extern int
dirichlet_char_is_primitive(const dirichlet_group_t G, const dirichlet_char_t chi)
;

ulong dirichlet_chi(const dirichlet_group_t G, const dirichlet_char_t chi, ulong n);

void dirichlet_vec_set_null(ulong *v, const dirichlet_group_t G, slong nv);
void dirichlet_chi_vec_loop(ulong *v, const dirichlet_group_t G, const dirichlet_char_t chi, slong nv);
void dirichlet_chi_vec_primeloop(ulong *v, const dirichlet_group_t G, const dirichlet_char_t chi, slong nv);
void dirichlet_chi_vec(ulong *v, const dirichlet_group_t G, const dirichlet_char_t chi, slong nv);
void dirichlet_chi_vec_loop_order(ulong *v, const dirichlet_group_t G, const dirichlet_char_t chi, ulong order, slong nv);
void dirichlet_chi_vec_primeloop_order(ulong *v, const dirichlet_group_t G, const dirichlet_char_t chi, ulong order, slong nv);
void dirichlet_chi_vec_order(ulong *v, const dirichlet_group_t G, const dirichlet_char_t chi, ulong order, slong nv);

#ifdef __cplusplus
;
#endif

#endif
