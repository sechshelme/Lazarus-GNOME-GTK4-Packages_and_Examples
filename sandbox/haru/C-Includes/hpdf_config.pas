unit hpdf_config;

interface

uses
  fp_hpdf;

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

// === Konventiert am: 28-1-26 13:59:55 ===


implementation



end.
