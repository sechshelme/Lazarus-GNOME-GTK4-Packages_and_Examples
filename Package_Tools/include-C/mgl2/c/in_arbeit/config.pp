
unit config;
interface

{
  Automatically converted by H2Pas 1.0.0 from config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    config.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _MGL_CONFIG_H_}
{$define _MGL_CONFIG_H_}
{#define MGL_VER2 	0.1	// minor version of MathGL 2.* (like 1.3 for v.2.1.3) }

const
  MGL_VER_MAJOR = 8;  
  MGL_VER_MINOR = 0;  
  MGL_VER_PATCH = 1;  
  MGL_VERSION = 8000+0.1;  
  MGL_VER_STRING = '8.0.1';  
  MGL_USE_DOUBLE = 1;  
{$ifdef WIN32	// a man ask to use built-in font under Windows}
  MGL_DEF_FONT_NAME = '';  
{$else}

const
  MGL_DEF_FONT_NAME = 'STIX';  
{$endif}

const
  MGL_INSTALL_DIR = '/usr';  
{$if defined(_MSC_VER) || defined(__BORLANDC__)}

const
  MGL_SYS_NAN = 0;  
  MGL_HAVE_PTHREAD = 0;  
  MGL_HAVE_PTHR_WIDGET = 0;  
  MGL_HAVE_ATTRIBUTE = 0;  
  MGL_HAVE_C99_COMPLEX = 0;  
{$else}

const
  MGL_SYS_NAN = 1;  
  MGL_HAVE_PTHREAD = 0;  
  MGL_HAVE_PTHR_WIDGET = 1;  
  MGL_HAVE_ATTRIBUTE = 1;  
  MGL_HAVE_C99_COMPLEX = 0;  
{$endif}

const
  MGL_SIZEOF_LONG = 8;  
  MGL_HAVE_FREETYPE = 0;  
  MGL_HAVE_LTDL = 1;  
  MGL_HAVE_RVAL = 0;  
  MGL_HAVE_ZLIB = 1;  
  MGL_HAVE_PNG = 1;  
  MGL_HAVE_GSL = 1;  
  MGL_HAVE_OPENGL = 1;  
  MGL_HAVE_ARMA = 0;  
  MGL_HAVE_OMP = 1;  
  MGL_HAVE_JPEG = 1;  
  MGL_HAVE_GIF = 1;  
  MGL_HAVE_PDF = 1;  
  MGL_HAVE_HDF4 = 1;  
  MGL_HAVE_HDF5 = 1;  
  MGL_HDF5_VER_MAJOR = 1;  
  MGL_HDF5_VER_MINOR = 10;  
  MGL_USE_GETTEXT = 1;  
  MGL_FONT_PATH = '/usr/share/mathgl/fonts';  
  MGL_HAVE_FL_COPY = 1;  
{$endif}

implementation


end.
