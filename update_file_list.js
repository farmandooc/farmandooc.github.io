const fs = require('fs');
const path = require('path');

// Leer todos los archivos de la carpeta actual
const files = fs.readdirSync('.').filter(file => {
    return !file.startsWith('.') && 
           file !== 'update_file_list.js' && 
           file !== 'node_modules';
});

// Leer el archivo HTML
let htmlContent = fs.readFileSync('index.html', 'utf8');

// Crear la nueva lista de archivos
const fileListJS = `        const files = [\n${files.map(file => `            '${file}'`).join(',\n')}\n        ];`;

// Reemplazar la lista de archivos en el HTML
const regex = /const files = \[\s*[\s\S]*?\];/;
const updatedHTML = htmlContent.replace(regex, fileListJS);

// Escribir el archivo actualizado
fs.writeFileSync('index.html', updatedHTML, 'utf8');

console.log('Lista de archivos actualizada:', files);