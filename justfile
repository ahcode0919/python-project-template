rendered := "_rendered/demo-project"

# List available recipes
[private]
default:
    @just --list
# Lint the template repo and template GitHub workflows
actionlint:
    actionlint .github/workflows/*.yml template/.github/workflows/*.yml
# Scan staged changes for secrets
git-leaks:
    gitleaks git --pre-commit --staged --redact
# Run the git hooks on staged files
prek:
    prek
# Render a demo project from the current template (includes uncommitted changes)
render:
    rm -rf {{ rendered }}
    uvx copier copy --trust --defaults --vcs-ref HEAD \
        --data project_name=demo-project \
        --data github_repo=example-owner/demo-project \
        . {{ rendered }}
# Install Homebrew tools from the Brewfile
setup:
    brew bundle install
# Render a demo project and run its lint, tests, docs build, dependency audit, and workflow audit
check: render
    cd {{ rendered }} && just sync
    cd {{ rendered }} && just ci-lint
    cd {{ rendered }} && just test
    cd {{ rendered }} && just docs-build
    cd {{ rendered }} && just audit
    cd {{ rendered }} && uvx zizmor --offline .
# Audit the template repo and template GitHub workflows for security issues
zizmor:
    zizmor . template --collect all
