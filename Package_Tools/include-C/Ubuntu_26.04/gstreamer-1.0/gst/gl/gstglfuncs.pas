unit gstglfuncs;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstGLFuncs = ^TGstGLFuncs;
  TGstGLFuncs = record
    padding: array[0..((GST_PADDING_LARGE * 6) - 8) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

  // === Konventiert am: 14-7-26 13:01:27 ===


implementation



end.
