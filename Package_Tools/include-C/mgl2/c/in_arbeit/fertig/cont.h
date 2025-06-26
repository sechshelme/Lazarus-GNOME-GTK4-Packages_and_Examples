void  mgl_text_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, const char *text, const char *font, const char *opt);
void  mgl_textw_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, const wchar_t *text, const char *font, const char *opt);
void  mgl_text_xy(HMGL gr, HCDT x, HCDT y, const char *text, const char *font, const char *opt);
void  mgl_textw_xy(HMGL gr, HCDT x, HCDT y, const wchar_t *text, const char *font, const char *opt);
void  mgl_text_y(HMGL gr, HCDT y, const char *text, const char *font, const char *opt);
void  mgl_textw_y(HMGL gr, HCDT y, const wchar_t *text, const char *font, const char *opt);

void  mgl_dcont_gen(HMGL gr, double val, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const char *sch, const char *opt);
void  mgl_cont_gen(HMGL gr, double val, HCDT a, HCDT x, HCDT y, HCDT z, const char *stl, const char *opt);
void  mgl_contf_gen(HMGL gr, double v1, double v2, HCDT a, HCDT x, HCDT y, HCDT z, const char *stl, const char *opt);
// ???????????????????????????
void  mgl_contv_gen(HMGL gr, double v1, double v2, HCDT a, HCDT x, HCDT y, HCDT z, const char *stl);
void  mgl_axial_gen(HMGL gr, double v1, double v2, HCDT a, HCDT x, HCDT y, HCDT z, const char *stl);
// ???????????????????????????

void  mgl_dcont_xyz(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const char *sch, const char *opt);
void  mgl_dcont(HMGL gr, HCDT v, HCDT a, HCDT b, const char *sch, const char *opt);

void  mgl_cont_xy_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_cont_val(HMGL gr, HCDT v, HCDT z, const char *sch, const char *opt);
void  mgl_cont_xy(HMGL gr, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_cont(HMGL gr, HCDT z, const char *sch, const char *opt);

void  mgl_contf_xy_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_contf_val(HMGL gr, HCDT v, HCDT z, const char *sch, const char *opt);
void  mgl_contf_xy(HMGL gr, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_contf(HMGL gr, HCDT z, const char *sch, const char *opt);

void  mgl_contd_xy_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_contd_val(HMGL gr, HCDT v, HCDT z, const char *sch, const char *opt);
void  mgl_contd_xy(HMGL gr, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_contd(HMGL gr, HCDT z, const char *sch, const char *opt);

void  mgl_contv_xy_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_contv_val(HMGL gr, HCDT v, HCDT z, const char *sch, const char *opt);
void  mgl_contv_xy(HMGL gr, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_contv(HMGL gr, HCDT z, const char *sch, const char *opt);

void  mgl_contp_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, const char *opt);
void  mgl_contp(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, const char *opt);

void  mgl_axial_xy_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT a, const char *sch, const char *opt);
void  mgl_axial_val(HMGL gr, HCDT v, HCDT a, const char *sch, const char *opt);
void  mgl_axial_xy(HMGL gr, HCDT x, HCDT y, HCDT a, const char *sch, const char *opt);
void  mgl_axial(HMGL gr, HCDT a, const char *sch, const char *opt);

void  mgl_torus(HMGL gr, HCDT r, HCDT z, const char *col, const char *opt);

void  mgl_grid3_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_grid3(HMGL gr, HCDT a, const char *stl, double sVal, const char *opt);

void  mgl_dens3_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_dens3(HMGL gr, HCDT a, const char *stl, double sVal, const char *opt);

void  mgl_cont3_xyz_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, double sVal, const char *opt);
void  mgl_cont3_val(HMGL gr, HCDT v, HCDT a, const char *sch, double sVal, const char *opt);
void  mgl_cont3_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, double sVal, const char *opt);
void  mgl_cont3(HMGL gr, HCDT a, const char *sch, double sVal, const char *opt);

void  mgl_contf3_xyz_val(HMGL gr, HCDT v, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, double sVal, const char *opt);
void  mgl_contf3_val(HMGL gr, HCDT v, HCDT a, const char *sch, double sVal, const char *opt);
void  mgl_contf3_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, double sVal, const char *opt);
void  mgl_contf3(HMGL gr, HCDT a, const char *sch, double sVal, const char *opt);

