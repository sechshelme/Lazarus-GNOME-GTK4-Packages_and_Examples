unit fp_event;

interface

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

const
  {$IFDEF linux}
  libevent = 'libevent';
  {$ENDIF}

  {$IFDEF windows}
  libibus = 'event.dll'; // ???
  {$ENDIF}

  type
    Tsize_t=SizeUInt;
    Tva_list=Pointer;
    PFILE=Pointer;

    Ptimeval=Pointer; //????
    Ptm=Pointer; // ?????

  //{$DEFINE read_interface}
  //{$include fp_event_includes.inc}
  //{$UNDEF read_interface}

implementation

//{$DEFINE read_implementation}
//{$include fp_event_includes.inc}
//{$UNDEF read_implementation}

end.

