source("00 - carregar bibliotecas e dataset.R")


# Remoção dos NAs existentes na coluna TotalCharges
df <- df %>% filter(!is.na(TotalCharges))


# Converter a coluna SeniorCitizen para char: "Yes/No"
df$SeniorCitizen <- ifelse(df$SeniorCitizen == 1, "Yes", "No")


# converter as variáveis "char" para "factor" ???????
df <- df %>% mutate(across(
    c(
        SeniorCitizen,
        gender,
        Partner,
        Dependents,
        PhoneService,
        MultipleLines,
        InternetService,
        OnlineSecurity,
        OnlineBackup,
        DeviceProtection,
        TechSupport,
        StreamingTV,
        StreamingMovies,
        Contract,
        PaperlessBilling,
        PaymentMethod,
        Churn
    ),
    as.factor
))

