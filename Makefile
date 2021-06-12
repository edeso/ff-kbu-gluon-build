# GLUON-RELEASE to use
ifndef GLUON_RELEASE
	GLUON_RELEASE:=v2021.1.x
endif

ifndef GLUON_BRANCH
	GLUON_BRANCH:=$(GLUON_RELEASE)
endif


#What targets to use?
ifndef TARGETS
	TARGETS:=ipq40xx-generic ipq806x-generic ath79-generic lantiq-xway lantiq-xrx200 mpc85xx-generic mpc85xx-p1020 ar71xx-tiny ar71xx-generic ar71xx-nand x86-generic x86-geode x86-64 brcm2708-bcm2708 brcm2708-bcm2709 sunxi-cortexa7 ramips-mt7621 ramips-mt76x8 ramips-rt305x
endif


###
### Nothing to be changed from here
###

world: dist

# Create all distribution artifacts in ./dist
dist: $(addprefix dist/,$(TARGETS))
	mv $(PWD)/gluon/output/packages $(PWD)/dist
	find $(PWD)/dist -type f -print0  | xargs -0 sha512sum > $(PWD)/dist/sha512sums

# Log Build
init: gluon/Makefile
	mkdir -p  $(PWD)/dist
	date > $(PWD)/dist/log.txt
	@echo "GLUON_RELEASE: $(GLUON_RELEASE)" >> $(PWD)/dist/log.txt
	@echo "REPOSITORY_PREFIX: $(REPOSITORY_PREFIX)" >> $(PWD)/dist/log.txt
	@echo "SITE_BRANCH: $(SITE_BRANCH)" >> $(PWD)/dist/log.txt
	@echo "Gluon git status" >> $(PWD)/dist/log.txt
	cd gluon; git branch -v >> $(PWD)/dist/log.txt

.PHONY: dist/% init clean clean-% dist world
# Create a distribution for a certain gluon
dist/%: init
	cp -a site/* $(PWD)/gluon/site/
	make -C gluon GLUON_DEPRECATED=1 update
	mkdir -p $(PWD)/dist/
	make -C gluon all -j 4 BROKEN=1 GLUON_TARGET=$* GLUON_DEPRECATED=1  2>&1 | tee $(PWD)/dist/out_$*.txt
	rsync -Hav $(PWD)/gluon/output/images/ $(PWD)/dist/

	make -C gluon clean BROKEN=1 GLUON_DEPRECATED=1  GLUON_TARGET=$*

gluon/Makefile:
	git clone https://github.com/freifunk-gluon/gluon.git -b $(GLUON_BRANCH)
	mkdir -p $(PWD)/gluon/site/i18n

clean:
	rm -Rf dist
