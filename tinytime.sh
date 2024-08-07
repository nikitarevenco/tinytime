tinytime() {
  local RESET='\033[0m'
  local GRAY='\033[90m'
  local ACCENT='\033[33m'

  day_with_suffix() {
    local day=$1
    if [[ $day =~ ^[0-9]+$ ]]; then
      case $day in
      1 | 21 | 31) echo "${day}st" ;;
      2 | 22) echo "${day}nd" ;;
      3 | 23) echo "${day}rd" ;;
      *) echo "${day}th" ;;
      esac
    else
      echo "$day"
    fi
  }

  local DAY=$(date +"%A")
  local TIME=$(date +"%-I:%M %p" | tr '[:lower:]' '[:upper:]')
  local MONTH=$(date +"%B")
  local DATE=$(date +"%-d") # Remove leading zero for day

  local FORMATTED_DATE=$(day_with_suffix $DATE)

  echo -e "\n\t${ACCENT}${TIME}${RESET} ${GRAY}->${RESET} ${DAY}, ${MONTH} ${FORMATTED_DATE}"
}

tinytime
