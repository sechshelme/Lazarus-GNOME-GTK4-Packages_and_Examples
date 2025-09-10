
unit mersenne_types;

interface

{
  Automatically converted by H2Pas 1.0.0 from mersenne_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mersenne_types.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
type
  PLongint = ^longint;
  PSmallInt = ^smallint;
  pbyte = ^byte;
  PWord = ^word;
  PDWord = ^DWord;
  PDouble = ^double;

type
  PTCOD_dice_t = ^TCOD_dice_t;
  PTCOD_distribution_t = ^TCOD_distribution_t;
  PTCOD_Random = ^TCOD_Random;
  PTCOD_random_algo_t = ^TCOD_random_algo_t;
  PTCOD_random_t = ^TCOD_random_t;
  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PTCOD_Random = type Pointer;

  PTCOD_random_t = ^TTCOD_random_t;
  TTCOD_random_t = PTCOD_Random;

  TTCOD_dice_t = record
    nb_rolls: longint;
    nb_faces: longint;
    multiplier: single;
    addsub: single;
  end;
  PTCOD_dice_t = ^TTCOD_dice_t;

  PTCOD_random_algo_t = ^TTCOD_random_algo_t;
  TTCOD_random_algo_t = longint;

const
  TCOD_RNG_MT = 0;
  TCOD_RNG_CMWC = 1;

type
  PTCOD_distribution_t = ^TTCOD_distribution_t;
  TTCOD_distribution_t = longint;

const
  TCOD_DISTRIBUTION_LINEAR = 0;
  TCOD_DISTRIBUTION_GAUSSIAN = 1;
  TCOD_DISTRIBUTION_GAUSSIAN_RANGE = 2;
  TCOD_DISTRIBUTION_GAUSSIAN_INVERSE = 3;
  TCOD_DISTRIBUTION_GAUSSIAN_RANGE_INVERSE = 4;

implementation


end.
