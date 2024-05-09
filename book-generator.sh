#!/bin/bash

# Function to extract content from grey boxes
get_toolchain_cmd()
{
	echo "source ~/.bash_profile" >> $1
}
extract_kbd_command() {
    local page_url="$1"
    local output_file="$2"

    local kbd_content=$(wget -qO- "$page_url" | xmllint --html --xpath '//kbd[@class="command"]/text() | //code[@class="literal"]/text() | //em[@class="replaceable"]/code/text()' - 2>/dev/null)
    local kbd_content_text=$(echo "$kbd_content" | sed -e 's/&gt;/>/g' -e 's/&lt;/</g' -e 's/&amp;&amp;//g' -e 's/&amp;/\&/g')
    # Save extracted content to the output file
    #echo "$kbd_content" > "$output_file"
    echo "$kbd_content_text" >> "$output_file"
}
check_if_kbd_is_empty()
{
    local page_url="$1"

    local kbd_content=$(wget -qO- "$page_url" | xmllint --html --xpath '//kbd[@class="command"]/text() | //code[@class="literal"]/text() | //em[@class="replaceable"]/code/text()' - 2>/dev/null)
    local kbd_content_text=$(echo "$kbd_content" | sed -e 's/&gt;/>/g' -e 's/&lt;/</g' -e 's/&amp;&amp;//g' -e 's/&amp;/\&/g')
    if [ -z "$kbd_content_text" ]; then
	return 1
    else
    	return 2
    fi
}
extract_urls() {
    local content="$1"
    local urls=$(echo "$content" | grep -oE 'href="([^"#]+)"' | awk -F'"' '{print $2}')
    echo "$urls"
}

remove_extension() {
    local url="$1"
    local filename=$(basename "$url")
    local filename_no_ext="${filename%.*}"
    echo "$filename_no_ext"
}

extract_chapter() {
    local url="$1"
    local chapter=$(echo "$url" | awk -F'/' '{print $(NF-1)}')
    echo "$chapter"
}
create_chapter_directory() {
    local chapter="$1"
    local download_folder="/lfs-book-generator/stripped"

    # Check if chapter directory exists
    if [ ! -d "$download_folder/$chapter" ]; then
        # Create chapter directory
        mkdir -p "$download_folder/$chapter"
        echo "Created directory '$chapter' in '$download_folder'"
    fi
}
get_pkg_name()
{
    local input="$1"
    local result="${input%%-*}"
    echo "$result"
}


tar_command() {
    local package_name="$1"
    local directory="/mnt/lfs/sources"

    # Search for the package file
    local package_file=$(find "$directory" -maxdepth 1 -type f -name "${package_name}*.tar.*")
    # Check if package file exists
    if [ -z "$package_file" ]; then
        echo "Error: Package $package_name not found in $directory."
    else
		echo "bsdtar -xvf $package_file" >> $2
    fi

    echo "$package_file"
}
insert_cd()
{
	echo "cd /mnt/lfs/sources/$1" >> $2
}

delete_folders() {
	echo 'find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +' > deletion_script.sh >> $1
}

base_url="https://www.linuxfromscratch.org/~thomas/multilib"
content=$(curl -s "$base_url/index.html")
urls=$(extract_urls "$content")
counter=1
rm -rfv /lfs-book-generator/stripped

for url in $urls; do

    echo "$base_url/$url"
    last_part=$(remove_extension "$url")
    chapter=$(extract_chapter "$url")
    #create_chapter_directory "$chapter"
    echo $chapter
    	if ((counter < 10)); then
        	var_name="0$counter-$last_part"
    	else
        	var_name="$counter-$last_part"
    	fi
    	echo $var_name
	check_if_kbd_is_empty "$base_url/$url"
	if [ $? = 2 ]; then
		create_chapter_directory "$chapter"
	    	if [[ "$chapter" == "chapter05" || "$chapter" == "chapter06" ]];then
			get_toolchain_cmd "stripped/$chapter/$var_name.sh"
    		fi
    		package_name=$(get_pkg_name $last_part)
    		echo $package_name
		tar_command $package_name "stripped/$chapter/$var_name.sh"
		insert_cd "${package_name}*" "stripped/$chapter/$var_name.sh"
    		extract_kbd_command "$base_url/$url" "stripped/$chapter/$var_name.sh"
    		delete_folders "stripped/$chapter/$var_name.sh"
		((counter++))
	fi
done


