IMAGE ?= rstudio/r-docker-tests
BASE_IMAGE ?= rstudio/r-base
VERSIONS = 3.1 3.2 3.3 3.4 3.5 3.6
VARIANTS = xenial bionic centos6 centos7 opensuse42 opensuse15
TEST ?= all

all: build-all test-all

update-all-docker:
	docker run -it --rm -v $(PWD):/r-docker -w /r-docker ubuntu:xenial /r-docker/update.sh

update-all:
	@./update.sh

define GEN_BUILD_IMAGES
build-$(version)-$(variant):
	docker build -t $(IMAGE):$(version)-$(variant) --build-arg BASE_IMAGE=$(BASE_IMAGE) $(version)/$(variant)/.

rebuild-$(version)-$(variant):
	docker build --no-cache -t $(IMAGE):$(version)-$(variant) --build-arg BASE_IMAGE=$(BASE_IMAGE) $(version)/$(variant)/.

test-$(version)-$(variant):
	docker run -it --rm -v $(PWD)/test:/test $(IMAGE):$(version)-$(variant) bash -l /test/test-$(TEST).sh

bash-$(version)-$(variant):
	docker run -it --rm -v $(PWD)/test:/test $(IMAGE):$(version)-$(variant) /bin/bash

BUILD_IMAGES += build-$(version)-$(variant)
REBUILD_IMAGES += rebuild-$(version)-$(variant)
TEST_IMAGES += test-$(version)-$(variant)
endef

$(foreach variant,$(VARIANTS), \
  $(foreach version,$(VERSIONS), \
    $(eval $(GEN_BUILD_IMAGES)) \
  ) \
)

rebuild-all: $(REBUILD_IMAGES)

build-all: $(BUILD_IMAGES)

test-all: $(TEST_IMAGES)