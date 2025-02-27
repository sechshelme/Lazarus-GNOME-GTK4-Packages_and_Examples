
unit xmlIO;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlIO.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlIO.h
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
PFILE  = ^FILE;
PxmlChar  = ^xmlChar;
PxmlInputOpenCallback  = ^xmlInputOpenCallback;
PxmlOutputBuffer  = ^xmlOutputBuffer;
PxmlOutputOpenCallback  = ^xmlOutputOpenCallback;
PxmlParserInputBuffer  = ^xmlParserInputBuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: interface for the I/O interfaces used by the parser
 * Description: interface for the I/O interfaces used by the parser
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_IO_H__}
{$define __XML_IO_H__}
{$include <stdio.h>}
{$include <libxml/xmlversion.h>}
{ C++ extern C conditionnal removed }
{
 * Those are the functions and datatypes for the parser input
 * I/O structures.
  }
{*
 * xmlInputMatchCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Input API to detect if the current handler
 * can provide input functionality for this resource.
 *
 * Returns 1 if yes and 0 if another Input module should be used
  }
(* Const before declarator ignored *)
type

  TxmlInputMatchCallback = function (filename:Pchar):longint;cdecl;
{*
 * xmlInputOpenCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Input API to open the resource
 *
 * Returns an Input context or NULL in case or error
  }
(* Const before declarator ignored *)

  PxmlInputOpenCallback = ^TxmlInputOpenCallback;
  TxmlInputOpenCallback = function (filename:Pchar):pointer;cdecl;
{*
 * xmlInputReadCallback:
 * @context:  an Input context
 * @buffer:  the buffer to store data read
 * @len:  the length of the buffer in bytes
 *
 * Callback used in the I/O Input API to read the resource
 *
 * Returns the number of bytes read or -1 in case of error
  }

  TxmlInputReadCallback = function (context:pointer; buffer:Pchar; len:longint):longint;cdecl;
{*
 * xmlInputCloseCallback:
 * @context:  an Input context
 *
 * Callback used in the I/O Input API to close the resource
 *
 * Returns 0 or -1 in case of error
  }

  TxmlInputCloseCallback = function (context:pointer):longint;cdecl;
{$ifdef LIBXML_OUTPUT_ENABLED}
{
 * Those are the functions and datatypes for the library output
 * I/O structures.
  }
{*
 * xmlOutputMatchCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Output API to detect if the current handler
 * can provide output functionality for this resource.
 *
 * Returns 1 if yes and 0 if another Output module should be used
  }
(* Const before declarator ignored *)

  TxmlOutputMatchCallback = function (filename:Pchar):longint;cdecl;
{*
 * xmlOutputOpenCallback:
 * @filename: the filename or URI
 *
 * Callback used in the I/O Output API to open the resource
 *
 * Returns an Output context or NULL in case or error
  }
(* Const before declarator ignored *)

  PxmlOutputOpenCallback = ^TxmlOutputOpenCallback;
  TxmlOutputOpenCallback = function (filename:Pchar):pointer;cdecl;
{*
 * xmlOutputWriteCallback:
 * @context:  an Output context
 * @buffer:  the buffer of data to write
 * @len:  the length of the buffer in bytes
 *
 * Callback used in the I/O Output API to write to the resource
 *
 * Returns the number of bytes written or -1 in case of error
  }
(* Const before type ignored *)

  TxmlOutputWriteCallback = function (context:pointer; buffer:Pchar; len:longint):longint;cdecl;
{*
 * xmlOutputCloseCallback:
 * @context:  an Output context
 *
 * Callback used in the I/O Output API to close the resource
 *
 * Returns 0 or -1 in case of error
  }

  TxmlOutputCloseCallback = function (context:pointer):longint;cdecl;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$include <libxml/globals.h>}
{$include <libxml/tree.h>}
{$include <libxml/parser.h>}
{$include <libxml/encoding.h>}
{ C++ extern C conditionnal removed }
{ I18N conversions to UTF-8  }
{ Local buffer encoded in UTF-8  }
{ if encoder != NULL buffer for raw input  }
{ -1=unknown, 0=not compressed, 1=compressed  }
{ amount consumed from raw  }
type
  PxmlParserInputBuffer = ^TxmlParserInputBuffer;
  TxmlParserInputBuffer = record
      context : pointer;cdecl;
      readcallback : TxmlInputReadCallback;
      closecallback : TxmlInputCloseCallback;
      encoder : TxmlCharEncodingHandlerPtr;
      buffer : TxmlBufPtr;
      raw : TxmlBufPtr;
      compressed : longint;
      error : longint;
      rawconsumed : dword;
    end;

