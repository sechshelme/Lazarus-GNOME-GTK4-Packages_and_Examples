unit wayland_version;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_wayland;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  WAYLAND_VERSION_MAJOR = 1;
  WAYLAND_VERSION_MINOR = 22;
  WAYLAND_VERSION_MICRO = 0;
  WAYLAND_VERSION_ = '1.22.0';
  {$ENDIF read_enum}

  // === Konventiert am: 10-6-26 17:06:00 ===


implementation



end.
