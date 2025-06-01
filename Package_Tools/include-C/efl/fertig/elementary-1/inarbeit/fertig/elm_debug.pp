
unit elm_debug;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_debug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_debug.h
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
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Elm_Debug Debug
 * @ingroup Elementary
 * Don't use it unless you are sure.
 *
 * @
  }
{*
 * Print Tree object hierarchy in stdout
 *
 * @param top The root object
 * @ingroup Elm_Debug
  }
(* Const before type ignored *)

procedure elm_object_tree_dump(top:PEvas_Object);cdecl;external;
{*
 * Print Elm Objects tree hierarchy in file as dot(graphviz) syntax.
 *
 * @param top The root object
 * @param file The path of output file
 * @ingroup Elm_Debug
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_object_tree_dot_dump(top:PEvas_Object; file:Pchar);cdecl;external;
{*
 * @
  }

implementation


end.
