unit version;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Macros for the header version.
  }
{$ifndef VIPS_VERSION_H}
{$define VIPS_VERSION_H}

const
  VIPS_VERSION = '8.15.1';  
  VIPS_VERSION_STRING = '8.15.1';  
  VIPS_MAJOR_VERSION = 8;  
  VIPS_MINOR_VERSION = 15;  
  VIPS_MICRO_VERSION = 1;  
{ The ABI version, as used for library versioning.
  }
  VIPS_LIBRARY_CURRENT = 59;  
  VIPS_LIBRARY_REVISION = 1;  
  VIPS_LIBRARY_AGE = 17;  
  VIPS_CONFIG = 'enable debug: false\nenable deprecated: true\nenable modules: true\nenable cplusplus: true\nenable RAD load/save: true\nenable Analyze7 load/save: true\nenable PPM load/save: true\nenable GIF load: true\nuse fftw for FFTs: true\nSIMD support with highway;  
{ Not really anything to do with versions, but this is a handy place to put
 * it.
  }
  VIPS_ENABLE_DEPRECATED = 1;  
{$endif}
{VIPS_VERSION_H }

// === Konventiert am: 26-4-26 16:08:18 ===


implementation



end.
