source("02 - conversões e limpeza de dados.R")

# Distribuição de Contratos, Faturamento Eletrônico e Método de Pagamento por Churn

# Preparar os dados: selecionar as variáveis e transformar para formato longo
df_contract <- df %>%
    select(Churn, Contract, PaperlessBilling, PaymentMethod) %>%
    pivot_longer(cols = -Churn, names_to = "Variable", values_to = "Value")


p <- ggplot(df_contract, aes(x = Value, fill = Churn)) +
    geom_bar(position = position_dodge(width = 0.8), color = "black") +
    facet_wrap(~ Variable, scales = "free") +
    scale_fill_manual(values = c("No" = "green", "Yes" = "red")) +
    labs(title = "Distribuição de Contract, PaperlessBilling e PaymentMethod por Churn",
         x = "Categoria",
         y = "Contagem") +
    theme_minimal() +
    theme(
        legend.position = "top",
        axis.text.x = element_text(
            angle = 90,
            hjust = 1,
            vjust = 0.5,
            margin = margin(t = 10)
        ),
        plot.margin = margin(1, 1, 1, 1, "cm")
    )


# Converter para interativo com plotly (opcional)
ggplotly(p)









# Distribuição Demográfica por Variável e Churn


# Preparar os dados: selecionar variáveis demográficas e manter a variável Churn
df_demog <- df %>%
    select(Churn, gender, SeniorCitizen, Partner, Dependents) %>%
    pivot_longer(cols = -Churn, names_to = "Variable", values_to = "Value")


# Create the combined bar chart using facet_wrap with side-by-side bars for Churn
ggplot(df_demog, aes(x = Value, fill = Churn)) +
    geom_bar(position = position_dodge(width = 0.9), color = "black") +
    geom_text(
        stat = "count",
        aes(label = ..count..),
        position = position_dodge(width = 0.9),
        vjust = -0.5,
        size = 3
    ) +
    facet_wrap( ~ Variable, scales = "free") +
    labs(title = "Distribuição Demográfica por Variável e Churn", x = "", y = "Frequência") +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    theme_minimal() +
    theme(legend.position = "top",
          axis.text.x = element_text(angle = 90, hjust = 1))







# Distribuição dos Serviços por Churn

# Prepare the data: select the service variables along with Churn
df_services <- df %>%
    select(Churn, PhoneService, MultipleLines, InternetService, OnlineSecurity,
           OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies) %>%
    pivot_longer(cols = -Churn, names_to = "Service", values_to = "Status")


# Create the combined bar chart with side-by-side bars for Churn within each service facet
ggplot(df_services, aes(x = Status, fill = Churn)) +
    geom_bar(position = position_dodge(width = 0.9), color = "black") +
    geom_text(stat = "count", aes(label = ..count..),
              position = position_dodge(width = 0.9), vjust = -0.5, size = 3) +
    facet_wrap(~ Service, scales = "free") +
    labs(title = "Distribuição dos Serviços por Churn",
         x = "",
         y = "Frequência") +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    theme_minimal() +
    theme(legend.position = "top")
