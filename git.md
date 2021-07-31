# Git



## Command line instructions:

### Git global setup
```
git config --global user.name "Abdul Matin"
git config --global user.email "matinict@gmail.com"
Create a new repository
git clone https://gitlab.com/matinict/pondit_lvblog.git
cd pondit_lvblog
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

Existing folder or Git repository
cd existing_folder
```
git init
git remote add origin https://gitlab.com/matinict/pondit_lvblog.git
git add .
git commit
git push -u origin master
```


## Git basic Command line instructions
!!==================================================================!!

	Git global setup
	git config --global user.name "matinict"
	git config --global user.email "matinict@gmail.com"

	Create a new repository
	git clone https://gitlab.com/matinict/laravelcrud.git
	cd laravelcrud
	touch README.md
	git add README.md
	git commit -m "add README"
	git push -u origin master

	Existing folder or Git repository
	cd existing_folder
	git init
	git remote add origin https://gitlab.com/matinict/laravelcrud.git
	git remote add origin https://github.com/harriswebworks/MailChimpExt.git
	git add .
	git commit
	git push -u origin master
	
	
	Git Global Setup From Remote Repo to local directory:
	git config --global user.name "matinict"		[global config]
	git config --global user.email "matinict@gmail.com"
	git init	[git initialization ]
	git pull origin master		[Credential. Download Fresh copy from repository]
	git status 	[check status After Create new file ]
	git add . 	[Add New file to repository]
	git diff
	git diff --staged  	[Check different ]
	git commit -m "Test file Comment Here" 	[Commit with massge ]
	git push -u origin master 	[Download Fresh copy from repository]
	FORCE OVERWRITE OF LOCAL FILE WITH WHAT'S IT ORIGIN REPO:
	git fetch [Overwrite only one file from remote repository]
	git reset --hard origin/master   [Overwrite only one file from remote repository]
	Create /Swith Branch:
	====================================
	git branch [check current branch]
	git branch devlop  [Create new branch]
	git checkout devlop  [Swith Branch]
	git merge master [merge branch master & devlopment ]
	Download Fresh Copy From Remote:
	====================================
	git config --global user.name "matinict"
	git config --global user.email "matinict@gmail.com"
	git init	[git initialization ]
	//git remote add origin https://gitlab.com/matinict/pondit_git_test.git
	git remote add origin https://gitlab.com/matinict/pondit_laravel30.git
	git remote add origin https://gitlab.com/matinict/pondit_laravel30.git
	php		[Credential. Download Fresh copy from repository]
	
	Upload New File Local to Remote:
	====================================
	git status 	[check status After Create new file ]
	git add . 	[Add New file to repository]
	//git diff
	//git diff --staged  	[Check different ]
	git commit -m "Test file Comment Here" 	[Commit with massge ]
	git push -u origin master 	[Upload File to remote repository]
	
	Update Edit/ Modified  File Local to Remote:
	============================================
	git status 	[check status After Create new file ]
	git add . 	[Add New file to repository]
	git commit -m "Test file Comment Here" 	[Commit with massge ]
	git push -u origin master 	[Upload File to remote repository with credential]
	FORCE OVERWRITE OF LOCAL FILE WITH WHAT'S IT ORIGIN REPO:
	git fetch [Overwrite only one file from remote repository]
	git reset --hard origin/master   [Overwrite only one file from remote repository]
	
	Git Update Local from remote
	=========================================================
	git pull origin master
	
	
	To exit (g)Vim type:
	==========================
	EscZZ or Esc:wq Return.
	

	```
## Git Branching and Merging:

### Git: merge 'develop' in to 'master'

	```
	git diff master..develop [Develop Server]
	git status [On branch develop]
	git checkout master [if develop change to master]
	git status [On branch master]
	git merge develop
	git push -u origin master
	
	git pull origin master   [master pull to live ]
	git reset --keep HEAD@{1}  [undo latest pull ]
	
	```
### Others

