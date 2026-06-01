/* 4bf720e0ca97527a28e4c30f1c35b36a0b5f2697265c5ddc81080eaab4344ef2 (0.9.7+)
 *
 * uriparser - RFC 3986 URI parsing library
 *
 * Copyright (C) 2007, Weijia Song <songweijia@gmail.com>
 * Copyright (C) 2007, Sebastian Pipping <sebastian@pipping.org>
 * All rights reserved.
 *
 * Redistribution and use in source  and binary forms, with or without
 * modification, are permitted provided  that the following conditions
 * are met:
 *
 *     1. Redistributions  of  source  code   must  retain  the  above
 *        copyright notice, this list  of conditions and the following
 *        disclaimer.
 *
 *     2. Redistributions  in binary  form  must  reproduce the  above
 *        copyright notice, this list  of conditions and the following
 *        disclaimer  in  the  documentation  and/or  other  materials
 *        provided with the distribution.
 *
 *     3. Neither the  name of the  copyright holder nor the  names of
 *        its contributors may be used  to endorse or promote products
 *        derived from  this software  without specific  prior written
 *        permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND  ANY EXPRESS OR IMPLIED WARRANTIES,  INCLUDING, BUT NOT
 * LIMITED TO,  THE IMPLIED WARRANTIES OF  MERCHANTABILITY AND FITNESS
 * FOR  A  PARTICULAR  PURPOSE  ARE  DISCLAIMED.  IN  NO  EVENT  SHALL
 * THE  COPYRIGHT HOLDER  OR CONTRIBUTORS  BE LIABLE  FOR ANY  DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO,  PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA,  OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT  LIABILITY,  OR  TORT (INCLUDING  NEGLIGENCE  OR  OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @file Uri.h
 * Holds the RFC 3986 %URI parser interface.
 * NOTE: This header includes itself twice.
 */



