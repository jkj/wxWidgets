#############################################################################
# Name:        build/cmake/lib/tiff.cmake
# Purpose:     Use external or internal libtiff
# Author:      Tobias Taschner
# Created:     2016-09-21
# Copyright:   (c) 2016 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled libtiff and its submodule are removed. ncomm-deps builds libtiff
# before wx and hands it over as "sys", so a libtiff that cannot be found stops the configure, where
# upstream would quietly build its own copy.
if(wxUSE_LIBTIFF STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_LIBTIFF=builtin, and this tree has no bundled libtiff: use sys.")
endif()

if(wxUSE_LIBTIFF STREQUAL "sys")
    find_package(TIFF)
    mark_as_advanced(Tiff_DIR)
    if(NOT TIFF_FOUND)
        message(FATAL_ERROR "wxUSE_LIBTIFF=sys, and find_package(TIFF) did not find libtiff.")
    endif()
endif()
