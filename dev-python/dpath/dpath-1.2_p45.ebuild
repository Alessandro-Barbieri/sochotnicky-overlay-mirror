# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1

MY_V=${PV/_p/-}

DESCRIPTION="Module for accessing and searching dictionaries via /slashed/paths ala xpath"
HOMEPAGE="http://github.com/akesterson/dpath-python"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${MY_V}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND=""

S="${WORKDIR}/${PN}-${MY_V}"
