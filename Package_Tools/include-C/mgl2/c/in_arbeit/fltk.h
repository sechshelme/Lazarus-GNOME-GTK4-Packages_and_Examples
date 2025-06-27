HMGL  mgl_create_graph_fltk(int (*draw)(HMGL gr, void *p), const char *title, void *par, void (*load)(void *p));
int  mgl_fltk_run();
int  mgl_fltk_thr();
void  mgl_ask_fltk(const wchar_t *quest, wchar_t *res);
void  mgl_progress_fltk(int value, int maximal, HMGL gr);
 void *mgl_fltk_widget(HMGL gr);

