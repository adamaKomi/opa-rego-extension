/**
 * Script to generate icon.png from SVG
 * Run: node scripts/generate-icon.js
 * 
 * Requirements: sharp (npm install sharp --save-dev)
 */

const fs = require('fs');
const path = require('path');

// Simple PNG generator - creates a basic 128x128 icon
// For production, use proper image tools or online converters

const iconData = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128 128" width="128" height="128">
  <defs>
    <linearGradient id="grad1" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#566FE6;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#3949AB;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="128" height="128" rx="16" fill="url(#grad1)"/>
  <text x="64" y="88" 
        font-family="Consolas, Monaco, monospace" 
        font-size="72" 
        font-weight="bold" 
        fill="white" 
        text-anchor="middle">R</text>
  <circle cx="100" cy="28" r="8" fill="#7C4DFF" opacity="0.8"/>
</svg>`;

const outputPath = path.join(__dirname, '..', 'resources', 'icon.svg');

fs.writeFileSync(outputPath, iconData);
console.log('✓ Icon SVG generated at:', outputPath);
console.log('\nTo convert to PNG, use one of these methods:');
console.log('1. Online: https://svgtopng.com/');
console.log('2. ImageMagick: convert icon.svg -resize 128x128 icon.png');
console.log('3. Sharp: npm install sharp && node -e "require(\'sharp\')(\'icon.svg\').png().toFile(\'icon.png\')"');
