program project1;

uses
  fp_lasem,

  lsm,
  lsmtypes,
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
  lsmdomtypes,            // ???
  lsmmathmlenums,
  lsmtraits,
  lsmmathmltraits,
  lsmattributes,
  lsmcairo,
  lsmitex,
  lsmmathmlutils,
  lsmmathmlstyle,
  lsmmathmlpresentationtoken,
  lsmmathmloperatorelement,
  lsmmathmlmathelement,
  lsmmathmldocument,
  lsmmathmlview,
  lsmmathmlattributes,
  lsmmathmlelement,
  lsmmathmlpresentationcontainer,
  lsmmathmlactionelement,
  lsmmathmlaligngroupelement,
  lsmmathmlalignmarkelement,

  lsmmathmlencloseelement,
  lsmmathmlerrorelement,
  lsmmathmlfencedelement,
  lsmmathmlfractionelement,
  lsmmathmlglyphtableams,
  lsmmathmlitexelement,
  lsmmathmllayoututils,
  lsmmathmloperatordictionary,
  lsmmathmlpaddedelement,
  lsmmathmlphantomelement,
  lsmmathmlradicalelement,
  lsmmathmlrowelement,
  //lsmmathmlscriptelement,
  //lsmmathmlsemanticselement,
  //lsmmathmlspaceelement,
  //lsmmathmlstringelement,
  //lsmmathmlstyleelement,
  //lsmmathmltablecellelement,
  //lsmmathmltableelement,
  //lsmmathmltablerowelement,
  //lsmmathmltypes,
  //lsmmathmlunderoverelement,
  //lsmmisc,
  //lsmproperties,
  //lsmstr,
  //lsmsvgaelement,
  //lsmsvgattributes,
  //lsmsvgcircleelement,
  //lsmsvgclippathelement,
  //lsmsvgcolors,
  //lsmsvgdefselement,
  //lsmsvgdocument,
  //lsmsvgelement,
  //lsmsvgellipseelement,
  //lsmsvgenums,
  //lsmsvgfilterblend,
  //lsmsvgfiltercolormatrix,
  //lsmsvgfiltercomposite,
  //lsmsvgfilterconvolvematrix,
  //lsmsvgfilterdisplacementmap,
  //lsmsvgfilterelement,
  //lsmsvgfilterflood,
  //lsmsvgfiltergaussianblur,
  //lsmsvgfilterimage,
  //lsmsvgfiltermerge,
  //lsmsvgfiltermergenode,
  //lsmsvgfiltermorphology,
  //lsmsvgfilteroffset,
  //lsmsvgfilterprimitive,
  //lsmsvgfilterspecularlighting,
  //lsmsvgfiltersurface,
  //lsmsvgfiltertile,
  //lsmsvgfilterturbulence,
  //lsmsvggelement,
  //lsmsvggradientelement,
  //lsmsvgimageelement,
  //lsmsvglength,
  //lsmsvglineargradientelement,
  //lsmsvglineelement,
  //lsmsvgmarkerelement,
  //lsmsvgmaskelement,
  //lsmsvgmatrix,
  //lsmsvgpathelement,
  //lsmsvgpatternelement,
  //lsmsvgpolygonelement,
  //lsmsvgpolylineelement,
  //lsmsvgradialgradientelement,
  //lsmsvgrectelement,
  //lsmsvgstopelement,
  //lsmsvgstyle,
  //lsmsvgsvgelement,
  //lsmsvgswitchelement,
  //lsmsvgsymbolelement,
  //lsmsvgtextelement,
  //lsmsvgtraits,
  //lsmsvgtransformable,
  //lsmsvgtspanelement,
  //lsmsvgtypes,
  //lsmsvguseelement,
  //lsmsvgview,



  fp_GLIBTools,
  fp_glib2;


  procedure main;
  var
    t: TLsmMathmlElement;

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
