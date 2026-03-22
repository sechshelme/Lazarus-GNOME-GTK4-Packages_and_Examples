
unit sokol_log;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_log.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Plug this function into the 'logger.func' struct item when initializing any of the sokol
    headers. For instance for sokol_audio.h it would look like this:

    saudio_setup(&(saudio_desc)
        .logger = 
            .func = slog_func
        
    );
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure slog_func(tag:Pchar; log_level:Tuint32_t; log_item:Tuint32_t; message:Pchar; line_nr:Tuint32_t; 
            filename:Pchar; user_data:pointer);cdecl;external;

implementation


end.
