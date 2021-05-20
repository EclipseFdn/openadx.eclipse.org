local deployment = import "../../releng/hugo-websites/kube-deployment.jsonnet";

deployment.newProductionDeploymentWithStaging(
  "openadx.eclipse.org", "openadx-staging.eclipse.org"
)