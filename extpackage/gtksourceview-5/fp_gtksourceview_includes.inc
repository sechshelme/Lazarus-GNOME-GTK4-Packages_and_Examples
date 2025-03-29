

{$include gtksourceview/gtksourceversion.inc}                        // io.
{$include gtksourceview/gtksourcetypes.inc}                          // io.
{$include gtksourceview/gtksource_enumtypes.inc}                     // io.
{$include gtksourceview/gtksourceregion.inc}                         // io.
{$include gtksourceview/gtksourcelanguage.inc}                       // io.
{$include gtksourceview/gtksourcelanguagemanager.inc}                // io. -> gtksourcelanguage
{$include gtksourceview/gtksourcemark.inc}                           // io.
{$include gtksourceview/gtksourcestyle.inc}                          // io.
{$include gtksourceview/gtksourcestylescheme.inc}                    // io. -> gtksourcestyle
{$include gtksourceview/gtksourcebuffer.inc}                         // io. -> gtksourcelanguage, gtksourcestylescheme, gtksourcemark
{$include gtksourceview/gtksourcestyleschememanager.inc}             // io. -> gtksourcestylescheme
{$include gtksourceview/gtksourcesnippetcontext.inc}                 // io.
{$include gtksourceview/gtksourcesnippetchunk.inc}                   // io. -> gtksourcesnippetcontext
{$include gtksourceview/gtksourcesnippet.inc}                        // io. -> gtksourcesnippetchunk, gtksourcesnippetcontext
{$include gtksourceview/gtksourcecompletioncontext.inc}              // io. -> gtksourcebuffer, gtksourcelanguage
{$include gtksourceview/gtksourcecompletioncell.inc}                 // io.
{$include gtksourceview/gtksourcecompletionproposal.inc}             // io.
{$include gtksourceview/gtksourcecompletionprovider.inc}             // io. -> gtksourcecompletioncontext, gtksourcecompletionproposal, gtksourcecompletioncell
{$include gtksourceview/gtksourcecompletion.inc}                     // io. -> gtksourcebuffer, gtksourcecompletionprovider
{$include gtksourceview/gtksourcemarkattributes.inc}                 // io. -> gtksourcemark
{$include gtksourceview/gtksourcehoverdisplay.inc}                   // io.
{$include gtksourceview/gtksourcehovercontext.inc}                   // io. -> gtksourcebuffer
{$include gtksourceview/gtksourcehoverprovider.inc}                  // io. -> gtksourcehovercontext, gtksourcehoverdisplay
{$include gtksourceview/gtksourcehover.inc}                          // io. -> gtksourcehoverprovider
{$include gtksourceview/gtksourceindenter.inc}                       // io.
{$include gtksourceview/gtksourcegutterrenderer.inc}                 // io. -> gtksourcebuffer
{$include gtksourceview/gtksourcegutterlines.inc}                    // io. -> gtksourcegutterrenderer
{$include gtksourceview/gtksourcegutter.inc}                         // io. -> gtksourcegutterrenderer
{$include gtksourceview/gtksourcespacedrawer.inc}                    // io.
{$include gtksourceview/gtksourceview.inc}                           // io. -> gtksourcesnippet, gtksourcebuffer, gtksourcemarkattributes, gtksourcecompletion, gtksourcehover, gtksourceindenter, gtksourcegutter, gtksourcespacedrawer
{$include gtksourceview/gtksourceprintcompositor.inc}                // io. -> gtksourcebuffer
{$include gtksourceview/gtksourceencoding.inc}                       // io.
{$include gtksourceview/gtksourcefile.inc}                           // io. -> gtksourceencoding
{$include gtksourceview/gtksourcefileloader.inc}                     // io. -> gtksourcebuffer, gtksourcefile, gtksourceencoding
{$include gtksourceview/gtksourcefilesaver.inc}                      // io. -> gtksourcebuffer, gtksourcefile, gtksourceencoding
{$include gtksourceview/gtksourcesearchsettings.inc}                 // io.
{$include gtksourceview/gtksourcesearchcontext.inc}                  // io. -> gtksourcebuffer, gtksourcesearchsettings, gtksourcestyle
{$include gtksourceview/gtksourcegutterrendererpixbuf.inc}           // io. -> gtksourcegutterrenderer
{$include gtksourceview/gtksourcegutterrenderertext.inc}             // io. -> gtksourcegutterrenderer
{$include gtksourceview/gtksourcescheduler.inc}                      // io.
{$include gtksourceview/gtksourcesnippetmanager.inc}                 // io. -> gtksourcesnippet
{$include gtksourceview/gtksourcestyleschemechooser.inc}             // io. -> gtksourcestylescheme
{$include gtksourceview/gtksourcestyleschemepreview.inc}             // io. -> gtksourcestylescheme
{$include gtksourceview/gtksourcevimimcontext.inc}                   // io.
{$include gtksourceview/gtksourceinit.inc}                           // io.
{$include gtksourceview/gtksourcemap.inc}                            // io. -> gtksourceview
{$include gtksourceview/gtksourcestyleschemechooserbutton.inc}       // io.
{$include gtksourceview/gtksourcestyleschemechooserwidget.inc}       // io.
{$include gtksourceview/gtksourcetag.inc}                            // io.
{$include gtksourceview/gtksourceutils.inc}                          // io.

{$include gtksourceview/completion-providers/snippets/gtksourcecompletionsnippets.inc}
{$include gtksourceview/completion-providers/words/gtksourcecompletionwords.inc}



