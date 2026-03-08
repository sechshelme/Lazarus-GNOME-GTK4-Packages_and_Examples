program project1;

//  {$LinkLib m}

(*

math_functions:

#ifdef __cplusplus
    #define B2_API extern "C" BOX2D_EXPORT
    // Für C++: inline lassen, aber exportieren
    #define B2_INLINE inline BOX2D_EXPORT
    #define B2_LITERAL(T) T
    #define B2_ZERO_INIT {}
#else
    #define B2_API BOX2D_EXPORT
    // Für C: __attribute__((weak)) erlaubt mehrfache Definitionen,
    // BOX2D_EXPORT macht es nach außen sichtbar.
    #define B2_INLINE __attribute__((weak)) BOX2D_EXPORT
    #define B2_LITERAL(T) (T)
    #define B2_ZERO_INIT {0}
#endif

id:
#ifdef __cplusplus
    #define B2_NULL_ID {}
    #define B2_ID_INLINE inline __attribute__((visibility("default")))
#else
    #define B2_NULL_ID { 0 }
    // Wir schreiben den Export-Befehl direkt hin, statt das Makro zu nutzen
    #define B2_ID_INLINE __attribute__((weak)) __attribute__((visibility("default")))
#endif




/home/tux/Schreibtisch/von_Git/box2d/box2d/src/CMakeLists.txt

Alt:
elseif (UNIX)
	message(STATUS "Box2D using Unix")
	target_compile_options(box2d PRIVATE -Wmissing-prototypes -Wall -Wextra -pedantic -Wno-unused-value)


Neu:
elseif (UNIX)
	message(STATUS "Box2D using Unix")

# Fix for missing math library link in shared object
if(UNIX AND NOT APPLE)
    target_link_libraries(box2d PRIVATE m)
endif()

	target_compile_options(box2d PRIVATE -Wmissing-prototypes -Wall -Wextra -pedantic -Wno-unused-value)



*)


uses
  base,
  math_functions,
  id,
  collision,
  types,
  box2d,


  fp_box2d;

begin
//  b2StoreWorldId(1,2);
//  b2CreateWorld;
//  b2PrismaticJoint_GetTargetTranslation;
  WriteLn( b2MaxInt(1,3));
  WriteLn( b2MaxInt(3,1));
  WriteLn( b2MinInt(1,3));
  WriteLn( b2MinInt(3,1));
end.

