#ifdef __cplusplus
extern "C" {
#endif



#ifndef URI_DOXYGEN
# include "UriBase.h"
#endif



/**
 * Specifies a range of characters within a string.
 * The range includes all characters from <c>first</c>
 * to one before <c>afterLast</c>. So if both are
 * non-NULL the difference is the length of the text range.
 *
 * @see UriUriA
 * @see UriPathSegmentA
 * @see UriHostDataA
 * @since 0.3.0
 */
typedef struct TextRangeStruct {
	const URI_CHAR * first; /**< Pointer to first character */
	const URI_CHAR * afterLast; /**< Pointer to character after the last one still in */
} TextRange; /**< @copydoc UriTextRangeStructA */



/**
 * Represents a path segment within a %URI path.
 * More precisely it is a node in a linked
 * list of path segments.
 *
 * @see UriUriA
 * @since 0.3.0
 */
typedef struct PathSegmentStruct {
	TextRange text; /**< Path segment name */
	struct PathSegmentStruct * next; /**< Pointer to the next path segment in the list, can be NULL if last already */

	void * reserved; /**< Reserved to the parser */
} PathSegment; /**< @copydoc UriPathSegmentStructA */



/**
 * Holds structured host information.
 * This is either a IPv4, IPv6, plain
 * text for IPvFuture or all zero for
 * a registered name.
 *
 * @see UriUriA
 * @since 0.3.0
 */
typedef struct HostDataStruct {
	UriIp4 * ip4; /**< IPv4 address */
	UriIp6 * ip6; /**< IPv6 address */
	TextRange ipFuture; /**< IPvFuture address */
} HostData; /**< @copydoc UriHostDataStructA */



/**
 * Represents an RFC 3986 %URI.
 * Missing components can be {NULL, NULL} ranges.
 *
 * @see uriFreeUriMembersA
 * @see uriFreeUriMembersMmA
 * @see UriParserStateA
 * @since 0.3.0
 */
typedef struct UriStruct {
	TextRange scheme; /**< Scheme (e.g. "http") */
	TextRange userInfo; /**< User info (e.g. "user:pass") */
	TextRange hostText; /**< Host text (set for all hosts, excluding square brackets) */
	HostData hostData; /**< Structured host type specific data */
	TextRange portText; /**< Port (e.g. "80") */
	PathSegment * pathHead; /**< Head of a linked list of path segments */
	PathSegment * pathTail; /**< Tail of the list behind pathHead */
	TextRange query; /**< Query without leading "?" */
	TextRange fragment; /**< Query without leading "#" */
	UriBool absolutePath; /**< Absolute path flag, distincting "a" and "/a";
								always <c>URI_FALSE</c> for URIs with host */
	UriBool owner; /**< Memory owner flag */

	void * reserved; /**< Reserved to the parser */
} Uri; /**< @copydoc UriUriStructA */



/**
 * Represents a state of the %URI parser.
 * Missing components can be NULL to reflect
 * a components absence.
 *
 * @see uriFreeUriMembersA
 * @see uriFreeUriMembersMmA
 * @since 0.3.0
 */
typedef struct ParserStateStruct {
	Uri * uri; /**< Plug in the %URI structure to be filled while parsing here */
	int errorCode; /**< Code identifying the error which occurred */
	const URI_CHAR * errorPos; /**< Pointer to position in case of a syntax error */

	void * reserved; /**< Reserved to the parser */
} ParserState; /**< @copydoc UriParserStateStructA */



/**
 * Represents a query element.
 * More precisely it is a node in a linked
 * list of query elements.
 *
 * @since 0.7.0
 */
typedef struct QueryListStruct {
	const URI_CHAR * key; /**< Key of the query element */
	const URI_CHAR * value; /**< Value of the query element, can be NULL */

	struct QueryListStruct * next; /**< Pointer to the next key/value pair in the list, can be NULL if last already */
} QueryList; /**< @copydoc UriQueryListStructA */



/**
 * Parses a RFC 3986 %URI.
 * Uses default libc-based memory manager.
 *
 * @param state       <b>INOUT</b>: Parser state with set output %URI, must not be NULL
 * @param first       <b>IN</b>: Pointer to the first character to parse, must not be NULL
 * @param afterLast   <b>IN</b>: Pointer to the character after the last to parse, must not be NULL
 * @return            0 on success, error code otherwise
 *
 * @see uriParseUriA
 * @see uriParseSingleUriA
 * @see uriParseSingleUriExA
 * @see uriToStringA
 * @since 0.3.0
 * @deprecated Deprecated since 0.9.0, please migrate to uriParseSingleUriExA (with "Single").
 */
extern int externParseUriEx(ParserState * state,
		const URI_CHAR * first, const URI_CHAR * afterLast);



/**
 * Parses a RFC 3986 %URI.
 * Uses default libc-based memory manager.
 *
 * @param state   <b>INOUT</b>: Parser state with set output %URI, must not be NULL
 * @param text    <b>IN</b>: Text to parse, must not be NULL
 * @return        0 on success, error code otherwise
 *
 * @see uriParseUriExA
 * @see uriParseSingleUriA
 * @see uriParseSingleUriExA
 * @see uriToStringA
 * @since 0.3.0
 * @deprecated Deprecated since 0.9.0, please migrate to uriParseSingleUriA (with "Single").
 */
extern int externParseUri(ParserState * state,
		const URI_CHAR * text);



/**
 * Parses a single RFC 3986 %URI.
 * Uses default libc-based memory manager.
 *
 * @param uri         <b>OUT</b>: Output %URI, must not be NULL
 * @param text        <b>IN</b>: Pointer to the first character to parse,
 *                               must not be NULL
 * @param errorPos    <b>OUT</b>: Pointer to a pointer to the first character
 *                                causing a syntax error, can be NULL;
 *                                only set when URI_ERROR_SYNTAX was returned
 * @return            0 on success, error code otherwise
 *
 * @see uriParseSingleUriExA
 * @see uriParseSingleUriExMmA
 * @see uriToStringA
 * @since 0.9.0
 */
extern int externParseSingleUri(Uri * uri,
		const URI_CHAR * text, const URI_CHAR ** errorPos);



/**
 * Parses a single RFC 3986 %URI.
 * Uses default libc-based memory manager.
 *
 * @param uri         <b>OUT</b>: Output %URI, must not be NULL
 * @param first       <b>IN</b>: Pointer to the first character to parse,
 *                               must not be NULL
 * @param afterLast   <b>IN</b>: Pointer to the character after the last to
 *                               parse, can be NULL
 *                               (to use first + strlen(first))
 * @param errorPos    <b>OUT</b>: Pointer to a pointer to the first character
 *                                causing a syntax error, can be NULL;
 *                                only set when URI_ERROR_SYNTAX was returned
 * @return            0 on success, error code otherwise
 *
 * @see uriParseSingleUriA
 * @see uriParseSingleUriExMmA
 * @see uriToStringA
 * @since 0.9.0
 */
extern int externParseSingleUriEx(Uri * uri,
		const URI_CHAR * first, const URI_CHAR * afterLast,
		const URI_CHAR ** errorPos);



/**
 * Parses a single RFC 3986 %URI.
 *
 * @param uri         <b>OUT</b>: Output %URI, must not be NULL
 * @param first       <b>IN</b>: Pointer to the first character to parse,
 *                               must not be NULL
 * @param afterLast   <b>IN</b>: Pointer to the character after the last to
 *                               parse, can be NULL
 *                               (to use first + strlen(first))
 * @param errorPos    <b>OUT</b>: Pointer to a pointer to the first character
 *                                causing a syntax error, can be NULL;
 *                                only set when URI_ERROR_SYNTAX was returned
 * @param memory      <b>IN</b>: Memory manager to use, NULL for default libc
 * @return            0 on success, error code otherwise
 *
 * @see uriParseSingleUriA
 * @see uriParseSingleUriExA
 * @see uriToStringA
 * @since 0.9.0
 */
extern int externParseSingleUriExMm(Uri * uri,
		const URI_CHAR * first, const URI_CHAR * afterLast,
		const URI_CHAR ** errorPos, UriMemoryManager * memory);



/**
 * Frees all memory associated with the members
 * of the %URI structure. Note that the structure
 * itself is not freed, only its members.
 * Uses default libc-based memory manager.
 *
 * @param uri   <b>INOUT</b>: %URI structure whose members should be freed
 *
 * @see uriFreeUriMembersMmA
 * @since 0.3.0
 */
extern void externFreeUriMembers(Uri * uri);



/**
 * Frees all memory associated with the members
 * of the %URI structure. Note that the structure
 * itself is not freed, only its members.
 *
 * @param uri     <b>INOUT</b>: %URI structure whose members should be freed
 * @param memory  <b>IN</b>: Memory manager to use, NULL for default libc
 * @return        0 on success, error code otherwise
 *
 * @see uriFreeUriMembersA
 * @since 0.9.0
 */
extern int externFreeUriMembersMm(Uri * uri,
		UriMemoryManager * memory);



/**
 * Percent-encodes all unreserved characters from the input string and
 * writes the encoded version to the output string.
 * Be sure to allocate <b>3 times</b> the space of the input buffer for
 * the output buffer for <c>normalizeBreaks == URI_FALSE</c> and <b>6 times</b>
 * the space for <c>normalizeBreaks == URI_TRUE</c>
 * (since e.g. "\x0d" becomes "%0D%0A" in that case)
 *
 * @param inFirst           <b>IN</b>: Pointer to first character of the input text
 * @param inAfterLast       <b>IN</b>: Pointer after the last character of the input text
 * @param out               <b>OUT</b>: Encoded text destination
 * @param spaceToPlus       <b>IN</b>: Whether to convert ' ' to '+' or not
 * @param normalizeBreaks   <b>IN</b>: Whether to convert CR and LF to CR-LF or not.
 * @return                  Position of terminator in output string
 *
 * @see uriEscapeA
 * @see uriUnescapeInPlaceExA
 * @since 0.5.2
 */
extern URI_CHAR * externEscapeEx(const URI_CHAR * inFirst,
		const URI_CHAR * inAfterLast, URI_CHAR * out,
		UriBool spaceToPlus, UriBool normalizeBreaks);



/**
 * Percent-encodes all unreserved characters from the input string and
 * writes the encoded version to the output string.
 * Be sure to allocate <b>3 times</b> the space of the input buffer for
 * the output buffer for <c>normalizeBreaks == URI_FALSE</c> and <b>6 times</b>
 * the space for <c>normalizeBreaks == URI_TRUE</c>
 * (since e.g. "\x0d" becomes "%0D%0A" in that case)
 *
 * @param in                <b>IN</b>: Text source
 * @param out               <b>OUT</b>: Encoded text destination
 * @param spaceToPlus       <b>IN</b>: Whether to convert ' ' to '+' or not
 * @param normalizeBreaks   <b>IN</b>: Whether to convert CR and LF to CR-LF or not.
 * @return                  Position of terminator in output string
 *
 * @see uriEscapeExA
 * @see uriUnescapeInPlaceA
 * @since 0.5.0
 */
extern URI_CHAR * externEscape(const URI_CHAR * in, URI_CHAR * out,
		UriBool spaceToPlus, UriBool normalizeBreaks);



/**
 * Unescapes percent-encoded groups in a given string.
 * E.g. "%20" will become " ". Unescaping is done in place.
 * The return value will be point to the new position
 * of the terminating zero. Use this value to get the new
 * length of the string. NULL is only returned if <c>inout</c>
 * is NULL.
 *
 * @param inout             <b>INOUT</b>: Text to unescape/decode
 * @param plusToSpace       <b>IN</b>: Whether to convert '+' to ' ' or not
 * @param breakConversion   <b>IN</b>: Line break conversion mode
 * @return                  Pointer to new position of the terminating zero
 *
 * @see uriUnescapeInPlaceA
 * @see uriEscapeExA
 * @since 0.5.0
 */
extern const URI_CHAR * externUnescapeInPlaceEx(URI_CHAR * inout,
		UriBool plusToSpace, UriBreakConversion breakConversion);



/**
 * Unescapes percent-encoded groups in a given string.
 * E.g. "%20" will become " ". Unescaping is done in place.
 * The return value will be point to the new position
 * of the terminating zero. Use this value to get the new
 * length of the string. NULL is only returned if <c>inout</c>
 * is NULL.
 *
 * NOTE: '+' is not decoded to ' ' and line breaks are not converted.
 * Use the more advanced UnescapeInPlaceEx for that features instead.
 *
 * @param inout   <b>INOUT</b>: Text to unescape/decode
 * @return        Pointer to new position of the terminating zero
 *
 * @see uriUnescapeInPlaceExA
 * @see uriEscapeA
 * @since 0.3.0
 */
extern const URI_CHAR * externUnescapeInPlace(URI_CHAR * inout);



/**
 * Performs reference resolution as described in
 * <a href="http://tools.ietf.org/html/rfc3986#section-5.2.2">section 5.2.2 of RFC 3986</a>.
 * Uses default libc-based memory manager.
 * NOTE: On success you have to call uriFreeUriMembersA on \p absoluteDest manually later.
 *
 * @param absoluteDest     <b>OUT</b>: Result %URI
 * @param relativeSource   <b>IN</b>: Reference to resolve
 * @param absoluteBase     <b>IN</b>: Base %URI to apply
 * @return                 Error code or 0 on success
 *
 * @see uriRemoveBaseUriA
 * @see uriRemoveBaseUriMmA
 * @see uriAddBaseUriExA
 * @see uriAddBaseUriExMmA
 * @since 0.4.0
 */
extern int externAddBaseUri(Uri * absoluteDest,
		const Uri * relativeSource,
		const Uri * absoluteBase);



/**
 * Performs reference resolution as described in
 * <a href="http://tools.ietf.org/html/rfc3986#section-5.2.2">section 5.2.2 of RFC 3986</a>.
 * Uses default libc-based memory manager.
 * NOTE: On success you have to call uriFreeUriMembersA on \p absoluteDest manually later.
 *
 * @param absoluteDest     <b>OUT</b>: Result %URI
 * @param relativeSource   <b>IN</b>: Reference to resolve
 * @param absoluteBase     <b>IN</b>: Base %URI to apply
 * @param options          <b>IN</b>: Configuration to apply
 * @return                 Error code or 0 on success
 *
 * @see uriRemoveBaseUriA
 * @see uriAddBaseUriA
 * @see uriAddBaseUriExMmA
 * @since 0.8.1
 */
extern int externAddBaseUriEx(Uri * absoluteDest,
		const Uri * relativeSource,
		const Uri * absoluteBase,
		UriResolutionOptions options);



/**
 * Performs reference resolution as described in
 * <a href="http://tools.ietf.org/html/rfc3986#section-5.2.2">section 5.2.2 of RFC 3986</a>.
 * NOTE: On success you have to call uriFreeUriMembersMmA on \p absoluteDest manually later.
 *
 * @param absoluteDest     <b>OUT</b>: Result %URI
 * @param relativeSource   <b>IN</b>: Reference to resolve
 * @param absoluteBase     <b>IN</b>: Base %URI to apply
 * @param options          <b>IN</b>: Configuration to apply
 * @param memory           <b>IN</b>: Memory manager to use, NULL for default libc
 * @return                 Error code or 0 on success
 *
 * @see uriRemoveBaseUriA
 * @see uriRemoveBaseUriMmA
 * @see uriAddBaseUriA
 * @see uriAddBaseUriExA
 * @since 0.9.0
 */
extern int externAddBaseUriExMm(Uri * absoluteDest,
		const Uri * relativeSource,
		const Uri * absoluteBase,
		UriResolutionOptions options, UriMemoryManager * memory);



/**
 * Tries to make a relative %URI (a reference) from an
 * absolute %URI and a given base %URI. The resulting %URI is going to be
 * relative if the absolute %URI and base %UI share both scheme and authority.
 * If that is not the case, the result will still be
 * an absolute URI (with scheme part if necessary).
 * Uses default libc-based memory manager.
 * NOTE: On success you have to call uriFreeUriMembersA on
 * \p dest manually later.
 *
 * @param dest             <b>OUT</b>: Result %URI
 * @param absoluteSource   <b>IN</b>: Absolute %URI to make relative
 * @param absoluteBase     <b>IN</b>: Base %URI
 * @param domainRootMode   <b>IN</b>: Create %URI with path relative to domain root
 * @return                 Error code or 0 on success
 *
 * @see uriRemoveBaseUriMmA
 * @see uriAddBaseUriA
 * @see uriAddBaseUriExA
 * @see uriAddBaseUriExMmA
 * @since 0.5.2
 */
extern int externRemoveBaseUri(Uri * dest,
		const Uri * absoluteSource,
		const Uri * absoluteBase,
		UriBool domainRootMode);



/**
 * Tries to make a relative %URI (a reference) from an
 * absolute %URI and a given base %URI. The resulting %URI is going to be
 * relative if the absolute %URI and base %UI share both scheme and authority.
 * If that is not the case, the result will still be
 * an absolute URI (with scheme part if necessary).
 * NOTE: On success you have to call uriFreeUriMembersMmA on
 * \p dest manually later.
 *
 * @param dest             <b>OUT</b>: Result %URI
 * @param absoluteSource   <b>IN</b>: Absolute %URI to make relative
 * @param absoluteBase     <b>IN</b>: Base %URI
 * @param domainRootMode   <b>IN</b>: Create %URI with path relative to domain root
 * @param memory           <b>IN</b>: Memory manager to use, NULL for default libc
 * @return                 Error code or 0 on success
 *
 * @see uriRemoveBaseUriA
 * @see uriAddBaseUriA
 * @see uriAddBaseUriExA
 * @see uriAddBaseUriExMmA
 * @since 0.9.0
 */
extern int externRemoveBaseUriMm(Uri * dest,
		const Uri * absoluteSource,
		const Uri * absoluteBase,
		UriBool domainRootMode, UriMemoryManager * memory);



/**
 * Checks two URIs for equivalence. Comparison is done
 * the naive way, without prior normalization.
 * NOTE: Two <c>NULL</c> URIs are equal as well.
 *
 * @param a   <b>IN</b>: First %URI
 * @param b   <b>IN</b>: Second %URI
 * @return    <c>URI_TRUE</c> when equal, <c>URI_FAlSE</c> else
 *
 * @since 0.4.0
 */
extern UriBool externEqualsUri(const Uri * a,
		const Uri * b);



/**
 * Calculates the number of characters needed to store the
 * string representation of the given %URI excluding the
 * terminator.
 *
 * @param uri             <b>IN</b>: %URI to measure
 * @param charsRequired   <b>OUT</b>: Length of the string representation in characters <b>excluding</b> terminator
 * @return                Error code or 0 on success
 *
 * @see uriToStringA
 * @since 0.5.0
 */
extern int externToStringCharsRequired(const Uri * uri,
		int * charsRequired);



/**
 * Converts a %URI structure back to text as described in
 * <a href="http://tools.ietf.org/html/rfc3986#section-5.3">section 5.3 of RFC 3986</a>.
 *
 * @param dest           <b>OUT</b>: Output destination
 * @param uri            <b>IN</b>: %URI to convert
 * @param maxChars       <b>IN</b>: Maximum number of characters to copy <b>including</b> terminator
 * @param charsWritten   <b>OUT</b>: Number of characters written, can be lower than maxChars even if the %URI is too long!
 * @return               Error code or 0 on success
 *
 * @see uriToStringCharsRequiredA
 * @since 0.4.0
 */
extern int externToString(URI_CHAR * dest, const Uri * uri,
		int maxChars, int * charsWritten);



/**
 * Determines the components of a %URI that are not normalized.
 *
 * @param uri   <b>IN</b>: %URI to check
 * @return      Normalization job mask
 *
 * @see uriNormalizeSyntaxA
 * @see uriNormalizeSyntaxExA
 * @see uriNormalizeSyntaxExMmA
 * @see uriNormalizeSyntaxMaskRequiredExA
 * @since 0.5.0
 * @deprecated Deprecated since 0.9.0, please migrate to uriNormalizeSyntaxMaskRequiredExA (with "Ex").
 */
extern unsigned int externNormalizeSyntaxMaskRequired(
		const Uri * uri);



/**
 * Determines the components of a %URI that are not normalized.
 *
 * @param uri      <b>IN</b>: %URI to check
 * @param outMask  <b>OUT</b>: Normalization job mask
 * @return         Error code or 0 on success
 *
 * @see uriNormalizeSyntaxA
 * @see uriNormalizeSyntaxExA
 * @see uriNormalizeSyntaxExMmA
 * @see uriNormalizeSyntaxMaskRequiredA
 * @since 0.9.0
 */
extern int externNormalizeSyntaxMaskRequiredEx(
		const Uri * uri, unsigned int * outMask);



/**
 * Normalizes a %URI using a normalization mask.
 * The normalization mask decides what components are normalized.
 *
 * NOTE: If necessary the %URI becomes owner of all memory
 * behind the text pointed to. Text is duplicated in that case.
 * Uses default libc-based memory manager.
 *
 * @param uri    <b>INOUT</b>: %URI to normalize
 * @param mask   <b>IN</b>: Normalization mask
 * @return       Error code or 0 on success
 *
 * @see uriNormalizeSyntaxA
 * @see uriNormalizeSyntaxExMmA
 * @see uriNormalizeSyntaxMaskRequiredA
 * @since 0.5.0
 */
extern int externNormalizeSyntaxEx(Uri * uri,
		unsigned int mask);



/**
 * Normalizes a %URI using a normalization mask.
 * The normalization mask decides what components are normalized.
 *
 * NOTE: If necessary the %URI becomes owner of all memory
 * behind the text pointed to. Text is duplicated in that case.
 *
 * @param uri    <b>INOUT</b>: %URI to normalize
 * @param mask   <b>IN</b>: Normalization mask
 * @param memory <b>IN</b>: Memory manager to use, NULL for default libc
 * @return       Error code or 0 on success
 *
 * @see uriNormalizeSyntaxA
 * @see uriNormalizeSyntaxExA
 * @see uriNormalizeSyntaxMaskRequiredA
 * @since 0.9.0
 */
extern int externNormalizeSyntaxExMm(Uri * uri,
		unsigned int mask, UriMemoryManager * memory);



/**
 * Normalizes all components of a %URI.
 *
 * NOTE: If necessary the %URI becomes owner of all memory
 * behind the text pointed to. Text is duplicated in that case.
 * Uses default libc-based memory manager.
 *
 * @param uri   <b>INOUT</b>: %URI to normalize
 * @return      Error code or 0 on success
 *
 * @see uriNormalizeSyntaxExA
 * @see uriNormalizeSyntaxExMmA
 * @see uriNormalizeSyntaxMaskRequiredA
 * @since 0.5.0
 */
extern int externNormalizeSyntax(Uri * uri);



/**
 * Converts a Unix filename to a %URI string.
 * The destination buffer must be large enough to hold 7 + 3 * len(filename) + 1
 * characters in case of an absolute filename or 3 * len(filename) + 1 in case
 * of a relative filename.
 *
 * EXAMPLE
 *   Input:  "/bin/bash"
 *   Output: "file:///bin/bash"
 *
 * @param filename     <b>IN</b>: Unix filename to convert
 * @param uriString    <b>OUT</b>: Destination to write %URI string to
 * @return             Error code or 0 on success
 *
 * @see uriUriStringToUnixFilenameA
 * @see uriWindowsFilenameToUriStringA
 * @since 0.5.2
 */
extern int externUnixFilenameToUriString(const URI_CHAR * filename,
		URI_CHAR * uriString);



/**
 * Converts a Windows filename to a %URI string.
 * The destination buffer must be large enough to hold 8 + 3 * len(filename) + 1
 * characters in case of an absolute filename or 3 * len(filename) + 1 in case
 * of a relative filename.
 *
 * EXAMPLE
 *   Input:  "E:\\Documents and Settings"
 *   Output: "file:///E:/Documents%20and%20Settings"
 *
 * @param filename     <b>IN</b>: Windows filename to convert
 * @param uriString    <b>OUT</b>: Destination to write %URI string to
 * @return             Error code or 0 on success
 *
 * @see uriUriStringToWindowsFilenameA
 * @see uriUnixFilenameToUriStringA
 * @since 0.5.2
 */
extern int externWindowsFilenameToUriString(const URI_CHAR * filename,
		URI_CHAR * uriString);



/**
 * Extracts a Unix filename from a %URI string.
 * The destination buffer must be large enough to hold len(uriString) + 1 - 5
 * characters in case of an absolute %URI or len(uriString) + 1 in case
 * of a relative %URI.
 *
 * @param uriString    <b>IN</b>: %URI string to convert
 * @param filename     <b>OUT</b>: Destination to write filename to
 * @return             Error code or 0 on success
 *
 * @see uriUnixFilenameToUriStringA
 * @see uriUriStringToWindowsFilenameA
 * @since 0.5.2
 */
extern int externUriStringToUnixFilename(const URI_CHAR * uriString,
		URI_CHAR * filename);



/**
 * Extracts a Windows filename from a %URI string.
 * The destination buffer must be large enough to hold len(uriString) + 1 - 5
 * characters in case of an absolute %URI or len(uriString) + 1 in case
 * of a relative %URI.
 *
 * @param uriString    <b>IN</b>: %URI string to convert
 * @param filename     <b>OUT</b>: Destination to write filename to
 * @return             Error code or 0 on success
 *
 * @see uriWindowsFilenameToUriStringA
 * @see uriUriStringToUnixFilenameA
 * @since 0.5.2
 */
extern int externUriStringToWindowsFilename(const URI_CHAR * uriString,
		URI_CHAR * filename);



/**
 * Calculates the number of characters needed to store the
 * string representation of the given query list excluding the
 * terminator. It is assumed that line breaks are will be
 * normalized to "%0D%0A".
 *
 * @param queryList         <b>IN</b>: Query list to measure
 * @param charsRequired     <b>OUT</b>: Length of the string representation in characters <b>excluding</b> terminator
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryCharsRequiredExA
 * @see uriComposeQueryA
 * @since 0.7.0
 */
extern int externComposeQueryCharsRequired(
		const QueryList * queryList, int * charsRequired);



/**
 * Calculates the number of characters needed to store the
 * string representation of the given query list excluding the
 * terminator.
 *
 * @param queryList         <b>IN</b>: Query list to measure
 * @param charsRequired     <b>OUT</b>: Length of the string representation in characters <b>excluding</b> terminator
 * @param spaceToPlus       <b>IN</b>: Whether to convert ' ' to '+' or not
 * @param normalizeBreaks   <b>IN</b>: Whether to convert CR and LF to CR-LF or not.
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryCharsRequiredA
 * @see uriComposeQueryExA
 * @since 0.7.0
 */
extern  int externComposeQueryCharsRequiredEx(
		const QueryList * queryList,
		int * charsRequired, UriBool spaceToPlus, UriBool normalizeBreaks);



/**
 * Converts a query list structure back to a query string.
 * The composed string does not start with '?',
 * on the way ' ' is converted to '+' and line breaks are
 * normalized to "%0D%0A".
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param queryList         <b>IN</b>: Query list to convert
 * @param maxChars          <b>IN</b>: Maximum number of characters to copy <b>including</b> terminator
 * @param charsWritten      <b>OUT</b>: Number of characters written, can be lower than maxChars even if the query list is too long!
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryExA
 * @see uriComposeQueryMallocA
 * @see uriComposeQueryMallocExA
 * @see uriComposeQueryMallocExMmA
 * @see uriComposeQueryCharsRequiredA
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExA
 * @see uriDissectQueryMallocExMmA
 * @since 0.7.0
 */
extern int externComposeQuery(URI_CHAR * dest,
		const QueryList * queryList, int maxChars, int * charsWritten);



/**
 * Converts a query list structure back to a query string.
 * The composed string does not start with '?'.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param queryList         <b>IN</b>: Query list to convert
 * @param maxChars          <b>IN</b>: Maximum number of characters to copy <b>including</b> terminator
 * @param charsWritten      <b>OUT</b>: Number of characters written, can be lower than maxChars even if the query list is too long!
 * @param spaceToPlus       <b>IN</b>: Whether to convert ' ' to '+' or not
 * @param normalizeBreaks   <b>IN</b>: Whether to convert CR and LF to CR-LF or not.
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryA
 * @see uriComposeQueryMallocA
 * @see uriComposeQueryMallocExA
 * @see uriComposeQueryMallocExMmA
 * @see uriComposeQueryCharsRequiredExA
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExA
 * @see uriDissectQueryMallocExMmA
 * @since 0.7.0
 */
extern int externComposeQueryEx(URI_CHAR * dest,
		const QueryList * queryList, int maxChars, int * charsWritten,
		UriBool spaceToPlus, UriBool normalizeBreaks);



/**
 * Converts a query list structure back to a query string.
 * Memory for this string is allocated internally.
 * The composed string does not start with '?',
 * on the way ' ' is converted to '+' and line breaks are
 * normalized to "%0D%0A".
 * Uses default libc-based memory manager.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param queryList         <b>IN</b>: Query list to convert
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryMallocExA
 * @see uriComposeQueryMallocExMmA
 * @see uriComposeQueryA
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExA
 * @see uriDissectQueryMallocExMmA
 * @since 0.7.0
 */
extern int externComposeQueryMalloc(URI_CHAR ** dest,
		const QueryList * queryList);



/**
 * Converts a query list structure back to a query string.
 * Memory for this string is allocated internally.
 * The composed string does not start with '?'.
 * Uses default libc-based memory manager.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param queryList         <b>IN</b>: Query list to convert
 * @param spaceToPlus       <b>IN</b>: Whether to convert ' ' to '+' or not
 * @param normalizeBreaks   <b>IN</b>: Whether to convert CR and LF to CR-LF or not.
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryMallocA
 * @see uriComposeQueryMallocExMmA
 * @see uriComposeQueryExA
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExA
 * @see uriDissectQueryMallocExMmA
 * @since 0.7.0
 */
extern int externComposeQueryMallocEx(URI_CHAR ** dest,
		const QueryList * queryList,
		UriBool spaceToPlus, UriBool normalizeBreaks);



/**
 * Converts a query list structure back to a query string.
 * Memory for this string is allocated internally.
 * The composed string does not start with '?'.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param queryList         <b>IN</b>: Query list to convert
 * @param spaceToPlus       <b>IN</b>: Whether to convert ' ' to '+' or not
 * @param normalizeBreaks   <b>IN</b>: Whether to convert CR and LF to CR-LF or not.
 * @param memory            <b>IN</b>: Memory manager to use, NULL for default libc
 * @return                  Error code or 0 on success
 *
 * @see uriComposeQueryMallocA
 * @see uriComposeQueryMallocExA
 * @see uriComposeQueryExA
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExA
 * @see uriDissectQueryMallocExMmA
 * @since 0.9.0
 */
extern int externComposeQueryMallocExMm(URI_CHAR ** dest,
		const QueryList * queryList,
		UriBool spaceToPlus, UriBool normalizeBreaks,
		UriMemoryManager * memory);



/**
 * Constructs a query list from the raw query string of a given URI.
 * On the way '+' is converted back to ' ', line breaks are not modified.
 * Uses default libc-based memory manager.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param itemCount         <b>OUT</b>: Number of items found, can be NULL
 * @param first             <b>IN</b>: Pointer to first character <b>after</b> '?'
 * @param afterLast         <b>IN</b>: Pointer to character after the last one still in
 * @return                  Error code or 0 on success
 *
 * @see uriDissectQueryMallocExA
 * @see uriDissectQueryMallocExMmA
 * @see uriComposeQueryA
 * @see uriFreeQueryListA
 * @see uriFreeQueryListMmA
 * @since 0.7.0
 */
extern int externDissectQueryMalloc(QueryList ** dest,
		int * itemCount, const URI_CHAR * first, const URI_CHAR * afterLast);



/**
 * Constructs a query list from the raw query string of a given URI.
 * Uses default libc-based memory manager.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param itemCount         <b>OUT</b>: Number of items found, can be NULL
 * @param first             <b>IN</b>: Pointer to first character <b>after</b> '?'
 * @param afterLast         <b>IN</b>: Pointer to character after the last one still in
 * @param plusToSpace       <b>IN</b>: Whether to convert '+' to ' ' or not
 * @param breakConversion   <b>IN</b>: Line break conversion mode
 * @return                  Error code or 0 on success
 *
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExMmA
 * @see uriComposeQueryExA
 * @see uriFreeQueryListA
 * @since 0.7.0
 */
extern int externDissectQueryMallocEx(QueryList ** dest,
		int * itemCount, const URI_CHAR * first, const URI_CHAR * afterLast,
		UriBool plusToSpace, UriBreakConversion breakConversion);



/**
 * Constructs a query list from the raw query string of a given URI.
 *
 * @param dest              <b>OUT</b>: Output destination
 * @param itemCount         <b>OUT</b>: Number of items found, can be NULL
 * @param first             <b>IN</b>: Pointer to first character <b>after</b> '?'
 * @param afterLast         <b>IN</b>: Pointer to character after the last one still in
 * @param plusToSpace       <b>IN</b>: Whether to convert '+' to ' ' or not
 * @param breakConversion   <b>IN</b>: Line break conversion mode
 * @param memory            <b>IN</b>: Memory manager to use, NULL for default libc
 * @return                  Error code or 0 on success
 *
 * @see uriDissectQueryMallocA
 * @see uriDissectQueryMallocExA
 * @see uriComposeQueryExA
 * @see uriFreeQueryListA
 * @see uriFreeQueryListMmA
 * @since 0.9.0
 */
extern int externDissectQueryMallocExMm(QueryList ** dest,
		int * itemCount, const URI_CHAR * first, const URI_CHAR * afterLast,
		UriBool plusToSpace, UriBreakConversion breakConversion,
		UriMemoryManager * memory);



/**
 * Frees all memory associated with the given query list.
 * The structure itself is freed as well.
 *
 * @param queryList   <b>INOUT</b>: Query list to free
 *
 * @see uriFreeQueryListMmA
 * @since 0.7.0
 */
extern void externFreeQueryList(QueryList * queryList);



/**
 * Frees all memory associated with the given query list.
 * The structure itself is freed as well.
 *
 * @param queryList  <b>INOUT</b>: Query list to free
 * @param memory     <b>IN</b>: Memory manager to use, NULL for default libc
 * @return           Error code or 0 on success
 *
 * @see uriFreeQueryListA
 * @since 0.9.0
 */
extern int externFreeQueryListMm(QueryList * queryList,
		UriMemoryManager * memory);



/**
 * Makes the %URI hold copies of strings so that it no longer depends
 * on the original %URI string.  If the %URI is already owner of copies,
 * this function returns <c>URI_TRUE</c> and does not modify the %URI further.
 *
 * Uses default libc-based memory manager.
 *
 * @param uri    <b>INOUT</b>: %URI to make independent
 * @return       Error code or 0 on success
 *
 * @see uriMakeOwnerMmA
 * @since 0.9.4
 */
extern int externMakeOwner(Uri * uri);



/**
 * Makes the %URI hold copies of strings so that it no longer depends
 * on the original %URI string.  If the %URI is already owner of copies,
 * this function returns <c>URI_TRUE</c> and does not modify the %URI further.
 *
 * @param uri     <b>INOUT</b>: %URI to make independent
 * @param memory  <b>IN</b>: Memory manager to use, NULL for default libc
 * @return        Error code or 0 on success
 *
 * @see uriMakeOwnerA
 * @since 0.9.4
 */
extern int externMakeOwnerMm(Uri * uri,
                                     UriMemoryManager * memory);



#ifdef __cplusplus
}
#endif



#endif
#endif
