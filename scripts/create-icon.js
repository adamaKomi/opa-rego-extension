const sharp = require('sharp');

const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128" width="128" height="128">
  <defs>
    <linearGradient id="g" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#566FE6"/>
      <stop offset="100%" stop-color="#3949AB"/>
    </linearGradient>
  </defs>
  <rect width="128" height="128" rx="16" fill="url(#g)"/>
  <text x="64" y="88" font-family="Arial, sans-serif" font-size="72" font-weight="bold" fill="white" text-anchor="middle">R</text>
  <circle cx="100" cy="28" r="8" fill="#7C4DFF" opacity="0.8"/>
</svg>`;

sharp(Buffer.from(svg))
  .png()
  .toFile('resources/icon.png')
  .then(() => console.log('✓ Icon PNG created successfully!'))
  .catch(console.error);
