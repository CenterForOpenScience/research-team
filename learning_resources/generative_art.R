#from https://blog.djnavarro.net/posts/2021-10-19_rtistry-posts/


library(flametree)
library(wesanderson)

# pick some colours
#
shades <- c("#FAD77B", "#85D4E3", "#9C964A", "#CDC08C")

# data structure defining the trees
dat <- flametree_grow(time = 10, trees = 12)

# draw the plot - voronoi and black
dat %>%
  flametree_plot(
    background = "black",
    palette = shades,
    style = "voronoi"
  )

# draw the plot - native flora and black
dat %>%
  flametree_plot(
    background = "black",
    palette = shades,
    style = "nativeflora"
  )

# using a wes anderson palette

dat %>%
  flametree_plot(
    background = "white",
    palette = wes_palette("Royal2"),
    style = "wisp"
  )
