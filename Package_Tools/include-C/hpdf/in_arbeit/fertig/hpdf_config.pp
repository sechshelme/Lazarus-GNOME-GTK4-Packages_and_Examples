
unit hpdf_config;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_config.h
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


{ Define to 1 if you have the `png' library (-lpng).  }
{$define LIBHPDF_HAVE_LIBPNG}
{ Define to 1 if you have the `z' library (-lz).  }
{$define LIBHPDF_HAVE_ZLIB}
{ debug build  }
{ #undef LIBHPDF_DEBUG  }
{ debug trace enabled  }
{ #undef LIBHPDF_DEBUG_TRACE  }

implementation


end.
