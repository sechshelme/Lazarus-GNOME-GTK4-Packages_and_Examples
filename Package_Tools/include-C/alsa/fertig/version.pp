
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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


{
 *  version.h
  }
{*< major number of library version  }

const
  SND_LIB_MAJOR = 1;  
{*< minor number of library version  }
  SND_LIB_MINOR = 2;  
{*< subminor number of library version  }
  SND_LIB_SUBMINOR = 11;  
{*< extra version number, used mainly for betas  }
  SND_LIB_EXTRAVER = 1000000;  
{* library version  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SND_LIB_VER(maj,min,sub : longint) : longint;

{ was #define dname def_expr }
function SND_LIB_VERSION : longint; { return type might be wrong }

{* library version (string)  }
const
  SND_LIB_VERSION_STR = '1.2.11';  

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SND_LIB_VER(maj,min,sub : longint) : longint;
begin
  SND_LIB_VER:=((maj shl 16) or (min shl 8)) or sub;
end;

{ was #define dname def_expr }
function SND_LIB_VERSION : longint; { return type might be wrong }
  begin
    SND_LIB_VERSION:=SND_LIB_VER(SND_LIB_MAJOR,SND_LIB_MINOR,SND_LIB_SUBMINOR);
  end;


end.
