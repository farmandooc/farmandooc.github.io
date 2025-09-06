const fs = require('fs');

try {
    // Leer todos los archivos de la carpeta actual
    const files = fs.readdirSync('.').filter(file => {
        return !file.startsWith('.') && 
               file !== 'update_file_list.js' && 
               file !== 'generate_file_list.cmd' &&
               !fs.statSync(file).isDirectory();
    });

    console.log('Archivos encontrados:', files);

    // Leer el archivo HTML
    let htmlContent = fs.readFileSync('index.html', 'utf8');

    // Crear la nueva lista de archivos con el formato exacto
    const fileListJS = `        const files = [
${files.map(file => `            '${file}'`).join(',\n')}
        ];`;

    // Buscar y reemplazar específicamente la sección const files = [...]
    const regex = /(\s+const files = \[)[^}]*?(\s+\];)/s;
    
    if (htmlContent.match(regex)) {
        const updatedHTML = htmlContent.replace(regex, fileListJS);
        fs.writeFileSync('index.html', updatedHTML, 'utf8');
        console.log('✅ Lista de archivos actualizada correctamente');
    } else {
        console.log('❌ No se encontró la sección const files para actualizar');
    }

} catch (error) {
    console.error('Error:', error.message);
}