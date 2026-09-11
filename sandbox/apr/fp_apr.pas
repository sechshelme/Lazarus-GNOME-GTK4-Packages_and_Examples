unit fp_apr;

interface

const
  {$IFDEF Linux}
  libapr = 'apr-1';
  {$ENDIF}

  {$IFDEF Windows}
  libapr = 'libapr-1.dll';
  {$ENDIF}

  type
    Ttime_t=Int64;
    Piovec=type Pointer;
  Tva_list=type Pointer; // ????

  const
    SEEK_SET = 0;
    SEEK_CUR = 1;
    SEEK_END = 2;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type


  Papr_file_t=type Pointer;
  PPapr_file_t=^Papr_file_t;

Papr_pool_t=type Pointer;
PPapr_pool_t=^Papr_pool_t;

  {$DEFINE read_interface}
  //  {$include fp_apr_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_apr_includes.inc}
{$UNDEF read_implementation}

end.
