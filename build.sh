#!/bin/sh
# Gera index.html (página completa) a partir de portfolio.html (conteúdo usado no Artifact)
cd "$(dirname "$0")"
{
printf '<!doctype html>\n<html lang="pt-BR">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
printf '<link rel="icon" href="icons/favicon.ico" sizes="any">\n<link rel="icon" type="image/png" sizes="32x32" href="icons/favicon-32.png">\n<link rel="apple-touch-icon" href="icons/apple-touch-icon.png">\n<link rel="manifest" href="site.webmanifest">\n<meta name="theme-color" content="#120a12">\n'
printf '<meta property="og:type" content="website">\n<meta property="og:title" content="Vivian · Portfólio de Dança">\n<meta property="og:description" content="Bailarina de Nova Friburgo (RJ): ballet clássico, sapateado, jazz e dança contemporânea.">\n<meta property="og:image" content="https://portfolio-vivian-henna.vercel.app/img/foto2.jpg">\n'
sed -n '1,/<\/style>/p' portfolio.html
printf '</head>\n<body>\n'
sed -n '/<\/style>/,$p' portfolio.html | tail -n +2
printf '</body>\n</html>\n'
} > index.html
