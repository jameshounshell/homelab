import github

import os
TOKEN = os.environ["GITHUB_PERSONAL_ACCESS_TOKEN"]
gh = github.Github(login_or_token=TOKEN)
repo = gh.get_repo("jameshounshell/homelab")
print(list(repo.get_hooks()))