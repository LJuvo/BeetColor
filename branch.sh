#!/bin/sh

int=1
while(( $int<=5 ))
do
    printf "\n操作选项\n\n"
    printf "1):查看所有分支\n"
    printf "2):创建新分支\n"
    printf "3):切换分支\n"
    printf "4):删除分支\n"
    printf "5):提交分支代码\n"
    printf "7):删除当前分支并重新创建该分支\n"
    printf "6):退出\n\n"

    echo -n "选择操作:"
    read checkNum
    case $checkNum in 
        1)  git branch -a
        ;;
        2)  echo -n "创建新分支(分支名):"
            read newBranchName
            git branch $newBranchName
            echo -n "切换为新分支 $newBranchName"
            git checkout $newBranchName
            echo -n "提交新分支 $newBranchName至远端"
            git push origin "$newBranchName":"$newBranchName"
        ;;
        3)  echo -n "切换分支请输入分支名："
            read checkBranchName
            echo -n "切换为 $checkBranchName分支"
            git checkout $checkBranchName
        ;;
        4)  echo -n "删除分支请输入分支名："
            read branchName
            echo -n "切换master分支"
            git checkout master
            echo -n "删除本地分支:$branchName"
            git branch -D $branchName
            echo -n "删除远端分支:$branchName"
            git push origin --delete $branchName
        ;;
        5)  

            br=`git branch | grep "*"`
            echo ${br/* /}

            currentBranch=${br/* /}
            git add -A
            echo -n "输入commit内容："
            read commitInfo
            git commit -m "$commitInfo"
            git push origin $currentBranch

            exit
        ;;
        6)  exit
        ;;
        7)  

            br=`git branch | grep "*"`
            currentThisBranch=${br/* /}

            if $currentBranch!='master'
                git checkout master
                git pull
                echo -n "删除本地分支:$currentThisBranch"
                git branch -D $currentThisBranch
                echo -n "删除远端分支:$currentThisBranch"
                git push origin --delete $currentThisBranch
                git branch $currentThisBranch
                git checkout $currentThisBranch
                
                exit
            then
                echo -n "不可操作当前分支:$currentThisBranch"

            fi
        ;;
        *)  echo '你没有输入 1 到 4 之间的数字'
        ;;
    esac
done