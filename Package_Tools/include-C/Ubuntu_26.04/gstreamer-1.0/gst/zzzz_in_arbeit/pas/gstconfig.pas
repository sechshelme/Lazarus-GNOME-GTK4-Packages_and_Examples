unit gstconfig;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  GST_DISABLE_GST_DEBUG = 1;
  GST_DISABLE_PARSE = 1;
  GST_DISABLE_REGISTRY = 1;
  GST_DISABLE_PLUGIN = 1;
  GST_PADDING = 4;
  GST_PADDING_LARGE = 20;
  GST_DISABLE_CAST_CHECKS = 0;
  GST_DISABLE_GLIB_ASSERTS = 0;
  GST_DISABLE_GLIB_CHECKS = 0;
  {$ENDIF read_enum}

  // === Konventiert am: 10-7-26 19:56:24 ===


implementation



end.
