
unit emotion_api;
interface

{
  Automatically converted by H2Pas 1.0.0 from emotion_api.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    emotion_api.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_EMOTION_API_H}
{$define _EFL_EMOTION_API_H}
{$ifdef EMOTION_API}
{$error EMOTION_API should not be already defined}
{$endif}
{$ifdef _WIN32}
{$ifndef EMOTION_STATIC}
{$ifdef EMOTION_BUILD}

{ was #define dname def_expr }
function EMOTION_API : longint; { return type might be wrong }

{$else}

{ was #define dname def_expr }
function EMOTION_API : longint; { return type might be wrong }

{$endif}
{$else}
{$define EMOTION_API}
{$endif}
{$define EMOTION_API_WEAK}
(*** was #elif ****){$else defined(__GNUC__)}
{$if __GNUC__ >= 4}

{ was #define dname def_expr }
function EMOTION_API : longint; { return type might be wrong }

{ was #define dname def_expr }
function EMOTION_API_WEAK : longint; { return type might be wrong }

{$else}
{$define EMOTION_API}
{$define EMOTION_API_WEAK}
{$endif}
{$else}
{$define EMOTION_API}
{$define EMOTION_API_WEAK}
{$endif}
{$endif}

implementation

{ was #define dname def_expr }
function EMOTION_API : longint; { return type might be wrong }
  begin
    EMOTION_API:=__declspec(dllexport);
  end;

{ was #define dname def_expr }
function EMOTION_API : longint; { return type might be wrong }
  begin
    EMOTION_API:=__declspec(dllimport);
  end;

{ was #define dname def_expr }
function EMOTION_API : longint; { return type might be wrong }
  begin
    EMOTION_API:=__attribute__(visibility('default'));
  end;

{ was #define dname def_expr }
function EMOTION_API_WEAK : longint; { return type might be wrong }
  begin
    EMOTION_API_WEAK:=__attribute__(weak);
  end;


end.
