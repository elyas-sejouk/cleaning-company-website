# 0002 Technical SEO, JSON-LD Schema, and Local Targeting Architecture

## Context
"Éclat du Sud" is a professional cleaning service company operating in the French Arc Méditerranéen. To maximize organic search engine visibility, improve conversion rates for **Devis** requests, and optimize landing pages for Google Ads campaigns, the website requires a comprehensive technical SEO, structured data, and local targeting architecture.

## Decisions

1. **Technical Metadata & Canonical Links**:
   - Enhance `Layout.astro` to accept dynamic props (`title`, `description`, `image`, `canonical`, `type`).
   - Standardize default meta titles and description.
   - Enforce explicit canonical tags `<link rel="canonical">` using `Astro.site` and `Astro.url`.
   - Add Open Graph (`og:*`) and Twitter Card meta tags across all pages and dynamic **Prestation** pages (`/services/[slug]`).
   - Deploy `public/robots.txt` pointing explicitly to `https://eclatdesud.fr/sitemap-index.xml`.

2. **Contextual JSON-LD Schema.org Data**:
   - **Homepage / Layout**: Embed a `LocalBusiness` / `CleaningService` JSON-LD schema with complete company details, address, telephone, business hours, and geographic coverage (`areaServed`).
   - **Dynamic Service Pages (`/services/[slug]`)**: Embed a `Service` schema linking the specific **Prestation** to **Éclat du Sud** (`provider`), matching price ranges and feature descriptions.
   - **FAQ Component**: Embed an `FAQPage` schema into `FAQ.astro` to enable interactive Google FAQ Rich Snippets in search engine results pages (SERPs).

3. **Local SEO & Intervention Zones**:
   - Create a dedicated `InterventionZones.astro` component highlighting key target municipalities in the Aude and Hérault regions (**Narbonne, Béziers, Gruissan, Lézignan-Corbières, Coursan, Vinassan, Salles-d'Aude, Colombiers, Sérignan**).
   - Integrate intervention zones into `Footer.astro` and bind them to the `areaServed` JSON-LD schema array.

4. **Reassurance Trust Signals & High-Intent FAQ**:
   - Add a `Reassurance.astro` trust bar highlighting core guarantees: *Devis gratuit sous 24h, Intervention rapide, Personnel qualifié, Matériel professionnel, Assurance RC Professionnelle*.
   - Expand `FAQ.astro` with high-intent queries regarding B2B services, emergency interventions, post-renovation cleanup, and weekend availability.

## Consequences
- Maximizes search engine indexability and Rich Snippet eligibility (star ratings, business panel, FAQ accordions).
- Improves Quality Score for targeted local Google Ads campaigns.
- Provides prospective **Clients** with immediate reassurance and clear local coverage information.
