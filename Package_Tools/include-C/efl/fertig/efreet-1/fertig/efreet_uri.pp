
unit efreet_uri;
interface

{
  Automatically converted by H2Pas 1.0.0 from efreet_uri.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efreet_uri.h
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
PEfreet_Uri  = ^Efreet_Uri;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_URI_H}
{$define EFREET_URI_H}
{*
 * @file efreet_uri.h
 * @brief Contains the methods used to support the FDO URI specification.
 * @addtogroup Efreet_Uri Efreet_Uri: The FDO URI Specification functions
 * @ingroup Efreet
 * @
  }
{*
 * Efreet_Uri
  }
type
{*
 * Efreet_Uri
 * @brief Contains a simple rappresentation of an uri. The string don't have
 * special chars escaped.
  }
(* Const before type ignored *)
{*< The protocol used (usually 'file') }
(* Const before type ignored *)
{*< The name of the host if any, or NULL  }
(* Const before type ignored *)
{*< The full file path whitout protocol nor host }
  PEfreet_Uri = ^TEfreet_Uri;
  TEfreet_Uri = record
      protocol : Pchar;
      hostname : Pchar;
      path : Pchar;
    end;

{*
 * @param uri Create an URI string from an Efreet_Uri struct
 * @return The string rapresentation of uri (ex: 'file:///home/my%20name')
 * @brief Get the string rapresentation of the given uri struct escaping
 * illegal caracters. Remember to free the string with eina_stringshare_del()
 * when you don't need it anymore.
 * @note The resulting string will contain the protocol and the path but not
 * the hostname, as many apps doesn't handle it.
  }
(* Const before type ignored *)

function efreet_uri_encode(uri:PEfreet_Uri):Pchar;cdecl;external;
{*
 * @param val a valid uri string to parse
 * @return Return The corresponding Efreet_Uri structure. Or NULL on errors.
 * @brief Read a single uri and return an Efreet_Uri struct. If there's no
 * hostname in the uri then the hostname parameter will be NULL. All the uri
 * escaped chars will be converted to normal.
  }
(* Const before type ignored *)
function efreet_uri_decode(val:Pchar):PEfreet_Uri;cdecl;external;
{*
 * @param uri The uri to free
 * @brief Free the given uri structure.
  }
procedure efreet_uri_free(uri:PEfreet_Uri);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
