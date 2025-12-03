unit textspan;

interface

uses
  geom;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  HTML_BF = 1 shl 0;
  HTML_IF = 1 shl 1;
  HTML_UL = 1 shl 2;
  HTML_SUP = 1 shl 3;
  HTML_SUB = 1 shl 4;
  HTML_S = 1 shl 5;
  HTML_OL = 1 shl 6;

type
  TPostscriptAlias = record
    name: pchar;
    family: pchar;
    weight: pchar;
    stretch: pchar;
    style: pchar;
    xfig_code: longint;
    svg_font_family: pchar;
    svg_font_weight: pchar;
    svg_font_style: pchar;
  end;
  PPostscriptAlias = ^TPostscriptAlias;

  Ptextfont_t = type Pointer;

const
  bm_textfont_t_flags = $7F;
  bp_textfont_t_flags = 0;

type
  Ptextspan_t = ^Ttextspan_t;

  Ttextspan_t = record
    str: pchar;
    font: Ptextfont_t;
    layout: pointer;
    free_layout: procedure(layout: pointer); cdecl;
    yoffset_layout: double;
    yoffset_centerline: double;
    size: Tpointf;
    just: char;
  end;

  // === Konventiert am: 3-12-25 15:07:30 ===


implementation


end.
