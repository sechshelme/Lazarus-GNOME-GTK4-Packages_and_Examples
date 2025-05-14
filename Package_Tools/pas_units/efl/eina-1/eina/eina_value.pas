unit eina_value;

interface

uses
  ctypes, efl, eina_types, eina_error, eina_inarray, eina_hash;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  TEina_Value_Union = record
      case longint of
        0 : ( buf : array[0..7] of byte );
        1 : ( ptr : pointer );
        2 : ( _guarantee : uint64 );
      end;
  PEina_Value_Union = ^TEina_Value_Union;

type
  PEina_Value_Type = ^TEina_Value_Type;
  TEina_Value_Type = record
      version : dword;
      value_size : dword;
      name : Pchar;
      setup : function (_type:PEina_Value_Type; mem:pointer):TEina_Bool;cdecl;
      flush : function (_type:PEina_Value_Type; mem:pointer):TEina_Bool;cdecl;
      copy : function (_type:PEina_Value_Type; src:pointer; dst:pointer):TEina_Bool;cdecl;
      compare : function (_type:PEina_Value_Type; a:pointer; b:pointer):longint;cdecl;
      convert_to : function (_type:PEina_Value_Type; convert:PEina_Value_Type; type_mem:pointer; convert_mem:pointer):TEina_Bool;cdecl;
      convert_from : function (_type:PEina_Value_Type; convert:PEina_Value_Type; type_mem:pointer; convert_mem:pointer):TEina_Bool;cdecl;
      vset : function (_type:PEina_Value_Type; mem:pointer; args:Tva_list):TEina_Bool;cdecl;
      pset : function (_type:PEina_Value_Type; mem:pointer; ptr:pointer):TEina_Bool;cdecl;
      pget : function (_type:PEina_Value_Type; mem:pointer; ptr:pointer):TEina_Bool;cdecl;
    end;

  var
    EINA_VALUE_TYPE_ERROR : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_VALUE : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_UCHAR : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_BOOL : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_USHORT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_UINT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_ULONG : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_TIMESTAMP : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_UINT64 : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_CHAR : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_SHORT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_INT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_LONG : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_INT64 : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_FLOAT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_DOUBLE : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_STRINGSHARE : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_STRING : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_ARRAY : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_LIST : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_HASH : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_TIMEVAL : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_BLOB : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_STRUCT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_TM : PEina_Value_Type;cvar;external libeina;
    EINA_ERROR_VALUE_FAILED : TEina_Error;cvar;external libeina;
type
  TEina_Value = record
      _type : PEina_Value_Type;
      value : TEina_Value_Union;
    end;
  PEina_Value = ^TEina_Value;

function eina_value_new(_type:PEina_Value_Type):PEina_Value;cdecl;external libeina;
procedure eina_value_free(value:PEina_Value);cdecl;external libeina;
function eina_value_copy(value:PEina_Value; copy:PEina_Value):TEina_Bool;cdecl;external libeina;
type
  PEina_Value_Array = ^TEina_Value_Array;
  TEina_Value_Array = record
      subtype : PEina_Value_Type;
      step : dword;
      arr : PEina_Inarray;
    end;


function eina_value_array_new(subtype:PEina_Value_Type; step:dword):PEina_Value;cdecl;external libeina;
type
  TEina_Value_List = record
      subtype : PEina_Value_Type;
      list : PEina_List;
    end;
  PEina_Value_List = ^TEina_Value_List;

function eina_value_list_new(subtype:PEina_Value_Type):PEina_Value;cdecl;external libeina;
type
  TEina_Value_Hash = record
      subtype : PEina_Value_Type;
      buckets_power_size : dword;
      hash : PEina_Hash;
    end;
  PEina_Value_Hash = ^TEina_Value_Hash;

function eina_value_hash_new(subtype:PEina_Value_Type; buckets_power_size:dword):PEina_Value;cdecl;external libeina;
const
  EINA_VALUE_BLOB_OPERATIONS_VERSION = 1;  
