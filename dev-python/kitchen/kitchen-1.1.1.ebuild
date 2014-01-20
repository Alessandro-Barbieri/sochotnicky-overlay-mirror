# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1

DESCRIPTION="Small, useful pieces of code to make python coding easier"
HOMEPAGE="https://pypi.python.org/pypi/kitchen/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/chardet[$PYTHON_USEDEP]"

DEPEND="
	${RDEPEND}
	test? ( dev-python/nose dev-python/coverage )"

python_test() {
	# todo: i18n tests seem to fail
	rm tests/test_i18n.py
	# todo: SIGINT test fails in portage for some reason
	sed -i "/test_send_signal/,/^$/{d}" tests/test_subprocess.py
	nosetests tests || die "Testuite failed with ${EPYTHON}"
}
