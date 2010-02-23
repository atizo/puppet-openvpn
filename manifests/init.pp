#
# oracle module
#
# Copyright 2007, admin@immerda.ch
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class openvpn {
    case $operatingsystem {
        openbsd: { include openvpn::base::openbsd }
        default: { include openvpn::base }
    }
    if $use_munin {
    #    include openvpn::munin
    }
}
