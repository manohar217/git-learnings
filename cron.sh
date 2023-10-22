#!/bin/bash
history >> History.txt
git add . 
git commit -m "Learnings" 
git pull origin main 
git push origin main 
