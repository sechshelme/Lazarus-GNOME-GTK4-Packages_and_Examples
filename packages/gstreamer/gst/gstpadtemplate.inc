/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstPadPresence = ^TGstPadPresence;
  TGstPadPresence = longint;

const
  GST_PAD_ALWAYS = 0;
  GST_PAD_SOMETIMES = 1;
  GST_PAD_REQUEST = 2;


type
  PGstPadTemplateFlags = ^TGstPadTemplateFlags;
  TGstPadTemplateFlags = longint;

const
  GST_PAD_TEMPLATE_FLAG_LAST = GST_OBJECT_FLAG_LAST shl 4;

type
  TGstPadTemplate = record
    obj: TGstObject;
    name_template: Pgchar;
    direction: TGstPadDirection;
    presence: TGstPadPresence;
    caps: PGstCaps;
    ABI: record
      case longint of
        0: (_gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer);
        1: (abi: record
            gtype: TGType;
            documentation_caps: PGstCaps;
            end);
      end;
  end;
  PGstPadTemplate = ^TGstPadTemplate;

  TGstPadTemplateClass = record
    parent_class: TGstObjectClass;
    //      pad_created : procedure (templ:PGstPadTemplate; pad:PGstPad);cdecl;
    pad_created: procedure(templ: PGstPadTemplate; pad: Pointer); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstPadTemplateClass = ^TGstPadTemplateClass;

  TGstStaticPadTemplate = record
    name_template: Pgchar;
    direction: TGstPadDirection;
    presence: TGstPadPresence;
    static_caps: TGstStaticCaps;
  end;
  PGstStaticPadTemplate = ^TGstStaticPadTemplate;

function gst_pad_template_get_type: TGType; cdecl; external libgstreamer;
function gst_static_pad_template_get_type: TGType; cdecl; external libgstreamer;
function gst_pad_template_new(name_template: Pgchar; direction: TGstPadDirection; presence: TGstPadPresence; caps: PGstCaps): PGstPadTemplate; cdecl; external libgstreamer;
function gst_pad_template_new_with_gtype(name_template: Pgchar; direction: TGstPadDirection; presence: TGstPadPresence; caps: PGstCaps; pad_type: TGType): PGstPadTemplate; cdecl; external libgstreamer;
function gst_static_pad_template_get(pad_template: PGstStaticPadTemplate): PGstPadTemplate; cdecl; external libgstreamer;
function gst_pad_template_new_from_static_pad_template_with_gtype(pad_template: PGstStaticPadTemplate; pad_type: TGType): PGstPadTemplate; cdecl; external libgstreamer;
function gst_static_pad_template_get_caps(templ: PGstStaticPadTemplate): PGstCaps; cdecl; external libgstreamer;
function gst_pad_template_get_caps(templ: PGstPadTemplate): PGstCaps; cdecl; external libgstreamer;
procedure gst_pad_template_set_documentation_caps(templ: PGstPadTemplate; caps: PGstCaps); cdecl; external libgstreamer;
function gst_pad_template_get_documentation_caps(templ: PGstPadTemplate): PGstCaps; cdecl; external libgstreamer;
// procedure gst_pad_template_pad_created(templ:PGstPadTemplate; pad:PGstPad);cdecl;external gstreamerlib;
procedure gst_pad_template_pad_created(templ: PGstPadTemplate; pad: Pointer); cdecl; external libgstreamer;

function GST_TYPE_STATIC_PAD_TEMPLATE: TGType;

function GST_PAD_TEMPLATE_NAME_TEMPLATE(templ: Pointer): Pgchar;
function GST_PAD_TEMPLATE_DIRECTION(templ: Pointer): TGstPadDirection;
function GST_PAD_TEMPLATE_PRESENCE(templ: Pointer): TGstPadPresence;
function GST_PAD_TEMPLATE_CAPS(templ: Pointer): PGstCaps;
function GST_PAD_TEMPLATE_GTYPE(templ: Pointer): TGType;
function GST_PAD_TEMPLATE_IS_FIXED(templ: Pointer): Tgboolean;


// === Konventiert am: 14-9-24 13:52:32 ===

function GST_TYPE_PAD_TEMPLATE: TGType;
function GST_PAD_TEMPLATE(obj: Pointer): PGstPadTemplate;
function GST_PAD_TEMPLATE_CLASS(klass: Pointer): PGstPadTemplateClass;
function GST_IS_PAD_TEMPLATE(obj: Pointer): Tgboolean;
function GST_IS_PAD_TEMPLATE_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PAD_TEMPLATE: TGType;
begin
  GST_TYPE_PAD_TEMPLATE := gst_pad_template_get_type;
end;

function GST_PAD_TEMPLATE(obj: Pointer): PGstPadTemplate;
begin
  Result := PGstPadTemplate(g_type_check_instance_cast(obj, GST_TYPE_PAD_TEMPLATE));
end;

function GST_PAD_TEMPLATE_CLASS(klass: Pointer): PGstPadTemplateClass;
begin
  Result := PGstPadTemplateClass(g_type_check_class_cast(klass, GST_TYPE_PAD_TEMPLATE));
end;

function GST_IS_PAD_TEMPLATE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PAD_TEMPLATE);
end;

function GST_IS_PAD_TEMPLATE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PAD_TEMPLATE);
end;

// ====

function GST_TYPE_STATIC_PAD_TEMPLATE: TGType;
begin
  GST_TYPE_STATIC_PAD_TEMPLATE := gst_static_pad_template_get_type;
end;

function GST_PAD_TEMPLATE_NAME_TEMPLATE(templ: Pointer): Pgchar;
begin
  GST_PAD_TEMPLATE_NAME_TEMPLATE := (PGstPadTemplate(templ))^.name_template;
end;

function GST_PAD_TEMPLATE_DIRECTION(templ: Pointer): TGstPadDirection;
begin
  GST_PAD_TEMPLATE_DIRECTION := (PGstPadTemplate(templ))^.direction;
end;

function GST_PAD_TEMPLATE_PRESENCE(templ: Pointer): TGstPadPresence;
begin
  GST_PAD_TEMPLATE_PRESENCE := (PGstPadTemplate(templ))^.presence;
end;

function GST_PAD_TEMPLATE_CAPS(templ: Pointer): PGstCaps;
begin
  GST_PAD_TEMPLATE_CAPS := (PGstPadTemplate(templ))^.caps;
end;

function GST_PAD_TEMPLATE_GTYPE(templ: Pointer): TGType;
begin
  GST_PAD_TEMPLATE_GTYPE := (PGstPadTemplate(templ))^.ABI.abi.gtype;
end;

// xxxxxxxxxxxxxx
// GST_PAD_TEMPLATE_FIXED im Header nicht findbar

function GST_PAD_TEMPLATE_IS_FIXED(templ: Pointer): Tgboolean;
begin
  //  GST_PAD_TEMPLATE_IS_FIXED:=GST_OBJECT_FLAG_IS_SET(templ,GST_PAD_TEMPLATE_FIXED);
end;


{$ENDIF read_implementation}
