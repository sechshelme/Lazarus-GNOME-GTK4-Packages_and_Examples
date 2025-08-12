unit if_shaper;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SHAPER_QLEN = 10;
  SHAPER_LATENCY = 5 * HZ;
  SHAPER_MAXSLIP = 2;
  SHAPER_BURST = HZ / 50;
  SHAPER_SET_DEV = $0001;
  SHAPER_SET_SPEED = $0002;
  SHAPER_GET_DEV = $0003;
  SHAPER_GET_SPEED = $0004;

type
  Tshaperconf = record
    ss_cmd: Tuint16_t;
    ss_u: record
      case longint of
        0: (ssu_name: array[0..13] of char);
        1: (ssu_speed: Tuint32_t);
      end;
  end;
  Pshaperconf = ^Tshaperconf;


  // === Konventiert am: 12-8-25 17:05:57 ===


implementation



end.
