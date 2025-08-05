unit fp_locale;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/locale.h

const
  _BITS_LOCALE_H = 1;
  __LC_CTYPE = 0;
  __LC_NUMERIC = 1;
  __LC_TIME = 2;
  __LC_COLLATE = 3;
  __LC_MONETARY = 4;
  __LC_MESSAGES = 5;
  __LC_ALL = 6;
  __LC_PAPER = 7;
  __LC_NAME = 8;
  __LC_ADDRESS = 9;
  __LC_TELEPHONE = 10;
  __LC_MEASUREMENT = 11;
  __LC_IDENTIFICATION = 12;


  // /usr/include/locale.h

const
  LC_CTYPE = __LC_CTYPE;
  LC_NUMERIC = __LC_NUMERIC;
  LC_TIME = __LC_TIME;
  LC_COLLATE = __LC_COLLATE;
  LC_MONETARY = __LC_MONETARY;
  LC_MESSAGES = __LC_MESSAGES;
  LC_ALL = __LC_ALL;
  LC_PAPER = __LC_PAPER;
  LC_NAME = __LC_NAME;
  LC_ADDRESS = __LC_ADDRESS;
  LC_TELEPHONE = __LC_TELEPHONE;
  LC_MEASUREMENT = __LC_MEASUREMENT;
  LC_IDENTIFICATION = __LC_IDENTIFICATION;

type
  Tlconv = record
    decimal_point: pchar;
    thousands_sep: pchar;
    grouping: pchar;
    int_curr_symbol: pchar;
    currency_symbol: pchar;
    mon_decimal_point: pchar;
    mon_thousands_sep: pchar;
    mon_grouping: pchar;
    positive_sign: pchar;
    negative_sign: pchar;
    int_frac_digits: char;
    frac_digits: char;
    p_cs_precedes: char;
    p_sep_by_space: char;
    n_cs_precedes: char;
    n_sep_by_space: char;
    p_sign_posn: char;
    n_sign_posn: char;
    int_p_cs_precedes: char;
    int_p_sep_by_space: char;
    int_n_cs_precedes: char;
    int_n_sep_by_space: char;
    int_p_sign_posn: char;
    int_n_sign_posn: char;
    __int_p_cs_precedes: char;
    __int_p_sep_by_space: char;
    __int_n_cs_precedes: char;
    __int_n_sep_by_space: char;
    __int_p_sign_posn: char;
    __int_n_sign_posn: char;
  end;
  Plconv = ^Tlconv;

function setlocale(__category: longint; __locale: pchar): pchar; cdecl; external libc;
function localeconv: Plconv; cdecl; external libc;
function newlocale(__category_mask: longint; __locale: pchar; __base: Tlocale_t): Tlocale_t; cdecl; external libc;

const
  LC_CTYPE_MASK = 1 shl __LC_CTYPE;
  LC_NUMERIC_MASK = 1 shl __LC_NUMERIC;
  LC_TIME_MASK = 1 shl __LC_TIME;
  LC_COLLATE_MASK = 1 shl __LC_COLLATE;
  LC_MONETARY_MASK = 1 shl __LC_MONETARY;
  LC_MESSAGES_MASK = 1 shl __LC_MESSAGES;
  LC_PAPER_MASK = 1 shl __LC_PAPER;
  LC_NAME_MASK = 1 shl __LC_NAME;
  LC_ADDRESS_MASK = 1 shl __LC_ADDRESS;
  LC_TELEPHONE_MASK = 1 shl __LC_TELEPHONE;
  LC_MEASUREMENT_MASK = 1 shl __LC_MEASUREMENT;
  LC_IDENTIFICATION_MASK = 1 shl __LC_IDENTIFICATION;
  LC_ALL_MASK = LC_CTYPE_MASK or LC_NUMERIC_MASK or LC_TIME_MASK or LC_COLLATE_MASK or LC_MONETARY_MASK or LC_MESSAGES_MASK or LC_PAPER_MASK or LC_NAME_MASK or LC_ADDRESS_MASK or LC_TELEPHONE_MASK or LC_MEASUREMENT_MASK or LC_IDENTIFICATION_MASK;

function duplocale(__dataset: Tlocale_t): Tlocale_t; cdecl; external libc;
procedure freelocale(__dataset: Tlocale_t); cdecl; external libc;
function uselocale(__dataset: Tlocale_t): Tlocale_t; cdecl; external libc;

const
  LC_GLOBAL_LOCALE = Tlocale_t(-(1));

  // === Konventiert am: 5-8-25 15:20:27 ===


implementation



end.
