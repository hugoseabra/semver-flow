git_closest_tag(){
    git describe --abbrev=0
}

git_flow_release(){
    git_flow_patch_release
}

git_flow_minor_release(){
    local LAST_TAG=$(git_closest_tag)
    local NEW_TAG=$(echo $LAST_TAG | python -c \
    'import semver, sys; print semver.bump_minor(sys.stdin.read())')

    git flow release start $NEW_TAG
    git flow release finish $NEW_TAG
    git push --follow-tags origin master develop
}

git_flow_major_release(){
    local LAST_TAG=$(git_closest_tag)
    local NEW_TAG=$(echo $LAST_TAG | python -c \
    'import semver, sys; print semver.bump_major(sys.stdin.read())')

    git flow release start $NEW_TAG
    git flow release finish $NEW_TAG
    git push --follow-tags origin master develop
}

git_flow_patch_release(){
    local LAST_TAG=$(git_closest_tag)
    local NEW_TAG=$(echo $LAST_TAG | python -c \
    'import semver, sys; print semver.bump_patch(sys.stdin.read())')

    git flow release start $NEW_TAG
    git flow release finish $NEW_TAG
    git push --follow-tags origin master develop
}
