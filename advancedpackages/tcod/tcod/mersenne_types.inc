{$IFDEF read_interface}


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

  // === Konventiert am: 10-9-25 13:55:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
