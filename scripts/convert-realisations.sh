#!/usr/bin/env bash
#
# Converts camera originals into web derivatives for the Réalisations page.
#
# Why this exists: Astro's image pipeline rejects .HEIC outright (its
# VALID_INPUT_FORMATS list has no heic/heif entry), and browsers cannot decode
# HEVC-in-QuickTime. See docs/adr/0003.
#
# The originals live in SRC below and are NOT tracked in git — they are camera
# masters held in iCloud. This script is the only supported way to regenerate
# the committed derivatives in DEST.
#
# Only curated frames are converted. The exclusions are deliberate; see
# docs/adr/0004 before adding anything to the manifest.
#
# Usage:  ./scripts/convert-realisations.sh
#
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$REPO/src/assets/missons"
DEST="$REPO/src/assets/realisations"        # photos — processed by Astro's image pipeline
VIDEO_DEST="$REPO/public/realisations"      # videos — Astro does not optimise video, served as-is

MAX_DIM=2000        # source is 4032x3024; 2000 covers 2x on every layout we use
JPEG_QUALITY=80

if [ ! -d "$SRC" ]; then
  echo "error: originals not found at $SRC" >&2
  echo "       They are gitignored camera masters — restore them from iCloud first." >&2
  exit 1
fi

# ---------------------------------------------------------------------------
# Manifest: "<realisation-slug>|<source path relative to SRC>|<output name>"
#
# NOTE ON alignan-du-vent-2026-07-09: the two vitre filenames are inverted
# relative to their capture timestamps. "vitre - Anti calcaire" (09:38:58) is
# the DIRTY frame; "Vitre avant" (09:39:04) is the CLEAN one. The mapping below
# corrects this. Do not "fix" it back to match the filenames.
# ---------------------------------------------------------------------------
PHOTOS=(
  # --- R1 Coursan, 27 oct. 2025 — ménage + fin de chantier ------------------
  "coursan-2025-10-27|Fin de Chantier/Sol bois - avant.HEIC|parquet-avant"
  "coursan-2025-10-27|Fin de Chantier/Sol bois - après.HEIC|parquet-apres"
  "coursan-2025-10-27|Menage/douche - avant.HEIC|douche-avant"
  "coursan-2025-10-27|Menage/douche - après.HEIC|douche-apres"
  "coursan-2025-10-27|Menage/Cabinet - avant.HEIC|plan-travail-avant"
  "coursan-2025-10-27|Menage/Cabinet - après.HEIC|plan-travail-apres"
  "coursan-2025-10-27|Menage/cuisine aprés.HEIC|cuisine-apres"

  # --- R2 Ginestas, 28 oct. 2025 — fin de chantier --------------------------
  "ginestas-2025-10-28|Fin de Chantier/Sol - poceline après - 2.HEIC|sejour-apres"
  "ginestas-2025-10-28|Fin de Chantier/vitre.HEIC|fenetre-apres"
  "ginestas-2025-10-28|Fin de Chantier/Sol - poceline avant - 2.HEIC|carrelage-avant"
  "ginestas-2025-10-28|Fin de Chantier/sol porceline - avant - 4.HEIC|laitance-avant"

  # --- R3 Cers, 30 avr. 2026 — kärcher --------------------------------------
  "cers-2026-04-30|Karcher/avant - 2.HEIC|terrasse-mi-parcours"
  "cers-2026-04-30|Karcher/avant - 3.HEIC|terrasse-avant"

  # --- R4 Alignan-du-Vent, 9 jul. 2026 — fin de chantier --------------------
  "alignan-du-vent-2026-07-09|Fin de Chantier/Après pose carrelage .HEIC|sejour-autolaveuse"
  "alignan-du-vent-2026-07-09|Fin de Chantier/WC Propre .HEIC|wc-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Après peinture_.HEIC|cuisine-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Après poussière .HEIC|plan-travail-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Après .HEIC|sejour-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Finition .HEIC|finitions-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/(Après) un reflet propre (2).HEIC|fenetre-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Sol après la remontée de la laitance .HEIC|couloir-apres"
  "alignan-du-vent-2026-07-09|Fin de Chantier/vitre - Anti calcaire .HEIC|vitre-avant"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Vitre avant .HEIC|vitre-apres"
)

# Videos are portrait HEVC/MOV. Transcoded to H.264 MP4 with the audio track
# dropped (site recordings may carry recognisable voices), plus a poster frame.
# The two "Vidéo avant" sources differ only by a double space in the filename —
# disambiguated here by duration: single space = 34.7s, double space = 15.0s.
#
# NOTE: these carry 2026-07-29/30 timestamps, three weeks AFTER the photos, and
# their GPS is rounded to 4 decimals where every photo has 6 — they are export
# dates, not capture dates. The clips were shot during the pre-works site visit
# for the same job as the photos, so they belong to the 2026-07-09 réalisation.
VIDEOS=(
  "alignan-du-vent-2026-07-09|Fin de Chantier/Vidéo avant chantier .MOV|chantier-avant-1"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Vidéo avant  chantier .MOV|chantier-avant-2"
  "alignan-du-vent-2026-07-09|Fin de Chantier/Résultat fin chantier .MOV|resultat"
)

# ---------------------------------------------------------------------------

echo "→ photos"
for entry in "${PHOTOS[@]}"; do
  IFS='|' read -r slug rel out <<< "$entry"
  in="$SRC/$rel"
  if [ ! -f "$in" ]; then
    echo "  MISSING: $rel" >&2
    exit 1
  fi
  mkdir -p "$DEST/$slug"
  sips -s format jpeg \
       -s formatOptions "$JPEG_QUALITY" \
       -Z "$MAX_DIM" \
       "$in" --out "$DEST/$slug/$out.jpg" >/dev/null
  printf "  %-28s %s\n" "$slug" "$out.jpg"
done

echo "→ videos"
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "  SKIPPED: ffmpeg not installed (brew install ffmpeg)" >&2
  echo "  Photos are done; re-run this script once ffmpeg is available." >&2
  exit 0
fi

for entry in "${VIDEOS[@]}"; do
  IFS='|' read -r slug rel out <<< "$entry"
  in="$SRC/$rel"
  if [ ! -f "$in" ]; then
    echo "  MISSING: $rel" >&2
    exit 1
  fi
  mkdir -p "$VIDEO_DEST/$slug"
  # -an drops audio; -map_metadata -1 strips EXIF/GPS carried in the container
  ffmpeg -loglevel error -y -i "$in" \
    -vf "scale=-2:1280" \
    -c:v libx264 -preset slow -crf 24 -pix_fmt yuv420p \
    -movflags +faststart -an -map_metadata -1 \
    "$VIDEO_DEST/$slug/$out.mp4"
  ffmpeg -loglevel error -y -i "$VIDEO_DEST/$slug/$out.mp4" \
    -frames:v 1 -q:v 4 "$VIDEO_DEST/$slug/$out-poster.jpg"
  printf "  %-28s %s\n" "$slug" "$out.mp4 (+poster)"
done

echo "done → $DEST"
