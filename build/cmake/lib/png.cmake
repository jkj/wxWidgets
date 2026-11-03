#############################################################################
# Name:        build/cmake/lib/png.cmake
# Purpose:     Use external or internal libpng
# Author:      Tobias Taschner
# Created:     2016-09-21
# Copyright:   (c) 2016 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled libpng and its submodule are removed. ncomm-deps builds libpng
# before wx and hands it over as "sys", so a libpng that cannot be found stops the configure, where
# upstream would quietly build its own copy.
if(wxUSE_LIBPNG STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_LIBPNG=builtin, and this tree has no bundled libpng: use sys.")
endif()

if(wxUSE_LIBPNG STREQUAL "sys")
    find_package(PNG)
    if(NOT PNG_FOUND)
        message(FATAL_ERROR "wxUSE_LIBPNG=sys, and find_package(PNG) did not find libpng.")
    endif()
endif()
