#! /bin/bash
eval `ssh-agent -s`
ssh-add

gs(){
 git status
}

gl() {
 git log --graph --pretty=format:'%Cred%h%Creset %Cgreen%cr %C(bold yellow)%an %Creset- %s  %Creset' --abbrev-commit $1 $2 $3 $4 $5 $6 $7 $8 $9
}

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function check {
                          count=0
                        
                          if [ "$2" = "" ]; then
                                                      echo "########################### Checkins ###########################"
                                                      for item in $(git log --pretty=%H --grep $1); do
                                                                                 git show -s --pretty="%h %cn, %s - %ar" $item
                                                      done
                                                    
                                                      echo ""
                                                      echo "########################### Files ###########################"
                                                      for item in $(git log --pretty=%h --grep $1); do
                                                                                 for file in $(git diff-tree --no-commit-id --name-only -r $item); do
                                                                                                            count=$(($count + 1))
                                                                                                            echo -e "$item $count\t$file"
                                                                                 done
                                                      done
                          else
                                                      ########################### Diff ###########################
                                                                                 for item in $(git log --pretty=%H --grep $1); do
                                                                                                            for file in $(git diff-tree --no-commit-id --name-only -r $item); do
                                                                                                                                       count=$(($count + 1))
                                                                                                                                       if [ "$count" = "$2" ]; then
                                                                                                                                                                   git show $item $file
                                                                                                                                       fi
                                                                                                            done
                                                      done
                          fi
}

bla = bla || {};

bla.autoComplete = function(){
	lkasjdflksjad : alskdja
}


bla.autoComplete