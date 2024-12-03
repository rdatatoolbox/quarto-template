make_hist <- function(dat) {
  
  #dat = targets::tar_read("data")
  
  ggplot2::ggplot(data = dat, mapping = ggplot2::aes(x = Ozone)) +
    ggplot2::geom_histogram()
  
  
}