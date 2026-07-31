unit as_category_gi;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function as_get_default_categories_gi(with_special: Tgboolean): PGPtrArray; cdecl; external libappstream;
{$ENDIF read_function}

// === Konventiert am: 30-7-26 19:36:38 ===


implementation



end.
