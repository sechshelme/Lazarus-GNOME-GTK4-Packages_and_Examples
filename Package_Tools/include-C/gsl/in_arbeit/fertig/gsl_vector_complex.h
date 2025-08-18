#ifndef __GSL_VECTOR_COMPLEX_H__
#define __GSL_VECTOR_COMPLEX_H__

#define  GSL_VECTOR_REAL(z, i)  ((z)->data[2*(i)*(z)->stride])
#define  GSL_VECTOR_IMAG(z, i)  ((z)->data[2*(i)*(z)->stride + 1])


// xxxxxxxxxxxx #define GSL_VECTOR_COMPLEX(zv, i) (*GSL_COMPLEX_AT((zv),(i)))

#define GSL_COMPLEX_AT(zv,i) ((gsl_complex*)&((zv)->data[2*(i)*(zv)->stride]))
#define GSL_COMPLEX_FLOAT_AT(zv,i) ((gsl_complex_float*)&((zv)->data[2*(i)*(zv)->stride]))
#define GSL_COMPLEX_LONG_DOUBLE_AT(zv,i) ((gsl_complex_long_double*)&((zv)->data[2*(i)*(zv)->stride]))

#endif /* __GSL_VECTOR_COMPLEX_H__ */
