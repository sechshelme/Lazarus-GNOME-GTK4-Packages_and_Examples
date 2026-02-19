program project1;

uses
  libqhull_r_,
  stat_r,
  user_r,
  //geom_r,
  //io_r,
  //mem_r,
  //merge_r,
  //poly_r,
  //qhull_ra,
  //qset_r,
  //random_r,


  fp_qhull_r;

// procedure qh_printsummary(qh:PqhT; fp:PFILE);cdecl;external libqhull_r;


procedure main;
const  points: array[0..8*3-1]of TcoordT = (
    0,0,0,  10,0,0,  0,10,0,  10,10,0,
    0,0,10, 10,0,10, 0,10,10, 10,10,10
);
var
  outfile, errfile: PFILE;
  qh: TqhT;
  facet: PfacetT;
  curlong, totlong: Longint;

begin

//errfile^ := stdout;
//outfile^ := stdout;

//  qhT qh_tmp;
//  qhT *qh = &qh_tmp;

   exitcode := qh_new_qhull(@qh, 3, 8, points, False, 'qhull Qc', stdout, stdout);

  if  exitcode =0 then begin
      WriteLn(#10'Convex Hull Facetten:');

      // ✅ FIX: Explizite Deklaration vor FORALLfacets
      facet := qh.facet_list; // Start

      // Das entspricht exakt dem C-Makro: facet && facet->next
      while (facet <> nil) and (facet^.next <> nil) do
      begin
        Write('Facet ', facet^.id, ': Normal=(');
        Write(facet^.normal[0]:0:1, ','); // :0:1 bedeutet 1 Nachkommastelle
        Write(facet^.normal[1]:0:1, ',');
        Write(facet^.normal[2]:0:1, ')');
        WriteLn;

        facet := facet^.next; // Weiter zum nächsten
      end;
     end;

  qh_freeqhull(@qh, qh_ALL);
  qh_memfreeshort(@qh, @curlong, @totlong);
end;

begin
  main;
end.

