# Nuvio TV Logos

These files are Nuvio-ready derivatives of source logos elsewhere in this repository.

- Canvas: 512×512 transparent PNG
- Visible-logo safe area: up to 360×360 pixels
- Alignment: centered horizontally and vertically
- Purpose: prevent Nuvio's square cover tiles from cropping edge-to-edge source artwork

Regenerate the referenced USA TV logos after `usa-tv-streams/data/logo-sources.json` changes:

```sh
node utilities/generate-nuvio-tv-logos.mjs ../usa-tv-streams/data/logo-sources.json
```
