#!/usr/bin/env bash

sh build-dockerhub.sh

oc new-project tekton-cart

oc apply -f service_account-role.yaml
oc delete -f service_account-role.yaml

oc apply -f docker-secret.yaml
oc delete -f docker-secret.yaml

oc apply -f pipeline-resources.yaml
oc delete -f pipeline-resources.yaml

oc apply -f pipeline.yaml
oc delete -f pipeline.yaml

oc apply -f pipeline-run.yaml
oc delete -f pipeline-run.yaml

oc delete -f *.yaml

oc apply -f pv.yaml

      env:
        - name: DOCKER_CONFIG
          value: /builder/home/.docker
oc apply -f pv.yaml
oc delete -f pipeline.yaml
oc apply -f pipeline.yaml
oc delete -f pipeline-run.yaml
oc apply -f pipeline-run.yaml

error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Action:pull Class: Name:gandhicloud/tekton-cart Type:repository] map[Action:push Class: Name:gandhicloud/tekton-cart Type:repository]]

error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Action:pull Class: Name:gandhicloud/tekton-cart Type:repository] map[Action:push Class: Name:gandhicloud/tekton-cart Type:repository]]

error checking push permissions -- make sure you entered the correct tag name, and that you are authenticated correctly, and try again: checking push permission for "index.docker.io/gandhicloud/tekton-cart:latest": UNAUTHORIZED: authentication required; [map[Action:pull Class: Name:gandhicloud/tekton-cart Type:repository] map[Action:push Class: Name:gandhicloud/tekton-cart Type:repository]]