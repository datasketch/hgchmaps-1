#' choropleth chart Gcd Num
#'
#' @description
#' `hgch_choropleth_GcdNum()` Create a Highcharter choropleth map based on a particular data type.
#' In this case, you can load data with only two columns, where the firts it's a **geocode column**,
#' and the second is a **numeric class column**, or make sure that the first two columns of
#' your data meet this condition
#'
#' @export
#' @family Gcd-Num plots
#' @section Ftype:
#' Gcd-Num
#' @examples
#' data <- sample_data("Gcd-Num", n = 30)
#' hgch_choropleth_GcdNum(data)
#'
#'
#' # if you want to calculate the average instead of the sum, you can use agg inside a function
#' hgch_choropleth_GcdNum(data,
#'                        agg = "mean")
#'
#'
hgch_choropleth_GcdNum <- function(data = NULL, ...) {

  opts <- dsvizopts::merge_dsviz_options(...)
  if (!is.null(data)) data[[1]] <- as_Gcd(data[[1]])
  l <- hgchmaps_prep(data = data, opts = opts, by_col = "id", ftype="Gcd-Num")

  highchart(type = "map") %>%
    hc_add_series(
      mapData = l$geoInfo,
      data = l$data,
      joinBy = l$by_col,
      borderColor = opts$theme$border_color,
      nullColor = opts$theme$na_color,
      showInLegend = FALSE,
      dataLabels = list (
        enabled = l$datalabel$dataLabels_show,
        format = l$datalabel$dataLabels_format_sample %||% "{point.value}",
        style = list(
          fontSize = paste0(l$datalabel$dataLabels_size %||% 11, "px"),
          color = l$datalabel$dataLabels_color %||% "#222222",
          textShadow = "none",
          textOutline = ifelse(l$datalabel$dataLabels_text_outline,
                               "1px contrast", "none")
        )
      ),
      events = list(click = l$shiny$clickFunction),
      cursor= l$shiny$cursor
    ) %>%
    hc_colorAxis(
      stops = color_stops(colors = l$palette_colors)
    ) %>%
    hc_tooltip(useHTML = TRUE,
               formatter = JS(paste0("function () {return this.point.labels;}"))) %>%
    hc_add_theme(hgch_theme(opts = l$theme))


}

#' choropleth chart Gcd
#'
#' @description
#' `hgch_choropleth_Gcd()` Create a Highcharter choropleth map based on a particular data type.
#' In this case, you can load data with only one column, where it's a **geocode column**,
#' or make sure that the first column of your data meet this condition
#'
#' @export
#' @family Gcd plots
#' @section Ftype:
#' Gcd
#' @examples
#' data <- sample_data("Gcd", n = 30)
#' hgch_choropleth_Gcd(data)
#'
#'
#' # if you want to calculate the average instead of the sum, you can use agg inside a function
#' hgch_choropleth_Gcd(data,
#'                     agg = "mean")
#'
#'
hgch_choropleth_Gcd <- function(data = NULL, ...) {

  opts <- dsvizopts::merge_dsviz_options(...)
  if (!is.null(data)) data[[1]] <- as_Gcd(data[[1]])
  l <- hgchmaps_prep(data = data, opts = opts, by_col = "id", ftype="Gcd")

  highchart(type = "map") %>%
    hc_add_series(
      mapData = l$geoInfo,
      data = l$data,
      joinBy = l$by_col,
      borderColor = opts$theme$border_color,
      nullColor = opts$theme$na_color,
      showInLegend = FALSE,
      dataLabels = list (
        enabled = l$datalabel$dataLabels_show,
        format = l$datalabel$dataLabels_format_sample %||% "{point.value}",
        style = list(
          fontSize = paste0(l$datalabel$dataLabels_size %||% 11, "px"),
          color = l$datalabel$dataLabels_color %||% "#222222",
          textShadow = "none",
          textOutline = ifelse(l$datalabel$dataLabels_text_outline,
                               "1px contrast", "none")
        )
      ),
      events = list(click = l$shiny$clickFunction),
      cursor= l$shiny$cursor
    ) %>%
    hc_colorAxis(
      stops = color_stops(colors = l$palette_colors)
    ) %>%
    hc_tooltip(useHTML = TRUE,
               formatter = JS(paste0("function () {return this.point.labels;}"))) %>%
    hc_add_theme(hgch_theme(opts = l$theme))


}

