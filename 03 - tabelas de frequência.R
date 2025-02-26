source("02 - conversões e limpeza de dados.R")



# estrutura do dataframe - tipo de variáveis
str(df)

# estatísticas descritivas
summary(df)

# Distribuição de Churn - Tabela de Frequência (Absoluta e Relativa)
cbind(Absolute_Frequency = table(df$Churn),
      Relative_Frequency = prop.table(table(df$Churn)))


# Visualizar a distribuição de Churn
ggplot(df, aes(x = Churn, fill = Churn)) +
    geom_bar() +
    geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) +
    scale_fill_manual(values = c("No" = "#4CBB17", "Yes" = "red")) +
    labs(title = "Distribuição de Churn", x = "Churn", y = "Contagem")

