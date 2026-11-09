EAPI=8

PYTHON_COMPAT=( python3_{12..15} )

inherit bash-completion-r1 python-single-r1

DESCRIPTION="Run emerge with a pinned progress panel: phases, per-package and overall progress, and ETA"
HOMEPAGE="https://github.com/REPLACE_ME/gentoo-overlay"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# We ship the script directly from FILESDIR (no external distfiles)
SRC_URI=""
RESTRICT="mirror"

# The script imports portage to look up each package's eclasses.
RDEPEND="
  ${PYTHON_DEPS}
  $(python_gen_cond_dep 'sys-apps/portage[${PYTHON_USEDEP}]')
"

S="${WORKDIR}"

src_install() {
  python_newscript "${FILESDIR}/emergep" emergep
  newbashcomp "${FILESDIR}/emergep.bash-completion" emergep
}

pkg_postinst() {
  einfo "Installed /usr/bin/emergep, which replaces emerge-progress."
  einfo "Its own options now start with --ep-; see 'emergep --ep-help'."
}
