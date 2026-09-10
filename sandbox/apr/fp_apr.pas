unit fp_apr;

interface

const
  {$IFDEF Linux}
  libapr = 'apr-1';
  {$ENDIF}

  {$IFDEF Windows}
  libapr = 'libapr-1.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Ttime_t=Int64;
  Tva_list=type Pointer; // ????

/// ==== am ende löschen
Papr_pool_t=Pointer;
PPapr_pool_t=^Papr_pool_t;

  {$DEFINE read_interface}
  //  {$include fp_apr_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_apr_includes.inc}
{$UNDEF read_implementation}

end.
