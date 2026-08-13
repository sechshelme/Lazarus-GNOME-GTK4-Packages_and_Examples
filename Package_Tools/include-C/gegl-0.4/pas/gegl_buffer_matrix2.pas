unit gegl_buffer_matrix2;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGeglBufferMatrix2 = ^TGeglBufferMatrix2;
  TGeglBufferMatrix2 = record
    coeff: array[0..1] of array[0..1] of Tgdouble;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_buffer_matrix2_is_identity(matrix: PGeglBufferMatrix2): Tgboolean; cdecl; external libgegl;
function gegl_buffer_matrix2_is_scale(matrix: PGeglBufferMatrix2): Tgboolean; cdecl; external libgegl;
function gegl_buffer_matrix2_determinant(matrix: PGeglBufferMatrix2): Tgdouble; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 14:48:08 ===


implementation



end.
