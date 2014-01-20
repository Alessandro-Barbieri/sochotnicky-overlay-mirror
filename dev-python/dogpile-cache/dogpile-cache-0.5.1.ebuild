# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_{6,7} python3_{1,2,3} )

inherit distutils-r1

MY_PN=${PN/-/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="A caching API built around the concept of a dogpile lock"
HOMEPAGE="https://bitbucket.org/zzzeek/dogpile.cache"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=""
DEPEND="
	dev-python/dogpile-core[$PYTHON_USEDEP]
	test? ( dev-python/nose[$PYTHON_USEDEP]
			dev-python/mock[$PYTHON_USEDEP]
		)"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests tests || die "Testuite failed with ${EPYTHON}"
}
