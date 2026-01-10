unit fp_aa;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  AA_LIB_VERSION = 1;  
  AA_LIB_MINNOR = 4;  
  AA_LIB_VERSIONCODE = 104000;  
  AA_NATTRS = 5;  
  AA_NPARAMS = 5;  
  AA_RESIZE = 258;
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
  Taa_attribute =  Longint;
  Const
    AA_NORMAL = 0;
    AA_DIM = 1;
    AA_BOLD = 2;
    AA_BOLDFONT = 3;
    AA_REVERSE = 4;
    AA_SPECIAL = 5;

type
  Taa_dithering_mode =  Longint;
  Const
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
  AA_HIDECURSOR = 8;  
  AA_SENDRELEASE = 1;  
  AA_KBDALLMASK = 1;  
  AA_USE_PAGES = 1;
  AA_NORMAL_SPACES = 8;  
type
  Paa_driver = type Pointer;
  Paa_kbddriver = type Pointer;
  Paa_mousedriver = type Pointer;

  Paa_edit = type Pointer;

  Taa_hardware_params = record
      font : Paa_font;
      supported : longint;
      minwidth : longint;
      minheight : longint;
      maxwidth : longint;
      maxheight : longint;
      recwidth : longint;
      recheight : longint;
      mmwidth : longint;
      mmheight : longint;
      width : longint;
      height : longint;
      dimmul : double;
      boldmul : double;
    end;
  Paa_hardware_params = ^Taa_hardware_params;

  Taa_context = record
      driver : Paa_driver;
      kbddriver : Paa_kbddriver;
      mousedriver : Paa_mousedriver;
      params : Taa_hardware_params;
      driverparams : Taa_hardware_params;
      mulx : longint;
      muly : longint;
      imgwidth : longint;
      imgheight : longint;
      imagebuffer : Pbyte;
      textbuffer : Pbyte;
      attrbuffer : Pbyte;
      table : Pword;
      filltable : Pword;
      parameters : Pparameters;
      cursorx : longint;
      cursory : longint;
      cursorstate : longint;
      mousex : longint;
      mousey : longint;
      buttons : longint;
      mousemode : longint;
      resizehandler : procedure (para1:Paa_context);cdecl;
      driverdata : pointer;
      kbddriverdata : pointer;
      mousedriverdata : pointer;
    end;
  Paa_context = ^Taa_context;

  Taa_driver = record
      shortname : Pchar;
      name : Pchar;
      init : function (para1:Paa_hardware_params; para2:pointer; para3:Paa_hardware_params; para4:Ppointer):longint;cdecl;
      uninit : procedure (para1:Paa_context);cdecl;
      getsize : procedure (para1:Paa_context; para2:Plongint; para3:Plongint);cdecl;
      setattr : procedure (para1:Paa_context; para2:longint);cdecl;
      print : procedure (para1:Paa_context; para2:Pchar);cdecl;
      gotoxy : procedure (para1:Paa_context; para2:longint; para3:longint);cdecl;
      flush : procedure (para1:Paa_context);cdecl;
      cursormode : procedure (para1:Paa_context; para2:longint);cdecl;
    end;
  Paa_driver = ^Taa_driver;

{
 * The hardware driver specification.  Used internally by AA-lib only.
 * Provided for compatibility with older programs.
  }
  Paa_kbddriver = ^Taa_kbddriver;
  Taa_kbddriver = record
      shortname : Pchar;
      name : Pchar;
      flags : longint;
      init : function (para1:Paa_context; mode:longint):longint;cdecl;
      uninit : procedure (para1:Paa_context);cdecl;
      getkey : function (para1:Paa_context; para2:longint):longint;cdecl;
    end;

{
 * The hardware driver specification.  Used internally by AA-lib only.
 * Provided for compatibility with older programs.
  }
  Paa_mousedriver = ^Taa_mousedriver;
  Taa_mousedriver = record
      shortname : Pchar;
      name : Pchar;
      flags : longint;
      init : function (para1:Paa_context; mode:longint):longint;cdecl;
      uninit : procedure (para1:Paa_context);cdecl;
      getmouse : procedure (para1:Paa_context; para2:Plongint; para3:Plongint; para4:Plongint);cdecl;
      cursormode : procedure (para1:Paa_context; para2:longint);cdecl;
    end;

