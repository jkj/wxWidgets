#############################################################################
# Name:        build/cmake/lib/zlib.cmake
# Purpose:     Use external or internal zlib
# Author:      Tobias Taschner
# Created:     2016-09-21
# Copyright:   (c) 2016 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled zlib and its submodule are removed. ncomm-deps builds zlib before
# wx and hands it over as "sys", so a zlib that cannot be found stops the configure, where upstream
# would quietly build its own copy.
if(wxUSE_ZLIB STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_ZLIB=builtin, and this tree has no bundled zlib: use sys.")
endif()

if(wxUSE_ZLIB STREQUAL "sys")
    find_package(ZLIB)
    if(NOT ZLIB_FOUND)
        message(FATAL_ERROR "wxUSE_ZLIB=sys, and find_package(ZLIB) did not find zlib.")
    endif()
endif()
