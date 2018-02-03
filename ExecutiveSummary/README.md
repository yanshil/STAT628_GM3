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

## About Online / Offline

We failed to run the slides with images represented in `relative directory`. Thus we post the plots in `plotly` and a Linux Server.

Both version is in fact "online", with the `online` one have images with links from `plotly` and the `offline` one with links from the server.

We would like to use the `online` version to do the presentation if the plots can be loaded successfully.