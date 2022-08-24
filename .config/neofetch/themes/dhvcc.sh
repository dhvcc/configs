os_arch="on"
gap=1
colors=(79 255 245 79 255 255)

image_source="$HOME/.config/neofetch/resources/kishibe_rohan_ascii"
set_colors 255 108 030 172 029

# Colorize some ascii stuff
case $(trim "$image_source") in
  *"kishibe_rohan_ascii"*)
    ascii_colors=(255 108 030 172 029)
  ;;
esac
