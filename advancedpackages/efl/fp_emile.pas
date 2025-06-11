unit fp_emile;

interface

uses
  efl, fp_eina;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}
{$MACRO ON}

{$DEFINE includes:=
  {$include emile-1/Emile.inc}                                               // io.
  {$include emile-1/emile_base64.inc}                                        // io.
  {$include emile-1/emile_cipher.inc}                                        // io.
  {$include emile-1/emile_compress.inc}                                      // io.
  {$include emile-1/emile_image.inc}                                         // io.
}


{$DEFINE read_interface}
includes
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
includes
{$UNDEF read_implementation}

end.

