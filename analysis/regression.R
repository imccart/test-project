## Basic regression for test project

dartmouth.data <- dartmouth.data %>%
  mutate(exp_1000=Expenditures/1000)

reg1 <- feols(Total_Mortality~exp_1000, se="hetero", dartmouth.data)
reg2 <- feols(Total_Mortality~exp_1000 | HRR, dartmouth.data)
reg3 <- feols(Total_Mortality~exp_1000 | HRR + Year, dartmouth.data)

modelsummary(list(reg1,reg2,reg3),
             coef_omit="Intercept",
             statistic="conf.int",
             conf_level=0.95,
             coef_rename = c("exp_1000" = "Expenditures per Capita ($1000s)"),
             gof_omit = 'R2|AIC|BIC|Log',
             output="output/reg-results.tex")