unit gstelementmetadata;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_ELEMENT_METADATA_LONGNAME = 'long-name';
  GST_ELEMENT_METADATA_KLASS = 'klass';
  GST_ELEMENT_METADATA_DESCRIPTION = 'description';
  GST_ELEMENT_METADATA_AUTHOR = 'author';
  GST_ELEMENT_METADATA_DOC_URI = 'doc-uri';
  GST_ELEMENT_METADATA_ICON_NAME = 'icon-name';
  {$ENDIF read_enum}

  // === Konventiert am: 11-7-26 10:58:50 ===


implementation



end.
