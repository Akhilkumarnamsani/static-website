package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
  "strings"
)

func TestS3Website(t *testing.T) {
  t.Parallel()

  terraformOptions := &terraform.Options{
    TerraformDir: "../terraform",
    Vars: map[string]interface{}{
      "bucket_name": "my-static-site-test-bucket",
    },
  }

  defer terraform.Destroy(t, terraformOptions)
  terraform.InitAndApply(t, terraformOptions)

  websiteURL := terraform.Output(t, terraformOptions, "website_url")
  assert.True(t, strings.Contains(websiteURL, "amazonaws.com"))
}
