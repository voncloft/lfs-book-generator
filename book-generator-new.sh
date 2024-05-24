#!/bin/bash

# Function to extract content from grey boxes
#progress.txt
#A=initial setup is done
#B=Book downloaded
#Other=What step was left on that was successful DONT DO THIS ONE AGAIN

get_toolchain_cmd()
{
	echo "source ~/.bash_profile" >> $1
	echo "source ~/.bashrc" >> $1
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
	insert_cd "${package_name}*" $2
    fi

    echo "$package_file"
}
insert_cd()
{
	echo "cd /mnt/lfs/sources/$1" >> $2
}

delete_folders() {
	echo 'find /mnt/lfs/sources -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +' >> $1
}

insert_book_page(){
	echo "#"$1 >> $2
}
initial_setup() {
	echo "Note MBR=BIOS, GPT=EUFI"
	echo "Be sure to create a boot partition, and your main hard drive"
	cp files/bash_profile ~/.bash_profile
	cp files/bashrc ~/.bashrc
	sh files/add_lfs_user.sh
	touch process.txt
	mkdir -pv /mnt/lfs/tools
	mkdir -pv /mnt/lfs/sources
	get_preliminaries
	get_sources
	initialize_check
	echo "A" > progress.txt
}
initialize_check(){
	sh files/hostreqs.sh
	echo "Update your system as needed before you continue running again will start the install"
}
get_sources(){
	rm wget-list-sysv
	wget https://www.linuxfromscratch.org/~thomas/multilib/wget-list-sysv
	wget --input-file=wget-list-sysv --continue --directory-prefix=/mnt/lfs/sources
}
get_preliminaries()
{
	sudo apt install sudo wget g++ texinfo pkg-config gcc-multilib g++-multilib libarchive-dev
}
download_book()
{
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
		insert_book_page "$base_url/$url" "stripped/$chapter/$var_name.sh"
	    	if [[ "$chapter" == "chapter05" || "$chapter" == "chapter06" ]];then
			get_toolchain_cmd "stripped/$chapter/$var_name.sh"
    		fi
    		package_name=$(get_pkg_name $last_part)
    		echo $package_name
		tar_command $package_name "stripped/$chapter/$var_name.sh"
		#insert_cd "${package_name}*" "stripped/$chapter/$var_name.sh"
    		extract_kbd_command "$base_url/$url" "stripped/$chapter/$var_name.sh"
    		delete_folders "stripped/$chapter/$var_name.sh"
		((counter++))
	fi
done
echo "Instructions Complete - LOOK OVER THE FILES possible errors may occur" 
echo "Chapter05" > progress.txt
}
start_install()
{
	####loop thru chapters here dont need to re-initialize setup or redownload book
	####update progress.txt to each attempt to install a package if successful overwrite step on textfile
	####format: ChapterX/num-name_of_package
	####update to log.txt

	stripped_dir="stripped_files"
	process_file="process.txt"

	# Read the content of the process.txt file
	process_content=$(<"$process_file")

	# Determine the starting chapter and filename
	start_chapter=$(dirname "$process_content")
	filename=$(basename "$process_content")

	# If the process.txt specifies only the chapter without a specific filename
	# or if process.txt doesn't specify a filename at all, default to starting from "chapter05"
	if [ "$filename" == "$start_chapter" ] || [ -z "$filename" ]; then
    		start_chapter="chapter05"
    		filename="00-placeholder.sh"  # Initialize filename to a placeholder if process.txt specifies only the chapter
	fi

	# Extract the number part from the filename
	last_number=$(echo "$filename" | cut -d'-' -f1)

	# Iterate through each directory in the "stripped" folder
	for chapter_dir in "$stripped_dir"/*; do
    		# Check if the directory is a directory
    		if [ -d "$chapter_dir" ]; then
        	# Check if the directory starts with the specified starting chapter
        		if [[ "$(basename "$chapter_dir")" == "$start_chapter"* ]]; then
            		echo "Processing directory: $chapter_dir"

            		# Flag to indicate if any command fails
            		error_flag=false

            		# Iterate through each file in the directory
            		for file in "$chapter_dir"/*; do
                	# Check if the file is a regular file
                	if [ -f "$file" ]; then
                    	# Execute your command on the file
                    		sh "$file"
                    		# Check if the command failed
                    		if [ $? -ne 0 ]; then
                        		echo "Failed to execute command on file: $file"
                        		error_flag=true  # Set error flag to true if any command fails
                        		break  # Exit the loop if any command fails
                    		else
                        	# Update process.txt with the last successful file
                        		echo "$start_chapter/$filename" > "$process_file"
                    		fi
                	fi
           	 done

            	# Exit the script if any command fails
            	if [ "$error_flag" = true ]; then
                	exit 1
            	fi
        fi
    fi
done

}
no_option(){
	$line=$(head -n 1 /lfs-book-generator/progress.txt)
	if [[ -z $line ]]; then 
		initial_setup
	elif [[ $line == "A" ]]
	then
		download_book
	else
		start_install
	fi
}
####TEST ON A VIRTUAL BOX
####Next step is to run thru the stripped files chapters starting at Chapter 4 and update progress.txt
####After each install output the last step done, so if it crashes it knows to not redo already done
####stuff
help_display()
{
	echo "1 - initial_setup() - gets the folders setup for /mnt/lfs and sources"
	echo "2 - download_book() - strips the book"
	echo "3 - start_install() - starts install on system login with su - lfs"
	echo "nothing - start as usual"
	echo "-h - Show this prompt"
}
if [ "$1" == "-h" ]; then
    help_display
fi

# Check the number of command-line arguments
if [ "$#" -eq 0 ]; then
    no_option
    exit 0
fi

case "$1" in
    1)
        initial_setup
        ;;
    2)
        download_book
        ;;
    3)
        start_install
        ;;
    *)
        echo "Invalid function number. Use -h for help"
        exit 1
        ;;
esac
