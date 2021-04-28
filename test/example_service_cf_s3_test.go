package test

import (
	"crypto/tls"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
)

func TestExampleServiceCfS3(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/service-cf-s3",
		NoColor: true,
	})
	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	albEndpoint := terraform.Output(t, terraformOptions, "cloudfront_dns_name")

	tlsConfig := tls.Config{}
	http_helper.HttpGetWithRetryWithCustomValidation(t, "http://" + albEndpoint, &tlsConfig, 60, 10 * time.Second, func(statusCode int, body string) bool {
		return statusCode == 200
	})
}

