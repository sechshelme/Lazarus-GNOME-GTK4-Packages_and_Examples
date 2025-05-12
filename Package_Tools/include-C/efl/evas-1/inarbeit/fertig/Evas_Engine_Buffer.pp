
unit Evas_Engine_Buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from Evas_Engine_Buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Evas_Engine_Buffer.h
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
PEvas_Engine_Info_Buffer  = ^Evas_Engine_Info_Buffer;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_ENGINE_BUFFER_H}
{$define _EVAS_ENGINE_BUFFER_H}

const
  EVAS_ENGINE_BUFFER_DEPTH_ARGB32 = 0;  
  EVAS_ENGINE_BUFFER_DEPTH_BGRA32 = 1;  
  EVAS_ENGINE_BUFFER_DEPTH_RGB24 = 2;  
  EVAS_ENGINE_BUFFER_DEPTH_BGR24 = 3;  
  EVAS_ENGINE_BUFFER_DEPTH_RGB32 = 4;  
type
{ PRIVATE - don't mess with this baby or evas will poke its tongue out  }
{ at you and make nasty noises  }
{ non-blocking or blocking mode  }
  PEvas_Engine_Info_Buffer = ^TEvas_Engine_Info_Buffer;
  TEvas_Engine_Info_Buffer = record
      magic : TEvas_Engine_Info;
      info : record
          depth_type : longint;
          dest_buffer : pointer;
          dest_buffer_row_bytes : longint;
          flag0 : word;
          alpha_threshold : longint;
          color_key_r : longint;
          color_key_g : longint;
          color_key_b : longint;
          func : record
              new_update_region : function (x:longint; y:longint; w:longint; h:longint; row_bytes:Plongint):pointer;cdecl;
              free_update_region : procedure (x:longint; y:longint; w:longint; h:longint; data:pointer);cdecl;
              switch_buffer : function (data:pointer; dest_buffer:pointer):pointer;cdecl;
            end;
          switch_data : pointer;
        end;
      render_mode : TEvas_Engine_Render_Mode;
    end;


const
  bm_TEvas_Engine_Info_Buffer_use_color_key = $1;
  bp_TEvas_Engine_Info_Buffer_use_color_key = 0;

{$endif}

implementation


end.