{
 * Parameters used for rendering.
  }
{ Brighness in range 0 (normal) to 255
				       (white)   }
{ Contrast value in range 0 (normal)
				       to 127 (white)   }
{ Gama value in the standard range   }
{ Dithering algorithm  }
{ Set 1 for inversed terminals (black on
				       white)   }
{ Range of random value added to each
				       pixel. Used to crate random dithering
				       effect.   }
  Paa_renderparams = ^Taa_renderparams;
  Taa_renderparams = record
      bright : longint;
      contrast : longint;
      gamma : single;
      dither : Taa_dithering_mode;
      inversion : longint;
      randomval : longint;
    end;

{ Bitmap of 8xheight font.   }
{ Height of font.   }
{ Long name of font.   }
{ One-word name of the font.   }
  Paa_font = ^Taa_font;
  Taa_font = record
      data : Pbyte;
      height : longint;
      name : Pchar;
      shortname : Pchar;
    end;

{
 * Output format specification used by aa_save driver. 
  }
{fields after this line may change in future versions }
  Paa_format = ^Taa_format;
  Taa_format = record
      width : longint;
      height : longint;
      pagewidth : longint;
      pageheight : longint;
      flags : longint;
      supported : longint;
      font : Paa_font;
      formatname : Pchar;
      extension : Pchar;
      head : Pchar;
      end : Pchar;
      newline : Pchar;
      prints : array[0..(AA_NATTRS)-1] of Pchar;
      begin : array[0..(AA_NATTRS)-1] of Pchar;
      ends : array[0..(AA_NATTRS)-1] of Pchar;
      conversions : ^Pchar;
    end;

{
 * Initialization data used by aa_save driver. 
  }
{ Base name of the output file. The page number and extension
		   is attached automatically.   }
{ Format to save into.   }
{ You might specify output file by field too,
		   in case the name field is NULL }
  Paa_savedata = ^Taa_savedata;
  Taa_savedata = record
      name : Pchar;
      format : Paa_format;
      file : PFILE;
    end;

  Taa_linkedlist = Taa_reclist;
  Taa_hardware_params = Taa_hardwareparams;

  Paa_palette = ^Taa_palette;
  Taa_palette = array[0..255] of longint;
{
 * AA-lib driver used to save ascii-art image into file in used specified format. 
 * Initialize this driver using aa_init function and specify the driver
 * dependent parameters in aa_savedata structure to save image into file.
 * See the texinfo documentation for details.
  }
  var
    save_d : Taa_driver;cvar;external libaa;
{
 * AA-lib memory driver.  
 * Used to render ascii-art images into memory. 
 * You might use this driver to render images into memory and then use your
 * own routines to handle them in case you want to avoid AA-lib's output
 * mechanizms.
  }
    mem_d : Taa_driver;cvar;external libaa;
{
 * AA-lib help string for the default command line parser.
  }
    aa_help : Pchar;cvar;external libaa;
{
 * NULL terminated array of save formats supported by AA-lib.
  }
    aa_formats : ^Paa_format;cvar;external libaa;
    aa_nhtml_format : Taa_format;cvar;external libaa;
{
 * Null-terminated array of available fonts.
  }
    aa_fonts : ^Paa_font;cvar;external libaa;
    aa_font8 : Taa_font;cvar;external libaa;
{
 * Names of dithering methods supported by AA-lib.
 * NULL terminated array containing the names of supported dithering methods
 * as ascii strings.
  }
    aa_dithernames : ^Pchar;cvar;external libaa;
{
 * NULL-terminated array of output drivers available in AA-lib.
  }
    aa_drivers : ^Paa_driver;cvar;external libaa;
    curses_d : Taa_driver;cvar;external libaa;
{
 * NULL-terminated array of keyboard drivers available in AA_lib.
  }
    aa_kbddrivers : ^Paa_kbddriver;cvar;external libaa;
    kbd_curses_d : Taa_kbddriver;cvar;external libaa;
{
 * NULL terminated array of mouse drivers supported by AA-lib.
  }
    aa_mousedrivers : ^Paa_mousedriver;cvar;external libaa;
    mouse_curses_d : Taa_mousedriver;cvar;external libaa;
{
 * List of recommended drivers.
 * List of recommended drivers is used by aa_autoinit familly of functions
 * and altered by aa_recommend familly of functions.
  }
    aa_kbdrecommended : Paa_linkedlist;cvar;external libaa;
{
 * default hardware paramters requested by AA-lib programs. Pa
 * Default hardware paramters requested by AA-lib programs. Passed to aa_init
 * function familly.
  }
    aa_defparams : Taa_hardware_params;cvar;external libaa;
{
 * default rendering parameters.
 * Default rendering parameters. Passed to aa_render function familly.
  }
    aa_defrenderparams : Taa_renderparams;cvar;external libaa;
{ returns width of the output screen in characters.   }
{ Specifies the AA-lib context to operate on.  }

