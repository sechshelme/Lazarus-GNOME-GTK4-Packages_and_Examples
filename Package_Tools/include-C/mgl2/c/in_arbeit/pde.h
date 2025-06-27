HADT  mgl_pde_solve_c(HMGL gr, const char *ham, HCDT ini_re, HCDT ini_im, mreal dz, mreal k0,const char *opt);
HMDT  mgl_pde_solve(HMGL gr, const char *ham, HCDT ini_re, HCDT ini_im, mreal dz, mreal k0,const char *opt);

HADT  mgl_pde_adv_c(HMGL gr, const char *ham, HCDT ini_re, HCDT ini_im, mreal dz, mreal k0,const char *opt);
HMDT  mgl_pde_adv(HMGL gr, const char *ham, HCDT ini_re, HCDT ini_im, mreal dz, mreal k0,const char *opt);

HADT  mgl_qo2d_solve_c(const char *ham, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy);
HADT  mgl_qo2d_func_c(mdual (*ham)(mreal u, mreal x, mreal y, mreal px, mreal py, void *par), void *par, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy);
HMDT  mgl_qo2d_solve(const char *ham, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy);
HMDT  mgl_qo2d_func(mdual (*ham)(mreal u, mreal x, mreal y, mreal px, mreal py, void *par), void *par, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy);

HADT  mgl_qo3d_solve_c(const char *ham, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy, HMDT zz);
HADT  mgl_qo3d_func_c(mdual (*ham)(mreal u, mreal x, mreal y, mreal z, mreal px, mreal py, mreal pz, void *par), void *par, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy, HMDT zz);
HMDT  mgl_qo3d_solve(const char *ham, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy, HMDT zz);
HMDT  mgl_qo3d_func(mdual (*ham)(mreal u, mreal x, mreal y, mreal z, mreal px, mreal py, mreal pz, void *par), void *par, HCDT ini_re, HCDT ini_im, HCDT ray, mreal r, mreal k0, HMDT xx, HMDT yy, HMDT zz);

HMDT  mgl_ode_solve(void (*func)(const mreal *x, mreal *dx, void *par), int n, const mreal *x0, mreal dt, mreal tmax, void *par);
HMDT  mgl_ode_solve_str(const char *func, const char *var, HCDT x0, mreal dt, mreal tmax);
HADT  mgl_ode_solve_str_c(const char *func, const char *var, HCDT x0, mreal dt, mreal tmax);
HMDT  mgl_ode_solve_set(const char *func, const char *var, char brd, HCDT x0, mreal dt, mreal tmax);
HADT  mgl_ode_solve_set_c(const char *func, const char *var, char brd, HCDT x0, mreal dt, mreal tmax);
HMDT  mgl_ode_solve_ex(void (*func)(const mreal *x, mreal *dx, void *par), int n, const mreal *x0, mreal dt, mreal tmax, void *par, void (*bord)(mreal *x, const mreal *xp, void *par));
HMDT  mgl_ray_trace(const char *ham, mreal x0, mreal y0, mreal z0, mreal px, mreal py, mreal pz, mreal dt, mreal tmax);

HMDT  mgl_jacobian_2d(HCDT x, HCDT y);
HMDT  mgl_jacobian_3d(HCDT x, HCDT y, HCDT z);

