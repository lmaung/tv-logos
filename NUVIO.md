# Nuvio collection artwork

The generated files in `nuvio/media` are 1280×720 collection cards designed for clients that crop cover artwork to fill a 16:9 tile.

Each card uses:

- a charcoal `#1C1C1E` background that remains visible on pure-black interfaces;
- a subtle `#3A3A3C` inset border;
- a white, centered logo;
- a maximum logo area of 576×288 (45% × 40% of the canvas);
- the same filename as its source in `misc/media`.

## Generate every media card

Install ImageMagick 7, then run from the repository root:

```bash
./utilities/generate-nuvio-cards.sh
```

The script defaults to `misc/media` → `nuvio/media`. You can provide other directories while retaining their internal folder structure:

```bash
./utilities/generate-nuvio-cards.sh countries nuvio/countries
```

To rebuild with original brand colors:

```bash
NUVIO_MODE=color ./utilities/generate-nuvio-cards.sh
```

Override the tile palette:

```bash
NUVIO_BACKGROUND='#242426' NUVIO_BORDER='#48484A' \
  ./utilities/generate-nuvio-cards.sh
```

The safe area is configurable:

```bash
NUVIO_LOGO_WIDTH=500 NUVIO_LOGO_HEIGHT=250 ./utilities/generate-nuvio-cards.sh
```

## Raw GitHub URLs

For the `nuvio-collections` branch, URLs follow this pattern:

```text
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/media/{filename}.png
```

Examples:

```text
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/media/netflix.png
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/media/apple-tv-plus.png
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/media/prime-video-hz.png
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/media/disney-plus.png
```

Use the horizontal (`-hz`) variant when one exists and looks better in a landscape tile.
