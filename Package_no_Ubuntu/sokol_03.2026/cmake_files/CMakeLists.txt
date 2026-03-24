cmake_minimum_required(VERSION 3.10)
project(SokolSharedLib C)

# 1. Plattform-spezifische Makros festlegen
if(WIN32)
    # Wir erzwingen OpenGL für Windows
    set(SOKOL_EXPORT "__declspec(dllexport)")
    set(SOKOL_LIBS kernel32 user32 gdi32 opengl32 ole32)
else()
    # Linux (Ubuntu)
    set(SOKOL_EXPORT "__attribute__((visibility(\"default\")))")
    set(OpenGL_GL_PREFERENCE GLVND)
endif()


# 2. Den C-Wrapper automatisch generieren
set(SOKOL_WRAPPER "${CMAKE_CURRENT_BINARY_DIR}/sokol_wrapper.c")
file(WRITE ${SOKOL_WRAPPER} "
#define SOKOL_NO_ENTRY
#define SOKOL_IMPL
#define SOKOL_GLCORE
#define SOKOL_API_DECL ${SOKOL_EXPORT}

#include \"sokol_log.h\"\n
#include \"sokol_gfx.h\"\n
#include \"sokol_app.h\"\n
#include \"sokol_audio.h\"\n
#include \"sokol_time.h\"\n
#include \"sokol_args.h\"\n
#include \"sokol_fetch.h\"\n
#include \"sokol_glue.h\"\n


#define SOKOL_COLOR_IMPL
#include \"util/sokol_color.h\"\n

#define SOKOL_GL_IMPL
#include \"util/sokol_gl.h\"\n

#define SOKOL_SHAPE_IMPL
#include \"util/sokol_shape.h\"\n

#define SOKOL_DEBUGTEXT_IMPL
#include \"util/sokol_debugtext.h\"\n

#define SOKOL_MEMTRACK_IMPL
#include \"util/sokol_memtrack.h\"\n


//#include \"util/sokol_fontstash.h\"\n
//#include \"util/sokol_spine.h\"\n

//#include \"util/sokol_imgui.h\"\n
//#include \"util/sokol_gfx_imgui.h\"\n
//#include \"util/sokol_nuklear.h\"\n
")

# 3. Die Library definieren
add_library(sokol SHARED ${SOKOL_WRAPPER})
target_include_directories(sokol PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

# 4. Plattform-spezifische Suche und Verlinkung
if(WIN32)
    target_link_libraries(sokol PUBLIC ${SOKOL_LIBS})
else()
    # Ubuntu/Linux Abhängigkeiten suchen
    find_package(X11 REQUIRED)
    find_library(X11_Xi_LIB Xi REQUIRED)
    find_library(X11_Xcursor_LIB Xcursor REQUIRED)
    find_package(OpenGL REQUIRED)
    find_library(ASOUND_LIB asound REQUIRED)

    target_link_libraries(sokol PUBLIC 
        ${OPENGL_LIBRARIES} 
        ${X11_LIBRARIES}
        ${X11_Xi_LIB}
        ${X11_Xcursor_LIB}
        ${ASOUND_LIB}
        m dl pthread
    )

    # Linker-Trick für Linux (Abhängigkeiten in .so speichern)
    set_target_properties(sokol PROPERTIES 
        C_VISIBILITY_PRESET hidden
        LINK_FLAGS "-Wl,--no-as-needed"
    )
endif()

# 5. Install-Regeln (Sauber für Ubuntu)
include(GNUInstallDirs)
install(TARGETS sokol LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})

if(NOT WIN32)
    # Header-Installation nur für Linux sinnvoll/üblich
    install(FILES 
        sokol_app.h sokol_audio.h sokol_gfx.h sokol_glue.h 
        sokol_time.h sokol_log.h sokol_args.h sokol_fetch.h
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/sokol
    )
    install(DIRECTORY util/ 
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/sokol/util
            FILES_MATCHING PATTERN "*.h")
endif()

