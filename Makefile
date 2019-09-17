
create:
	operator-sdk new sample-operator --repo github.com/krol/sample-operator

crd:
	operator-sdk add api --api-version=app.devopsdays.com/v1alpha1 --kind=PodSet