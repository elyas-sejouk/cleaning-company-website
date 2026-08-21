# Project Blueprint

## Overview
This project is a static website for a cleaning company (**Éclat du Sud**), built with **Astro.js** and **Tailwind CSS**. It is designed for performance, accessibility, local search dominance, and high conversion, targeting **Clients** seeking premium cleaning **Prestations** (Airbnb turnover, end-of-construction cleaning, residential, post-disaster, and event cleanup).

## Project Outline
- **Framework**: Astro.js (v5)
- **Styling**: Tailwind CSS
- **Deployment**: GitHub Pages (via GitHub Actions)
- **Domain**: `https://eclatdusud.fr`
- **SEO & Search Indexing**: Dynamic metadata, Open Graph, `@astrojs/sitemap`, Schema.org JSON-LD (`LocalBusiness`, `Service`, `FAQPage`), and `robots.txt`.

### Key Files & Directories
- `src/pages/`: Astro route components (Home, Mentions Légales, Contact, Services, Devis Confirmation).
- `src/components/`: Modular UI components (`Navbar`, `Button`, `FAQ`, `Reassurance`, `InterventionZones`, `ContactForm`, `Reviews`, `Footer`).
- `src/assets/`: Brand assets including `logo.svg`.
- `src/data/`: Structured JS data containing **Prestation** details (`services.js`).
- `public/`: Static assets, favicon, CNAME, and `robots.txt`.
- `docs/adr/`: Architecture decision records (`0001`, `0002`).
- `CONTEXT.md`: Ubiquitous language and domain terminology.

---

## Current Plan: Logo SVG Integration in Header, Footer, and Relevant Pages

Integrate official company logo (`src/assets/logo.svg`) across header, footer, mobile drawer menu, layout schema, quote thank-you page, and contact page.

### Actionable Steps
1. **Header & Mobile Navigation Drawer (`src/components/Navbar.astro`)**:
   - Import `logo.svg` via Astro assets.
   - Update desktop navbar brand link to display logo mark alongside brand text.
   - Update mobile menu drawer header to feature logo SVG.
2. **Site Footer (`src/components/Footer.astro`)**:
   - Import `logo.svg` via Astro assets.
   - Embed logo SVG into the footer brand column.
3. **Layout Schema (`src/layouts/Layout.astro`)**:
   - Update Schema.org `CleaningService` JSON-LD `logo` and fallback image properties to use `logo.svg` path.
4. **Thank You & Contact Pages (`src/pages/devis/merci.astro`, `src/pages/contact.astro`)**:
   - Include logo SVG in key hero/brand headers for high-trust presentation.
5. **Build & Route Verification**:
   - Run `npm run build` to verify asset bundling and static site generation without errors.
