source("02 - conversões e limpeza de dados.R")



# Tenure por Churn
p <- ggplot(df, aes(x = tenure, fill = Churn)) +
    geom_histogram(binwidth = 5, position = "dodge") +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    labs(title = "Distribuição do Tenure por Churn", x = "Tenure (meses)", y = "Frequência")

ggplotly(p)




# Cobranças mensais por Churn
p <- ggplot(df, aes(x = MonthlyCharges, fill = Churn)) +
    geom_histogram(binwidth = 5, position = "dodge") +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    labs(title = "Distribuição das Cobranças Mensais por Churn", x = "Monthly Charges", y = "Frequência")

ggplotly(p)





# Total cobrado por Churn
p <- ggplot(df, aes(x = TotalCharges, fill = Churn)) +
    geom_histogram(binwidth = 100, position = "dodge") +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    labs(title = "Distribuição do Total Cobrado por Churn", x = "Total Charges", y = "Frequência")

ggplotly(p)
