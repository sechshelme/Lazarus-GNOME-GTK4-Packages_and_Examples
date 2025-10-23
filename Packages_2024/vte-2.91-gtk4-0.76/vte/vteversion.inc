{$IFDEF read_interface}

const
  VTE_MAJOR_VERSION = 0;  
  VTE_MINOR_VERSION = 76;
  VTE_MICRO_VERSION = 0;

function VTE_CHECK_VERSION(major,minor,micro : longint) : Boolean;

function vte_get_major_version:Tguint;cdecl;external libvte_2_91_gtk4 ;
function vte_get_minor_version:Tguint;cdecl;external libvte_2_91_gtk4 ;
function vte_get_micro_version:Tguint;cdecl;external libvte_2_91_gtk4 ;

// === Konventiert am: 3-5-25 17:07:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function VTE_CHECK_VERSION(major,minor,micro : longint) : Boolean;
begin
  Result :=
    (VTE_MAJOR_VERSION > major) or
    ((VTE_MAJOR_VERSION = major) and (VTE_MINOR_VERSION > minor)) or
    ((VTE_MAJOR_VERSION = major) and (VTE_MINOR_VERSION = minor) and (VTE_MICRO_VERSION >= micro));
end;


{$ENDIF read_implementation}
