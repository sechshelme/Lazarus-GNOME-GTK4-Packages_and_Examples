unit gioerror;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function g_io_error_quark: TGQuark; cdecl; external libgio2;
function g_io_error_from_errno(err_no: Tgint): TGIOErrorEnum; cdecl; external libgio2;
function g_io_error_from_file_error(file_error: TGFileError): TGIOErrorEnum; cdecl; external libgio2;

{$ifdef windows}
function g_io_error_from_win32_error(error_code: Tgint): TGIOErrorEnum; cdecl; external libgio2;
{$endif}

function G_IO_ERROR: TGQuark;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 19:34:38 ===


implementation


function G_IO_ERROR: TGQuark;
begin
  G_IO_ERROR := g_io_error_quark;
end;


end.
