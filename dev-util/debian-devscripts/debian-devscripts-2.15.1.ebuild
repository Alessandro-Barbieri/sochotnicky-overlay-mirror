# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/cloc/cloc-1.62.ebuild,v 1.1 2014/12/31 15:19:02 kensington Exp $

EAPI=5

MY_PN="devscripts"
DESCRIPTION="Scripts to make the life of a Debian Package maintainer easier"
HOMEPAGE="https://anonscm.debian.org/gitweb/?p=collab-maint/devscripts.git"
SRC_URI="mirror://debian/pool/main/d/${MY_PN}/${MY_PN}_${PV}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-lang/perl
	!<dev-util/rpmdevtools-8.5"
RDEPEND="${DEPEND}
	licensecheck? ( virtual/perl-Getopt-Long )
	checkbashisms? (
		virtual/perl-File-Temp
		virtual/perl-Getopt-Long
		!dev-util/checkbashisms
	)
	"

IUSE="+licensecheck +checkbashisms"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	for script in licensecheck.pl checkbashisms.pl; do
		sed -i "s/###VERSION###/${PV}/" scripts/$script || die
	done
}

src_compile() {
	for uflag in licensecheck; do
		if use $uflag;then
			pod2man scripts/${uflag}.pl > scripts/${uflag}.1 || die
		fi
	done
}

src_install() {
	for uflag in licensecheck checkbashisms; do
		if use $uflag;then
			doman scripts/$uflag.1
			newbin scripts/${uflag}.pl $uflag
		fi
	done
	for script in annotate-output.sh manpage-alert.sh;do
			doman scripts/${script/.sh/.1}
			newbin scripts/${script} ${script/.sh/}
	done
}
