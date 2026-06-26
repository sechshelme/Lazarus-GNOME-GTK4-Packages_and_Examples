unit gvaluecollector;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  G_VALUE_COLLECT_INT = 'i';
  G_VALUE_COLLECT_LONG = 'l';
  G_VALUE_COLLECT_INT64 = 'q';
  G_VALUE_COLLECT_DOUBLE = 'd';
  G_VALUE_COLLECT_POINTER = 'p';

type
  PGTypeCValue = ^TGTypeCValue;
  TGTypeCValue = record
    case longint of
      0: (v_int: Tgint);
      1: (v_long: Tglong);
      2: (v_int64: Tgint64);
      3: (v_double: Tgdouble);
      4: (v_pointer: Tgpointer);
  end;

const
  G_VALUE_COLLECT_FORMAT_MAX_LENGTH = 8;

  // === Konventiert am: 25-6-26 15:14:31 ===


implementation



end.
