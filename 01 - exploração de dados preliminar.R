
source("00 - carregar bibliotecas e dataset.R")


# Visualizar as primeiras linhas
head(df)


# Estrutura dos dados
str(df)


# Resumo estatístico preliminar
summary(df)


# verificar existência de valores duplicados
if (sum(duplicated(df)) > 0) {
    cat("Number of duplicate rows:", sum(duplicated(df)))
} else {
    cat("No duplicate rows")
}


# verificar NAs na base de dados - tabela com a quantidade de NAs por coluna
colSums(is.na(df))


# Visualizar as linhas correspondentes (observações) com NA existentes na coluna TotalCharges
View(df %>% filter(is.na(TotalCharges)))
