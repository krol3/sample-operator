
REPOSITORY=krol
TAG=1.0

create:
	operator-sdk new sample-operator --repo github.com/krol/sample-operator

crd:
	operator-sdk add api --api-version=app.devopsdays.com/v1alpha1 --kind=PodSet

controller:
	operator-sdk add controller --api-version=app.devopsdays.com/v1alpha1 --kind=PodSet

generate:
	operator-sdk generate k8s

publish:
	operator-sdk build ${REPOSITORY}/podset-operator:${TAG}
	docker push ${REPOSITORY}/podset-operator:${TAG}

deploy_:
	sed -i 's|REPLACE_IMAGE|krol/podset-operator:1.0|g' deploy/operator.yaml
	kubectl create -f deploy/crds/app_v1alpha1_podset_crd.yaml 