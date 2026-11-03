#############################################################################
# Name:        build/cmake/lib/regex.cmake
# Purpose:     Use external or internal regex lib
# Author:      Tobias Taschner
# Created:     2016-09-25
# Copyright:   (c) 2016 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled PCRE2 and its submodule are removed. ncomm-deps builds PCRE2
# before wx and hands it over as "sys", so a PCRE2 that cannot be found stops the configure, where
# upstream would quietly build its own copy.
if(wxUSE_REGEX STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_REGEX=builtin, and this tree has no bundled PCRE2: use sys.")
endif()

if(wxUSE_REGEX STREQUAL "sys")
    find_package(PCRE2)
    if(NOT PCRE2_FOUND)
        message(FATAL_ERROR "wxUSE_REGEX=sys, and find_package(PCRE2) did not find PCRE2.")
    endif()
    set(REGEX_LIBRARIES ${PCRE2_LIBRARIES})
    set(REGEX_INCLUDE_DIRS ${PCRE2_INCLUDE_DIRS})
endif()
