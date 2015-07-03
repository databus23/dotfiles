function gopath
  find ~/gocode/src -depth -6 -type d -name .git -o -name .hg | sed -e 's!/Users/d062284/gocode/src/\(.*\)/.*!\1!'
end
