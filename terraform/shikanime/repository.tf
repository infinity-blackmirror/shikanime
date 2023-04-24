resource "github_repository" "default" {
  name                 = var.name
  description          = "あらあらー\u3000( ⓛ ω ⓛ *)"
  has_downloads        = true
  has_issues           = true
  vulnerability_alerts = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_actions_secret" "cachix_token" {
  repository      = github_repository.default.name
  secret_name     = "CACHIX_AUTH_TOKEN"
  plaintext_value = var.cachix.token
}

resource "github_repository_environment" "wakabox" {
  repository  = github_repository.default.name
  environment = "${var.name}-wakabox"
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

resource "github_actions_environment_secret" "wakabox_wakatime" {
  repository      = github_repository.default.name
  environment     = github_repository_environment.wakabox.environment
  secret_name     = "WAKATIME_API_KEY"
  plaintext_value = var.wakatime.api_key
}
resource "github_actions_environment_variable" "wakabox_gist_id" {
  repository    = github_repository.default.name
  environment   = github_repository_environment.wakabox.environment
  variable_name = "WAKABOX_GITHUB_GIST_ID"
  value         = var.wakabox.github_gist_id
}

resource "github_actions_environment_secret" "wakabox_github_token" {
  repository      = github_repository.default.name
  environment     = github_repository_environment.wakabox.environment
  secret_name     = "WAKABOX_GITHUB_TOKEN"
  plaintext_value = var.wakabox.github_token
}

resource "github_repository" "algorithm" {
  name                 = "algorithm"
  description          = "My algorithms sketchbook"
  has_issues           = true
  vulnerability_alerts = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_actions_secret" "algorithm_cachix_token" {
  repository      = github_repository.algorithm.name
  secret_name     = "CACHIX_AUTH_TOKEN"
  plaintext_value = var.cachix.token
}