function aa_scrwidth(a:Paa_context):longint;cdecl;external libaa;
{ returns height of the output screen in characters.   }
{ Specifies the AA-lib context to operate on.  }
function aa_scrheight(a:Paa_context):longint;cdecl;external libaa;
{ returns width of the output screen in millimeters.   }
{ Specifies the AA-lib context to operate on.  }
function aa_mmwidth(a:Paa_context):longint;cdecl;external libaa;
{ returns height of the output screen in millimeters.   }
{ Specifies the AA-lib context to operate on.  }
function aa_mmheight(a:Paa_context):longint;cdecl;external libaa;
{ returns width of the emulated image in pixels.   }
{ Specifies the AA-lib context to operate on.  }
function aa_imgwidth(a:Paa_context):longint;cdecl;external libaa;
{ returns height of the emulated image in pixels.   }
{ Specifies the AA-lib context to operate on.  }
function aa_imgheight(a:Paa_context):longint;cdecl;external libaa;
{
 * returns pointer to the framebuffer emulated by AA-lib.
 * The framebuffer is simple array of characters specifying
 * the brightness value (or palette index depending on the aa_render
 * call). The array is organizated in the aa_imgheight (a) rows of
 * aa_imgwidth(a) characters.
 * Returns pointer to framebuffer emulated by AA-lib.
  }
{ Specifies the AA-lib context to operate on.  }
function aa_image(a:Paa_context):Pchar;cdecl;external libaa;
{
 * returns pointer to the text output buffer used by AA-lib.
 * The text output buffer is simple array of characters specifying
 * the ascii-value of the characters.
 * The array is organizated in the aa_scrheight (a) rows of
 * aa_scrwidth(a) characters.
 *
 * Returns pointer the text output buffer used by AA-lib.
  }
{ Specifies the AA-lib context to operate on.  }
function aa_text(a:Paa_context):Pchar;cdecl;external libaa;
{
 * returns pointer to the text output buffer used by AA-lib.
 * The attribute output buffer is simple array of characters specifying
 * the attributes.
 * The array is organizated in the aa_scrheight (a) rows of
 * aa_scrwidth(a) characters.
 *
 * Returns pointer the text output buffer used by AA-lib.
  }
{ Specifies the AA-lib context to operate on.  }
function aa_attrs(a:Paa_context):Pchar;cdecl;external libaa;
{
 * returns specification of the fonts used by AA-lib rendering routines.
  }
{ Specifies the AA-lib context to operate on.  }
function aa_currentfont(a:Paa_context):Paa_font;cdecl;external libaa;
{
 * easy to use AA-lib initialization function. 
 * Attempts to find available output driver supporting the specified
 * parameters.  First attempts to initialize the recommended drivers
 * and then in order drivers available in the aa_drivers array
 * (all regular output drivers compiled into AA-lib).
 * Returns pointer to initialized context structure when succesfull or
 * NULL on failure.
  }
{ Hardware parameters you want.  Use aa_defparams
		           for default values.   }
function aa_autoinit(params:Paa_hardware_params):Paa_context;cdecl;external libaa;
{
 * easy to use AA-lib keyboard initialization function. 
 * Attempts to find available keyboard driver supporting the specified
 * mode.  First attempts to initialize the recommended drivers
 * and then in order drivers available in the aa_kbddrivers array
 * (all regular output drivers compiled into AA-lib).
 *
 * Every AA-lib program ought to have call to aa_parseoptions before
 * first call to aa_init.
 *
 * Returns 1 when succesfull or 0 on failure.
  }
{ Specifies the AA-lib context to operate on.  }
{ Mask of extra features you request. Can contain
		      AA_SENDRELEASE if you are interested in release events
		      too.  }