{$ifdef LIBXML_OUTPUT_ENABLED}
{ I18N conversions to UTF-8  }
{ Local buffer encoded in UTF-8 or ISOLatin  }
{ if encoder != NULL buffer for output  }
{ total number of byte written  }
  PxmlOutputBuffer = ^TxmlOutputBuffer;
  TxmlOutputBuffer = record
      context : pointer;
      writecallback : TxmlOutputWriteCallback;
      closecallback : TxmlOutputCloseCallback;
      encoder : TxmlCharEncodingHandlerPtr;
      buffer : TxmlBufPtr;
      conv : TxmlBufPtr;
      written : longint;
      error : longint;
    end;

{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{
 * Interfaces for input
  }

procedure xmlCleanupInputCallbacks;cdecl;external;
function xmlPopInputCallbacks:longint;cdecl;external;
procedure xmlRegisterDefaultInputCallbacks;cdecl;external;
function xmlAllocParserInputBuffer(enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
(* Const before type ignored *)
function xmlParserInputBufferCreateFilename(URI:Pchar; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
function xmlParserInputBufferCreateFile(file:PFILE; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
function xmlParserInputBufferCreateFd(fd:longint; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
(* Const before type ignored *)
function xmlParserInputBufferCreateMem(mem:Pchar; size:longint; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
(* Const before type ignored *)
function xmlParserInputBufferCreateStatic(mem:Pchar; size:longint; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
function xmlParserInputBufferCreateIO(ioread:TxmlInputReadCallback; ioclose:TxmlInputCloseCallback; ioctx:pointer; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
function xmlParserInputBufferRead(in:TxmlParserInputBufferPtr; len:longint):longint;cdecl;external;
function xmlParserInputBufferGrow(in:TxmlParserInputBufferPtr; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlParserInputBufferPush(in:TxmlParserInputBufferPtr; len:longint; buf:Pchar):longint;cdecl;external;
procedure xmlFreeParserInputBuffer(in:TxmlParserInputBufferPtr);cdecl;external;
(* Const before type ignored *)
function xmlParserGetDirectory(filename:Pchar):Pchar;cdecl;external;
function xmlRegisterInputCallbacks(matchFunc:TxmlInputMatchCallback; openFunc:TxmlInputOpenCallback; readFunc:TxmlInputReadCallback; closeFunc:TxmlInputCloseCallback):longint;cdecl;external;
(* Const before type ignored *)
function __xmlParserInputBufferCreateFilename(URI:Pchar; enc:TxmlCharEncoding):TxmlParserInputBufferPtr;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
{
 * Interfaces for output
  }
procedure xmlCleanupOutputCallbacks;cdecl;external;
function xmlPopOutputCallbacks:longint;cdecl;external;
procedure xmlRegisterDefaultOutputCallbacks;cdecl;external;
function xmlAllocOutputBuffer(encoder:TxmlCharEncodingHandlerPtr):TxmlOutputBufferPtr;cdecl;external;
(* Const before type ignored *)
function xmlOutputBufferCreateFilename(URI:Pchar; encoder:TxmlCharEncodingHandlerPtr; compression:longint):TxmlOutputBufferPtr;cdecl;external;
function xmlOutputBufferCreateFile(file:PFILE; encoder:TxmlCharEncodingHandlerPtr):TxmlOutputBufferPtr;cdecl;external;
function xmlOutputBufferCreateBuffer(buffer:TxmlBufferPtr; encoder:TxmlCharEncodingHandlerPtr):TxmlOutputBufferPtr;cdecl;external;
function xmlOutputBufferCreateFd(fd:longint; encoder:TxmlCharEncodingHandlerPtr):TxmlOutputBufferPtr;cdecl;external;
function xmlOutputBufferCreateIO(iowrite:TxmlOutputWriteCallback; ioclose:TxmlOutputCloseCallback; ioctx:pointer; encoder:TxmlCharEncodingHandlerPtr):TxmlOutputBufferPtr;cdecl;external;
{ Couple of APIs to get the output without digging into the buffers  }
(* Const before type ignored *)
function xmlOutputBufferGetContent(out:TxmlOutputBufferPtr):PxmlChar;cdecl;external;
function xmlOutputBufferGetSize(out:TxmlOutputBufferPtr):Tsize_t;cdecl;external;
(* Const before type ignored *)
function xmlOutputBufferWrite(out:TxmlOutputBufferPtr; len:longint; buf:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlOutputBufferWriteString(out:TxmlOutputBufferPtr; str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlOutputBufferWriteEscape(out:TxmlOutputBufferPtr; str:PxmlChar; escaping:TxmlCharEncodingOutputFunc):longint;cdecl;external;
function xmlOutputBufferFlush(out:TxmlOutputBufferPtr):longint;cdecl;external;
function xmlOutputBufferClose(out:TxmlOutputBufferPtr):longint;cdecl;external;
function xmlRegisterOutputCallbacks(matchFunc:TxmlOutputMatchCallback; openFunc:TxmlOutputOpenCallback; writeFunc:TxmlOutputWriteCallback; closeFunc:TxmlOutputCloseCallback):longint;cdecl;external;
(* Const before type ignored *)
function __xmlOutputBufferCreateFilename(URI:Pchar; encoder:TxmlCharEncodingHandlerPtr; compression:longint):TxmlOutputBufferPtr;cdecl;external;
{$ifdef LIBXML_HTTP_ENABLED}
{  This function only exists if HTTP support built into the library   }
procedure xmlRegisterHTTPPostCallbacks;cdecl;external;
{$endif}
{ LIBXML_HTTP_ENABLED  }
{$endif}
{ LIBXML_OUTPUT_ENABLED  }

function xmlCheckHTTPInput(ctxt:TxmlParserCtxtPtr; ret:TxmlParserInputPtr):TxmlParserInputPtr;cdecl;external;
{
 * A predefined entity loader disabling network accesses
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNoNetExternalEntityLoader(URL:Pchar; ID:Pchar; ctxt:TxmlParserCtxtPtr):TxmlParserInputPtr;cdecl;external;
{
 * xmlNormalizeWindowsPath is obsolete, don't use it.
 * Check xmlCanonicPath in uri.h for a better alternative.
  }
(* Const before type ignored *)
function xmlNormalizeWindowsPath(path:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCheckFilename(path:Pchar):longint;cdecl;external;
{*
 * Default 'file://' protocol callbacks
  }
(* Const before type ignored *)
function xmlFileMatch(filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlFileOpen(filename:Pchar):pointer;cdecl;external;
function xmlFileRead(context:pointer; buffer:Pchar; len:longint):longint;cdecl;external;
function xmlFileClose(context:pointer):longint;cdecl;external;
{*
 * Default 'http://' protocol callbacks
  }
{$ifdef LIBXML_HTTP_ENABLED}
(* Const before type ignored *)
function xmlIOHTTPMatch(filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlIOHTTPOpen(filename:Pchar):pointer;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
(* Const before type ignored *)
function xmlIOHTTPOpenW(post_uri:Pchar; compression:longint):pointer;cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }

function xmlIOHTTPRead(context:pointer; buffer:Pchar; len:longint):longint;cdecl;external;
function xmlIOHTTPClose(context:pointer):longint;cdecl;external;
{$endif}
{ LIBXML_HTTP_ENABLED  }
{*
 * Default 'ftp://' protocol callbacks
  }
{$ifdef LIBXML_FTP_ENABLED}
(* Const before type ignored *)

function xmlIOFTPMatch(filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlIOFTPOpen(filename:Pchar):pointer;cdecl;external;
function xmlIOFTPRead(context:pointer; buffer:Pchar; len:longint):longint;cdecl;external;
function xmlIOFTPClose(context:pointer):longint;cdecl;external;
{$endif}
{ LIBXML_FTP_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_IO_H__  }

implementation


end.
