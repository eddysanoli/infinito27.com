/** @type {import('tailwindcss').Config} */
module.exports = {

  // Will look for classes inside both the main index.html file
  // or the "src" folder with any of the listed extensions.
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}"
  ],

  // Styling changes for Tailwind
  theme: {
    extend: {
      colors: {
        "infinito-primary": "#a382c9",
        "infinito-secondary": "#e8b0d0",
      },
    },
    fontFamily: {
      Outfit: ["Outfit", "sans-serif"],
      MuseoModerno: ["MuseoModerno", "sans-serif"],
      FredokaOne: ["Fredoka One", "cursive"],
      PatuaOne: ["Patua One", "cursive"],
    }
  },

  plugins: [],

};
