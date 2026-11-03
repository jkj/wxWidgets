#############################################################################
# Name:        build/cmake/lib/jpeg.cmake
# Purpose:     Use external or internal libjpeg
# Author:      Tobias Taschner
# Created:     2016-09-21
# Copyright:   (c) 2016 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled libjpeg and its submodule are removed. ncomm-deps builds
# libjpeg-turbo before wx and hands it over as "sys", so a libjpeg that cannot be found stops the
# configure, where upstream would quietly build its own copy.
if(wxUSE_LIBJPEG STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_LIBJPEG=builtin, and this tree has no bundled libjpeg: use sys.")
endif()

if(wxUSE_LIBJPEG STREQUAL "sys")
    find_package(JPEG)
    if(NOT JPEG_FOUND)
        message(FATAL_ERROR "wxUSE_LIBJPEG=sys, and find_package(JPEG) did not find libjpeg.")
    endif()
endif()
