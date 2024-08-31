#!/bin/env bash

scrDir=$(dirname "$(realpath "$0")")
source $scrDir/globalcontrol.sh

rofi_pos

enable_package wtype noto-fonts-emoji

save_recent() {
    #? Prepend the selected emoji to the top of the recentData file
    # sed -i "1i\\$selEmoji" "${recentData}"
    awk -v var="$dataEmoji" 'BEGIN{print var} {print}' "${recentData}" >temp && mv temp "${recentData}"
    #?  Use awk to remove duplicates and empty lines, moving the most recent emoji to the top
    awk 'NF' "${recentData}" | awk '!seen[$0]++' >temp && mv temp "${recentData}"
}

# Loop through all arguments
while (($# > 0)); do
    case $1 in
    --style | -s)
        if (($# > 1)); then
            emoji_style="$2"
            shift # Consume the value argument
        else
            print_prompt +y "[warn] " "--style needs argument"
            emoji_style=1
            shift
        fi
        ;;
    --rasi)
        [[ -z ${2} ]] && print_prompt +r "[error] " +y "--rasi requires a file.rasi config file" && exit 1
        useRofile=${2}
        shift
        ;;
    -*)
        cat <<HELP
Usage: 
--style [1 | 2]     Change Emoji style
                    Add 'emoji_style=[1|2]' variable in ./hyde.conf'
                        1 = list
                        2 = grid
HELP

        exit 0
        ;;
    esac
    shift # Shift off the current option being processed
done

emojiData="${etcDir}/emoji.db"
recentData="${cacheDir}/landing/show_emoji.recent"

if [[ ! -f "${recentData}" ]]; then
    echo "    Arch linux I use Arch BTW" >"${recentData}"
fi
#? Read the contents of recent.db and main.db separately
recent_entries=$(cat "${recentData}")
main_entries=$(cat "${emojiData}")
#? Combine the recent entries with the main entries
combined_entries="${recent_entries}\n${main_entries}"
#? Remove duplicates from the combined entries
unique_entries=$(echo -e "${combined_entries}" | awk '!seen[$0]++')

if [[ -n ${useRofile} ]]; then
    dataEmoji=$(rofi -dmenu -i -config "${useRofile}" <<<"${unique_entries}")
else

    case ${emoji_style} in
    2 | grid)
        size_override=""
        dataEmoji=$(rofi -dmenu -i -display-columns 1 -display-column-separator " " -theme-str "listview {columns: 8;}" -theme-str "entry { placeholder: \" 🔎 Emoji\";} ${pos} ${r_override}" -theme-str "${fnt_override}" -theme-str "${size_override}" -config "${roConf}" <<<"${unique_entries}")
        ;;
    *)
        dataEmoji=$(rofi -dmenu -multi-select -i -theme-str "entry { placeholder: \" 🔎 Emoji\";} ${pos} ${r_override}" -theme-str "${fnt_override}" -config "${roConf}" <<<"${unique_entries}")
        ;;
    esac
fi

# selEmoji=$(echo -n "${selEmoji}" | cut -d' ' -f1 | tr -d '\n' | wl-copy)
trap save_recent EXIT
selEmoji=$(printf "%s" "${dataEmoji}" | cut -d' ' -f1 | tr -d '\n\r')
[ -z "${selEmoji}" ] && exit 0
wl-copy "${selEmoji}"
pasteIt "${*}"
