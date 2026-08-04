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
- `src/pages/`: Astro route components (Home, Mentions Légales, Contact, Services).
- `src/components/`: Modular UI components (`Navbar`, `Button`, `FAQ`, `Reassurance`, `InterventionZones`, `ContactForm`, `Reviews`, `Footer`).
- `src/data/`: Structured JS data containing **Prestation** details (`services.js`).
- `public/`: Static assets, favicon, CNAME, and `robots.txt`.
- `docs/adr/`: Architecture decision records (`0001`, `0002`).
- `CONTEXT.md`: Ubiquitous language and domain terminology.

---

## Current Plan: Contact Information Update

Updated the official contact email address across the entire application to `contact@eclatdusud.fr`.

### Actionable Steps
1. **Contact Information Updates**:
   - Update contact email to `contact@eclatdusud.fr` in `Footer.astro`, `contact.astro`, `mentions-legales.astro`, `politique-de-confidentialite.astro`, and `conditions-generales-de-vente.astro`.
1. **Technical Meta Architecture (`Layout.astro`)**:
   - Add dynamic props (`description`, `image`, `canonical`, `type`).
   - Implement explicit `<link rel="canonical">` generation.
   - Add Open Graph (`og:title`, `og:description`, `og:image`, `og:url`, `og:type`) and Twitter Card tags.
   - Create `public/robots.txt` pointing to `sitemap-index.xml`.

2. **JSON-LD Structured Data**:
   - Embed `LocalBusiness` / `CleaningService` JSON-LD schema on homepage / `Layout.astro`.
   - Embed `Service` JSON-LD schema on dynamic **Prestation** pages (`/services/[slug]`).
   - Embed `FAQPage` JSON-LD schema in `FAQ.astro`.

3. **Local SEO & Intervention Zones**:
   - Create `InterventionZones.astro` displaying key municipalities (**Narbonne, Béziers, Gruissan, Lézignan-Corbières, Coursan, Vinassan, Salles-d'Aude, Colombiers, Sérignan**).
   - Update `Footer.astro` and bind city list to `areaServed` JSON-LD schema array.

4. **Reassurance Signals & High-Intent FAQ**:
   - Create `Reassurance.astro` trust bar highlighting core guarantees (*Devis gratuit sous 24h, Intervention rapide, Personnel qualifié, Matériel professionnel, Assurance RC Pro*).
   - Expand `FAQ.astro` with high-intent queries (pricing calculation, weekend availability, B2B services, emergency intervention, post-renovation cleanup).
