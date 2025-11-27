unit fp_rdf;

interface

const
  {$IFDEF Linux}
  librdf = 'rdf';
  {$ENDIF}

  {$IFDEF Windows}
  librdf = 'librdf.dll'; // ??????
  {$ENDIF}

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

//{$include <Redland/rdf_log.h>}
//{$include <Redland/rdf_digest.h>}
//{$include <Redland/rdf_hash.h>}
//{$include <Redland/rdf_init.h>}
//{$include <Redland/rdf_iterator.h>}
//{$include <Redland/rdf_uri.h>}
//{$include <Redland/rdf_node.h>}
//{$include <Redland/rdf_concepts.h>}
//{$include <Redland/rdf_statement.h>}
//{$include <Redland/rdf_model.h>}
//{$include <Redland/rdf_storage.h>}
//{$include <Redland/rdf_parser.h>}
//{$include <Redland/rdf_raptor.h>}
//{$include <Redland/rdf_serializer.h>}
//{$include <Redland/rdf_stream.h>}
//{$include <Redland/rdf_query.h>}
//{$include <Redland/rdf_utf8.h>}


// === Konventiert am: 26-11-25 19:55:10 ===


implementation



end.
