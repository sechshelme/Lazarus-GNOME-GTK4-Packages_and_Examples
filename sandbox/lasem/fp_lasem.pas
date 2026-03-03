unit fp_lasem;

interface

uses
  fp_glib2;


const
  {$ifdef linux}
  liblasem = 'lasem-0.6';
  {$endif}

  {$ifdef windows}
  liblasem = 'liblasem-0.6-0.dll';
  {$endif}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


implementation

end.
