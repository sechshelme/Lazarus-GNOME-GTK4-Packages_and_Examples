program project1;
uses
fp_ffi,
ffitarget;


procedure main1;
    ffi_cif cif;
    ffi_type *args[1];
    void *values[1];
    char *str;
    ffi_arg rc;
begin

    // Argumenttyp Information vorbereiten (ein Zeiger auf char)
    args[0] = &ffi_type_pointer;
    // return type ist int
    if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 1, &ffi_type_sint, args) == FFI_OK) {
        str = "Hallo Welt!";
        values[0] = &str;

        // puts dynamisch aufrufen
        ffi_call(&cif, puts, &rc, values);

        str = "Noch ein Beispiel!";
        ffi_call(&cif, puts, &rc, values);
    }
    return 0;
}

int main2() {
    ffi_cif cif;
    ffi_type *arg_types[3];
    void *args[3];
    char *format = "%.5g, %d\n";
    double doubleArg = 3.14159;
    int intArg = 7;
    ffi_arg res;

    // Argumenttypen: zuerst fester Parameter (format string), dann zwei varargs
    arg_types[0] = &ffi_type_pointer;  // const char *format
    arg_types[1] = &ffi_type_double;   // double
    arg_types[2] = &ffi_type_sint;     // int

    // CIF für variadische Funktion vorbereiten: 1 fester und 2 gesamt Argumente
    if (ffi_prep_cif_var(&cif, FFI_DEFAULT_ABI, 1, 3, &ffi_type_sint, arg_types) == FFI_OK) {
        args[0] = &format;
        args[1] = &doubleArg;
        args[2] = &intArg;

        ffi_call(&cif, FFI_FN(printf), &res, args);
    }

    return 0;
}


int main(){
 main1();
 main2();
}



begin

end.

