program project1;

uses
  SysUtils,
  gmp;


  procedure Calculate;
  var
    a, b, sum: Tmpz;
  begin
    mpz_init(@a);
    mpz_init(@b);
    mpz_init(@sum);

    mpz_set_str(@a, '1111', 10);
    mpz_set_str(@b, '3333', 10);

    mpz_add(@sum, @a, @b);
    gmp_printf('Summe: %Zd + %Zd = %Zd'#10, @a, @b, @sum);
    mpz_mul(@sum, @a, @b);
    gmp_printf('Summe: %Zd * %Zd = %Zd'#10, @a, @b, @sum);

    mpz_clear(@a);
    mpz_clear(@b);
    mpz_clear(@sum);
  end;

  procedure mpz_rand;
  var
    seed, rand_num, limit: Tmpz;
    i: integer;
    state: Tgmp_randstate;
  begin
    gmp_randinit_default(@state);

    mpz_init_set_ui(@seed, GetTickCount64);
    gmp_randseed(@state, @seed);

    mpz_init_set_ui(@limit, 1000);

    mpz_init(@rand_num);

    for i := 0 to 7 do begin
      mpz_urandomm(@rand_num, @state, @limit);
      gmp_printf('Zufallzahl: %Zd'#10, @rand_num);
    end;

    mpz_clear(@rand_num);
    mpz_clear(@limit);
    mpz_clear(@seed);
    gmp_randclear(@state);
  end;

  procedure mpf_rand;
  var
    state: Tgmp_randstate;
    rand_f: Tmpf;
    seed: Tmpz;
    i: integer;
  const
    places = 10;
    bits = Trunc(places * 3.32193) + 1; // Log 10
  begin
    gmp_randinit_default(@state);
    mpz_init_set_ui(@seed, GetTickCount64);
    gmp_randseed(@state, @seed);

    mpf_init2(@rand_f, bits);

    for i := 0 to 7 do begin
      mpf_urandomb(@rand_f, @state, bits);
      gmp_printf('Zufallszahl: %.*Ff'#10, places, @rand_f);
    end;

    mpf_clear(@rand_f);
    mpz_clear(@seed);
    gmp_randclear(@state);
  end;

begin
  WriteLn('Version: ', gmp_version);
  WriteLn('--- Calculate -----------------');
  Calculate;
  WriteLn('--- Int Random ----------------');
  mpz_rand;
  WriteLn('--- Float Random --------------');
  mpf_rand;
end.
