cd ../..
docker run --name "Opus4_Doku_Renderer" --rm --label=jekyll --volume=%CD%:/srv/jekyll  -it -p 4000:4000 jekyll/jekyll jekyll serve
pause
