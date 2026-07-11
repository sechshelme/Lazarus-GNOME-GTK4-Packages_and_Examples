
unit gstelementfactory;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstelementfactory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstelementfactory.h
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
Pgchar  = ^gchar;
PGList  = ^GList;
PGstCaps  = ^GstCaps;
PGstElement  = ^GstElement;
PGstElementFactory  = ^GstElementFactory;
PGstElementFactoryListType  = ^GstElementFactoryListType;
PGstPlugin  = ^GstPlugin;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *               2000,2004 Wim Taymans <wim@fluendo.com>
 *
 * gstelementfactory.h: Header for GstElementFactory
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_ELEMENT_FACTORY_H__}
{$define __GST_ELEMENT_FACTORY_H__}
{*
 * GstElementFactory:
 *
 * The opaque #GstElementFactory data structure.
  }
type
{$include <gst/gstconfig.h>}
{$include <gst/gstelement.h>}
{$include <gst/gstpad.h>}
{$include <gst/gstplugin.h>}
{$include <gst/gstpluginfeature.h>}
{$include <gst/gsturi.h>}

{ was #define dname def_expr }
function GST_TYPE_ELEMENT_FACTORY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT_FACTORY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT_FACTORY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ELEMENT_FACTORY_CAST(obj : longint) : PGstElementFactory;

function gst_element_factory_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_find(name:Pgchar):PGstElementFactory;cdecl;external;
function gst_element_factory_get_element_type(factory:PGstElementFactory):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_factory_get_metadata(factory:PGstElementFactory; key:Pgchar):Pgchar;cdecl;external;
function gst_element_factory_get_metadata_keys(factory:PGstElementFactory):^Pgchar;cdecl;external;
function gst_element_factory_get_num_pad_templates(factory:PGstElementFactory):Tguint;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_get_static_pad_templates(factory:PGstElementFactory):PGList;cdecl;external;
function gst_element_factory_get_uri_type(factory:PGstElementFactory):TGstURIType;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function gst_element_factory_get_uri_protocols(factory:PGstElementFactory):^Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_has_interface(factory:PGstElementFactory; interfacename:Pgchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_create(factory:PGstElementFactory; name:Pgchar):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_create_full(factory:PGstElementFactory; first:Pgchar; args:array of const):PGstElement;cdecl;external;
function gst_element_factory_create_full(factory:PGstElementFactory; first:Pgchar):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_create_valist(factory:PGstElementFactory; first:Pgchar; properties:Tva_list):PGstElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_factory_create_with_properties(factory:PGstElementFactory; n:Tguint; names:PPgchar; values:PGValue):PGstElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_factory_make(factoryname:Pgchar; name:Pgchar):PGstElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_factory_make_full(factoryname:Pgchar; first:Pgchar; args:array of const):PGstElement;cdecl;external;
function gst_element_factory_make_full(factoryname:Pgchar; first:Pgchar):PGstElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_factory_make_valist(factoryname:Pgchar; first:Pgchar; properties:Tva_list):PGstElement;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_element_factory_make_with_properties(factoryname:Pgchar; n:Tguint; names:PPgchar; values:PGValue):PGstElement;cdecl;external;
(* Const before type ignored *)
function gst_element_register(plugin:PGstPlugin; name:Pgchar; rank:Tguint; _type:TGType):Tgboolean;cdecl;external;
procedure gst_element_type_set_skip_documentation(_type:TGType);cdecl;external;
function gst_element_factory_get_skip_documentation(factory:PGstElementFactory):Tgboolean;cdecl;external;
{ Factory list functions  }
{*
 * GstFactoryListType:
 * @GST_ELEMENT_FACTORY_TYPE_DECODER: Decoder elements
 * @GST_ELEMENT_FACTORY_TYPE_ENCODER: Encoder elements
 * @GST_ELEMENT_FACTORY_TYPE_SINK: Sink elements
 * @GST_ELEMENT_FACTORY_TYPE_SRC: Source elements
 * @GST_ELEMENT_FACTORY_TYPE_MUXER: Muxer elements
 * @GST_ELEMENT_FACTORY_TYPE_DEMUXER: Demuxer elements
 * @GST_ELEMENT_FACTORY_TYPE_PARSER: Parser elements
 * @GST_ELEMENT_FACTORY_TYPE_PAYLOADER: Payloader elements
 * @GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER: Depayloader elements
 * @GST_ELEMENT_FACTORY_TYPE_DECRYPTOR: Elements handling decryption (Since: 1.6)
 * @GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR: Elements handling encryption (Since: 1.6)
 * @GST_ELEMENT_FACTORY_TYPE_HARDWARE: Hardware based elements (Since: 1.18)
 * @GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS: Private, do not use
 * @GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO: Elements handling video media types
 * @GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO: Elements handling audio media types
 * @GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE: Elements handling image media types
 * @GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE: Elements handling subtitle media types
 * @GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA: Elements handling metadata media types
 *
 * The type of #GstElementFactory to filter.
 *
 * All @GstFactoryListType up to @GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS are exclusive.
 *
 * If one or more of the MEDIA types are specified, then only elements
 * matching the specified media types will be selected.
  }
{*
 * GstElementFactoryListType:
 *
 * A type defining the type of an element factory.
  }
type
  PGstElementFactoryListType = ^TGstElementFactoryListType;
  TGstElementFactoryListType = Tguint64;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECODER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ENCODER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_SINK : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_SRC : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MUXER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DEMUXER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_PARSER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_PAYLOADER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_FORMATTER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECRYPTOR : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_HARDWARE : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER:
 *
 * Timestamp correcting elements
 *
 * Since: 1.24
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE : TGstElementFactoryListType;  

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_ANY: (value 562949953421311) (type GstElementFactoryListType)
 *
 * Elements of any of the defined GST_ELEMENT_FACTORY_LIST types
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ANY : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY: (value 18446462598732840960) (type GstElementFactoryListType)
 *
 * Elements matching any of the defined GST_ELEMENT_FACTORY_TYPE_MEDIA types
 *
 * Note: Do not use this if you wish to not filter against any of the defined
 * media types. If you wish to do this, simply don't specify any
 * GST_ELEMENT_FACTORY_TYPE_MEDIA flag.
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER: (value 2814749767106562) (type GstElementFactoryListType)
 *
 * All encoders handling video or image media types
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER: (value 1125899906842626) (type GstElementFactoryListType)
 *
 * All encoders handling audio media types
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS: (value 3940649673949188) (type GstElementFactoryListType)
 *
 * All sinks handling audio, video or image media types
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS : TGstElementFactoryListType;  

{*
 * GST_ELEMENT_FACTORY_TYPE_DECODABLE: (value 1377) (type GstElementFactoryListType)
 *
 * All elements used to 'decode' streams (decoders, demuxers, parsers, depayloaders)
  }
{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECODABLE : TGstElementFactoryListType;  

{ Element klass defines  }
const
  GST_ELEMENT_FACTORY_KLASS_DECODER = 'Decoder';  
  GST_ELEMENT_FACTORY_KLASS_ENCODER = 'Encoder';  
  GST_ELEMENT_FACTORY_KLASS_SINK = 'Sink';  
  GST_ELEMENT_FACTORY_KLASS_SRC = 'Source';  
  GST_ELEMENT_FACTORY_KLASS_MUXER = 'Muxer';  
  GST_ELEMENT_FACTORY_KLASS_DEMUXER = 'Demuxer';  
  GST_ELEMENT_FACTORY_KLASS_PARSER = 'Parser';  
  GST_ELEMENT_FACTORY_KLASS_PAYLOADER = 'Payloader';  
  GST_ELEMENT_FACTORY_KLASS_DEPAYLOADER = 'Depayloader';  
  GST_ELEMENT_FACTORY_KLASS_FORMATTER = 'Formatter';  
  GST_ELEMENT_FACTORY_KLASS_DECRYPTOR = 'Decryptor';  
  GST_ELEMENT_FACTORY_KLASS_ENCRYPTOR = 'Encryptor';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_VIDEO = 'Video';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_AUDIO = 'Audio';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_IMAGE = 'Image';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_SUBTITLE = 'Subtitle';  
  GST_ELEMENT_FACTORY_KLASS_MEDIA_METADATA = 'Metadata';  
{*
 * GST_ELEMENT_FACTORY_KLASS_HARDWARE:
 *
 * Elements interacting with hardware devices should specify this classifier in
 * their metadata. You may need to put the element in "READY" state to test if
 * the hardware is present in the system.
 *
 * Since: 1.16
  }
  GST_ELEMENT_FACTORY_KLASS_HARDWARE = 'Hardware';  

function gst_element_factory_list_is_type(factory:PGstElementFactory; _type:TGstElementFactoryListType):Tgboolean;cdecl;external;
function gst_element_factory_list_get_elements(_type:TGstElementFactoryListType; minrank:TGstRank):PGList;cdecl;external;
(* Const before type ignored *)
function gst_element_factory_list_filter(list:PGList; caps:PGstCaps; direction:TGstPadDirection; subsetonly:Tgboolean):PGList;cdecl;external;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstElementFactory, gst_object_unref) }
{$endif}
{ __GST_ELEMENT_FACTORY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_ELEMENT_FACTORY : longint; { return type might be wrong }
  begin
    GST_TYPE_ELEMENT_FACTORY:=gst_element_factory_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_FACTORY(obj : longint) : longint;
begin
  GST_ELEMENT_FACTORY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ELEMENT_FACTORY,GstElementFactory);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ELEMENT_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_ELEMENT_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_ELEMENT_FACTORY,GstElementFactoryClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT_FACTORY(obj : longint) : longint;
begin
  GST_IS_ELEMENT_FACTORY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ELEMENT_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ELEMENT_FACTORY_CLASS(klass : longint) : longint;
begin
  GST_IS_ELEMENT_FACTORY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_ELEMENT_FACTORY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_ELEMENT_FACTORY_CAST(obj : longint) : PGstElementFactory;
begin
  GST_ELEMENT_FACTORY_CAST:=PGstElementFactory(obj);
end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DECODER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 0);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ENCODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_ENCODER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 1);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_SINK : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_SINK:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 2);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_SRC : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_SRC:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 3);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MUXER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MUXER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 4);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DEMUXER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DEMUXER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 5);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_PARSER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_PARSER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 6);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_PAYLOADER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_PAYLOADER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 7);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 8);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_FORMATTER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_FORMATTER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 9);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECRYPTOR : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DECRYPTOR:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 10);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 11);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_HARDWARE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_HARDWARE:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 12);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 13);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 48);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 49);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 50);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 51);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 52);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA:=TGstElementFactoryListType((G_GUINT64_CONSTANT(1)) shl 53);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_ANY : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_ANY:=TGstElementFactoryListType(((G_GUINT64_CONSTANT(1)) shl 49)-1);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY:=TGstElementFactoryListType(( not (G_GUINT64_CONSTANT(0))) shl 48);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER:=TGstElementFactoryListType((GST_ELEMENT_FACTORY_TYPE_ENCODER or GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO) or GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER:=TGstElementFactoryListType(GST_ELEMENT_FACTORY_TYPE_ENCODER or GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS:=TGstElementFactoryListType(((GST_ELEMENT_FACTORY_TYPE_SINK or GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO) or GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO) or GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE);
  end;

{ was #define dname def_expr }
function GST_ELEMENT_FACTORY_TYPE_DECODABLE : TGstElementFactoryListType;
  begin
    GST_ELEMENT_FACTORY_TYPE_DECODABLE:=TGstElementFactoryListType((((GST_ELEMENT_FACTORY_TYPE_DECODER or GST_ELEMENT_FACTORY_TYPE_DEMUXER) or GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER) or GST_ELEMENT_FACTORY_TYPE_PARSER) or GST_ELEMENT_FACTORY_TYPE_DECRYPTOR);
  end;


end.
