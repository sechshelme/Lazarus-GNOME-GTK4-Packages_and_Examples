unit eina_slice;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Slice = record
    len: Tsize_t;
    uni: record
      case longint of
        0: (mem: pointer);
        1: (bytes: Puint8);
      end;
  end;
  PEina_Slice = ^TEina_Slice;

  TEina_Rw_Slice = record
    len: Tsize_t;
    uni: record
      case longint of
        0: (mem: pointer);
        1: (bytes: Puint8);
      end;
  end;
  PEina_Rw_Slice = ^TEina_Rw_Slice;

const
  EINA_SLICE_STR_FMT = '%.*s';
  EINA_SLICE_FMT = '%p+%zu';

  // === Konventiert am: 16-5-25 17:19:46 ===


implementation



end.
