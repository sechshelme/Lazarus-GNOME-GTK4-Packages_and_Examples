unit gtkimmodule;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  GTK_IM_MODULE_EXTENSION_POINT_NAME = 'gtk-im-module';
  {$ENDIF read_enum}

  // === Konventiert am: 6-7-26 17:18:30 ===


implementation



end.
