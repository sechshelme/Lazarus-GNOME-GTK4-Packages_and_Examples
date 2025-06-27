extern int mglFitPnts;			///< Number of output points in fitting
extern char mglFitRes[1024];	///< Last fitted formula
HMDT  mgl_fit_1(HMGL gr, HCDT y, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_2(HMGL gr, HCDT z, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_3(HMGL gr, HCDT a, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_xy(HMGL gr, HCDT x, HCDT y, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_xyza(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_ys(HMGL gr, HCDT y, HCDT s, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_xys(HMGL gr, HCDT x, HCDT y, HCDT s, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_xyzs(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT s, const char *eq, const char *vars, HMDT ini, const char *opt);
HMDT  mgl_fit_xyzas(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, HCDT s, const char *eq, const char *vars, HMDT ini, const char *opt);

 const char *mgl_get_fit(HMGL gr);

HMDT  mgl_hist_x(HMGL gr, HCDT x, HCDT a, const char *opt);
HMDT  mgl_hist_xy(HMGL gr, HCDT x, HCDT y, HCDT a, const char *opt);
HMDT  mgl_hist_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *opt);

void  mgl_puts_fit(HMGL gr, double x, double y, double z, const char *prefix, const char *font, double size);
mreal  mgl_get_fit_chi();
HCDT  mgl_get_fit_covar();

