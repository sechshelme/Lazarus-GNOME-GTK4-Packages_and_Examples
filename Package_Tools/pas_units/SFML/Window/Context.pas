unit Context;

interface

uses
  fp_sfml;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_CONTEXT_H}
{$define SFML_CONTEXT_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Window/Export.h>}
{$include <SFML/Window/Types.h>}
{$include <SFML/Window/Window.h>}
type

  TGlFunctionPointer = procedure (para1:pointer);cdecl;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new context }
{/ }
{/ This function activates the new context. }
{/ }
{/ \return New sfContext object }
{/ }
{////////////////////////////////////////////////////////// }

function sfContext_create:PsfContext;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a context }
{/ }
{/ \param context Context to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfContext_destroy(context:PsfContext);cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Check whether a given OpenGL extension is available. }
{/ }
{/ \param Name of the extension to check for }
{/ }
{/ \return True if available, false if unavailable }
{/ }
{////////////////////////////////////////////////////////// }
function sfContext_isExtensionAvailable(name:Pchar):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Activate or deactivate explicitely a context }
{/ }
{/ \param context Context object }
{/ \param active  sfTrue to activate, sfFalse to deactivate }
{/ }
{/ \return sfTrue on success, sfFalse on failure }
{/ }
{////////////////////////////////////////////////////////// }
function sfContext_setActive(context:PsfContext; active:TsfBool):TsfBool;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get the address of an OpenGL function. }
{/ }
{/ \param name Name of the function to get the address of }
{/ }
{/ \return Address of the OpenGL function, 0 on failure }
{/ }
{////////////////////////////////////////////////////////// }
function sfContext_getFunction(name:Pchar):TGlFunctionPointer;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get the settings of the context. }
{/ }
{/ Note that these settings may be different than the ones passed to the }
{/ constructor; they are indeed adjusted if the original settings are not }
{/ directly supported by the system. }
{/ }
{/ \return Structure containing the settings }
{/ }
{////////////////////////////////////////////////////////// }
function sfContext_getSettings(context:PsfContext):TsfContextSettings;cdecl;external libsfml_window;
{////////////////////////////////////////////////////////// }
{/ \brief Get the currently active context's ID }
{/ }
{/ The context ID is used to identify contexts when }
{/ managing unshareable OpenGL resources. }
{/ }
{/ \return The active context's ID or 0 if no context is currently active }
{/ }
{////////////////////////////////////////////////////////// }
function sfContext_getActiveContextId:TsfUint64;cdecl;external libsfml_window;
{$endif}
{ SFML_CONTEXT_H }

// === Konventiert am: 24-9-25 16:58:29 ===


implementation



end.
