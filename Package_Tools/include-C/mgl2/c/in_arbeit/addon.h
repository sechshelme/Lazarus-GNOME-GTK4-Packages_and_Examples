double  mgl_gauss_rnd();
void  mgl_fft_freq(double *freq,long nn);

void  mgl_strcls(char *str);
long  mgl_strpos(const char *str,char *fnd);
long  mgl_chrpos(const char *str,char fnd);

 char *mgl_fgetstr(FILE *fp);
void  mgl_fgetpar(FILE *fp, const char *str, ...);
int  mgl_istrue(char ch);
void  mgl_test(const char *str, ...);
void  mgl_info(const char *str, ...);
 FILE *mgl_next_data(const char *fname,long p);
void  mgl_fgetstr_mgl(int enable);


