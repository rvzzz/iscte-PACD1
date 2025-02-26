source("02 - conversões e limpeza de dados.R")


# Transform the data to long format while keeping the Churn variable
df_long <- df %>%
    select(Churn, tenure, MonthlyCharges, TotalCharges) %>%
    pivot_longer(cols = -Churn, names_to = "Variable", values_to = "Value")

# Create the ggplot with tooltips for interactivity
p <- ggplot(df_long, aes(x = Churn, y = Value, fill = Churn,
                         text = paste("Churn:", Churn, "<br>Variable:", Variable, "<br>Value:", Value))) +
    geom_boxplot() +
    facet_wrap(~ Variable, scales = "free") +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    labs(title = "Distribuição das Variáveis por Churn",
         x = "Churn",
         y = "Valor") +
    theme_minimal()

# Convert the ggplot to an interactive plotly object
ggplotly(p, tooltip = "text")
