# Makefile
# Time-stamp: <2018-04-08 09:52:43 (slane)>
.PHONY: all document build test check checking install winbuild site

all: document build check install site

checking: document build test check

document:
	Rscript -e "devtools::document()"

build:
	Rscript -e "devtools::build()"

test:
	Rscript -e "devtools::test()"

check:
	Rscript -e "devtools::check()"

install:
	Rscript -e "devtools::install(build_vignettes = TRUE, upgrade_dependencies = FALSE)"

winbuild:
	Rscript -e "devtools::build_win(version = 'R-devel', quiet = TRUE)"

site:
	Rscript -e "pkgdown::clean_site(); pkgdown::build_site()"
