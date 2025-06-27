int  mgl_check_version(const char *ver);
void  mgl_suppress_warn(int on);
int  mgl_get_warn(HMGL gr);
void  mgl_set_warn(HMGL gr, int code, const char *text);
 const char *mgl_get_mess(HMGL gr);

void  mgl_set_plotid(HMGL gr, const char *id);
 const char *mgl_get_plotid(HMGL gr);

void  mgl_ask_stop(HMGL gr, int stop);
int  mgl_need_stop(HMGL gr);
void  mgl_set_event_func(HMGL gr, void (*func)(void *), void *par);

int  mgl_get_quality(HMGL gr);
void  mgl_set_quality(HMGL gr, int qual);
void  mgl_set_draw_reg(HMGL gr, long nx, long ny, long m);

int  mgl_is_frames(HMGL gr);
int  mgl_get_flag(HMGL gr, uint32_t flag);
void  mgl_set_flag(HMGL gr, int val, uint32_t flag);
long  mgl_use_graph(HMGL gr, int inc);
void  mgl_set_rdc_acc(HMGL gr, int reduce);

void  mgl_start_group(HMGL gr, const char *name);
void  mgl_end_group(HMGL gr);
void  mgl_highlight(HMGL gr, int id);

void  mgl_set_palette(HMGL gr, const char *colors);
void  mgl_set_color(char id, double r, double g, double b);
void  mgl_set_def_sch(HMGL gr, const char *sch);
void  mgl_set_mask(char id, const char *mask);
void  mgl_set_mask_val(char id, uint64_t mask);
void  mgl_set_mask_angle(HMGL gr, int angle);

void  mgl_set_alpha_default(HMGL gr, double alpha);
void  mgl_set_bar_width(HMGL gr, double width);
void  mgl_set_meshnum(HMGL gr, int num);
void  mgl_set_facenum(HMGL gr, int num);
void  mgl_clear_unused(HMGL gr);
void  mgl_set_tex_parse(HMGL gr, int val);

void  mgl_set_ambbr(HMGL gr, double i);
void  mgl_set_difbr(HMGL gr, double i);
void  mgl_set_light_dif(HMGL gr, int enable);

void  mgl_set_cut(HMGL gr, int cut);
void  mgl_set_cut_box(HMGL gr, double x1,double y1,double z1,double x2,double y2,double z2);
void  mgl_set_cutoff(HMGL gr, const char *EqC);

void  mgl_set_ranges(HMGL gr, double x1, double x2, double y1, double y2, double z1, double z2);
void  mgl_set_range_val(HMGL gr, char dir, double v1,double v2);
void  mgl_add_range_val(HMGL gr, char dir, double v1,double v2);
void  mgl_set_range_dat(HMGL gr, char dir, HCDT a, int add);
void  mgl_set_auto_ranges(HMGL gr, double x1, double x2, double y1, double y2, double z1, double z2, double c1, double c2);
void  mgl_zoom_axis(HMGL gr, double x1,double y1,double z1,double c1,double x2,double y2,double z2,double c2);

void  mgl_set_origin(HMGL gr, double x0, double y0, double z0);
void  mgl_set_func(HMGL gr, const char *EqX,const char *EqY,const char *EqZ,const char *EqA);
void  mgl_set_coor(HMGL gr, int how);
void  mgl_set_ternary(HMGL gr, int kind);

void  mgl_set_tick_rotate(HMGL gr, int enable);
void  mgl_set_tick_skip(HMGL gr, int enable);

void  mgl_def_font(const char *name, const char *path);
void  mgl_set_mark_size(HMGL gr, double size);
void  mgl_set_arrow_size(HMGL gr, double size);
void  mgl_set_font_size(HMGL gr, double size);
void  mgl_set_font_def(HMGL gr, const char *fnt);
void  mgl_set_rotated_text(HMGL gr, int enable);
void  mgl_set_scale_text(HMGL gr, int enable);
void  mgl_load_font(HMGL gr, const char *name, const char *path);
void  mgl_copy_font(HMGL gr, HMGL gr_from);
void  mgl_restore_font(HMGL gr);
void  mgl_define_symbol(HMGL gr, char id, HCDT x, HCDT y);

