# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/buzhug/buzhug-1.6.ebuild,v 1.1 2009/12/21 00:28:44 arfrever Exp $

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Fast, pure-Python database engine, using a syntax that Python programmers should find very intuitive"
HOMEPAGE="http://code.google.com/p/pyqtrailer/"
SRC_URI="http://pypi.python.org/packages/source/p/pyqtrailer/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-python/pytrailer-0.2"
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"
