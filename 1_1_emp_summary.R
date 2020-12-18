set.seed(1231)
ab <- data.frame(source = sample(1:3, 4, T),
           date = c("2010-01-13 11:35:57 CET",
                    "11-01-2010",
                    "03-01-2010",
                    "2010 10-02"),
           temp = sample(-10:30, 4,T))


tem_function <- function(df_date){
  df_date %>% 
    mutate(date_1= if_else(str_count(date)> 12, ymd_hms(date),parse_date_time(date, orders = c("dmy", "ymd", " y dm"))),
           year = year(date_1),
           month = month(date_1)) %>% 
    group_by(year, month) %>% 
    mutate(temperature_mean = round(mean(temperature),2)) %>% 
    select(source, year, month, temperature_mean) %>% 
    arrange(source, year, month)
  
}

abc <- read.csv("temperature.csv")

tem_function(abc)

