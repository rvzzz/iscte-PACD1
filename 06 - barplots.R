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







# Filtrar apenas os casos onde Churn é "Yes"
df_demog_yes <- df %>%
    select(Churn, gender, SeniorCitizen, Partner, Dependents) %>%
    pivot_longer(cols = -Churn, names_to = "Variable", values_to = "Value") %>%
    filter(Churn == "Yes")  # Mantém apenas os registros de Churn = Yes

# Criar o gráfico apenas para Churn = "Yes"
ggplot(df_demog_yes, aes(x = Value, fill = Churn)) +
    geom_bar(color = "black", fill = "red") +  # Mantém apenas a cor vermelha
    geom_text(
        stat = "count",
        aes(label = ..count..),
        vjust = -0.5,
        size = 4
    ) +
    facet_wrap(~ Variable, scales = "free") +
    labs(title = "Distribuição Demográfica para Churn: Yes",
         x = "",
         y = "Frequência") +
    theme_light() +
    theme(legend.position = "none",  # Remove a legenda, pois só há um grupo
          axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))








# Filtrar apenas os casos onde Churn é "Yes"
df_demog_yes <- df %>%
    select(Churn, gender, SeniorCitizen, Partner, Dependents) %>%
    pivot_longer(cols = -Churn, names_to = "Variable", values_to = "Value") %>%
    filter(Churn == "Yes")  # Mantém apenas os registros de Churn = Yes

# Criar o gráfico apenas para Churn = "Yes"
ggplot(df_demog_yes, aes(x = Value, fill = Churn)) +
    geom_bar(color = "black", fill = "red") +
    geom_text(
        stat = "count",
        aes(label = ..count..),
        vjust = -1.2,  # Aumenta a distância do número para melhor visibilidade
        size = 4
    ) +
    facet_wrap(~ Variable, scales = "free") +
    labs(title = "Distribuição Demográfica para Churn: Yes",
         x = "",
         y = "Frequência") +
    scale_y_continuous(expand = expansion(mult = c(0, 0.15))) +  # Adiciona espaço acima das barras
    theme_light() +
    theme(legend.position = "none",
          axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))




















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



# Distribuição dos Serviços por Churn

# Prepare the data: select the service variables along with Churn
df_services <- df %>%
    select(Churn, PhoneService, MultipleLines, InternetService, OnlineSecurity,
           OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies) %>%
    pivot_longer(cols = -Churn, names_to = "Service", values_to = "Status") %>%
    filter(Churn == "Yes")  # Filtrar apenas os clientes que cancelaram


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







# Prepare the data: select only churned customers
df_services <- df %>%
    select(Churn, PhoneService, MultipleLines, InternetService, OnlineSecurity,
           OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies) %>%
    pivot_longer(cols = -Churn, names_to = "Service", values_to = "Status") %>%
    filter(Churn == "Yes")  # Filtrar apenas os clientes que cancelaram

# Create the bar chart with only Churn = Yes
ggplot(df_services, aes(x = Status)) +
    geom_bar(fill = "red", color = "black") +  # Apenas vermelho para churn
    geom_text(stat = "count", aes(label = ..count..),
              vjust = -0.5, size = 3) +
    facet_wrap(~ Service, scales = "free") +
    labs(title = "Distribuição dos Serviços - Apenas Churn = Yes",
         x = "",
         y = "Frequência") +
    theme_minimal()






# Pacotes necessários
library(dplyr)
library(ggplot2)
library(scales)

# Calcular proporção de churn dentro de cada tipo de contrato
df_percent <- df %>%
    group_by(Contract) %>%  # Agrupa por tipo de contrato
    count(Churn) %>%  # Conta os clientes em cada categoria de churn
    mutate(prop = n / sum(n))  # Calcula a proporção dentro de cada contrato

# Criar gráfico com percentagens dentro das barras
ggplot(df_percent, aes(x = Contract, y = prop, fill = Churn)) +
    geom_bar(stat = "identity", position = "fill") +  # Proporção dentro de cada tipo de contrato
    geom_text(
        aes(label = percent(prop, accuracy = 1)),  # Exibir percentual formatado
        position = position_fill(vjust = 0.5),  # Centraliza dentro da barra
        color = "white", size = 3, fontface = "bold"
    ) +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    labs(title = "Distribuição do Churn por Tipo de Contrato",
         x = "Tipo de Contrato",
         y = "Proporção",
         fill = "Churn") +
    theme_minimal() +
    coord_flip()  # Inverte os eixos para melhor visualização



