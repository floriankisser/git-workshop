git config --global user.name "John Doe"
git config --global user.email johndoe@seekda.com
# copy public ssh key to github

# new repo
git init
git add
git commit
git remote add origin <url>
git push -u origin master

# existing repo
git clone <url>
cd <dir>
git branch -a
git checkout -t origin/develop

# development
git checkout -b myfeature [develop|master]
# hack
git diff
git add [-p|-i]
git mv
git rm
git diff --staged
git commit
git log
git checkout develop
git fetch
git status
git pull --ff-only
git merge --no-ff myfeature
git push origin develop
git branch -d myfeature

# advanced
git reflog

git commit --amend
git rebase -i <new-base>
git reset [--hard] <commit>

git checkout -- <file>
git revert <commit>
git cherry-pick <commit>

git bisect

git stash && git stash pop

# further help
git help revisions
git help rebase

