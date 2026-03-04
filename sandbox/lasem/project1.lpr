program project1;

uses
  fp_lasem,

  lsm,
  lsmdebug,
  lsmdomentities,
  lsmutils,
  lsmdomnode,
  lsmdomnodelist,
  lsmdomelement,
  lsmdomcharacterdata,
  lsmdomtext,
  lsmdomview,
  lsmdomdocument,
  lsmdomdocumentfragment,
  lsmdomimplementation,
  lsmdomnamednodemap,
  lsmdomparser,
  lsmmathmlenums,
  lsmtraits,
  lsmmathmltraits,
  lsmattributes,
  lsmcairo,
  lsmitex,
  lsmmisc,
  lsmproperties,
  lsmstr,                               // static inline
  lsmmathmlutils,
  lsmmathmlstyle,
  lsmmathmlpresentationtoken,
  lsmmathmlpresentationcontainer,
  lsmmathmlactionelement,
  lsmmathmlaligngroupelement,
  lsmmathmlencloseelement,
  lsmmathmlerrorelement,
  lsmmathmlfencedelement,
  lsmmathmlpaddedelement,
  lsmmathmlrowelement,
  lsmmathmlstringelement,
  lsmmathmlstyleelement,
  lsmmathmlmathelement,                  // lsmmathmlutils, lsmmathmlstyle
  lsmmathmloperatorelement,              // lsmmathmlmathelement
  lsmmathmldocument,                     // lsmmathmlmathelement
  lsmmathmlattributes,                   // lsmmathmltraits, lsmmathmlstyle
  lsmmathmlelement,                      // lsmmathmlenums, lsmmathmlutils, lsmmathmlstyle, lsmmathmloperatorelement, lsmmathmlmathelement
  lsmmathmlview,                         // lsmmathmlenums, lsmmathmlutils, lsmmathmldocument, lsmmathmlmathelement, lsmmathmlstyle, lsmmathmlelement;
  lsmmathmlalignmarkelement,             // lsmmathmlelement
  lsmmathmlfractionelement,              // lsmmathmlelement
  lsmmathmlphantomelement,               // lsmmathmlelement
  lsmmathmlsemanticselement,             // lsmmathmlelement
  lsmmathmlitexelement,                  // lsmmathmlelement
  lsmmathmlglyphtableams,                // lsmmathmlview
  lsmmathmllayoututils,                  // lsmmathmlenums, lsmmathmltraits
  lsmmathmloperatordictionary,           // lsmmathmlenums, lsmmathmltraits
  lsmmathmlradicalelement,               // lsmmathmlelement, lsmmathmlutils
  lsmmathmlscriptelement,                // lsmmathmlelement, lsmmathmlenums, lsmmathmlattributes
  lsmmathmlspaceelement,                 // lsmmathmlelement, lsmmathmlattributes
  lsmmathmltablecellelement,             // lsmmathmlelement, lsmmathmlattributes
  lsmmathmltableelement,                 // lsmmathmlelement, lsmmathmlattributes
  lsmmathmltablerowelement,              // lsmmathmlelement
  lsmmathmlunderoverelement,             // lsmmathmlelement, lsmmathmlattributes
  lsmsvgenums,
  lsmsvgcolors,
  lsmsvgmatrix,
  lsmsvglength,                        // lsmsvgenums
  lsmsvgtraits,                        // lsmsvgenums, lsmsvglength
  lsmsvgattributes,                    // lsmsvgenums, lsmsvgtraits, lsmsvglength, lsmsvgmatrix
  lsmsvgview,                          // lsmsvgenums, lsmsvgmatrix, lsmsvglength, lsmsvgtraits
  lsmsvgsvgelement,                    // lsmsvgview
  lsmsvgelement,                       // lsmsvgview
  lsmsvgdocument,                      // lsmsvgsvgelement, lsmsvgview
  lsmsvgtransformable,                 // lsmsvgelement, lsmsvgattributes
  lsmsvgaelement,                      // lsmsvgtransformable
  lsmsvgdefselement,                   // lsmsvgtransformable
  lsmsvgcircleelement,                 // lsmsvgattributes, lsmsvgtransformable
  lsmsvgclippathelement,               // lsmsvgattributes, lsmsvgtransformable
  lsmsvgellipseelement,                // lsmsvgattributes, lsmsvgtransformable
  lsmsvgfilterprimitive,               // lsmsvgelement, lsmsvgattributes, lsmsvglength
  lsmsvgfilterblend,                   // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfiltercolormatrix,             // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfiltercomposite,               // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfilterconvolvematrix,          // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfilterdisplacementmap,         // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfilterelement,                 // lsmsvgattributes, lsmsvgelement
  lsmsvgfilterflood,                   // lsmsvgfilterprimitive
  lsmsvgfiltergaussianblur,            // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfilterimage,                   // lsmsvgfilterprimitive, lsmsvgattributes
  lsmsvgfiltermerge,                   // lsmsvgfilterprimitive
  lsmsvgfiltermergenode,
  lsmsvgfiltermorphology,
  lsmsvgfilteroffset,
  lsmsvgfilterspecularlighting,
  lsmsvgfiltersurface,
  lsmsvgfiltertile,
  lsmsvgfilterturbulence,
  lsmsvggelement,
  lsmsvggradientelement,
  lsmsvgimageelement,
  lsmsvglineargradientelement,
  lsmsvglineelement,
  lsmsvgmarkerelement,
  lsmsvgmaskelement,
  lsmsvgpathelement,
  lsmsvgpatternelement,
  lsmsvgpolygonelement,
  lsmsvgpolylineelement,
  lsmsvgradialgradientelement,
  lsmsvgrectelement,
  lsmsvgstopelement,
  lsmsvgstyle,
  lsmsvgswitchelement,
  lsmsvgsymbolelement,
  lsmsvgtextelement,
  lsmsvgtspanelement,
  lsmsvguseelement,


  fp_GLIBTools,
  fp_glib2;


  procedure main;
  var
    t: TLsmMathmlElement;
    c:TLsmSvgPaint    ;

    p1: Pointer;
  begin
    p1 := g_object_new(LSM_TYPE_MATHML_MATH_ELEMENT, nil);
    GObjectShowProperty(p1);
    p1 := g_object_new(LSM_TYPE_MATHML_PRESENTATION_TOKEN, nil);
    GObjectShowProperty(p1);
    p1 := g_object_new(LSM_TYPE_MATHML_ALIGN_GROUP_ELEMENT, nil);
    GObjectShowProperty(p1);
  //  p1 := g_object_new(LSM_TYPE_MATHML_PRESENTATION_CONTAINER, nil);
//    GObjectShowProperty(p1);

  end;

begin
  main;
end.
