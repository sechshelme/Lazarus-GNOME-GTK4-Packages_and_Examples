
unit sokol_time;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_time.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_time.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure stm_setup;cdecl;external;
function stm_now:Tuint64_t;cdecl;external;
function stm_diff(new_ticks:Tuint64_t; old_ticks:Tuint64_t):Tuint64_t;cdecl;external;
function stm_since(start_ticks:Tuint64_t):Tuint64_t;cdecl;external;
function stm_laptime(last_time:Puint64_t):Tuint64_t;cdecl;external;
function stm_round_to_common_refresh_rate(frame_ticks:Tuint64_t):Tuint64_t;cdecl;external;
function stm_sec(ticks:Tuint64_t):Tdouble;cdecl;external;
function stm_ms(ticks:Tuint64_t):Tdouble;cdecl;external;
function stm_us(ticks:Tuint64_t):Tdouble;cdecl;external;
function stm_ns(ticks:Tuint64_t):Tdouble;cdecl;external;

implementation


end.
