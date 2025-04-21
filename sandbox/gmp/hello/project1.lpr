program project1;

// https://www.perplexity.ai/search/gib-mir-ein-c-beispiel-mit-gmp-CNlefi.HSB.B17IFAlL9zg

uses
  gmp;

  //procedure mpz_init(para1: Tmpz_ptr); cdecl; external libgmp name '__gmpz_init';
  //function mpz_set_str(para1: Tmpz_ptr; para2: pchar; para3: longint): longint; cdecl; external libgmp name '__gmpz_set_str';
  //procedure mpz_add(para1: Tmpz_ptr; para2: Tmpz_srcptr; para3: Tmpz_srcptr); cdecl; external libgmp name '__gmpz_add';

  //function gmp_printf(para1: pchar): longint; varargs; cdecl; external libgmp name '__gmp_printf';
  //function gmp_printf(para1:Pchar):longint;varargs;cdecl;external libgmp name '__ggmp_printf';


  //procedure mpz_clear(para1:Tmpz_ptr);cdecl;external libgmp name '__gmpz_clear';
  //

  procedure Add;
//  var
//    a, b, sum: Tmpz_t;
  var
    a, b, sum: Tmpz_struct;
  begin
    mpz_init(@a);
    mpz_init(@b);
    mpz_init(@sum);

    mpz_set_str(@a, '1111', 10);
    mpz_set_str(@b, '3333', 10);

    mpz_add(@sum, @a, @b);

    gmp_printf('Summe: %Zd'#10, @sum);

    mpz_clear(@a);
    mpz_clear(@b);
    mpz_clear(@sum);
  end;

begin
  Add;
end.
