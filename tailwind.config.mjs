/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
			colors: {
				'soapy-green': '#cae7ec', // Your Pistachio Green
				'soapy-orange': '#F1B844', // Your Retro Orange
				'soapy-yellow': '#F1B844',
				'soapy-black': '#000000',  // Pure black
			},
			fontFamily: {
				'retro': ['"Shrikhand"', 'cursive'], // For titles
				'body': ['"Montserrat"', 'sans-serif'], // For body text
			},
			boxShadow: {
				'retro': '4px 4px 0px 0px #000000', // Hard "Cartoon" shadow
				'retro-hover': '2px 2px 0px 0px #000000', // The effect when clicking
			},
			borderWidth: {
				'3': '3px', // Specific thickness for the Soapy style
			}
		},
	},
	plugins: [],
}