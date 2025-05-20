unit fp_emile;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}

{$include emile-1/Emile.inc}                                               // io.
{$include emile-1/emile_base64.inc}                                        // io.
{$include emile-1/emile_cipher.inc}                                        // io.
{$include emile-1/emile_compress.inc}                                      // io.
{$include emile-1/emile_image.inc}                                         // io.

{$UNDEF read_interface}


implementation

{$DEFINE read_implementation}

{$include emile-1/Emile.inc}                                               // io.
{$include emile-1/emile_base64.inc}                                        // io.
{$include emile-1/emile_cipher.inc}                                        // io.
{$include emile-1/emile_compress.inc}                                      // io.
{$include emile-1/emile_image.inc}                                         // io.

{$UNDEF read_implementation}

end.

