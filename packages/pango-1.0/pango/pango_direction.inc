
{$IFDEF read_interface}

type
  PPangoDirection = ^TPangoDirection;
  TPangoDirection = longint;

const
  PANGO_DIRECTION_LTR = 0;
  PANGO_DIRECTION_RTL = 1;
  PANGO_DIRECTION_TTB_LTR = 2;
  PANGO_DIRECTION_TTB_RTL = 3;
  PANGO_DIRECTION_WEAK_LTR = 4;
  PANGO_DIRECTION_WEAK_RTL = 5;
  PANGO_DIRECTION_NEUTRAL = 6;

{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
