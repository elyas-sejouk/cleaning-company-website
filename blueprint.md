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

## Current Plan: Devis Form Submission Thank You Path

Create a dedicated thank you page at `/devis/merci` and update the quote request form (`ContactForm.astro`) to redirect users to this path upon successful submission.

### Actionable Steps
1. **Thank You Page Component (`src/pages/devis/merci.astro`)**:
   - Create a brand-aligned, high-trust confirmation page.
   - Display success messaging, step-by-step timeline of quote processing (within 24h), emergency hotline callouts, and return navigation options.
2. **Form Redirection (`src/components/ContactForm.astro`)**:
   - Add hidden `_next` parameter to Formspree form.
   - Update client-side fetch handler to redirect users to `/devis/merci` upon successful form submission.
3. **Build & Route Verification**:
   - Run `npm run build` to confirm Astro static route generation for `/devis/merci`.

