# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/mock/mock-1.0.3.ebuild,v 1.2 2011/11/02 22:44:19 vapier Exp $

EAPI="5"

inherit eutils bash-completion-r1

DESCRIPTION="Tool for checking common errors in RPM packages"
HOMEPAGE="http://rpmlint.zarb.org/"
SRC_URI="mirror://sourceforge/rpmlint/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion"

DEPEND="app-arch/rpm[python]"
RDEPEND="
	app-arch/rpm[python]
	sys-apps/file[python]
	dev-python/pyenchant"

src_install() {
	emake DESTDIR="${D}" install
	rm -r "${ED}"/usr/share/bash-completion || die
	if use bash-completion;then
	 	newbashcomp rpmlint.bash-completion ${PN}
	 	newbashcomp rpmlint.bash-completion rpmdiff
	fi
}
