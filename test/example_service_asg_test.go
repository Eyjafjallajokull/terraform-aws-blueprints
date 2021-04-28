package test

import (
	"crypto/tls"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	aws "github.com/gruntwork-io/terratest/modules/aws"
)

func TestExampleServiceASG(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/service-asg",
		NoColor: true,
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	instanceIDs := aws.GetInstanceIdsForAsg(t, "blueprints-ASG-production", "eu-central-1")
	publicIP := aws.GetPublicIpOfEc2Instance(t, instanceIDs[0], "eu-central-1")

	tlsConfig := tls.Config{}
	http_helper.HttpGetWithRetryWithCustomValidation(t, "http://" + publicIP, &tlsConfig, 60, 10 * time.Second, func(statusCode int, body string) bool {
		return statusCode == 200
	})
}