function aa_autoinitkbd(context:Paa_context; mode:longint):longint;cdecl;external libaa;
{
 * easy to use AA-lib mouse initialization function. 
 * Attempts to find available mouse driver supporting the specified
 * mode.  First attempts to initialize the recommended drivers
 * and then in order drivers available in the aa_kbddrivers array
 * (all regular output drivers compiled into AA-lib).
 * Returns 1 when succesfull or 0 on failure.
  }
{ Specifies the AA-lib context to operate on.  }
{ Mask of extra features you request.  No such features
		        are available in the current AA-lib version.   }
function aa_autoinitmouse(c:Paa_context; mode:longint):longint;cdecl;external libaa;
{ insert the given driver on beggining of the list of recommended drivers.   }
{ List to operate on (aa_displayrecommended,
		       aa_kbdrecommended or aa_mouserecommended)  }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendhi(l:PPaa_linkedlist; name:Pchar);cdecl;external libaa;
{ Add the given driver to the end of list of recommended drivers.   }
{ List to operate on (aa_displayrecommended,
		       aa_kbdrecommended or aa_mouserecommended)  }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendlow(l:PPaa_linkedlist; name:Pchar);cdecl;external libaa;
function aa_getfirst(l:PPaa_linkedlist):Pchar;cdecl;external libaa;
{init functions  }
{
 * open the output display for AA-lib. 
 * This is the most primitive AA-lib initialization function.
 * Allows better control over the process than the easier to use
 * aa_autoinit function.
 *
 * Every AA-lib program ought to have call to aa_parseoptions before
 * first call to aa_init.
 *
 * returns pointer to new AA-lib context or NULL if failed.  
  }
{ Driver you want to use.  Available drivers are listed
		         in the NULL terminated aa_drivers array.   }
{ Hardware parameters you want.  Use aa_defparams
		         for default values.   }
{ This pointer is passed dirrectly to driver used
		         to specify additional driver dependent parameters.  }
function aa_init(driver:Paa_driver; defparams:Paa_hardware_params; driverdata:pointer):Paa_context;cdecl;external libaa;
{
 * initialize the AA-lib keyboard driver. 
 * This is the most primitive AA-lib keyboard initialization function.
 * Allows better control over the process than the easier to use
 * aa_autoinitkbd function.
 * returns 1 on success and 0 on fail.  
  }
{ Specifies the AA-lib context to operate on.   }
{ Driver you wish to use  }
{ Mask of extra features you request. Can contain
		  AA_SENDRELEASE if you are interested in release events
		  too.  }
function aa_initkbd(context:Paa_context; drv:Paa_kbddriver; mode:longint):longint;cdecl;external libaa;
{
 * initialize the AA-lib mouse driver. 
 * This is the most primitive AA-lib keyboard initialization function.
 * Allows better control over the process than the easier to use
 * aa_autoinitmouse function.
 * returns 1 on success and 0 on fail.  
  }
{ Specifies the AA-lib context to operate on.   }
{ Driver you wish to use.   }
{ Mask of extra features you request.  No such features
		      are available in the current AA-lib version.   }
