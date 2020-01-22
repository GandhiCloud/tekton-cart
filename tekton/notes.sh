#!/usr/bin/env bash

sh build-dockerhub.sh

oc new-project tekton-cart

oc apply -f service_account-role.yaml
oc delete -f service_account-role.yaml

oc apply -f docker-secret.yaml
oc delete -f docker-secret.yaml

oc apply -f pipeline-resources.yaml
oc delete -f pipeline-resources.yaml


oc apply -f task-1-build-docker-image.yaml
oc delete -f task-1-build-docker-image.yaml

oc apply -f task-2-deploy-using-kubectl.yaml
oc delete -f task-2-deploy-using-kubectl.yaml


oc apply -f pipeline.yaml
oc delete -f pipeline.yaml

oc apply -f pipeline-run.yaml
oc delete -f pipeline-run.yaml

oc delete -f *.yaml

oc apply -f pv.yaml


oc apply -f pv.yaml
oc delete -f pipeline.yaml
oc apply -f pipeline.yaml
oc delete -f pipeline-run.yaml
oc apply -f pipeline-run.yaml

oc apply -f pv.yaml
oc apply -f docker-secret.yaml
oc apply -f service_account-role.yaml
oc apply -f pipeline-resources.yaml
oc apply -f task-1-build-docker-image.yaml
oc apply -f task-2-deploy-using-kubectl.yaml
oc apply -f pipeline.yaml

oc apply -f pipeline-run.yaml




docker run -p 8080:8080 test-1


$ kubectl -n tekton-cart logs tekton-cart-pipeline-run-05-build-docker-image-szcx4-pod-4917b5
Error from server (BadRequest): a container name must be specified for pod tekton-cart-pipeline-run-05-build-docker-image-szcx4-pod-4917b5, choose one of: [step-create-dir-image-registry-5pvp2 step-git-source-git-repo-f87r5 step-build-and-push step-image-digest-exporter-ccnjm] or one of the init containers: [step-credential-initializer-h4sw5 create-dir-default-image-output-2sz9j step-place-tools]


error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Action:pull Class: Name:gandhicloud/tekton-cart Type:repository] map[Action:push Class: Name:gandhicloud/tekton-cart Type:repository]]

error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Action:pull Class: Name:gandhicloud/tekton-cart Type:repository] map[Action:push Class: Name:gandhicloud/tekton-cart Type:repository]]

error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Action:pull Class: Name:gandhicloud/tekton-cart Type:repository] map[Action:push Class: Name:gandhicloud/tekton-cart Type:repository]]

error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Type:repository Class: Name:gandhicloud/tekton-cart Action:pull] map[Name:gandhicloud/tekton-cart Action:push Type:repository Class:]]