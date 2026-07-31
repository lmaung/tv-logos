#!/usr/bin/env bash
set -euo pipefail

input_dir="${1:-misc/media}"
output_dir="${2:-nuvio/media}"
canvas_width="${NUVIO_WIDTH:-1280}"
canvas_height="${NUVIO_HEIGHT:-720}"
logo_width="${NUVIO_LOGO_WIDTH:-576}"
logo_height="${NUVIO_LOGO_HEIGHT:-288}"
background="${NUVIO_BACKGROUND:-#1C1C1E}"
foreground="${NUVIO_FOREGROUND:-white}"
border="${NUVIO_BORDER:-#3A3A3C}"
border_width="${NUVIO_BORDER_WIDTH:-7}"
mode="${NUVIO_MODE:-monochrome}"

if ! command -v magick >/dev/null 2>&1; then
  echo "ImageMagick 7 is required (the 'magick' command was not found)." >&2
  exit 1
fi

if [[ ! -d "$input_dir" ]]; then
  echo "Input directory does not exist: $input_dir" >&2
  exit 1
fi

if [[ "$mode" != "monochrome" && "$mode" != "color" ]]; then
  echo "NUVIO_MODE must be 'monochrome' or 'color'." >&2
  exit 1
fi

mkdir -p "$output_dir"
converted=0

while IFS= read -r -d '' source_file; do
  relative_path="${source_file#"$input_dir"/}"
  relative_stem="${relative_path%.*}"
  destination="$output_dir/$relative_stem.png"
  mkdir -p "$(dirname "$destination")"

  operations=("$source_file" -trim +repage)
  if [[ "$mode" == "monochrome" ]]; then
    # Replace RGB channels while retaining the source alpha mask and antialiasing.
    operations+=(-channel RGB -fill "$foreground" -colorize 100%)
  fi

  magick "${operations[@]}" \
    -resize "${logo_width}x${logo_height}>" \
    -gravity center \
    -background "$background" \
    -extent "${canvas_width}x${canvas_height}" \
    -fill none \
    -stroke "$border" \
    -strokewidth "$border_width" \
    -draw "roundrectangle 8,8 $((canvas_width - 9)),$((canvas_height - 9)) 42,42" \
    -strip \
    "$destination"

  converted=$((converted + 1))
done < <(
  find "$input_dir" -type f \
    \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) \
    -print0
)

echo "Generated $converted Nuvio cards in $output_dir"
