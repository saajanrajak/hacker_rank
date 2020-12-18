# Sock pair Count

# https://www.hackerrank.com/challenges/sock-merchant/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=warmup

pair_function <- function(n_col,arr) {
  df <- data.frame(socks = arr)
  df %>% 
    count(socks) %>% 
    mutate(pairs_count = n%/%2) %>% 
    select(pairs_count) %>% 
    sum()
}

pair_function(5, c(2,3,4,2,4,4,4,4))  


