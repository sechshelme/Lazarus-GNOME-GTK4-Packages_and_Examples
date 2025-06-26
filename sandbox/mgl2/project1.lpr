program project1;

// mglDataA = Pointer ?????     canvas_cg.h
// mglNum = Pointer ????        canvas_cg.h,

uses
  mgl_command,
  define,             // io.
  abstract,           // io.
  plot,               // io.
  canvas_cf,          // io.
  cont,               // io.
  data_cf,            // io.
  datac_cf,           // io.
  prim,               // io.
  vect,               // io.

  qt,                 // io.




  math;

  function sample(gr: THMGL; p: pointer): longint;
  begin
    mgl_rotate(gr, 60, 40, 0);
    mgl_box(gr);
  end;

  procedure main;
  var
    gr: THMGL;
  begin
    gr := mgl_create_graph_qt(@sample, 'MathGL Example', nil, nil);

    if gr = nil then begin
      WriteLn('Fehler');
    end;
    mgl_qt_run();
    mgl_delete_graph(gr);
  end;


begin
//  mgl_contv_gen(nil,0,0,nil,nil,nil,nil,nil);
//  mgl_axial_gen(nil,0,0,nil,nil,nil,nil,nil);

  main;
end.
////#include <mgl2/mgl_cf.h>////int sample(HMGL gr, void *param) {//    mgl_rotate(gr, 60, 40, 0);//    mgl_box(gr);//    return 0;//}////int main(int argc, char **argv) {//    HMGL gr = mgl_create_graph_qt(sample, "MathGL Beispiel", 0, 0);//    if (gr == NULL) {//        // Fehlerbehandlung falls Initialisierung fehlschlägt//        return 1;//    }//    mgl_qt_run();//    mgl_delete_graph(gr);//    return 0;//}
