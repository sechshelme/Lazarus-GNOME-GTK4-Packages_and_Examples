void  mgl_set_click_func(HMGL gr, void (*func)(void *p));
void  mgl_wnd_set_mutex(HMGL gr, pthread_mutex_t *mutex);

void  mgl_wnd_make_dialog(HMGL gr, const char *ids, char const * const *args, const char *title);
void  mgl_wnd_set_func(HMGL gr, int (*draw)(HMGL gr, void *p), void *par, void (*reload)(void *p));
void  mgl_wnd_set_prop(HMGL gr, void (*prop)(char id, const char *val, void *p), void *par);
void  mgl_wnd_set_delay(HMGL gr, double dt);
double  mgl_wnd_get_delay(HMGL gr);
void  mgl_setup_window(HMGL gr, int clf_upd, int showpos);
void  mgl_wnd_toggle_alpha(HMGL gr);
void  mgl_wnd_toggle_light(HMGL gr);
void  mgl_wnd_toggle_zoom(HMGL gr);
void  mgl_wnd_toggle_rotate(HMGL gr);
void  mgl_wnd_toggle_no(HMGL gr);
void  mgl_wnd_update(HMGL gr);
void  mgl_wnd_reload(HMGL gr);
void  mgl_wnd_adjust(HMGL gr);
void  mgl_wnd_next_frame(HMGL gr);
void  mgl_wnd_prev_frame(HMGL gr);
void  mgl_wnd_animation(HMGL gr);
void  mgl_get_last_mouse_pos(HMGL gr, mreal *x, mreal *y, mreal *z);
 void *mgl_wnd_window(HMGL gr);
 void *mgl_wnd_widget(HMGL gr);
void  mgl_wnd_move(HMGL gr, int x, int y);
void  mgl_wnd_size(HMGL gr, int w, int h);