type
  PEina_Value_Blob_Operations = ^TEina_Value_Blob_Operations;
  TEina_Value_Blob_Operations = record
      version : dword;
      free : procedure (ops:PEina_Value_Blob_Operations; memory:pointer; size:Tsize_t);cdecl;
      copy : function (ops:PEina_Value_Blob_Operations; memory:pointer; size:Tsize_t):pointer;cdecl;
      compare : function (ops:PEina_Value_Blob_Operations; data1:pointer; size_data1:Tsize_t; data2:pointer; size_data2:Tsize_t):longint;cdecl;
      to_string : function (ops:PEina_Value_Blob_Operations; memory:pointer; size:Tsize_t):Pchar;cdecl;
    end;

  var
    EINA_VALUE_BLOB_OPERATIONS_MALLOC : PEina_Value_Blob_Operations;cvar;external libeina;
type
  TEina_Value_Blob = record
      ops : PEina_Value_Blob_Operations;
      memory : pointer;
      size : dword;
    end;
  PEina_Value_Blob = ^TEina_Value_Blob;

const
  EINA_VALUE_STRUCT_DESC_VERSION = 1;
  EINA_VALUE_STRUCT_OPERATIONS_VERSION = 1;
type
  PEina_Value_Struct_Operations = ^TEina_Value_Struct_Operations;
  PEina_Value_Struct_Desc = ^TEina_Value_Struct_Desc;
  PEina_Value_Struct = ^TEina_Value_Struct;

  TEina_Value_Struct_Member = record
      name : Pchar;
      _type : PEina_Value_Type;
      offset : dword;
    end;
  PEina_Value_Struct_Member = ^TEina_Value_Struct_Member;

  TEina_Value_Struct_Desc = record
      version : dword;
      ops : PEina_Value_Struct_Operations;
      members : PEina_Value_Struct_Member;
      member_count : dword;
      size : dword;
    end;

  TEina_Value_Struct = record
      desc : PEina_Value_Struct_Desc;
      memory : pointer;
    end;

  TEina_Value_Struct_Operations = record
      version : dword;
      alloc : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc):pointer;cdecl;
      free : procedure (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; memory:pointer);cdecl;
      copy : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; memory:pointer):pointer;cdecl;
      compare : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; data1:pointer; data2:pointer):longint;cdecl;
      find_member : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; name:Pchar):PEina_Value_Struct_Member;cdecl;
    end;

  var
    EINA_VALUE_STRUCT_OPERATIONS_BINSEARCH : PEina_Value_Struct_Operations;cvar;external libeina;
    EINA_VALUE_STRUCT_OPERATIONS_STRINGSHARE : PEina_Value_Struct_Operations;cvar;external libeina;

function eina_value_struct_new(desc:PEina_Value_Struct_Desc):PEina_Value;cdecl;external libeina;
const
  EINA_VALUE_TYPE_VERSION = 1;  
function eina_value_type_name_get(_type:PEina_Value_Type):Pchar;cdecl;external libeina;
function eina_value_type_check(_type:PEina_Value_Type):TEina_Bool;cdecl;external libeina;
  var
    EINA_VALUE_TYPE_OPTIONAL : PEina_Value_Type;cvar;external libeina;
type
  PEina_Value_Optional = ^TEina_Value_Optional;
  TEina_Value_Optional = TEina_Value_Union;

function eina_value_optional_new(subtype:PEina_Value_Type; value:pointer):PEina_Value;cdecl;external libeina;
function eina_value_optional_pset(value:PEina_Value; subtype:PEina_Value_Type; subvalue:pointer):TEina_Bool;cdecl;external libeina;
function eina_value_optional_pget(value:PEina_Value; subvalue:pointer):TEina_Bool;cdecl;external libeina;
function eina_value_optional_reset(value:PEina_Value):TEina_Bool;cdecl;external libeina;
  var
    EINA_VALUE_TYPE_FILE : PEina_Value_Type;cvar;external libeina;

// === Konventiert am: 14-5-25 17:50:53 ===


implementation



end.
