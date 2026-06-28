unit gfileattribute;

interface

uses
  fp_glib2, gioenums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PGFileAttributeInfo = ^TGFileAttributeInfo;
  TGFileAttributeInfo = record
      name : Pchar;
      _type : TGFileAttributeType;
      flags : TGFileAttributeInfoFlags;
    end;

  PGFileAttributeInfoList = ^TGFileAttributeInfoList;
  TGFileAttributeInfoList = record
      infos : PGFileAttributeInfo;
      n_infos : longint;
    end;

function g_file_attribute_info_list_get_type:TGType;cdecl;external libgio2;
function g_file_attribute_info_list_new:PGFileAttributeInfoList;cdecl;external libgio2;
function g_file_attribute_info_list_ref(list:PGFileAttributeInfoList):PGFileAttributeInfoList;cdecl;external libgio2;
procedure g_file_attribute_info_list_unref(list:PGFileAttributeInfoList);cdecl;external libgio2;
function g_file_attribute_info_list_dup(list:PGFileAttributeInfoList):PGFileAttributeInfoList;cdecl;external libgio2;
function g_file_attribute_info_list_lookup(list:PGFileAttributeInfoList; name:Pchar):PGFileAttributeInfo;cdecl;external libgio2;
procedure g_file_attribute_info_list_add(list:PGFileAttributeInfoList; name:Pchar; _type:TGFileAttributeType; flags:TGFileAttributeInfoFlags);cdecl;external libgio2;

// === Konventiert am: 26-6-26 19:22:30 ===

function G_TYPE_FILE_ATTRIBUTE_INFO_LIST : TGType;

implementation

function G_TYPE_FILE_ATTRIBUTE_INFO_LIST : TGType;
  begin
    G_TYPE_FILE_ATTRIBUTE_INFO_LIST:=g_file_attribute_info_list_get_type;
  end;



end.
