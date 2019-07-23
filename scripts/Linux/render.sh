#!/bin/bash
cd ../..
sudo docker run --name "Opus4_Doku_Renderer" -v "$PWD":/usr/src/app -p "4000:4000" starefossen/github-pages 
