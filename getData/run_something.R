#- generate a file with the current date

commandArgs(trailingOnly = TRUE)

# date_file <- "../data/test_app_1.txt"
# 
# dt <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")
# 
# print(paste0("print: Writing the date to ", date_file))
# cat(paste0("cat: Writing the date to ", date_file))
# writeLines(dt, date_file)

n = 100
beta0 = 40
beta1 = .44
df <- data.frame(
  x = rnorm(n, mean = 50, sd = 4.3)
)
df$y = beta0 + beta1 * df$x + rnorm(n, mean = 0, sd = 3.0)

plot(df$x, df$y)

mod1 <- lm(y ~ x,
           data = df)
anova(mod1)
