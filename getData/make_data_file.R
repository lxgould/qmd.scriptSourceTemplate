#- generate a file with the current date


date_file <- "../data/test_app_1.txt"

dt <- format(Sys.time(), "%Y-%m-%d %H:%M:%S")

cat(paste0("Writing the date to ", date_file))

#- force an error
# stop("I forced an error.  The date was not written to the file")
writeLines(dt, date_file)

n = 10000
beta0 = 483
beta1 = .44
df <- data.frame(
  x = rnorm(n, mean = 500, sd = 4.3)
)
df$y = beta0 + beta1 * df$x + rnorm(n, mean = 0, sd = 3.0)

plot(df$x, df$y)

mod1 <- lm(y ~ x,
           data = df)
anova(mod1)

