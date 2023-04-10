if ! [[ -e "./config" ]]; then
	echo "config not found!"
	exit 1
fi

mkdir ./data &>/dev/null

header() {
	cat <<EOF
  ##############
  ##  $1  ##
  ##############
EOF
}

fll() {
	printf "%0.s${2:- }" $(seq 1 "${1:-1}")
}

serialize() {
	echo "./data/${1//\//__}"
}

catches() {
	# Comment lines
	if [[ "${1:0:1}" == "#" ]]; then
		echo 1
		return
	fi
	# Empty lines
	if [[ -z $1 ]]; then
		echo 2
		return
	fi
	# Exists
	if ! [[ -e $1 ]]; then
		echo 3
		return
	fi
	# Base Only
	if [[ $1 == "./data/" ]]; then
		echo 4
		return
	fi
	# Default
	echo 0
}

# deserialize() {
# 	out="${1/#.\/data\//}"
# 	echo "${dest//__/\/}"
# }
