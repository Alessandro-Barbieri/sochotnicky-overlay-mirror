# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

PYTHON_COMPAT=( python2_{6,7} )

inherit distutils-r1

MY_PN="python-bugzilla"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Python library and tool for interacting with Bugzilla"
HOMEPAGE="https://fedorahosted.org/python-bugzilla"
SRC_URI="https://fedorahosted.org/releases/${MY_PN:0:1}/${MY_PN:1:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="attachments test"

RDEPEND="
	dev-python/pycurl[$PYTHON_USEDEP]
	attachments? ( sys-apps/file[python] )"

DEPEND="dev-python/setuptools"

S="${WORKDIR}/${MY_P}"

DOCS=( bz-api-notes.txt README HACKING )

python_test() {
	"${PYTHON}" setup.py test || die "Testuite failed with ${EPYTHON}"
}
