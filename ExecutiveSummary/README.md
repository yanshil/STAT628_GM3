## Command Running on the Jupyter Notebook Server

1. Open the terminal
2. Run the following command

```
# Post the slides
jupyter nbconvert "./ExecutiveSummary/[filename].ipynb" --to slides --post serve --ServePostProcessor.ip='*'
```

3. Open the Link

http://13.85.11.67:8000/[filename].slides.html

Or

http://jupyterslides.yansr.me/[filename].slides.html


## Here we have

```
# netstat -tulpn
jupyter nbconvert "./ExecutiveSummary/Slides_offlineVersion.ipynb" --to slides --post serve --ServePostProcessor.ip='*'
```
http://13.85.11.67:8000/Slides_offlineVersion.slides.html