```
git clone (URL)   [Retrieve/Clone a repo]
git remote (-v for detail)  [List remotes]
git log --all --decorate --oneline --graph  [Commit graph]
git checkout  [Checkout a branch]
git checkout -b (branch name)   [Create and checkout a branch]
git fetch (remote name)  [Retrieve/download from a remote]
git merge (branch or tracking branch name)  [merge branch or tracking-branch]
git status  [Show status]
git push (remote name) (branch name)  [Upload to a remote]
git add (filename)  [stage an edit] 
git commit -m "description"   [make a commit ]
git commit -a -m "description"  [stage and commit ]
git branch  [List local branches]
git branch -r  [List remote branches] 
git branch -a  [List both local and remote branches]

git log   [git history]
git log --all --decorate --oneline --graph = commit history graph
git branch (branch-name) = create a branch
git checkout (branch-name) = checkout a branch/move head pointer
git commit -a -m "commit message" = commit all modified and tracked files in on command (bypass separate 'git add' command)
git diff master..develop [= diff between 2 branches]
git merge (branch-name) = merge branches (fast-forward and 3-way merges)
git branch --merged = see branches merged into the current branch
git branch -d (branch-name) = delete a branch, only if already merged
git branch -D (branch-name) = delete a branch, including if not already merged (exercise caution here)
git merge --abort = abort a merge during a merge conflict situation
git checkout (commit-hash) = checkout a commit directly, not through a branch, results in a detached HEAD state
git stash = create a stash point
git stash list = list stash points
git stash list -p = list stash points and show diffs per stash
git stash apply = apply most recent stash
git stash pop = apply most recent stash, and remove it from saved stashes
git stash apply (stash reference) = apply a specific stash point
git stash save "(description)" = create a stash point, be more descriptive
```
## Clear already committed files but included in .gitignore
	
- Remove everything from the index (the files will stay in the file system) 
	```
	git rm -r --cached .
	```

- Re-add everything (they'll be added in the current state, changes included)
	```
	git add .
	```

- Commit, if anything changed. You should see only deletions
	```
	git commit -m 'Remove all files that are in the .gitignore'
	```

- Update the remote
	```
	git push origin master
## Use a .gitignore File What If I Already Have It Checked In?
Git will not ignore the file if you've already committed it. You'll have to untrack the file first, then it will start ignoring it. You can untrack the file with this command:

```
git rm --cached FILENAME

or

echo debug.log >> .gitignore
git rm --cached debug.log
rm 'debug.log'
git commit -m "Start ignoring debug.log"
```

### add  directory to .gitignore

	$ cat .gitignore
	# exclude everything except directory foo/bar
	/*
	!/foo
	/foo/*
	!/foo/bar
    

## How to add / commit Directory recusively 

```
git status 	[check status After Create new file ]
git add  app/code/Amasty/Label/*	[Add New file to repository]
git add  app/code/Amasty/Label/* app/code/Bdcrops/*	[Add multiple dir]
git commit -m "AmastyLabel update" 	[Commit with massge ]
git push -u origin master 


```

## RemoveDelete dir

```
git checkout master [Ensure you are in the default branch]
git rm -r folder-name [rm -r command will recursively remove your folder]
git commit -m "Remove duplicated directory" [Commit the change:]
git push origin master [Push the change to your remote repository:]
```




### Working With Feature Branch
============================================================ 

LOC:*local Branch/ create feature branch each feature
 
	git status
	git add stagetest.php
	git status
	nano stest.php
	git commit -m "stg test"
	git push origin mloc
	git stash
	git status
	git checkout -b gignor1
	git log
	git add dir/*
	git commit -m "master ini commit"
	git push origin stest
	git checkout -b gitIgnor2
	git checkout -b gitIgnore3 [Feature Name:gitIgnore3 ]
	git branch
	git status
	git add .gitignore
	git commit -m "remove media issue"
	git push
	git push origin gitIgnore3

  

Stage: * stage

	git status
	git init
	git status
	git branch
	git add .
	git commit -m "master ini commit"
	git remote add origin git@gitlab.eoninfosys.com:matin/eonbazar.git
	git pull
	git pull origin
	git remote add origin http://gitlab.domain.com/matin/project1.git
	git remote rm origin
	git remote add origin http://gitlab.domain.com/matin/project1.git
	git pull --all origin
	git pull  origin
	git branch
	git branch -a
	git checkout stage
	stest.php [check  ls]
	
	
	git checkout -b v1.0-matin-mobile-email-login
	git branch
	git status
	git add app/code/Vendor/MobileLogin/
	git commit -m "matin-mobile-email-login Apps"
	git push origin v1.0-matin-mobile-email-login

### Override Local

	git fetch --all
	git fetch --force
	
	git checkout -f branch



	git reset --hard origin/stage
	
## Stashing and Cleaning

	git status
	
	 git stash push -m dcompileIssue_cart PayPal/ButtonAdapter.php



	# modified:   lib/simplegit.rb
	
	git stash 
	git stash list
	git stash apply
	git stash apply --index
	git status -s
	git stash --patch
	
	git clean -d -n
	git clean -n -d
	
	git status -s
	M lib/simplegit.rb
	?? build.TMP
	?? tmp/

	git clean -n -d
	Would remove build.TMP
	Would remove tmp/

	git clean -n -d -x
	Would remove build.TMP
	Would remove test.o






	

## ref
- [git-scm-book](https://git-scm.com/book/en/v2)
- [BranchingMergingYu](https://www.youtube.com/watch?v=FyAAIHHClqI)
- [git/tutorials](https://www.atlassian.com/git/tutorials/saving-changes/gitignore)

	
