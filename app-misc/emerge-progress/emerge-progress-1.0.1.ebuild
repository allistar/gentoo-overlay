EAPI=8
DESCRIPTION="Emerge progress viewer with ETA, idle spinner, phase highlighting, and terminal title"
HOMEPAGE="https://github.com/REPLACE_ME/gentoo-overlay"
LICENSE="MIT"
SLOT="0"
KEYWORDS=""

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
  dobin "${FILESDIR}"/emerge-progress
  dodoc -r /dev/null 2>/dev/null || :
}
