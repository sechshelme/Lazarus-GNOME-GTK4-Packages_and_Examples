unit hpdf_objects;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_objects.c
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_OBJECTS_H}
{$define _HPDF_OBJECTS_H}
{$include "hpdf_encoder.h"}
{ C++ extern C conditionnal removed }
{ if HPDF_OTYPE_DIRECT bit is set, the object owned by other container
 * object. if HPDF_OTYPE_INDIRECT bit is set, the object managed by xref.
  }

const
  HPDF_OTYPE_NONE = $00000000;  
  HPDF_OTYPE_DIRECT = $80000000;  
  HPDF_OTYPE_INDIRECT = $40000000;  
  HPDF_OTYPE_ANY = HPDF_OTYPE_DIRECT or HPDF_OTYPE_INDIRECT;  
  HPDF_OTYPE_HIDDEN = $10000000;  
  HPDF_OCLASS_UNKNOWN = $0001;  
  HPDF_OCLASS_NULL = $0002;  
  HPDF_OCLASS_BOOLEAN = $0003;  
  HPDF_OCLASS_NUMBER = $0004;  
  HPDF_OCLASS_REAL = $0005;  
  HPDF_OCLASS_NAME = $0006;  
  HPDF_OCLASS_STRING = $0007;  
  HPDF_OCLASS_BINARY = $0008;  
  HPDF_OCLASS_ARRAY = $0010;  
  HPDF_OCLASS_DICT = $0011;  
  HPDF_OCLASS_PROXY = $0012;  
  HPDF_OCLASS_DIRECT = $00A0;  
  HPDF_OCLASS_ANY = $00FF;  
  HPDF_OSUBCLASS_FONT = $0100;  
  HPDF_OSUBCLASS_CATALOG = $0200;  
  HPDF_OSUBCLASS_PAGES = $0300;  
  HPDF_OSUBCLASS_PAGE = $0400;  
  HPDF_OSUBCLASS_XOBJECT = $0500;  
  HPDF_OSUBCLASS_OUTLINE = $0600;  
  HPDF_OSUBCLASS_DESTINATION = $0700;  
  HPDF_OSUBCLASS_ANNOTATION = $0800;  
  HPDF_OSUBCLASS_ENCRYPT = $0900;  
  HPDF_OSUBCLASS_EXT_GSTATE = $0A00;  
{ read only object  }
  HPDF_OSUBCLASS_EXT_GSTATE_R = $0B00;  
  HPDF_OSUBCLASS_NAMEDICT = $0C00;  
  HPDF_OSUBCLASS_NAMETREE = $0D00;  
  HPDF_OSUBCLASS_SHADING = $0E00;  
{---------------------------------------------------------------------------- }
{------ Values related xref ------------------------------------------------- }
  HPDF_FREE_ENTRY = 'f';  
  HPDF_IN_USE_ENTRY = 'n';  
{
 *  structure of Object-ID
 *
 *  1       direct-object
 *  2       indirect-object
 *  3       reserved
 *  4       shadow-object
 *  5-8     reserved
 *  9-32    object-id
 *
 *  the real Object-ID is described "obj_id & 0x00FFFFFF"
  }
type
  PHPDF_Obj_Header = ^THPDF_Obj_Header;
  THPDF_Obj_Header = record
      obj_id : THPDF_UINT32;
      gen_no : THPDF_UINT16;
      obj_class : THPDF_UINT16;
    end;

function HPDF_Obj_WriteValue(obj:pointer; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Obj_Write(obj:pointer; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
procedure HPDF_Obj_Free(mmgr:THPDF_MMgr; obj:pointer);cdecl;external libhpdf;
procedure HPDF_Obj_ForceFree(mmgr:THPDF_MMgr; obj:pointer);cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Null ----------------------------------------------------------- }
type
  PHPDF_Null = ^THPDF_Null;
  THPDF_Null = PHPDF_Null_Rec;

  PHPDF_Null_Rec = ^THPDF_Null_Rec;
  THPDF_Null_Rec = record
      header : THPDF_Obj_Header;
    end;

function HPDF_Null_New(mmgr:THPDF_MMgr):THPDF_Null;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Boolean -------------------------------------------------------- }
type
  PHPDF_Boolean = ^THPDF_Boolean;
  THPDF_Boolean = PHPDF_Boolean_Rec;

  PHPDF_Boolean_Rec = ^THPDF_Boolean_Rec;
  THPDF_Boolean_Rec = record
      header : THPDF_Obj_Header;
      value : THPDF_BOOL;
    end;

