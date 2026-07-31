# Nuvio extended artwork

This folder contains artwork beyond the 1280×720 cover cards.

## Structure

- `streaming-services/` — Netflix, Apple TV+, Hulu, Disney+, Max, Prime Video, Paramount+, and Peacock
- `tv-discovery/` — Recently Released, Trending TV, New & Popular, and Popular TV
- `movie-discovery/` — Recently Released, Trending Movies, New & Popular, and Popular Movies

Each folder can contain:

- `title-logo.png` — transparent 1200×400 PNG
- `hero-backdrop.jpg` — 1920×1080 JPEG
- `focus/` — reserved for future focus animations
- `video/` — reserved for future hero videos

Each collection also has:

- `collection/backdrop.jpg` — 1920×1080 collection-level background

## Raw URL pattern

```text
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/artwork/{collection}/{folder}/{file}
```

Example:

```text
https://raw.githubusercontent.com/lmaung/tv-logos/nuvio-collections/nuvio/artwork/tv-discovery/trending-tv/hero-backdrop.jpg
```

The hero compositions intentionally keep the left side darker and quieter for Nuvio interface overlays. Title logos use transparent backgrounds and should not be used as cover images.
