void _mgl_key_up(unsigned char ch,int ,int );
HMGL  mgl_create_graph_glut(int (*draw)(HMGL gr, void *p), const char *title, void *par, void (*load)(void *p));

void  mgl_glut_toggle_alpha(HMGL gr);
void  mgl_glut_toggle_light(HMGL gr);
void  mgl_glut_toggle_no(HMGL gr);
void  mgl_glut_update(HMGL gr);
void  mgl_glut_reload(HMGL gr);
void  mgl_glut_next_frame(HMGL gr);
void  mgl_glut_prev_frame(HMGL gr);
void  mgl_glut_animation(HMGL gr);

