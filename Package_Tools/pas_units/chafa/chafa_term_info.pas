unit chafa_term_info;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  CHAFA_TERM_SEQ_LENGTH_MAX = 96;
  CHAFA_TERM_SEQ_ARGS_MAX = 8;

type
  PChafaTermSeq = ^TChafaTermSeq;
  TChafaTermSeq = longint;

const
  CHAFA_TERM_SEQ_MAX = 0;

type
  TChafaTermInfo = record
  end;
  PChafaTermInfo = ^TChafaTermInfo;

type
  PChafaTermInfoError = ^TChafaTermInfoError;
  TChafaTermInfoError = longint;

const
  CHAFA_TERM_INFO_ERROR_SEQ_TOO_LONG = 0;
  CHAFA_TERM_INFO_ERROR_BAD_ESCAPE = 1;
  CHAFA_TERM_INFO_ERROR_BAD_ARGUMENTS = 2;

type
  PChafaParseResult = ^TChafaParseResult;
  TChafaParseResult = longint;

const
  CHAFA_PARSE_SUCCESS = 0;
  CHAFA_PARSE_FAILURE = 1;
  CHAFA_PARSE_AGAIN = 2;

function chafa_term_info_error_quark: TGQuark; cdecl; external libchafa;
function chafa_term_info_new: PChafaTermInfo; cdecl; external libchafa;
function chafa_term_info_copy(term_info: PChafaTermInfo): PChafaTermInfo; cdecl; external libchafa;
procedure chafa_term_info_ref(term_info: PChafaTermInfo); cdecl; external libchafa;
procedure chafa_term_info_unref(term_info: PChafaTermInfo); cdecl; external libchafa;
function chafa_term_info_get_seq(term_info: PChafaTermInfo; seq: TChafaTermSeq): Pgchar; cdecl; external libchafa;
function chafa_term_info_set_seq(term_info: PChafaTermInfo; seq: TChafaTermSeq; str: Pgchar; error: PPGError): Tgint; cdecl; external libchafa;
function chafa_term_info_have_seq(term_info: PChafaTermInfo; seq: TChafaTermSeq): Tgboolean; cdecl; external libchafa;
function chafa_term_info_emit_seq(term_info: PChafaTermInfo; seq: TChafaTermSeq; args: array of const): Pgchar; cdecl; external libchafa;
function chafa_term_info_emit_seq(term_info: PChafaTermInfo; seq: TChafaTermSeq): Pgchar; cdecl; external libchafa;
function chafa_term_info_parse_seq(term_info: PChafaTermInfo; seq: TChafaTermSeq; input: PPgchar; input_len: Pgint; args_out: Pguint): TChafaParseResult; cdecl; external libchafa;
procedure chafa_term_info_supplement(term_info: PChafaTermInfo; Source: PChafaTermInfo); cdecl; external libchafa;

function CHAFA_TERM_INFO_ERROR: TGQuark;

// === Konventiert am: 29-1-25 19:14:25 ===


implementation


function CHAFA_TERM_INFO_ERROR: TGQuark;
begin
  CHAFA_TERM_INFO_ERROR := chafa_term_info_error_quark;
end;


end.