function HPDF_Boolean_New(mmgr:THPDF_MMgr; value:THPDF_BOOL):THPDF_Boolean;cdecl;external libhpdf;
function HPDF_Boolean_Write(obj:THPDF_Boolean; stream:THPDF_Stream):THPDF_STATUS;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Number --------------------------------------------------------- }
type
  PHPDF_Number = ^THPDF_Number;
  THPDF_Number = PHPDF_Number_Rec;

  PHPDF_Number_Rec = ^THPDF_Number_Rec;
  THPDF_Number_Rec = record
      header : THPDF_Obj_Header;
      value : THPDF_INT32;
    end;

function HPDF_Number_New(mmgr:THPDF_MMgr; value:THPDF_INT32):THPDF_Number;cdecl;external libhpdf;
procedure HPDF_Number_SetValue(obj:THPDF_Number; value:THPDF_INT32);cdecl;external libhpdf;
function HPDF_Number_Write(obj:THPDF_Number; stream:THPDF_Stream):THPDF_STATUS;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Real ----------------------------------------------------------- }
type
  PHPDF_Real = ^THPDF_Real;
  THPDF_Real = PHPDF_Real_Rec;

  PHPDF_Real_Rec = ^THPDF_Real_Rec;
  THPDF_Real_Rec = record
      header : THPDF_Obj_Header;
      error : THPDF_Error;
      value : THPDF_REAL;
    end;

function HPDF_Real_New(mmgr:THPDF_MMgr; value:THPDF_REAL):THPDF_Real;cdecl;external libhpdf;
function HPDF_Real_Write(obj:THPDF_Real; stream:THPDF_Stream):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Real_SetValue(obj:THPDF_Real; value:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Name ----------------------------------------------------------- }
type
  PHPDF_Name = ^THPDF_Name;
  THPDF_Name = PHPDF_Name_Rec;

  PHPDF_Name_Rec = ^THPDF_Name_Rec;
  THPDF_Name_Rec = record
      header : THPDF_Obj_Header;
      error : THPDF_Error;
      value : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
    end;

function HPDF_Name_New(mmgr:THPDF_MMgr; value:Pchar):THPDF_Name;cdecl;external libhpdf;
function HPDF_Name_SetValue(obj:THPDF_Name; value:Pchar):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Name_Write(obj:THPDF_Name; stream:THPDF_Stream):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Name_GetValue(obj:THPDF_Name):Pchar;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_String --------------------------------------------------------- }
type
  PHPDF_String = ^THPDF_String;
  THPDF_String = PHPDF_String_Rec;

  PHPDF_String_Rec = ^THPDF_String_Rec;
  THPDF_String_Rec = record
      header : THPDF_Obj_Header;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      encoder : THPDF_Encoder;
      value : PHPDF_BYTE;
      len : THPDF_UINT;
    end;

function HPDF_String_New(mmgr:THPDF_MMgr; value:Pchar; encoder:THPDF_Encoder):THPDF_String;cdecl;external libhpdf;
function HPDF_String_SetValue(obj:THPDF_String; value:Pchar):THPDF_STATUS;cdecl;external libhpdf;
procedure HPDF_String_Free(obj:THPDF_String);cdecl;external libhpdf;
function HPDF_String_Write(obj:THPDF_String; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_String_Cmp(s1:THPDF_String; s2:THPDF_String):THPDF_INT32;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Binary --------------------------------------------------------- }
type
  PHPDF_Binary = ^THPDF_Binary;
  THPDF_Binary = PHPDF_Binary_Rec;

  PHPDF_Binary_Rec = ^THPDF_Binary_Rec;
  THPDF_Binary_Rec = record
      header : THPDF_Obj_Header;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      value : PHPDF_BYTE;
      len : THPDF_UINT;
    end;

function HPDF_Binary_New(mmgr:THPDF_MMgr; value:PHPDF_BYTE; len:THPDF_UINT):THPDF_Binary;cdecl;external libhpdf;
function HPDF_Binary_SetValue(obj:THPDF_Binary; value:PHPDF_BYTE; len:THPDF_UINT):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Binary_GetValue(obj:THPDF_Binary):PHPDF_BYTE;cdecl;external libhpdf;
procedure HPDF_Binary_Free(obj:THPDF_Binary);cdecl;external libhpdf;
function HPDF_Binary_Write(obj:THPDF_Binary; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Binary_GetLen(obj:THPDF_Binary):THPDF_UINT;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Array ---------------------------------------------------------- }
type
  PHPDF_Array = ^THPDF_Array;
  THPDF_Array = PHPDF_Array_Rec;

  PHPDF_Array_Rec = ^THPDF_Array_Rec;
  THPDF_Array_Rec = record
      header : THPDF_Obj_Header;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      list : THPDF_List;
    end;

