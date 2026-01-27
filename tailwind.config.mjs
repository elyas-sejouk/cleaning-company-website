/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			colors: {
				'soapy-green': '#cae7ec', // Votre Vert Pistache
				'soapy-orange': '#F1B844', // Votre Orange Rétro
				'soapy-yellow': '#F1B844',
				'soapy-black': '#000000',  // Noir pur
			},
			fontFamily: {
				'retro': ['"Shrikhand"', 'cursive'], // Pour les titres
				'body': ['"Montserrat"', 'sans-serif'], // Pour le texte
			},
			boxShadow: {
				'retro': '4px 4px 0px 0px #000000', // L'ombre dure "Cartoon"
				'retro-hover': '2px 2px 0px 0px #000000', // L'effet quand on clique
			},
			borderWidth: {
				'3': '3px', // Épaisseur spécifique pour le style Soapy
			}
		},
	},
	plugins: [],
}