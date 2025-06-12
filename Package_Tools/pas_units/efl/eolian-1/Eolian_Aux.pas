unit Eolian_Aux;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, Eolian;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$ifdef EFL_BETA_API_SUPPORT}
function eolian_aux_state_class_children_find(state: PEolian_State): PEina_Hash; cdecl; external libeolian;
function eolian_aux_class_callables_get(klass: PEolian_Class; funcs: PPEina_List; events: PPEina_List; ownfuncs: Psize_t; ownevs: Psize_t): Tsize_t; cdecl; external libeolian;
function eolian_aux_function_all_implements_get(func: PEolian_Function; class_children: PEina_Hash): PEina_List; cdecl; external libeolian;
function eolian_aux_implement_parent_get(impl: PEolian_Implement): PEolian_Implement; cdecl; external libeolian;
function eolian_aux_implement_documentation_get(impl: PEolian_Implement; ftype: TEolian_Function_Type): PEolian_Documentation; cdecl; external libeolian;
function eolian_aux_implement_documentation_fallback_get(impl: PEolian_Implement): PEolian_Documentation; cdecl; external libeolian;
{$endif}

// === Konventiert am: 12-6-25 19:16:40 ===


implementation



end.
