EAPI=8
DESCRIPTION="Emerge progress viewer with ETA, idle spinner, phase highlighting, and terminal title"
HOMEPAGE="https://github.com/REPLACE_ME/gentoo-overlay"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

# We ship the script directly from FILESDIR (no external distfiles)
SRC_URI=""
RESTRICT="mirror"

RDEPEND="
  app-shells/bash
  sys-apps/coreutils
  sys-apps/gawk
"

S="${WORKDIR}"

src_install() {
  # install the script from FILESDIR
  newbin "${FILESDIR}/emerge-progress" emerge-progress
}

pkg_postinst() {
  einfo "Installed /usr/bin/emerge-progress"
  einfo "Tip: alias emerge-progress=\"$HOME/scripts/eb-progress -U -I --color=auto -- sudo emerge\" if you prefer wrapping."
}
