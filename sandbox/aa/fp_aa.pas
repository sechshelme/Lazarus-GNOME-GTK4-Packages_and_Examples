unit fp_aa;

interface

const
  {$IFDEF Linux}
  libaa = 'aa';
  {$ENDIF}

  {$IFDEF Windows}
  libaa = 'aa.dll';  // ????
  {$ENDIF}



type
  Pparameters = type Pointer; // unauffindbar
  PFILE = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AA_LIB_VERSION = 1;
  AA_LIB_MINNOR = 4;
  AA_LIB_VERSIONCODE = 104000;
  AA_NATTRS = 5;
  AA_NPARAMS = 5;
  AA_RESIZE_ = 258;
  AA_MOUSE = 259;
  AA_UP = 300;
  AA_DOWN = 301;
  AA_LEFT = 302;
  AA_RIGHT = 303;
  AA_BACKSPACE = 304;
  AA_ESC = 305;
  AA_UNKNOWN = 400;
  AA_RELEASE = 65536;
  AA_NORMAL_MASK = 1;
  AA_DIM_MASK = 2;
  AA_BOLD_MASK = 4;
  AA_BOLDFONT_MASK = 8;
  AA_REVERSE_MASK = 16;
  AA_ALL = 128;
  AA_EIGHT = 256;
  AA_EXTENDED = AA_ALL or AA_EIGHT;

type
  Taa_attribute = longint;

const
  AA_NORMAL = 0;
  AA_DIM = 1;
  AA_BOLD = 2;
  AA_BOLDFONT = 3;
  AA_REVERSE = 4;
  AA_SPECIAL = 5;

type
  Taa_dithering_mode = longint;

const
  AA_NONE = 0;
  AA_ERRORDISTRIB = 1;
  AA_FLOYD_S = 2;
  AA_DITHERTYPES = 3;

  AA_BUTTON1 = 1;
  AA_BUTTON2 = 2;
  AA_BUTTON3 = 4;
  AA_MOUSEMOVEMASK = 1;
  AA_MOUSEPRESSMASK = 2;
  AA_PRESSEDMOVEMASK = 4;
  AA_MOUSEALLMASK = 7;
  AA_HIDECURSOR_ = 8;
  AA_SENDRELEASE = 1;
  AA_KBDALLMASK = 1;
  AA_USE_PAGES = 1;
  AA_NORMAL_SPACES = 8;

type
  Paa_driver = ^Taa_driver;
  Paa_kbddriver = ^Taa_kbddriver;
  Paa_mousedriver = ^Taa_mousedriver;

  Paa_edit = type Pointer;

  Taa_font = record
    data: pbyte;
    height: longint;
    name: pchar;
    shortname: pchar;
  end;
  Paa_font = ^Taa_font;

  Taa_hardware_params = record
    font: Paa_font;
    supported: longint;
    minwidth: longint;
    minheight: longint;
    maxwidth: longint;
    maxheight: longint;
    recwidth: longint;
    recheight: longint;
    mmwidth: longint;
    mmheight: longint;
    width: longint;
    height: longint;
    dimmul: double;
    boldmul: double;
  end;
  Paa_hardware_params = ^Taa_hardware_params;

  Paa_context = ^Taa_context;

  Taa_context = record
    driver: Paa_driver;
    kbddriver: Paa_kbddriver;
    mousedriver: Paa_mousedriver;
    params: Taa_hardware_params;
    driverparams: Taa_hardware_params;
    mulx: longint;
    muly: longint;
    imgwidth: longint;
    imgheight: longint;
    imagebuffer: pbyte;
    textbuffer: pbyte;
    attrbuffer: pbyte;
    table: Pword;
    filltable: Pword;
    parameters: Pparameters;
    cursorx: longint;
    cursory: longint;
    cursorstate: longint;
    mousex: longint;
    mousey: longint;
    buttons: longint;
    mousemode: longint;
    resizehandler: procedure(para1: Paa_context); cdecl;
    driverdata: pointer;
    kbddriverdata: pointer;
    mousedriverdata: pointer;
  end;

  Taa_driver = record
    shortname: pchar;
    name: pchar;
    init: function(para1: Paa_hardware_params; para2: pointer; para3: Paa_hardware_params; para4: Ppointer): longint; cdecl;
    uninit: procedure(para1: Paa_context); cdecl;
    getsize: procedure(para1: Paa_context; para2: Plongint; para3: Plongint); cdecl;
    setattr: procedure(para1: Paa_context; para2: longint); cdecl;
    print: procedure(para1: Paa_context; para2: pchar); cdecl;
    gotoxy: procedure(para1: Paa_context; para2: longint; para3: longint); cdecl;
    flush: procedure(para1: Paa_context); cdecl;
    cursormode: procedure(para1: Paa_context; para2: longint); cdecl;
  end;

  Taa_kbddriver = record
    shortname: pchar;
    name: pchar;
    flags: longint;
    init: function(para1: Paa_context; mode: longint): longint; cdecl;
    uninit: procedure(para1: Paa_context); cdecl;
    getkey: function(para1: Paa_context; para2: longint): longint; cdecl;
  end;

  Taa_mousedriver = record
    shortname: pchar;
    name: pchar;
    flags: longint;
    init: function(para1: Paa_context; mode: longint): longint; cdecl;
    uninit: procedure(para1: Paa_context); cdecl;
    getmouse: procedure(para1: Paa_context; para2: Plongint; para3: Plongint; para4: Plongint); cdecl;
    cursormode: procedure(para1: Paa_context; para2: longint); cdecl;
  end;

  Taa_renderparams = record
    bright: longint;
    contrast: longint;
    gamma: single;
    dither: Taa_dithering_mode;
    inversion: longint;
    randomval: longint;
  end;
  Paa_renderparams = ^Taa_renderparams;

  Taa_format = record
    width: longint;
    height: longint;
    pagewidth: longint;
    pageheight: longint;
    flags: longint;
    supported: longint;
    font: Paa_font;
    formatname: pchar;
    extension: pchar;
    head: pchar;
    end_: pchar;
    newline: pchar;
    prints: array[0..(AA_NATTRS) - 1] of pchar;
    begins: array[0..(AA_NATTRS) - 1] of pchar;
    ends: array[0..(AA_NATTRS) - 1] of pchar;
    conversions: ^pchar;
  end;
  Paa_format = ^Taa_format;

  Taa_savedata = record
    name: pchar;
    format: Paa_format;
    file_: PFILE;
  end;
  Paa_savedata = ^Taa_savedata;

  Paa_linkedlist = type Pointer;
  PPaa_linkedlist = ^Paa_linkedlist;
  Paa_reclist = Paa_linkedlist;

  Paa_palette = ^Taa_palette;
  Taa_palette = array[0..255] of longint;

