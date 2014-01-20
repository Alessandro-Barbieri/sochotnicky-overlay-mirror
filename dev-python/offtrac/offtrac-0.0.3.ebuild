# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_{6,7} )

# no source releases, grab from git
SRC_URI="https://git.fedorahosted.org/cgit/offtrac.git/snapshot/${P}.tar.bz2"

inherit distutils-r1

DESCRIPTION="Xmlrpc client library for www-apps/trac instances"
HOMEPAGE="http://fedorahosted.org/offtrac"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""
