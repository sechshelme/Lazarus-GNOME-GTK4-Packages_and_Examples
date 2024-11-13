

{$include gst/gl/gstgl_enums.inc}              // io.
{$include gst/gl/gl_enumtypes.inc}             // io.
{$include gst/gl/gstglfuncs.inc}               // io.
{$include gst/gl/gstglwindow.inc}              // io. -> gstglfuncs
{$include gst/gl/gstgldebug.inc}               // io. -> gstglwindow                       makros entfernt
{$include gst/gl/gstglquery.inc}               // io. -> gstglwindow, gstgldebug           makros entfernt
{$include gst/gl/gstglbasememory.inc}          // io, -> gstglwindow, gstglquery
{$include gst/gl/gstglbuffer.inc}              // io. -> gstglbasememory, gstglwindow
{$include gst/gl/gstglformat.inc}              // io. -> gstgl_enums, gstglwindow
{$include gst/gl/gstglmemory.inc}              // io. -> gstgl_enums, gstglbasememory, gstglwindow, gstglformat
{$include gst/gl/gstglmemorypbo.inc}           // io. -> gstglmemory, gstgl_enums, gstglformat
{$include gst/gl/gstglapi.inc}                 // io.
{$include gst/gl/gstglcontext.inc}             // io. -> gstglapi, gstglwindow
{$include gst/gl/gstgldisplay.inc}             // io. -> gstglapi, gstglwindow
{$include gst/gl/gstglbasefilter.inc}          // io. -> gstglapi, gstglwindow
{$include gst/gl/gstglbasemixer.inc}           // io. -> gstglapi, gstglwindow
{$include gst/gl/gstglsl.inc}                  // io. -> gstglapi, gstglwindow
{$include gst/gl/gstglslstage.inc}             // io. -> gstglwindow, gstglsl
{$include gst/gl/gstglshader.inc}              // io. -> gstglwindow, gstglsl, gstglslstage
{$include gst/gl/gstglframebuffer.inc}         // io. -> gstglwindow, gstglbasememory, gstglmemory
{$include gst/gl/gstglbasesrc.inc}             // io. -> gstglwindow, gstglapi, gstglmemory
{$include gst/gl/gstglbufferpool.inc}          // io. -> gstglwindow, gstglbasememory
{$include gst/gl/gstglcolorconvert.inc}        // io. -> gstglwindow, gstglframebuffer, gstglshader
{$include gst/gl/gstglcontextconfig.inc}       // io. -> gl_enumtypes
{$include gst/gl/gstglfeature.inc}             // io.
{$include gst/gl/gstglfilter.inc}              // io. -> gstglmemory, gstglbasefilter, gstgl_enums, gstglframebuffer, gstglshader
{$include gst/gl/gstglmixer.inc}               // io. -> gstglbasemixer, gstglmemory, gstglframebuffer
{$include gst/gl/gstgloverlaycompositor.inc}   // io. -> gstglwindow, gstglshader
{$include gst/gl/gstglrenderbuffer.inc}        // io. -> gstglwindow, gstglbasememory, gstglformat
{$include gst/gl/gstglshaderstrings.inc}       // io. -> gstglwindow, gstglsl
{$include gst/gl/gstglsyncmeta.inc}            // io. -> gstglwindow
{$include gst/gl/gstglupload.inc}              // io. -> gstglwindow
{$include gst/gl/gstglutils.inc}               // io. -> gstglwindow, gstgl_enums
{$include gst/gl/gstglviewconvert.inc}         // io. -> gstglwindow, gl_enumtypes, gstgl_enums, gstglshader, gstglframebuffer

