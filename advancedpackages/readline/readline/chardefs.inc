{$IFDEF read_interface}



function whitespace(klass : longint) : longint;

const
  control_character_threshold = $020;  
  control_character_mask = $1f;
  meta_character_threshold = $07f;
  control_character_bit = $40;
  meta_character_bit = $080;
  largest_char = 255;

function CTRL_CHAR(klass : longint) : longint;
function META_CHAR(klass : longint) : longint;
function CTRL(klass : longint) : Tc;
function META(klass : longint) : longint;
function UNMETA(klass : longint) : Tc;
function UNCTRL(klass : longint) : longint;

const
  UCHAR_MAX = 255;  
  CHAR_MAX = 127;

function IN_CTYPE_DOMAIN(klass : longint) : longint;
function NON_NEGATIVE(klass : longint) : longint;
function IN_CTYPE_DOMAIN(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(klass : longint) : longint;

{$endif}
{$if !defined (isxdigit) && !defined (HAVE_ISXDIGIT) && !defined (__cplusplus)}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function isxdigit(klass : longint) : longint;

{$endif}
{ Some systems define these; we want our definitions.  }
{$undef ISPRINT}
{ Beware:  these only work with single-byte ASCII characters.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ISALNUM(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISALPHA(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISDIGIT(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISLOWER(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISPRINT(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISUPPER(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISXDIGIT(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_lowercase_p(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_uppercase_p(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_digit_p(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_alphabetic_p(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_pure_alphabetic(klass : longint) : longint;

{$ifndef _rl_to_upper}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _rl_to_upper(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_to_lower(klass : longint) : longint;

{$endif}
{$ifndef _rl_digit_value}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function _rl_digit_value(x : longint) : Tx;

{$endif}
{$ifndef _rl_isident}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function _rl_isident(klass : longint) : longint;

{$endif}
{$ifndef ISOCTAL}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ISOCTAL(klass : longint) : longint;

{$endif}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function OCTVALUE(klass : longint) : Tc;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HEXVALUE(klass : longint) : longint;

{$ifndef NEWLINE}

const
  NEWLINE = '\n';  
{$endif}
{$ifndef RETURN}

{ was #define dname def_expr }
function RETURN : longint; { return type might be wrong }

{$endif}
{$ifndef RUBOUT}

const
  RUBOUT = $7f;  
{$endif}
{$ifndef TAB}

const
  TAB = '\t';  
{$endif}
{$ifdef ABORT_CHAR}
{$undef ABORT_CHAR}
{$endif}

{ was #define dname def_expr }
function ABORT_CHAR : longint; { return type might be wrong }

{$ifdef PAGE}
{$undef PAGE}
{$endif}

{ was #define dname def_expr }
function PAGE : longint; { return type might be wrong }

{$ifdef SPACE}
{$undef SPACE}
{$endif}
{ XXX - was 0x20  }

const
  SPACE = ' ';  
{$ifdef ESC}
{$undef ESC}
{$endif}

{ was #define dname def_expr }
function ESC : longint; { return type might be wrong }

{$endif}
{ _CHARDEFS_H_  }

// === Konventiert am: 27-8-25 16:55:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function whitespace(klass : longint) : longint;
begin
  whitespace:=(c=' ') or (c='\t');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CTRL_CHAR(klass : longint) : longint;
begin
  CTRL_CHAR:=c<(control_character_threshold and (@((Tc(@($80)))=0)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function META_CHAR(klass : longint) : longint;
begin
  META_CHAR:=(c>(meta_character_threshold and (@(c))))<=largest_char;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function CTRL(klass : longint) : Tc;
begin
  CTRL:=Tc(@(control_character_mask));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function META(klass : longint) : longint;
begin
  META:=c or meta_character_bit;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function UNMETA(klass : longint) : Tc;
begin
  UNMETA:=Tc(@( not (meta_character_bit)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function UNCTRL(klass : longint) : longint;
begin
  UNCTRL:=_rl_to_upper(c or control_character_bit);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CTYPE_DOMAIN(klass : longint) : longint;
begin
  IN_CTYPE_DOMAIN:=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(klass : longint) : longint;
begin
  NON_NEGATIVE:=1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IN_CTYPE_DOMAIN(klass : longint) : longint;
begin
  IN_CTYPE_DOMAIN:=(c>=(0 and (@(c))))<=CHAR_MAX;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NON_NEGATIVE(klass : longint) : longint;
begin
  NON_NEGATIVE:=(byte(c))=c;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function isxdigit(klass : longint) : longint;
begin
  isxdigit:=((isdigit(byte(c))) or ((c>=('a' and (@(c))))<='f')) or ((c>=('A' and (@(c))))<='F');
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISALNUM(klass : longint) : longint;
begin
  ISALNUM:=(IN_CTYPE_DOMAIN(c)) and (@(isalnum(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISALPHA(klass : longint) : longint;
begin
  ISALPHA:=(IN_CTYPE_DOMAIN(c)) and (@(isalpha(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISDIGIT(klass : longint) : longint;
begin
  ISDIGIT:=(IN_CTYPE_DOMAIN(c)) and (@(isdigit(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISLOWER(klass : longint) : longint;
begin
  ISLOWER:=(IN_CTYPE_DOMAIN(c)) and (@(islower(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISPRINT(klass : longint) : longint;
begin
  ISPRINT:=(IN_CTYPE_DOMAIN(c)) and (@(isprint(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISUPPER(klass : longint) : longint;
begin
  ISUPPER:=(IN_CTYPE_DOMAIN(c)) and (@(isupper(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISXDIGIT(klass : longint) : longint;
begin
  ISXDIGIT:=(IN_CTYPE_DOMAIN(c)) and (@(isxdigit(byte(c))));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_lowercase_p(klass : longint) : longint;
begin
  _rl_lowercase_p:=(NON_NEGATIVE(c)) and (@(ISLOWER(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_uppercase_p(klass : longint) : longint;
begin
  _rl_uppercase_p:=(NON_NEGATIVE(c)) and (@(ISUPPER(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_digit_p(klass : longint) : longint;
begin
  _rl_digit_p:=(c>=('0' and (@(c))))<='9';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_alphabetic_p(klass : longint) : longint;
begin
  _rl_alphabetic_p:=(NON_NEGATIVE(c)) and (@(ISALNUM(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_pure_alphabetic(klass : longint) : longint;
begin
  _rl_pure_alphabetic:=(NON_NEGATIVE(c)) and (@(ISALPHA(c)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_to_upper(klass : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if _rl_lowercase_p(c) then
    if_local1:=toupper(byte(c))
  else
    if_local1:=c;
  _rl_to_upper:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_to_lower(klass : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if _rl_uppercase_p(c) then
    if_local1:=tolower(byte(c))
  else
    if_local1:=c;
  _rl_to_lower:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function _rl_digit_value(x : longint) : Tx;
begin
  _rl_digit_value:=Tx(-('0'));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _rl_isident(klass : longint) : longint;
begin
  _rl_isident:=((ISALNUM(c)) or c)='_';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ISOCTAL(klass : longint) : longint;
begin
  ISOCTAL:=(c>=('0' and (@(c))))<='7';
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function OCTVALUE(klass : longint) : Tc;
begin
  OCTVALUE:=Tc(-('0'));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HEXVALUE(klass : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  if (c>=('a' and (@(c))))<='f' then
    if_local1:=(Tc(-('a')))+10
  else
    if_local1:=c;
  if 'F' then
    if_local2:=(Tc(-('A')))+10
  else
    if_local2:=Tc(-('0'));
  HEXVALUE:=((if_local1)>=('A' and (@(c))))<=(if_local2);
end;

{ was #define dname def_expr }
function RETURN : longint; { return type might be wrong }
  begin
    RETURN:=CTRL('M');
  end;

{ was #define dname def_expr }
function ABORT_CHAR : longint; { return type might be wrong }
  begin
    ABORT_CHAR:=CTRL('G');
  end;

{ was #define dname def_expr }
function PAGE : longint; { return type might be wrong }
  begin
    PAGE:=CTRL('L');
  end;

{ was #define dname def_expr }
function ESC : longint; { return type might be wrong }
  begin
    ESC:=CTRL('[');
  end;


{$ENDIF read_implementation}