function aa_initmouse(c:Paa_context; d:Paa_mousedriver; mode:longint):longint;cdecl;external libaa;
{uninicializing functions  }
{
 * close the AA-lib context.
 * Uninitialize all activated drivers and frees the memory used by context
 * structures.
  }
{ Specifies the AA-lib context to operate on.   }
procedure aa_close(c:Paa_context);cdecl;external libaa;
{
 * uninitialize the keyboard driver. 
 * Calls "uninitialize" function of the keyboard driver. It ought to undo
 * all actions done by "initialize" function.
  }
{ Specifies the AA-lib context to operate on.   }
procedure aa_uninitkbd(context:Paa_context);cdecl;external libaa;
{
 * uninitialize the mouse driver. 
 * Calls "uninitialize" function of the mouse driver. It ought to undo
 * all actions done by "initialize" function.
  }
{ Specifies the AA-lib context to operate on.   }
procedure aa_uninitmouse(context:Paa_context);cdecl;external libaa;
{ simple and fast AA-lib rendering function.
 * This function does the trick of converting the emulated framebuffer
 * into high quality ASCII-art. It is slightly faster and less flexible
 * the aa_render function.
 *
 * Note that to see the effect you need to call aa_flush too.
 *
 * First call to this function may take a while, because the rendering
 * tables are produced.
  }
{ Specifies the AA-lib context to operate on.   }
{ column of top left coner of rendered area
		      (in characters!)  }
{ row of top left coner of rendered area  }
{ column of bottom right coner of rendered area  }
{ row of bottom right coner of rendered area  }
procedure aa_fastrender(c:Paa_context; x1:longint; y1:longint; x2:longint; y2:longint);cdecl;external libaa;
{ convert image buffer to ASCII-art.
 * This function does the trick of converting the emulated framebuffer
 * into high quality ASCII-art. If you want to be really fast, you might
 * use aa_fastrender.  If you want to emulate palette, use aa_renderpalette.
 *
 * Note that to see the effect you need to call aa_flush too.
 *
 * First call to this function may take a while, because the rendering
 * tables are produced.
  }
{ Specifies the AA-lib context to operate on.   }
{ Rendering parametters used to specify brightness, gamma
		  correction and other usefull stuff. Use aa_defrenderparams
		  for default values.  }
{ column of top left coner of rendered area
	          (in characters!)  }
{ row of top left coner of rendered area  }
{ column of bottom right coner of rendered area  }
{ row of bottom right coner of rendered area  }
procedure aa_render(c:Paa_context; p:Paa_renderparams; x1:longint; y1:longint; x2:longint; 
            y2:longint);cdecl;external libaa;
procedure aa_renderpalette(c:Paa_context; table:Taa_palette; p:Paa_renderparams; x1:longint; y1:longint; 
            x2:longint; y2:longint);cdecl;external libaa;
function aa_getrenderparams:Paa_renderparams;cdecl;external libaa;
procedure aa_flush(c:Paa_context);cdecl;external libaa;
{ output string to AA-lib output buffers.
   Output given string to AA-lib output buffers.  To see the effect you need to
   call aa_flush too.   }
{ Specifies the AA-lib context to operate on.   }
{ X coordinate of the first character.   }
{ Y coordinate of the first character.   }
{ Attribute to use.   }
{ String to output.   }
procedure aa_puts(c:Paa_context; x:longint; y:longint; attr:Taa_attribute; s:Pchar);cdecl;external libaa;
{
 * print text to AA-lib output buffers.
 * Print given text to AA-lib output buffers.  To see the effect you need to
 * call aa_flush too.  
  }
{ Specifies the AA-lib context to operate on.   }
{ X coordinate of the first character.   }
{ Y coordinate of the first character.   }
{ Attribute to use.   }
{ Text to output in standard printf format.   }
function aa_printf(c:Paa_context; x:longint; y:longint; attr:Taa_attribute; fmt:Pchar; 
           args:array of const):longint;cdecl;external libaa;
function aa_printf(c:Paa_context; x:longint; y:longint; attr:Taa_attribute; fmt:Pchar):longint;cdecl;external libaa;
{
 * move the hardware cursor (if any) to specified position. 
 * Move the hardware cursor (if any) to specified position. 
 * To see the effect you need to call aa_flush too.  
  }
{ Specifies the AA-lib context to operate on.   }
{ X coordinate of new position.   }
{ Y coordinate of the position.   }
procedure aa_gotoxy(c:Paa_context; x:longint; y:longint);cdecl;external libaa;
{
 * hide the hardware cursor.
 * Hide the hardware cursor.
 * This function may be ignored by some drivers.
  }
{ Specifies the AA-lib context to operate on.   }
procedure aa_hidecursor(c:Paa_context);cdecl;external libaa;
{
 * show the hardware cursor.
 * Show the hardware cursor.
 * This function may not be ignored by some drivers.
  }
{ Specifies the AA-lib context to operate on.   }
procedure aa_showcursor(c:Paa_context);cdecl;external libaa;
{
 * Get mouse position as specified by last mouse event read by aa_getevent.
  }
{ Specifies the AA-lib context to operate on.   }
{ Used to return X coordinate of mouse in characters.   }
{ Used to return Y coordinate of mouse in characters.   }
{ Used to return button mask of mouse. 
		    (values used are AA_BUTTON1, AA_BUTTON2 and AA_BUTTON3) }
