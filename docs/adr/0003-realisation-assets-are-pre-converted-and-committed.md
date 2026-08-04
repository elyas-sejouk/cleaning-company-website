# 0003 Réalisation Assets Are Pre-Converted Locally and Committed

Photographic evidence for **Réalisations** arrives from the field as iPhone `.HEIC` stills and HEVC `.MOV` clips, neither of which the web can consume: Astro's `VALID_INPUT_FORMATS` (`astro/dist/assets/consts.js`) accepts only `jpeg, jpg, png, tiff, webp, gif, svg, avif`, so a `.HEIC` import fails validation before `sharp` is ever reached, and HEVC-in-QuickTime does not decode in Chrome or Firefox. We therefore convert once on a developer machine — `sips` for stills, `ffmpeg`/`avconvert` to H.264 MP4 for clips — and commit the derivatives under `src/assets/realisations/`, where Astro's image pipeline generates responsive `srcset` from ordinary JPEGs. The camera originals are removed from version control and `.gitignore`d; they live in the studio's iCloud library, which is their system of record.

## Considered Options

- **Convert during the GitHub Actions build.** Rejected. `withastro/action@v2` runs on `ubuntu-latest` with no ffmpeg, and even granting `sharp` its HEIF decoder, this would re-transcode ~117 MB of stills and ~65 MB of video on every push to produce byte-identical output. Minutes of CI per deploy for nothing.
- **Keep the originals tracked alongside the derivatives.** Rejected. `.git` already stands at ~203 MB because of them, and every future Réalisation would compound it. Camera masters are photo-library material, not source code.
- **Rewrite history with `git filter-repo` to purge the originals.** Rejected. It would drop `.git` to a few MB, but it invalidates every clone and force-pushes over the branch GitHub Pages deploys from — real risk for a cosmetic gain. Published output only ever contains `dist/`, so the existing history costs nothing at runtime.

## Consequences

- Adding a Réalisation is a manual step, not an automatic one. Dropping `.HEIC` files into `src/assets/` will not work and will fail at build time.
- Because the originals are untracked, **iCloud is the only copy of the full-resolution masters.** If that backup lapses, the committed derivatives become irreplaceable.
- Conversion strips EXIF GPS (verified: `sips` output retains an EXIF block but no GPS IFD), so client coordinates never reach the published site. Any future change to the conversion tooling must preserve that property — the source files carry the exact locations of client homes.
- Capture timestamps and GPS in the originals are the authority for grouping photographs into Réalisations. That metadata is lost in conversion, so grouping and dating must be recorded in `src/data/realisations.js` at conversion time.
