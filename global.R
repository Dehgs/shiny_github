library(shiny)
library(bslib)
library(dplyr)
if (FALSE) {
  library(markdown)
}

input_data_path <- "input_data"
processed_data_path <- "processed_data"
input_excel_file <-
  "business_summary_v6.xlsx"

footer_code <-
  div(
    h6(
      "Te Puni Kōkiri",
      span(
        "Te Puni Whakahaere Tikanga,",
        a(
          "Data & Insights",
          href = "mailto:matawhanui@tpk.govt.nz",
          # style = "color:gray;"
          style = "color:gray;"
        ),
        " - May 2024 ",
        style = "color:gray;font-size:12px;"
      ),
      a(
        img(
          # src = "https://raw.githubusercontent.com/Dehgs/climate_data_tool/main/img/footer_logo.svg",
          src = "footer_logo.svg",
          style = "height:22px;float:right;margin-top:19px;margin-right:15px;"
        ),
        href = "https://www.tpk.govt.nz/",
        target = "_blank",
        id = "footer_logo"
      ),
      style = "background-color:#333333;color:white;margin-top:3px;margin-bottom:0px;line-height:60px;margin-left:0px;margin-right:-15px;padding-left:15px;font-size:0.8em;font-size:12px;"
    ),
    id = "footer",
    style = "left:0;bottom:0;width:calc(100% - 15px);position:fixed;z-index:10000;"
  )

attr_opt <-
  c(
    "Business Count" = "bus_cnt",
    "Employee Count" = "emp_cnt",
    "Revenue" = "rev",
    "Sales" = "sales"
  )

comp_opt <-
  c(
    "Climate Hazard by Region" = "cli_reg",
    "Climate Hazard by Industry" = "cli_ind",
    "Industry by Region" = "ind_reg"
  )

ind_opt <-
  c(
    "Industry 1" = "ind_1",
    "Industry 2" = "ind_2",
    "Industry 3" = "ind_3"
  )

reg_opt <-
  c(
    "Region 1" = "reg_1",
    "Region 2" = "reg_2",
    "Region 3" = "reg_3"
  )

cli_opt <-
  c(
    "Climate 1" = "cli_1",
    "Climate 2" = "cli_2",
    "Climate 3" = "cli_3"
  )

eth_opt <-
  c(
    "Māori Businesses" = "mao_bus",
    "Non-Māori Businesses" = "non_mao_bus",
    "All Businesses" = "all_bus"
  )

cli_per_opt <-
  c(
    "Baseline (1986-2005 Average)" = "base",
    "Mid-Century (2031-2050 Average)" = "mid_cen",
    "Mid-Century vs. Baseline" = "mid_cen_base"
  )

fl_slr_thresh_opt <-
  c(
    "At Least 5% of the Area" = "area_5p",
    "At Least 0.5 km² in Extent" = "area_05k",
    "Exposure to Any Extent" = "area_any"
  )

other_thresh_opt <-
  c(
    "The 80<sup>th</sup> Percentile of the Baseline" = "pc_80",
    "The 90<sup>th</sup> Percentile of the Baseline" = "pc_90",
    "Increase by Over 10% of the Baseline" = "inc_10",
    "Any Increase" = "inc_any"
  )

ind2d_metadata <-
  openxlsx::read.xlsx(
    file.path(
      input_data_path,
      input_excel_file
    ),
    sheet = "lookup",
    colNames = FALSE,
    startRow = 7,
    cols = 1:2
  ) |>
  `colnames<-`(c("ind2d", "description"))

ind1d_metadata <-
  openxlsx::read.xlsx(
    file.path(
      input_data_path,
      input_excel_file
    ),
    sheet = "lookup",
    colNames = FALSE,
    rows = 7:25,
    cols = 7:8
  ) |>
  `colnames<-`(c("ind1d", "description"))

geo_metadata <-
  openxlsx::read.xlsx(
    file.path(
      input_data_path,
      input_excel_file
    ),
    sheet = "lookup",
    colNames = FALSE,
    startRow = 6,
    cols = 15:17
  ) |>
  `colnames<-`(c("regc_code", "regc_name", "mrgd_code")) |>
  mutate(
    regc_code = as.character(regc_code),
    mrgd_code = as.character(mrgd_code)
  )
