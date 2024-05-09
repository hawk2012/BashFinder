function show_menu() {
    echo "Menu:"
    echo "- Find files"
    echo "- Search text strings"
    echo "- Quit"
}

function find_files() {
    read -p "Enter directory to search: " dir
    if [ -d "$dir" ]; then
        find "$dir" -type f
    else
        echo "Directory not found"
    fi
}

function search_text_strings() {
    read -p "Enter directory to search: " dir
    read -p "Enter string to search for: " str
    if [ -d "$dir" ]; then
        find "$dir" -type f -exec grep -H "$str" {} +
    else
        echo "Directory not found"
    fi
}

function quit() {
    echo "Exiting..."
    exit
}

while true; do
    show_menu
    read -p "Choose an option: " opt
    
    case $opt in
        "Find files")
            find_files
            ;;
        "Search text strings")
            search_text_strings
            ;;
        "Quit")
            quit
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done
