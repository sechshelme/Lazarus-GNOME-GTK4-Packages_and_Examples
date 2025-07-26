


{$include ibus/ibustypes.inc}              // io.
{$include ibus/ibusenumtypes.inc}          // io.
{$include ibus/ibuskeysyms.inc}            // io.
{$include ibus/ibuskeysyms_compat.inc}     // io.
{$include ibus/ibusshare.inc}              // io.
{$include ibus/ibusxml.inc}                // io.
{$include ibus/ibusobject.inc}             // io.
{$include ibus/ibusproxy.inc}              // io. -> ibusobject
{$include ibus/ibusconfig.inc}             // io. -> ibusproxy
{$include ibus/ibusserializable.inc}       // io. -> ibusobject
{$include ibus/ibusservice.inc}            // io. -> ibusobject
{$include ibus/ibuskeymap.inc}             // io. -> ibusobject
{$include ibus/ibusconfigservice.inc}      // io. -> ibusservice
{$include ibus/ibusxevent.inc}             // io. -> ibusserializable
{$include ibus/ibusattribute.inc}          // io. -> ibusserializable
{$include ibus/ibusregistry.inc}           // io. -> ibusserializable
{$include ibus/ibusunicode.inc}            // io. -> ibusserializable
{$include ibus/ibushotkey.inc}             // io. -> ibusserializable
{$include ibus/ibusemoji.inc}              // io. -> ibusserializable
{$include ibus/ibusattrlist.inc}           // io. -> ibusserializable, ibusattribute
{$include ibus/ibustext.inc}               // io. -> ibusserializable, ibusattrlist
{$include ibus/ibuslookuptable.inc}        // io. -> ibusserializable, ibustext
{$include ibus/ibusproperty.inc}           // io. -> ibusserializable, ibustext
{$include ibus/ibusproplist.inc}           // io. -> ibusserializable, ibusproperty
{$include ibus/ibusengine.inc}             // io. -> ibusservice, ibustypes, ibustext, ibuslookuptable, ibusproperty
{$include ibus/ibusenginedesc.inc}         // io. -> ibusserializable, ibusxml
{$include ibus/ibusenginesimple.inc}       // io. -> ibusengine, ibuskeysyms
{$include ibus/ibuscomponent.inc}          // io. -> ibusserializable, ibusxml, ibusenginedesc
{$include ibus/ibusinputcontext.inc}       // io. -> ibusproxy, ibusenginedesc, ibustext
{$include ibus/ibusbus.inc}                // io. -> ibusobject, ibusinputcontext, ibuscomponent, ibusenginedesc, ibusconfig, ibusxevent
{$include ibus/ibuspanelservice.inc}       // io. -> ibusservice, ibusproperty, ibustext, ibuslookuptable, ibusxevent
{$include ibus/ibusfactory.inc}            // io. -> ibusservice, ibusengine
{$include ibus/ibusobservedpath.inc}       // io. -> ibusserializable, ibusxml
{$include ibus/ibusaccelgroup.inc}         // io. -> ibustypes
{$include ibus/ibuserror.inc}              // io.
{$include ibus/ibuskeys.inc}               // io.
{$include ibus/ibusutil.inc}               // io.
{$include ibus/ibusversion.inc}            // io.


