unit atomic_wide_counter_;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tatomic_wide_counter = record
    case integer of
      0: (value64: uint64);
      1: (value32: record
          low: uint32;
          high: uint32;
          end);
  end;

  // === Konventiert am: 8-8-25 17:10:41 ===


implementation



end.
