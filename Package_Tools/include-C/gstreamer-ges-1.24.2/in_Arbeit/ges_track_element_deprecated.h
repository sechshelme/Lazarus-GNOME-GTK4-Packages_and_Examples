#pragma once

GstElement * ges_track_element_get_gnlobject   (GESTrackElement * object);


GParamSpec **
ges_track_element_list_children_properties     (GESTrackElement *object,
                                               guint *n_properties);

gboolean ges_track_element_lookup_child        (GESTrackElement *object,
                                               const gchar *prop_name,
                                               GstElement **element,
                                               GParamSpec **pspec);

void
ges_track_element_get_child_property_valist   (GESTrackElement * object,
                                              const gchar * first_property_name,
                                              va_list var_args);

void ges_track_element_get_child_properties   (GESTrackElement *object,
                                              const gchar * first_property_name,
                                              ...) ;

void
ges_track_element_set_child_property_valist   (GESTrackElement * object,
                                              const gchar * first_property_name,
                                              va_list var_args);

void
ges_track_element_set_child_property_by_pspec (GESTrackElement * object,
                                              GParamSpec * pspec,
                                              GValue * value);

void
ges_track_element_set_child_properties       (GESTrackElement * object,
                                              const gchar * first_property_name,
                                              ...) ;

gboolean ges_track_element_set_child_property (GESTrackElement *object,
                                              const gchar *property_name,
                                              GValue * value);

gboolean ges_track_element_get_child_property (GESTrackElement *object,
                                              const gchar *property_name,
                                              GValue * value);

gboolean
ges_track_element_edit                        (GESTrackElement * object,
                                              GList *layers, GESEditMode mode,
                                              GESEdge edge, guint64 position);
