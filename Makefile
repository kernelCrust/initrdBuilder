include ~/workDir/.lcb-env
ifndef TARGET_DIR
	echo "??"
endif

help:
	@echo 'empty help (still)'
# ################
# Tuning
dev:
	@nvim Makefile
build.%:
	@$(MAKE) -C invoker $(shell scripts/parse-scheme.sh $*) ROOT_DIR=$(TARGET_DIR)/$*
# ################
# Any submodule
%:
	@echo [ AUTODETECTION: $@ ]
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
# ################
# GIT
pull:
	@git pull
savetogit: git.pushall
	@echo '<--'
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@if [ -n "$(shell git status -s)" ] ; then git commit -m 'saving'; else echo '--- nothing to commit'; fi
git.addall:
	@git add .