var
  save_d: Taa_driver; cvar;external libaa;
  mem_d: Taa_driver; cvar;external libaa;
  aa_help: pchar; cvar;external libaa;
  aa_formats: ^Paa_format; cvar;external libaa;
  aa_nhtml_format: Taa_format; cvar;external libaa;
  aa_fonts: ^Paa_font; cvar;external libaa;
  aa_font8: Taa_font; cvar;external libaa;
  aa_dithernames: ^pchar; cvar;external libaa;
  aa_drivers: ^Paa_driver; cvar;external libaa;
  curses_d: Taa_driver; cvar;external libaa;
  aa_kbddrivers: ^Paa_kbddriver; cvar;external libaa;
  kbd_curses_d: Taa_kbddriver; cvar;external libaa;
  aa_mousedrivers: ^Paa_mousedriver; cvar;external libaa;
  mouse_curses_d: Taa_mousedriver; cvar;external libaa;
  aa_kbdrecommended: Paa_linkedlist; cvar;external libaa;
  aa_defparams: Taa_hardware_params; cvar;external libaa;
  aa_defrenderparams: Taa_renderparams; cvar;external libaa;

function aa_scrwidth(a: Paa_context): longint; cdecl; external libaa;
function aa_scrheight(a: Paa_context): longint; cdecl; external libaa;
function aa_mmwidth(a: Paa_context): longint; cdecl; external libaa;
function aa_mmheight(a: Paa_context): longint; cdecl; external libaa;
function aa_imgwidth(a: Paa_context): longint; cdecl; external libaa;
function aa_imgheight(a: Paa_context): longint; cdecl; external libaa;
function aa_image(a: Paa_context): pchar; cdecl; external libaa;
function aa_text(a: Paa_context): pchar; cdecl; external libaa;
function aa_attrs(a: Paa_context): pchar; cdecl; external libaa;
function aa_currentfont(a: Paa_context): Paa_font; cdecl; external libaa;
function aa_autoinit(params: Paa_hardware_params): Paa_context; cdecl; external libaa;
function aa_autoinitkbd(context: Paa_context; mode: longint): longint; cdecl; external libaa;
function aa_autoinitmouse(c: Paa_context; mode: longint): longint; cdecl; external libaa;
procedure aa_recommendhi(l: PPaa_linkedlist; name: pchar); cdecl; external libaa;
procedure aa_recommendlow(l: PPaa_linkedlist; name: pchar); cdecl; external libaa;
function aa_getfirst(l: PPaa_linkedlist): pchar; cdecl; external libaa;
function aa_init(driver: Paa_driver; defparams: Paa_hardware_params; driverdata: pointer): Paa_context; cdecl; external libaa;
function aa_initkbd(context: Paa_context; drv: Paa_kbddriver; mode: longint): longint; cdecl; external libaa;
function aa_initmouse(c: Paa_context; d: Paa_mousedriver; mode: longint): longint; cdecl; external libaa;
procedure aa_close(c: Paa_context); cdecl; external libaa;
procedure aa_uninitkbd(context: Paa_context); cdecl; external libaa;
procedure aa_uninitmouse(context: Paa_context); cdecl; external libaa;
procedure aa_fastrender(c: Paa_context; x1: longint; y1: longint; x2: longint; y2: longint); cdecl; external libaa;
procedure aa_render(c: Paa_context; p: Paa_renderparams; x1: longint; y1: longint; x2: longint;
  y2: longint); cdecl; external libaa;
