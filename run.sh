RUN_PYTHON="python"
RUN_GO="go"
GO_FLAG="run"

RUN_NODE="node"
RUN_SHELL="sh"
RUN_C="gcc"
RUN_CPP="g++"
RUN_RUBY="ruby"

function exec_cmd() {
  cmd=$1
  file=$2

  cc=$cmd' '$file
  len=${#cc}
  echo $cmd $file\\n
  $cmd $file
}

function exec_with_flag() {
  cmd=$1
  flag=$2
  file=$3

  echo $cmd $flag $file\\n
  $cmd $flag $file
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
    "go")  exec_with_flag $RUN_GO $GO_FLAG ${@:3} ;;
    "py")  exec_cmd $RUN_PYTHON $FILENAME ;;
    "sh")  exec_cmd $RUN_SHELL $FILENAME ;;
    "c")   exec_cmd $RUN_C $FILENAME ;;
    "cpp") exec_cmd $RUN_CPP $FILENAME ;;
    "js")  exec_cmd $RUN_NODE $FILENAME ;;
    "rb")  exec_cmd $RUN_RUBY $FILENAME ;;
    *)
      echo "Not support extension"
      return 1
    ;;
  esac
}
