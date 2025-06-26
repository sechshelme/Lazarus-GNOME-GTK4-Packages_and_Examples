program project1;

// mglDataA = Pointer ?????     canvas_cg.h
// mglNum = Pointer ????        canvas_cg.h,

uses
  mgl_command,
  define,             // io.
  abstract,           // io.
  plot,               // io. -> abstract

  qt,



  math;

function sample(gr: THMGL; p: pointer): longint;
begin

end;

procedure main;
var
  gr: THMGL;
begin
  gr:=mgl_create_graph_qt(@sample, 'MathGL Example',nil,nil);
end;


begin
  main;
end.


//
//#include <mgl2/mgl_cf.h>
//
//int sample(HMGL gr, void *param) {
//    mgl_rotate(gr, 60, 40, 0);
//    mgl_box(gr);
//    return 0;
//}
//
//int main(int argc, char **argv) {
//    HMGL gr = mgl_create_graph_qt(sample, "MathGL Beispiel", 0, 0);
//    if (gr == NULL) {
//        // Fehlerbehandlung falls Initialisierung fehlschlägt
//        return 1;
//    }
//    mgl_qt_run();
//    mgl_delete_graph(gr);
//    return 0;
//}


