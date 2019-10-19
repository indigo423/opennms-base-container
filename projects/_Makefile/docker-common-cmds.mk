tag: build
	docker tag $(DOCKER_PROJECT) $(DOCKER_TAG); \
	if [[ -n "${CIRCLE_BUILD_NUM}" ]]; then \
	  docker tag $(DOCKER_PROJECT) $(DOCKER_TAG)-b$(CIRCLE_BUILD_NUM); \
	fi; \

oci: build tag
	docker image save $(CONTAINER_PROJECT) -o images/image.oci

push: tag
	docker push $(DOCKER_REGISTRY)/$(DOCKER_ORG)/$(DOCKER_PROJECT)

prune:
	docker system prune -af
