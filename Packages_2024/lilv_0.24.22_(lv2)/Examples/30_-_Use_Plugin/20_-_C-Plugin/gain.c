// gcc -shared -fPIC -o gain.so gain.c `pkg-config --cflags --libs lv2` -lm

#include <lv2/lv2plug.in/ns/lv2core/lv2.h>
#include <math.h>
#include <stdlib.h>

#define GAIN_URI "http://example.org/plugins/gain"

typedef enum {
    GAIN_INPUT = 0,
    GAIN_OUTPUT,
    GAIN_GAIN
} PortIndex;

typedef struct {
    const float* input;
    float* output;
    const float* gain;
} Gain;

static LV2_Handle 
instantiate(const LV2_Descriptor*     descriptor,
            double                    rate,
            const char*               bundle_path,
            const LV2_Feature* const* features) 
{
    Gain* gain = (Gain*)calloc(1, sizeof(Gain));
    return (LV2_Handle)gain;
}

static void connect_port(LV2_Handle instance, 
                        uint32_t   port, 
                        void*      data) 
{
    Gain* gain = (Gain*)instance;
    switch ((PortIndex)port) {
        case GAIN_INPUT:  gain->input  = (const float*)data; break;
        case GAIN_OUTPUT: gain->output = (float*)data; break;
        case GAIN_GAIN:   gain->gain   = (const float*)data; break;
    }
}

static void activate(LV2_Handle instance) {}

static void run(LV2_Handle instance, uint32_t n_samples) {
    Gain* gain = (Gain*)instance;
    const float gain_value = *(gain->gain);
    
    for (uint32_t i = 0; i < n_samples; ++i) {
        gain->output[i] = gain->input[i] * gain_value;
    }
}

static void deactivate(LV2_Handle instance) {}

static void cleanup(LV2_Handle instance) {
    free(instance);
}

static const void* extension_data(const char* uri) {
    return NULL;
}

static const LV2_Descriptor descriptor = {
    GAIN_URI,
    instantiate,
    connect_port,
    activate,
    run,
    deactivate,
    cleanup,
    extension_data
};

LV2_SYMBOL_EXPORT
const LV2_Descriptor* lv2_descriptor(uint32_t index) {
    return (index == 0) ? &descriptor : NULL;
}

