{$IFDEF read_interface}


const
  GLIBTOP_SYSINFO_NCPU = 0;
  GLIBTOP_SYSINFO_CPUINFO = 1;
  GLIBTOP_MAX_SYSINFO = 2;

type
  Tglibtop_entry = record
    labels: PGPtrArray;
    values: PGHashTable;
    descriptions: PGHashTable;
  end;
  Pglibtop_entry = ^Tglibtop_entry;

  Tglibtop_sysinfo = record
    flags: Tguint64;
    ncpu: Tguint64;
    cpuinfo: array[0..(GLIBTOP_NCPU) - 1] of Tglibtop_entry;
  end;
  Pglibtop_sysinfo = ^Tglibtop_sysinfo;


function glibtop_get_sysinfo_r(server: Pglibtop): Pglibtop_sysinfo; cdecl; external libgtop2 name 'glibtop_get_sysinfo_s^';

function glibtop_get_sysinfo_s(server: Pglibtop): Pglibtop_sysinfo; cdecl; external libgtop2;
function glibtop_get_sysinfo: Pglibtop_sysinfo; cdecl; external libgtop2;

// === Konventiert am: 26-10-25 12:03:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
