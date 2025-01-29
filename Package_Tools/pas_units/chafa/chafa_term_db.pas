unit chafa_term_db;

interface

uses
  fp_glib2, chafa_term_info;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TChafaTermDb = record
  end;
  PChafaTermDb = ^TChafaTermDb;

function chafa_term_db_new: PChafaTermDb; cdecl; external libchafa;
function chafa_term_db_copy(term_db: PChafaTermDb): PChafaTermDb; cdecl; external libchafa;
procedure chafa_term_db_ref(term_db: PChafaTermDb); cdecl; external libchafa;
procedure chafa_term_db_unref(term_db: PChafaTermDb); cdecl; external libchafa;
function chafa_term_db_get_default: PChafaTermDb; cdecl; external libchafa;
function chafa_term_db_detect(term_db: PChafaTermDb; envp: PPgchar): PChafaTermInfo; cdecl; external libchafa;
function chafa_term_db_get_fallback_info(term_db: PChafaTermDb): PChafaTermInfo; cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:32:29 ===


implementation



end.
