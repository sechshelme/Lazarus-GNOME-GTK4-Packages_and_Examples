#ifndef EOLIAN_H
#define EOLIAN_H




static inline const Eolian_Object *
eolian_state_object_by_name_get(const Eolian_State *state, const char *name)
{
   return eolian_unit_object_by_name_get(EOLIAN_UNIT(state), name);
}
static inline Eina_Iterator *
eolian_state_objects_get(const Eolian_State *state)
{
   return eolian_unit_objects_get(EOLIAN_UNIT(state));
}
static inline const Eolian_Class *
eolian_state_class_by_name_get(const Eolian_State *state, const char *class_name)
{
   return eolian_unit_class_by_name_get(EOLIAN_UNIT(state), class_name);
}
static inline Eina_Iterator *
eolian_state_classes_get(const Eolian_State *state)
{
   return eolian_unit_classes_get(EOLIAN_UNIT(state));
}
static inline const Eolian_Constant *
eolian_state_constant_by_name_get(const Eolian_State *state, const char *name)
{
   return eolian_unit_constant_by_name_get(EOLIAN_UNIT(state), name);
}
static inline const Eolian_Error *
eolian_state_error_by_name_get(const Eolian_State *state, const char *name)
{
   return eolian_unit_error_by_name_get(EOLIAN_UNIT(state), name);
}
static inline Eina_Iterator *
eolian_state_constants_get(const Eolian_State *state)
{
   return eolian_unit_constants_get(EOLIAN_UNIT(state));
}
static inline Eina_Iterator *
eolian_state_errors_get(const Eolian_State *state)
{
   return eolian_unit_errors_get(EOLIAN_UNIT(state));
}
static inline const Eolian_Typedecl *
eolian_state_alias_by_name_get(const Eolian_State *state, const char *name)
{
   return eolian_unit_alias_by_name_get(EOLIAN_UNIT(state), name);
}
static inline const Eolian_Typedecl *
eolian_state_struct_by_name_get(const Eolian_State *state, const char *name)
{
   return eolian_unit_struct_by_name_get(EOLIAN_UNIT(state), name);
}
static inline const Eolian_Typedecl *
eolian_state_enum_by_name_get(const Eolian_State *state, const char *name)
{
   return eolian_unit_enum_by_name_get(EOLIAN_UNIT(state), name);
}
static inline Eina_Iterator *
eolian_state_aliases_get(const Eolian_State *state)
{
   return eolian_unit_aliases_get(EOLIAN_UNIT(state));
}
static inline Eina_Iterator *
eolian_state_structs_get(const Eolian_State *state)
{
   return eolian_unit_structs_get(EOLIAN_UNIT(state));
}
static inline Eina_Iterator *
eolian_state_enums_get(const Eolian_State *state)
{
   return eolian_unit_enums_get(EOLIAN_UNIT(state));
}
static inline const char *
eolian_class_name_get(const Eolian_Class *klass)
{
   return eolian_object_name_get(EOLIAN_OBJECT(klass));
}
static inline const char *
eolian_class_c_name_get(const Eolian_Class *klass)
{
   return eolian_object_c_name_get(EOLIAN_OBJECT(klass));
}
static inline const char *
eolian_class_short_name_get(const Eolian_Class *klass)
{
   return eolian_object_short_name_get(EOLIAN_OBJECT(klass));
}
static inline Eina_Iterator *
eolian_class_namespaces_get(const Eolian_Class *klass)
{
   return eolian_object_namespaces_get(EOLIAN_OBJECT(klass));
}
static inline const char *
eolian_function_name_get(const Eolian_Function *fid)
{
   return eolian_object_name_get(EOLIAN_OBJECT(fid));
}
static inline Eina_Bool
eolian_function_is_beta(const Eolian_Function *function_id)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(function_id));
}
static inline const char *
eolian_parameter_name_get(const Eolian_Function_Parameter *param)
{
   return eolian_object_name_get(EOLIAN_OBJECT(param));
}
static inline const char *
eolian_implement_name_get(const Eolian_Implement *impl)
{
   return eolian_object_name_get(EOLIAN_OBJECT(impl));
}
static inline const char *
eolian_constructor_name_get(const Eolian_Constructor *ctor)
{
   return eolian_object_name_get(EOLIAN_OBJECT(ctor));
}
static inline const char *
eolian_event_name_get(const Eolian_Event *event)
{
   return eolian_object_name_get(EOLIAN_OBJECT(event));
}
static inline Eina_Bool
eolian_event_is_beta(const Eolian_Event *event)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(event));
}
static inline const char *
eolian_part_name_get(const Eolian_Part *part)
{
   return eolian_object_name_get(EOLIAN_OBJECT(part));
}
static inline Eina_Bool
eolian_part_is_beta(const Eolian_Part *part)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(part));
}
static inline Eina_Bool
eolian_class_is_beta(const Eolian_Class *klass)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(klass));
}
static inline const char *
eolian_typedecl_struct_field_name_get(const Eolian_Struct_Type_Field *field)
{
   return eolian_object_name_get(EOLIAN_OBJECT(field));
}
static inline const char *
eolian_typedecl_enum_field_name_get(const Eolian_Enum_Type_Field *field)
{
   return eolian_object_name_get(EOLIAN_OBJECT(field));
}
static inline Eina_Bool
eolian_typedecl_is_beta(const Eolian_Typedecl *tp)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_typedecl_name_get(const Eolian_Typedecl *tp)
{
   return eolian_object_name_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_typedecl_c_name_get(const Eolian_Typedecl *tp)
{
   return eolian_object_c_name_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_typedecl_short_name_get(const Eolian_Typedecl *tp)
{
   return eolian_object_short_name_get(EOLIAN_OBJECT(tp));
}
static inline Eina_Iterator *
eolian_typedecl_namespaces_get(const Eolian_Typedecl *tp)
{
   return eolian_object_namespaces_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_type_name_get(const Eolian_Type *tp)
{
   return eolian_object_name_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_type_c_name_get(const Eolian_Type *tp)
{
   return eolian_object_c_name_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_type_short_name_get(const Eolian_Type *tp)
{
   return eolian_object_short_name_get(EOLIAN_OBJECT(tp));
}
static inline Eina_Iterator *
eolian_type_namespaces_get(const Eolian_Type *tp)
{
   return eolian_object_namespaces_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_constant_name_get(const Eolian_Constant *tp)
{
   return eolian_object_name_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_constant_c_name_get(const Eolian_Constant *tp)
{
   return eolian_object_c_name_get(EOLIAN_OBJECT(tp));
}
static inline const char *
eolian_constant_short_name_get(const Eolian_Constant *tp)
{
   return eolian_object_short_name_get(EOLIAN_OBJECT(tp));
}
static inline Eina_Iterator *
eolian_constant_namespaces_get(const Eolian_Constant *tp)
{
   return eolian_object_namespaces_get(EOLIAN_OBJECT(tp));
}
static inline Eina_Bool
eolian_constant_is_beta(const Eolian_Constant *var)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(var));
}
static inline const char *
eolian_error_name_get(const Eolian_Error *err)
{
   return eolian_object_name_get(EOLIAN_OBJECT(err));
}
static inline const char *
eolian_error_c_name_get(const Eolian_Error *err)
{
   return eolian_object_c_name_get(EOLIAN_OBJECT(err));
}
static inline const char *
eolian_error_short_name_get(const Eolian_Error *err)
{
   return eolian_object_short_name_get(EOLIAN_OBJECT(err));
}
static inline Eina_Iterator *
eolian_error_namespaces_get(const Eolian_Error *err)
{
   return eolian_object_namespaces_get(EOLIAN_OBJECT(err));
}
static inline Eina_Bool
eolian_error_is_beta(const Eolian_Error *err)
{
   return eolian_object_is_beta(EOLIAN_OBJECT(err));
}


