#!/bin/bash

# Git 푸시 스크립트
# 사용법: ./push.sh "커밋 메시지"

# 커밋 메시지가 제공되지 않은 경우
if [ -z "$1" ]; then
    echo "커밋 메시지를 입력해주세요."
    echo "사용법: ./push.sh \"커밋 메시지\""
    exit 1
fi

COMMIT_MESSAGE="$1"

# 현재 브랜치 확인
CURRENT_BRANCH=$(git branch --show-current)

echo "현재 브랜치: $CURRENT_BRANCH"
echo "변경사항 추가 중..."
git add .

echo "커밋 중... ($COMMIT_MESSAGE)"
git commit -m "$COMMIT_MESSAGE"

echo "원격 저장소로 푸시 중..."
git push origin $CURRENT_BRANCH

if [ $? -eq 0 ]; then
    echo "✅ 푸시 완료!"
else
    echo "❌ 푸시 실패!"
    exit 1
fi
