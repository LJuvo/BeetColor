#!/bin/sh

int=1
while(( $int<=5 ))
do
    printf "\n操作选项\n\n"
    printf "1):查看所有分支\n"
    printf "2):创建新分支\n"
    printf "3):删除分支\n"
    printf "4):提交分支代码\n"
    printf "5):退出\n\n"

    echo -n "选择操作:"
    read checkNum
    case $checkNum in 
        1)  git branch -a
        ;;
        2)  echo -n "创建新分支(分支名):"
            read newBranchName
            git branch $newBranchName
            git checkout $newBranchName
            git push origin "$newBranchName":"$newBranchName"
        ;;
        3)  echo -n "删除分支请输入分支名："
            read branchName
            echo -n "切换master分支"
            git checkout master
            echo -n "删除本地分支:$branchName"
            git branch -D $branchName
            echo -n "删除远端分支:$branchName"
            git push origin --delete $branchName
        ;;
        4)  

            br=`git branch | grep "*"`
            echo ${br/* /}

            currentBranch=${br/* /}
            git add -A
            echo -n "输入commit内容："
            read commitInfo
            git commit -m "$commitInfo"
            git push origin $currentBranch
        ;;
        5)  exit
        ;;
        *)  echo '你没有输入 1 到 4 之间的数字'
        ;;
    esac
done