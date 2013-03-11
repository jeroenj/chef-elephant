PROJECT_PATHS=(~/Development/RoR ~/Development/ruby ~/Development/iOS ~/Development/python ~/Development/javascript ~/Development/RoR/Thinx ~/Development/MacRuby ~/Development/RubyMotion ~/Development/general ~/Development/chef ~/Development/vagrant)

function project () {
  cmd="cd"
  file=$1

  if [[ "open" == "$file" ]] then
    file=$2
    cmd=(${(s: :)EDITOR})
  fi

  for project in $PROJECT_PATHS; do
    if [[ -d $project/$file ]] then
      $cmd "$project/$file"
      unset project # Unset project var
      return
    fi
  done

  echo "No such project $1"
}

alias p="project"
alias m="project open "

function _project () {
  compadd `/bin/ls -l $PROJECT_PATHS | awk '{ print $9 }'`
}

compdef _project project
