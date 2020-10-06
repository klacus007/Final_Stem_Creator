let fs = require('fs');
const pasta = '/content/drive/My Drive/Musicas/03.Sleeper_m4a/'; //pasta onde ficam as musicas
const comando = '"/content/drive/My Drive/Programas/ni-stem-1.0/ni-stem" create -m "/content/drive/My Drive/Programas/ni-stem-1.0/StemMetadata.json" -s';  // comando que converte as musicas
const cx = "-x"; //parametro do comando
const tag = "-t";
const aspas = '"'; // aspas necessárias no endereço do arquivo
const stems = []; // arquivos organizados pelo script do fabio
const arquivos = fs.readdirSync(pasta);
arquivos.forEach((arquivo) => {
const raiz = arquivo.split('.')[1];

if (stems[raiz]) {
stems[raiz].push(arquivo);
} else {
stems[raiz] = [];
stems[raiz].push(arquivo);
}
});

let stem = function spleeter() {for (var i = 0; i < stems[1].length; i++) {
    console.log(comando, aspas + pasta + stems[1][i] + aspas, aspas + pasta + stems[2][i] + aspas, aspas + pasta + stems[3][i] + aspas, aspas + pasta + stems[4][i] + aspas, cx , aspas + pasta + stems[5][i] + aspas, tag, aspas + pasta + stems[6][i] + aspas)};
}; //laço que gera comando de conversão para o conjunto de arquivos
stem();