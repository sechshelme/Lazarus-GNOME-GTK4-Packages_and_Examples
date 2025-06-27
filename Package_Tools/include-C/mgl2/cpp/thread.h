struct mglThreadD
{
	mreal *a;		// float* array with parameters or results
	const mreal *b,*c,*d,*e;	// float* arrays with parameters
	const long *p;	// long* array with parameters
	const void *v;	// pointer to data/grapher
	int id;			// thread id
	long n;			// total number of iteration
	const char *s;
};
struct mglThreadC
{
	dual *a;		// dual* array with parameters or results
	const dual *b,*c,*d,*e;	// dual* arrays with parameters
	const long *p;	// long* array with parameters
	const void *v;	// pointer to data/grapher
	int id;			// thread id
	long n;			// total number of iteration
	const char *s;
};
struct mglThreadV
{
	mreal *a;		// float* array with parameters or results
	dual *aa;		// dual* array with parameters or results
	const void *b,*c;	// float* arrays with parameters
	const mreal *d;	// float* arrays with parameters
	const long *p;	// long* array with parameters
	const void *v;	// pointer to data/grapher
	int id;			// thread id
	long n;			// total number of iteration
};
struct mglThreadT
{
	void *a; 		// dual* or mreal* array with input or results
	double *b; 		// dual* array with input or results
	const long *p;	// long* array with parameters
	const void *v;	// pointer to table/parameter
	void **w; 		// pointer to workspace
	int id;			// thread id
	long n;			// total number of iteration
	const void *re,*im;
};
void  mglStartThread(void *(*func)(void *), void (*post)(mglThreadD *,mreal *), long n,	mreal *a=0, const mreal *b=0, const mreal *c=0, const long *p=0,const void *v=0, const mreal *d=0, const mreal *e=0, const char *s=0);
void  mglStartThreadV(void *(*func)(void *), long n, mreal *a, const void *b=0,
					const void *c=0, const long *p=0, const void *v=0, const mreal *d=0);
void  mglStartThreadV(void *(*func)(void *), long n, dual *a, const void *b=0,
					const void *c=0, const long *p=0, const void *v=0, const mreal *d=0);
void  mglStartThreadC(void *(*func)(void *), void (*post)(mglThreadC *,dual *), long n,
					dual *a=0, const dual *b=0, const dual *c=0, const long *p=0,
					const void *v=0, const dual *d=0, const dual *e=0, const char *s=0);
void  mglStartThreadT(void *(*func)(void *), long n, void *a, double *b, const void *v=0,
					void **w=0, const long *p=0, const void *re=0, const void *im=0);
 extern int mglNumThr;		///< Number of thread for plotting and data handling

