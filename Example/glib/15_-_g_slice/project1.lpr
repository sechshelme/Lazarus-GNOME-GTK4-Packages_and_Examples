program project1;

uses
  ctypes,
  fp_glib2;

// https://www.perplexity.ai/search/was-ist-g-slice-6F25hzekRAqwIExAlQCDXA

type
  THuman=record
    name:Pgchar;
    age:Tgint;
  end;  PHuman=^THuman;

  function main(argc: cint; argv: PPChar): cint;
  var num_people:Integer=3;
    people: PHuman;
  begin
 human_slice  g_slice_alloc(SizeOf(THuman));
 people:=g_slice_alloc0(num_people*SizeOf(THuman));



  end;

begin
  main(argc, argv);
end.