function HPDF_Array_New(mmgr:THPDF_MMgr):THPDF_Array;cdecl;external libhpdf;
function HPDF_Box_Array_New(mmgr:THPDF_MMgr; box:THPDF_Box):THPDF_Array;cdecl;external libhpdf;
procedure HPDF_Array_Free(array:THPDF_Array);cdecl;external libhpdf;
function HPDF_Array_Write(array:THPDF_Array; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Array_Add(array:THPDF_Array; obj:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Array_Insert(array:THPDF_Array; target:pointer; obj:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Array_GetItem(array:THPDF_Array; index:THPDF_UINT; obj_class:THPDF_UINT16):pointer;cdecl;external libhpdf;
function HPDF_Array_AddNumber(array:THPDF_Array; value:THPDF_INT32):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Array_AddReal(array:THPDF_Array; value:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Array_AddNull(array:THPDF_Array):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Array_AddName(array:THPDF_Array; value:Pchar):THPDF_STATUS;cdecl;external libhpdf;
procedure HPDF_Array_Clear(array:THPDF_Array);cdecl;external libhpdf;
function HPDF_Array_Items(array:THPDF_Array):THPDF_UINT;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Dict ----------------------------------------------------------- }
type
  PHPDF_Xref = ^THPDF_Xref;
  THPDF_Xref = PHPDF_Xref_Rec;

  PHPDF_Dict = ^THPDF_Dict;
  THPDF_Dict = PHPDF_Dict_Rec;

  THPDF_Dict_FreeFunc = procedure (obj:THPDF_Dict);cdecl;

  THPDF_Dict_BeforeWriteFunc = function (obj:THPDF_Dict):THPDF_STATUS;cdecl;

  THPDF_Dict_AfterWriteFunc = function (obj:THPDF_Dict):THPDF_STATUS;cdecl;

  THPDF_Dict_OnWriteFunc = function (obj:THPDF_Dict; stream:THPDF_Stream):THPDF_STATUS;cdecl;

  PHPDF_Dict_Rec = ^THPDF_Dict_Rec;
  THPDF_Dict_Rec = record
      header : THPDF_Obj_Header;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      list : THPDF_List;
      before_write_fn : THPDF_Dict_BeforeWriteFunc;
      write_fn : THPDF_Dict_OnWriteFunc;
      after_write_fn : THPDF_Dict_AfterWriteFunc;
      free_fn : THPDF_Dict_FreeFunc;
      stream : THPDF_Stream;
      filter : THPDF_UINT;
      filterParams : THPDF_Dict;
      attr : pointer;
    end;

  PHPDF_DictElement = ^THPDF_DictElement;
  THPDF_DictElement = PHPDF_DictElement_Rec;

  PHPDF_DictElement_Rec = ^THPDF_DictElement_Rec;
  THPDF_DictElement_Rec = record
      key : array[0..(HPDF_LIMIT_MAX_NAME_LEN+1)-1] of char;
      value : pointer;
    end;

function HPDF_Dict_New(mmgr:THPDF_MMgr):THPDF_Dict;cdecl;external libhpdf;
function HPDF_DictStream_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_Dict;cdecl;external libhpdf;
procedure HPDF_Dict_Free(dict:THPDF_Dict);cdecl;external libhpdf;
function HPDF_Dict_Write(dict:THPDF_Dict; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Dict_GetKeyByObj(dict:THPDF_Dict; obj:pointer):Pchar;cdecl;external libhpdf;
function HPDF_Dict_Add(dict:THPDF_Dict; key:Pchar; obj:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Dict_GetItem(dict:THPDF_Dict; key:Pchar; obj_class:THPDF_UINT16):pointer;cdecl;external libhpdf;
function HPDF_Dict_AddName(dict:THPDF_Dict; key:Pchar; value:Pchar):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Dict_AddNumber(dict:THPDF_Dict; key:Pchar; value:THPDF_INT32):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Dict_AddReal(dict:THPDF_Dict; key:Pchar; value:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Dict_AddBoolean(dict:THPDF_Dict; key:Pchar; value:THPDF_BOOL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Dict_RemoveElement(dict:THPDF_Dict; key:Pchar):THPDF_STATUS;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_ProxyObject ---------------------------------------------------- }
type
  PHPDF_Proxy = ^THPDF_Proxy;
  THPDF_Proxy = PHPDF_Proxy_Rec;

  PHPDF_Proxy_Rec = ^THPDF_Proxy_Rec;
  THPDF_Proxy_Rec = record
      header : THPDF_Obj_Header;
      obj : pointer;
    end;

function HPDF_Proxy_New(mmgr:THPDF_MMgr; obj:pointer):THPDF_Proxy;cdecl;external libhpdf;
{--------------------------------------------------------------------------- }
{----- HPDF_Xref ----------------------------------------------------------- }
type
  PHPDF_XrefEntry = ^THPDF_XrefEntry;
  THPDF_XrefEntry = PHPDF_XrefEntry_Rec;

  PHPDF_XrefEntry_Rec = ^THPDF_XrefEntry_Rec;
  THPDF_XrefEntry_Rec = record
      entry_typ : char;
      byte_offset : THPDF_UINT;
      gen_no : THPDF_UINT16;
      obj : pointer;
    end;

  PHPDF_Xref_Rec = ^THPDF_Xref_Rec;
  THPDF_Xref_Rec = record
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      start_offset : THPDF_UINT32;
      entries : THPDF_List;
      addr : THPDF_UINT;
      prev : THPDF_Xref;
      trailer : THPDF_Dict;
    end;

function HPDF_Xref_New(mmgr:THPDF_MMgr; offset:THPDF_UINT32):THPDF_Xref;cdecl;external libhpdf;
procedure HPDF_Xref_Free(xref:THPDF_Xref);cdecl;external libhpdf;
function HPDF_Xref_Add(xref:THPDF_Xref; obj:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Xref_GetEntry(xref:THPDF_Xref; index:THPDF_UINT):THPDF_XrefEntry;cdecl;external libhpdf;
function HPDF_Xref_WriteToStream(xref:THPDF_Xref; stream:THPDF_Stream; e:THPDF_Encrypt):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_Xref_GetEntryByObjectId(xref:THPDF_Xref; obj_id:THPDF_UINT):THPDF_XrefEntry;cdecl;external libhpdf;
type
  PHPDF_EmbeddedFile = ^THPDF_EmbeddedFile;
  THPDF_EmbeddedFile = THPDF_Dict;

  PHPDF_NameDict = ^THPDF_NameDict;
  THPDF_NameDict = THPDF_Dict;

  PHPDF_NameTree = ^THPDF_NameTree;
  THPDF_NameTree = THPDF_Dict;

  PHPDF_Pages = ^THPDF_Pages;
  THPDF_Pages = THPDF_Dict;

  PHPDF_Page = ^THPDF_Page;
  THPDF_Page = THPDF_Dict;

  PHPDF_Annotation = ^THPDF_Annotation;
  THPDF_Annotation = THPDF_Dict;

  PHPDF_3DMeasure = ^THPDF_3DMeasure;
  THPDF_3DMeasure = THPDF_Dict;

  PHPDF_ExData = ^THPDF_ExData;
  THPDF_ExData = THPDF_Dict;

  PHPDF_XObject = ^THPDF_XObject;
  THPDF_XObject = THPDF_Dict;

  PHPDF_Image = ^THPDF_Image;
  THPDF_Image = THPDF_Dict;

  PHPDF_Outline = ^THPDF_Outline;
  THPDF_Outline = THPDF_Dict;

  PHPDF_EncryptDict = ^THPDF_EncryptDict;
  THPDF_EncryptDict = THPDF_Dict;

  PHPDF_Action = ^THPDF_Action;
  THPDF_Action = THPDF_Dict;

  PHPDF_ExtGState = ^THPDF_ExtGState;
  THPDF_ExtGState = THPDF_Dict;

  PHPDF_Destination = ^THPDF_Destination;
  THPDF_Destination = THPDF_Array;

  PHPDF_U3D = ^THPDF_U3D;
  THPDF_U3D = THPDF_Dict;

  PHPDF_OutputIntent = ^THPDF_OutputIntent;
  THPDF_OutputIntent = THPDF_Dict;

  PHPDF_JavaScript = ^THPDF_JavaScript;
  THPDF_JavaScript = THPDF_Dict;

  PHPDF_Shading = ^THPDF_Shading;
  THPDF_Shading = THPDF_Dict;
{--------------------------------------------------------------------------- }
{----- HPDF_Direct --------------------------------------------------------- }

  PHPDF_Direct = ^THPDF_Direct;
  THPDF_Direct = PHPDF_Direct_Rec;

  PHPDF_Direct_Rec = ^THPDF_Direct_Rec;
  THPDF_Direct_Rec = record
      header : THPDF_Obj_Header;
      mmgr : THPDF_MMgr;
      error : THPDF_Error;
      value : PHPDF_BYTE;
      len : THPDF_UINT;
    end;

function HPDF_Direct_New(mmgr:THPDF_MMgr; value:PHPDF_BYTE; len:THPDF_UINT):THPDF_Direct;cdecl;external libhpdf;
function HPDF_Direct_SetValue(obj:THPDF_Direct; value:PHPDF_BYTE; len:THPDF_UINT):THPDF_STATUS;cdecl;external libhpdf;
procedure HPDF_Direct_Free(obj:THPDF_Direct);cdecl;external libhpdf;
function HPDF_Direct_Write(obj:THPDF_Direct; stream:THPDF_Stream):THPDF_STATUS;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_OBJECTS_H  }

// === Konventiert am: 28-1-26 14:09:34 ===


implementation



end.
