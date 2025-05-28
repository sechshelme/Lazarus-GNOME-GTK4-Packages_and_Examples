{$IFDEF read_interface}


type
  TElm_Code_Token = record
      start : longint;
      end_ : longint;
      continues : TEina_Bool;
      _type : TElm_Code_Token_Type;
    end;
  PElm_Code_Token = ^TElm_Code_Token;

  TElm_Code_Line = record
      file_ : PElm_Code_File;
      content : Pchar;
      length : dword;
      number : dword;
      modified : Pchar;
      status : TElm_Code_Status_Type;
      tokens : PEina_List;
      scope : dword;
      data : pointer;
      status_text : Pchar;
    end;
  PElm_Code_Line = ^TElm_Code_Line;

procedure elm_code_line_free(line:PElm_Code_Line);cdecl;external libelementary;
procedure elm_code_line_split_at(line:PElm_Code_Line; position:dword);cdecl;external libelementary;
procedure elm_code_line_merge_up(line:PElm_Code_Line);cdecl;external libelementary;
procedure elm_code_line_merge_down(line:PElm_Code_Line);cdecl;external libelementary;
procedure elm_code_line_status_set(line:PElm_Code_Line; status:TElm_Code_Status_Type);cdecl;external libelementary;
procedure elm_code_line_status_text_set(line:PElm_Code_Line; text:Pchar);cdecl;external libelementary;
procedure elm_code_line_status_clear(line:PElm_Code_Line);cdecl;external libelementary;
procedure elm_code_line_token_add(line:PElm_Code_Line; start:longint; end_:longint; lines:longint; _type:TElm_Code_Token_Type);cdecl;external libelementary;
procedure elm_code_line_tokens_clear(line:PElm_Code_Line);cdecl;external libelementary;
function elm_code_line_scope_get(line:PElm_Code_Line):dword;cdecl;external libelementary;
function elm_code_line_contains_widget_cursor(line:PElm_Code_Line):TEina_Bool;cdecl;external libelementary;

// === Konventiert am: 26-5-25 13:52:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
