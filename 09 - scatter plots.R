source("02 - conversões e limpeza de dados.R")


p <- ggplot(df, aes(x = tenure, y = MonthlyCharges, color = Churn)) +
    geom_point(alpha = 0.6) +
    scale_color_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    facet_grid(Contract ~ PaymentMethod) +
    labs(title = "MonthlyCharges vs. Tenure por Contrato e Método de Pagamento",
         x = "Tenure (meses)",
         y = "Monthly Charges") +
    theme_minimal()

ggplotly(p)
