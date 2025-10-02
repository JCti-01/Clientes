/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      './app/views/**/*.{erb,html,html.erb}',
      './app/helpers/**/*.rb',
      './app/javascript/**/*.{js,jsx,ts,tsx}'
    ],
    theme: {
      extend: {
        colors: {
          brand: '#4f46e5', 
        },
      },
    },
    plugins: [],
  }
  