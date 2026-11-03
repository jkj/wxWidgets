#############################################################################
# Name:        build/cmake/lib/expat.cmake
# Purpose:     Use external or internal expat lib
# Author:      Tobias Taschner
# Created:     2016-09-21
# Copyright:   (c) 2016 wxWidgets development team
# Licence:     wxWindows licence
#############################################################################

# Nostalgia Commander: the bundled expat and its submodule are removed. ncomm-deps builds expat
# before wx and hands it over as "sys", so an expat that cannot be found stops the configure, where
# upstream would quietly build its own copy.
if(wxUSE_EXPAT STREQUAL "builtin")
    message(FATAL_ERROR "wxUSE_EXPAT=builtin, and this tree has no bundled expat: use sys.")
endif()

if(wxUSE_EXPAT STREQUAL "sys")
    find_package(EXPAT)
    if(NOT EXPAT_FOUND)
        message(FATAL_ERROR "wxUSE_EXPAT=sys, and find_package(EXPAT) did not find expat.")
    endif()
endif()
