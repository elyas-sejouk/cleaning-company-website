# Project Blueprint

## Overview
This project is a static website for a cleaning company ("Eclat de Sud" based on the CNAME), built with **Astro.js** and **Tailwind CSS**. It is designed for performance and ease of deployment on GitHub Pages.

## Project Outline
- **Framework**: Astro.js (v5)
- **Styling**: Tailwind CSS
- **Deployment**: GitHub Pages (via GitHub Actions)
- **Domain**: `eclatdesud.fr`

### Key Files & Directories
- `src/pages/`: Contains the Astro components that act as pages.
- `public/`: Static assets and the `CNAME` file for custom domain configuration.
- `.github/workflows/deploy.yml`: CI/CD configuration for deploying to GitHub Pages.
- `astro.config.mjs`: Astro configuration including the `site` URL and Tailwind integration.

## Current Plan: Troubleshoot HTTPS on GitHub Pages
1.  **Verify Project Config**: Checked for `CNAME` in root and `public/`. (Completed: Found in both).
2.  **Verify Astro Config**: Checked `site` property in `astro.config.mjs`. (Completed: `https://eclatdesud.fr`).
3.  **Diagnosis**: The code configuration is correct. The missing HTTPS certificate is likely due to DNS propagation or GitHub Pages settings ("Enforce HTTPS").
4.  **Action**: Inform the user to check GitHub Repository Settings and DNS records.
