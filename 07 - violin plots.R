source("02 - conversões e limpeza de dados.R")


p <- ggplot(df, aes(x = Churn, y = MonthlyCharges, fill = Churn)) +
    geom_violin(trim = FALSE, alpha = 0.5) +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    geom_boxplot(width = 0.1, fill = "white") +
    geom_jitter(width = 0.1, alpha = 0.4) +
    labs(title = "Distribuição de MonthlyCharges por Churn",
         x = "Churn",
         y = "Monthly Charges") +
    theme_minimal()

ggplotly(p)
