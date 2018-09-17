declare -A RUN_

RUN_[PYTHON]="python"
RUN_[GO]="go run"
RUN_[NODE]="node"
RUN_[SHELL]="sh"
RUN_[C]="gcc"
RUN_[CPP]="g++"
RUN_[RUBY]="ruby"
RUN_[HASKELL]="runhaskell"
RUN_[CLOJURE]="clj"
RUN_[ELIXIR]="elixir"

function exec_cmd() {
  cmd=$1
  file=$2

  if [[ -x "$(command -v $cmd)" ]]
  then
    echo $cmd $file
    echo --------------------------------
    $cmd $file
  else
    echo "\""$cmd"\" not found"
    return 1
  fi
}

function run() {
  if [ $# -eq 0 ]
  then
    echo "No file input"
    return 1
  fi

  FILENAME=$1
  EXT=${FILENAME##*.}

  case $EXT in
    "go")  exec_cmd ${RUN_[GO]} $FILENAME ;;
    "py")  exec_cmd ${RUN_[PYTHON]} $FILENAME ;;
    "sh")  exec_cmd ${RUN_[SHELL]} $FILENAME ;;
    "c")   exec_cmd ${RUN_[C]} $FILENAME ;;
    "cpp") exec_cmd ${RUN_[CPP]} $FILENAME ;;
    "js")  exec_cmd ${RUN_[NODE]} $FILENAME ;;
    "rb")  exec_cmd ${RUN_[RUBY]} $FILENAME ;;
    "hs")  exec_cmd ${RUN_[HASKELL]} $FILENAME ;;
    "clj") exec_cmd ${RUN_[CLOJURE]} $FILENAME ;;
    "ex")  exec_cmd ${RUN_[ELIXIR]} $FILENAME ;;
    *)
      echo "Not support extension"
      return 1
    ;;
  esac
}
