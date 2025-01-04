// gcc -o main main.c `pkg-config --cflags --libs javascriptcoregtk-6.0`

// https://www.perplexity.ai/search/was-ist-jsc-welchec-bei-webkit-w5K_F7JCQYixjpJh3a5keA


#include <jsc/jsc.h>
#include <stdio.h>

int main() {
    JSCContext *ctx = jsc_context_new();

    JSCValue *result = jsc_context_evaluate(ctx, "2 + 3", -1);
    int value = jsc_value_to_int32(result);

    printf("Das Ergebnis von 2 + 3 ist: %d\n", value);

    g_object_unref(result);
    g_object_unref(ctx);

    return 0;
}
