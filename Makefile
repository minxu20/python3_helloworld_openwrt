PATH := build/python/bin:$(PATH)
ALLFILES = $(shell echo helloworld.py)

#.PHONY: release coverage install docs test test_all test_25 test_26 test_27 test_31 test_32 test_33 2to3 clean

#release: test_all
#	python setup.py --version | egrep -q -v '[a-zA-Z]' # Fail on dev/rc versions
#	git commit -e -m "Release of $(VERSION)"           # Fail on nothing to commit
#	git tag -a -m "Release of $(VERSION)" $(VERSION)   # Fail on existing tags
#	git push origin HEAD                               # Fail on out-of-sync upstream
#	git push origin tag $(VERSION)                     # Fail on dublicate tag
#	python setup.py sdist register upload              # Release to pypi

coverage:
	-mkdir build/
	coverage erase
	#COVERAGE_PROCESS_START=.coveragerc test/testall.py
	coverage combine
	coverage report
	coverage html

install:
	python helloworld.py install

clean:
	rm -rf build/ dist/ MANIFEST 2>/dev/null || true
	find . -name '__pycache__' -exec rm -rf {} +
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '._*' -exec rm -f {} +
	find . -name '.coverage*' -exec rm -f {} +

