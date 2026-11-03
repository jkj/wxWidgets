#############################################################################
# Name:        build/cmake/lib/webp.cmake
# Purpose:     Use external or internal libwebp
# Author:
# Created:     2025-01-31
# Copyright:   (c) 2025 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled libwebp and its submodule are removed. ncomm-deps builds libwebp
# before wx and hands it over as "sys", so a libwebp that cannot be found stops the configure, where
# upstream would quietly build its own copy.
if(wxUSE_LIBWEBP STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_LIBWEBP=builtin, and this tree has no bundled libwebp: use sys.")
endif()

if(wxUSE_LIBWEBP STREQUAL "sys")
    find_package(WebP)
    mark_as_advanced(WebP_DIR)
    if(NOT WebP_FOUND)
        message(FATAL_ERROR "wxUSE_LIBWEBP=sys, and find_package(WebP) did not find libwebp.")
    endif()
endif()