procedure aa_getmouse(c:Paa_context; x:Plongint; y:Plongint; b:Plongint);cdecl;external libaa;
{
 * hide the mouse cursor.
 * Hide the mouse cursor. 
 * This function may be ignored by some drivers.
  }
procedure aa_hidemouse(c:Paa_context);cdecl;external libaa;
{
 * show the mouse cursor.
 * Show the mouse cursor. 
 * This function may be ignored by some drivers.
  }
procedure aa_showmouse(c:Paa_context);cdecl;external libaa;
{
 * add new font specification to aa_fonts array.
 * Returns 1 when succesfull or 0 on failure.
  }
{ Font specification structure.  }
function aa_registerfont(f:Paa_font):longint;cdecl;external libaa;
{
 * alter the "supported" field of hardware_params structure used by AA-lib
 * This function can be used to alter "supported" field of hardware-params
 * structure used by AA-lib. 
  }
{ Specifies the AA-lib context to operate on.   }
{ New mask of requested features. Can contain
		        AA_EXTENDED to enable use of all 256 characters
		        and AA_EIGHT to enable use of the character numbered
		        higher than 127.   }
procedure aa_setsupported(c:Paa_context; supported:longint);cdecl;external libaa;
{ set font specification to be used by rendering functions.  }
{ Specifies the AA-lib context to operate on.   }
{ Font specification structure.   }
procedure aa_setfont(c:Paa_context; font:Paa_font);cdecl;external libaa;
{keyboard functions  }
{ return next event from queue.
 * Return next even from queue. Optionally wait for even when queue is
 * empty.
 * Returns next event from queue (values lower than 256 are used to report
 * ascii values of pressed keys and higher values have special meanings)
 * See the AA-lib texinfo documentation for more details.
 * 0 is returned when queue is empty and wait is set to 0.
  }
{ Specifies the AA-lib context to operate on.   }
{ 1 if you wish to wait for the even when queue is empty.   }
function aa_getevent(c:Paa_context; wait:longint):longint;cdecl;external libaa;
{ return next keypress event from queue.
 * Returns next keypress event from queue (values lower than 256 are used
 * to report ascii values of pressed keys and higher values are used to
 * represent some special keys like arrows)
 * See the AA-lib texinfo documentation for more details.
  }
{ Specifies the AA-lib context to operate on.   }
{ 1 if you wish to wait for the even when queue is empty.   }
function aa_getkey(c:Paa_context; wait:longint):longint;cdecl;external libaa;
{resize functions  }
{ 
 * Do resize action. This function ought to be called when application
 * takes into account the AA_RESIZE event.  The context is reinitialized
 * and set to new sizes.
 * Returns 0 when no resizing is done and 1 when resizing was succesfull.
  }
{ Specifies the AA-lib context to operate on.   }
function aa_resize(c:Paa_context):longint;cdecl;external libaa;
{
 * Set user handler to be called on resize event.
  }
{ Specifies the AA-lib context to operate on.   }
{ Function to be called when resize happends.   }
procedure aa_resizehandler(c:Paa_context; handler:procedure (para1:Paa_context));cdecl;external libaa;
{
 * parse the standard command line options used by AA-lib.
 * Use this function to parse the standard command line options used by
 * AA-lib. Every AA-lib program ought to call this function to let user
 * specify some extra parameters.  The function alters the aa_hardware_params
 * and aa_renderparams structures and removes known options from the
 * argc/argv lists. It also parse the AAOPTS environment variable.
 * When called with NULL for the argc/argv parameters, it parses AAOPTS
 * only. At least this call ought to be in every AA-lib program.
 * Returns 1 when sucesfull and 0 on failure. The program then can
 * print the help text available in aa_help variable.
  }
{ Hardware parameters structure to alter. It is expected
		     * that this structure only with necessary modifications
		     * will be later used to initialize the AA-lib context.   }
{ Rendering prameters structure to alter. It is expected
		     * that this structure only with necessary modifications
		     * will be later used to render images.   }
{ Pointer to argc parameter passed to function "main".   }
{ Pointer to argv parameter passed to function "main".   }
function aa_parseoptions(p:Paa_hardware_params; r:Paa_renderparams; argc:Plongint; argv:PPchar):longint;cdecl;external libaa;
{
 * Simple interactive line editor.
 * This function produces the simple interactive line editor that can
 * be used by AA-lib programs to input strings.
  }
{ Specifies the AA-lib context to operate on.   }
{ X coordinate of the edited text.   }
{ Y coordinate of the edited text.   }
{ Length of the editor window.   }
{ Buffer to edit (containing default value).   }
{ Size of the buffer.   }
procedure aa_edit(c:Paa_context; x:longint; y:longint; size:longint; s:Pchar; 
            maxsize:longint);cdecl;external libaa;
{
 * Simple interactive line editor provided as helper function.
 *
 * You might use this function to input strings in AA-lib programs.
 * This function initializes the aa_edit structure used by event-based
 * editor. You might then call the aa_editkey function when key is pressed.
 *
 * Returns pointer to edit context when succesfull and NULL on failure.
  }
{ Specifies the AA-lib context to operate on.   }
{ X coordinate of the edited text.   }
{ Y coordinate of the edited text.   }
{ Length of the editor window.   }
{ Buffer to edit (containing default value).   }
{ Size of the buffer.   }
function aa_createedit(c:Paa_context; x:longint; y:longint; size:longint; s:Pchar; 
           maxsize:longint):Paa_edit;cdecl;external libaa;
{ Notify the line editor about keypress.  }
{ Editor context to use (see aa_createedit)  }
{ Key pressed   }
procedure aa_editkey(e:Paa_edit; c:longint);cdecl;external libaa;
{
 * put pixel to emulated framebuffer
  }
{ Specifies the AA-lib context to operate on.   }
{ X coordinate.  }
{ Y coordinate.  }
{ Palette index or brightness value (0..255)  }
procedure aa_putpixel(c:Paa_context; x:longint; y:longint; color:longint);cdecl;external libaa;
{ insert the given driver on beggining of the list of recommended keyboard drivers.   }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendhikbd(name:Pchar);cdecl;external libaa;
{ Add the given driver to the end of list of keyboard recommended drivers.   }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendlowkbd(name:Pchar);cdecl;external libaa;
{ insert the given driver on beggining of the list of recommended mouse drivers.   }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendhimouse(name:Pchar);cdecl;external libaa;
{ Add the given driver to the end of list of mouse recommended drivers.   }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendlowmouse(name:Pchar);cdecl;external libaa;
{ insert the given driver on beggining of the list of recommended display drivers.   }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendhidisplay(name:Pchar);cdecl;external libaa;
{ Add the given driver to the end of list of display recommended drivers.   }
{ Name of the driver (ought to match the "shortname"
		       field of the driver definition structure).   }
