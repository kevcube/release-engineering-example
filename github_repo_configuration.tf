terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  # configured via env vars
}

resource "github_repository" "this" {
  name            = "release-engineering-example"
  description     = "Example code for release-engineering blogpost"
  homepage_url    = "https://icecube.dog/release-engineering"
  visibility      = "public"
  has_issues      = false
  has_discussions = false
  has_downloads   = false
  has_projects    = false
  has_wiki        = false

  # Configuration recommendations
  allow_auto_merge          = true
  allow_merge_commit        = false
  allow_rebase_merge        = false
  allow_squash_merge        = true
  squash_merge_commit_title = "PR_TITLE"
  delete_branch_on_merge    = true
  # End configuration recommendations

}

# After creating this repository, manually set https://github.com/kevcube/release-engineering-example/settings/actions
# Allow GitHub Actions to create and approve pull requests = true

# There's no option in github terraform provider, and not available in `gh` CLI. :(
