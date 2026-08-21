# Project Blueprint

## Overview
This project is a static website for a cleaning company (**Éclat du Sud**), built with **Astro.js** and **Tailwind CSS**. It is designed for performance, accessibility, local search dominance, and high conversion, targeting **Clients** seeking premium cleaning **Prestations** (Airbnb turnover, end-of-construction cleaning, residential, post-disaster, event cleanup, and carpet/sofa upholstery cleaning).

## Project Outline
- **Framework**: Astro.js (v5)
- **Styling**: Tailwind CSS
- **Deployment**: GitHub Pages (via GitHub Actions)
- **Domain**: `https://eclatdusud.fr`
- **SEO & Search Indexing**: Dynamic metadata, Open Graph, `@astrojs/sitemap`, Schema.org JSON-LD (`LocalBusiness`, `Service`, `FAQPage`), and `robots.txt`.

### Key Files & Directories
- `src/pages/`: Astro route components (Home, Mentions Légales, Contact, Services, Devis Confirmation).
- `src/components/`: Modular UI components (`Navbar`, `Button`, `FAQ`, `Reassurance`, `InterventionZones`, `ContactForm`, `Reviews`, `Footer`).
- `src/assets/`: Brand & service image assets including `nettoyage-moket.webp`.
- `src/data/`: Structured JS data containing **Prestation** details (`services.js`).
- `public/`: Static assets, favicon, CNAME, and `robots.txt`.
- `docs/adr/`: Architecture decision records (`0001`, `0002`).
- `CONTEXT.md`: Ubiquitous language and domain terminology.

---

## Current Plan: Add "Nettoyage Textiles & Canapés" Service

Add new service for carpet, sofa, rug, and upholstery cleaning (`textiles-canapes`), leveraging `nettoyage-moket.webp`.

### Actionable Steps
1. **Data Model (`src/data/services.js`)**:
   - Add new service object `textiles-canapes` with title, short description, full description, feature checklist, price, and image.
2. **Icon Mapping (`src/components/ServiceIcon.astro`)**:
   - Add sofa/textile SVG icon for `textiles-canapes`.
3. **Asset Glob Matching (`src/pages/index.astro`, `src/pages/services/[slug].astro`)**:
   - Extend `import.meta.glob` pattern to include `.webp` images.
4. **Build & Route Verification**:
   - Run `npm run build` to verify generation of `/services/textiles-canapes` and global integration.