procedure aa_renderpalette(c: Paa_context; table: Taa_palette; p: Paa_renderparams; x1: longint; y1: longint;
  x2: longint; y2: longint); cdecl; external libaa;
function aa_getrenderparams: Paa_renderparams; cdecl; external libaa;
procedure aa_flush(c: Paa_context); cdecl; external libaa;
procedure aa_puts(c: Paa_context; x: longint; y: longint; attr: Taa_attribute; s: pchar); cdecl; external libaa;
function aa_printf(c: Paa_context; x: longint; y: longint; attr: Taa_attribute; fmt: pchar): longint; cdecl; varargs; external libaa;
procedure aa_gotoxy(c: Paa_context; x: longint; y: longint); cdecl; external libaa;
procedure aa_hidecursor(c: Paa_context); cdecl; external libaa;
procedure aa_showcursor(c: Paa_context); cdecl; external libaa;
procedure aa_getmouse(c: Paa_context; x: Plongint; y: Plongint; b: Plongint); cdecl; external libaa;
procedure aa_hidemouse(c: Paa_context); cdecl; external libaa;
procedure aa_showmouse(c: Paa_context); cdecl; external libaa;
function aa_registerfont(f: Paa_font): longint; cdecl; external libaa;
procedure aa_setsupported(c: Paa_context; supported: longint); cdecl; external libaa;
procedure aa_setfont(c: Paa_context; font: Paa_font); cdecl; external libaa;
function aa_getevent(c: Paa_context; wait: longint): longint; cdecl; external libaa;
function aa_getkey(c: Paa_context; wait: longint): longint; cdecl; external libaa;
function aa_resize(c: Paa_context): longint; cdecl; external libaa;

type
  Tresizehandler_func = procedure(para1: Paa_context); cdecl;

procedure aa_resizehandler(c: Paa_context; handler: Tresizehandler_func); cdecl; external libaa;
function aa_parseoptions(p: Paa_hardware_params; r: Paa_renderparams; argc: Plongint; argv: PPchar): longint; cdecl; external libaa;
procedure aa_edit(c: Paa_context; x: longint; y: longint; size: longint; s: pchar;
  maxsize: longint); cdecl; external libaa;
function aa_createedit(c: Paa_context; x: longint; y: longint; size: longint; s: pchar;
  maxsize: longint): Paa_edit; cdecl; external libaa;
procedure aa_editkey(e: Paa_edit; c: longint); cdecl; external libaa;
procedure aa_putpixel(c: Paa_context; x: longint; y: longint; color: longint); cdecl; external libaa;
procedure aa_recommendhikbd(name: pchar); cdecl; external libaa;
procedure aa_recommendlowkbd(name: pchar); cdecl; external libaa;
procedure aa_recommendhimouse(name: pchar); cdecl; external libaa;
procedure aa_recommendlowmouse(name: pchar); cdecl; external libaa;
procedure aa_recommendhidisplay(name: pchar); cdecl; external libaa;
procedure aa_recommendlowdisplay(name: pchar); cdecl; external libaa;

function aa_setpalette(palette: pbyte; index: integer; r, g, b: byte): byte; inline;

{ xxxxxxxxxx#define aa_setpalette(palette,index,r,g,b) ((palette)[index]=(((r)*30+(g)*59+(b)*11)>>8)) }

function aa_scrwidth_(a: Paa_context): longint;
function aa_scrheight_(a: Paa_context): longint;
function aa_mmwidth_(a: Paa_context): longint;
function aa_mmheight_(a: Paa_context): longint;
function aa_imgwidth_(a: Paa_context): longint;
function aa_imgheight_(a: Paa_context): longint;
function aa_image_(c: Paa_context): pbyte;
function aa_text_(c: Paa_context): pbyte;
function aa_attrs_(c: Paa_context): pbyte;

// === Konventiert am: 10-1-26 15:58:20 ===


implementation

function aa_setpalette(palette: pbyte; index: integer; r, g, b: byte): byte;
begin
  palette[index] := ((r * 30 + g * 59 + (b) * 11) shr 8);
end;

function aa_scrwidth_(a: Paa_context): longint;
begin
  Result := a^.params.width;
end;

function aa_scrheight_(a: Paa_context): longint;
begin
  Result := a^.params.height;
end;

function aa_mmwidth_(a: Paa_context): longint;
begin
  Result := a^.params.mmwidth;
end;

function aa_mmheight_(a: Paa_context): longint;
begin
  Result := a^.params.mmheight;
end;

function aa_imgwidth_(a: Paa_context): longint;
begin
  Result := a^.imgwidth;
end;

function aa_imgheight_(a: Paa_context): longint;
begin
  Result := a^.imgheight;
end;

function aa_image_(c: Paa_context): pbyte;
begin
  Result := c^.imagebuffer;
end;

function aa_text_(c: Paa_context): pbyte;
begin
  Result := c^.textbuffer;
end;

function aa_attrs_(c: Paa_context): pbyte;
begin
  Result := c^.attrbuffer;
end;


end.
