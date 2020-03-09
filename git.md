# Git



## Command line instructions:

### Git global setup

git config --global user.name "Abdul Matin"
git config --global user.email "matinict@gmail.com"
Create a new repository
git clone https://gitlab.com/matinict/pondit_lvblog.git
cd pondit_lvblog
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

Existing folder or Git repository
cd existing_folder
git init
git remote add origin https://gitlab.com/matinict/pondit_lvblog.git
git add .
git commit
git push -u origin master


#GitLab Command line instructions
!!==================================================================!!
	Git global setup
	git config --global user.name "matinict"
	git config --global user.email "matinict@gmail.com"

	Create a new repository
	git clone https://github.com/harriswebworks/edco.git
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
## Clear already committed files but included in .gitignore
	
- Remove everything from the index (the files will stay in the file system) 
	git rm -r --cached .

- Re-add everything (they'll be added in the current state, changes included)
	git add .

- Commit, if anything changed. You should see only deletions
	git commit -m 'Remove all files that are in the .gitignore'

- Update the remote
	git push origin master
