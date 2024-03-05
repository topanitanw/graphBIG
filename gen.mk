# SUBDIR & ROOT should be predefined
#  before include this mk file

BUILDDIRS=$(SUBDIR:%=build-%)
CLEANDIRS=$(SUBDIR:%=clean-%)
RUNDIRS=$(SUBDIR:%=run-%)
TESTDIRS=$(SUBDIR:%=test-%)
HELPDIRS=$(word 1, ${SUBDIR})


default: all
test:
	@echo "BUILD DIRS: ${BUILDDIRS}"

all: pfm_cxx ${BUILDDIRS}
	@echo "- Build $@ "
	@echo "- BUILD DIRS: ${BUILDDIRS}"

${BUILDDIRS}:
	@echo "-- Build $@ $(@:build-%=%)"
	@${MAKE} -C $(@:build-%=%) all

pfm_cxx:
	@${MAKE} --no-print-directory -C ${ROOT}/tools all

clean: ${CLEANDIRS}
	@rm -f output.log

${CLEANDIRS}:
	@${MAKE} -C $(@:clean-%=%) clean


run: pfm_cxx ${RUNDIRS}
	@echo "-- Run $@ "
	@rm -f output.log
	@for d in ${SUBDIR}; do \
		cat $$d/output.log >> output.log; \
	done

${RUNDIRS}:
	@echo "-- rundirs | $@ | ${RUNDIRS}"
	${MAKE} -s -C $(@:run-%=%) run



verify: pfm_cxx ${TESTDIRS}

${TESTDIRS}:
	@${MAKE} -s -C $(@:test-%=%) verify

travis-verify: pfm_cxx ${TRAVIS_DIR:%=test-%}



help: ${HELPDIRS}

${HELPDIRS}:
	@${MAKE} -s -C $@ help



.PHONY: subdirs $(RUNDIRS)
.PHONY: subdirs $(BUILDDIRS)
.PHONY: subdirs $(HELPDIRS)
.PHONY: subdirs $(TESTDIRS)
.PHONY: subdirs $(CLEANDIRS)
.PHONY: all run clean verify pfm_cxx