procedure aa_recommendlowdisplay(name:Pchar);cdecl;external libaa;
{ This macro implementations are proved for faster compilation.  }
{ xxxxxxxxxx#define aa_setpalette(palette,index,r,g,b) ((palette)[index]=(((r)*30+(g)*59+(b)*11)>>8)) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_scrwidth(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_scrheight(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_mmwidth(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_mmheight(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_imgwidth(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_imgheight(a : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_image(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_text(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_attrs(klass : longint) : longint;

{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 10-1-26 15:58:20 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_scrwidth(a : longint) : longint;
begin
  aa_scrwidth:=a^.(params.width);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_scrheight(a : longint) : longint;
begin
  aa_scrheight:=a^.(params.height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_mmwidth(a : longint) : longint;
begin
  aa_mmwidth:=a^.(params.mmwidth);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_mmheight(a : longint) : longint;
begin
  aa_mmheight:=a^.(params.mmheight);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_imgwidth(a : longint) : longint;
begin
  aa_imgwidth:=a^.imgwidth;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_imgheight(a : longint) : longint;
begin
  aa_imgheight:=a^.imgheight;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_image(klass : longint) : longint;
begin
  aa_image:=c^.imagebuffer;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_text(klass : longint) : longint;
begin
  aa_text:=c^.textbuffer;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function aa_attrs(klass : longint) : longint;
begin
  aa_attrs:=c^.attrbuffer;
end;


end.
