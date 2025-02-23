#!/usr/bin/env sh

# aborta em casos de erros
set -e

# build
npm run build

# navega até o diretório de saída da compilação
cd dist

# se você estiver implantando em um domínio personalizado
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:felipebossolani/habit-tracker-cursor.ai.git main:gh-pages

cd - 