import { defineConfig } from "astro/config";
import tailwind from "@astrojs/tailwind";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://eclatdusud.fr",
  integrations: [
    tailwind({
      applyBaseStyles: false,
    }),
    sitemap(),
  ],
  server: {
    allowedHosts: "526f-2001-861-51c2-2dc0-95b9-a2b3-bd7d-52ca.ngrok-free.app",
  },
});
