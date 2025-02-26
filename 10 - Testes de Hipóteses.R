source("02 - conversões e limpeza de dados.R")


# Testes de Hipóteses

monthly_yes <- df %>%
    filter(Churn == "Yes") %>%
    pull(MonthlyCharges)

monthly_no <- df %>%
    filter(Churn == "No") %>%
    pull(MonthlyCharges)

# qqplot para verificar normalidade
qqplot(monthly_no, main = "QQ Plot - MonthlyCharges (Churn = No)")
qqplot(monthly_yes, main = "QQ Plot - MonthlyCharges (Churn = Yes)")


resultado_t <- t.test(monthly_yes, monthly_no, alternative = "two.sided")
resultado_t



# 5. Conclusão
#
# Se o p-value < 0.05, há evidência estatística de que a média de MonthlyCharges difere entre churners e não-churners.
#
# Observa também a direção da diferença (verifica as médias de cada grupo). Se a média de monthly_yes for maior, podes dizer que, estatisticamente, clientes que cancelam pagam um valor mensal maior (ou vice-versa).
#
# Com esse resultado, podes reforçar hipóteses de que custos elevados (se for o caso) influenciam o churn, e assim propor ações de retenção mais focadas em planos ou descontos.
# Exemplo de interpretação:
#
#     “O teste t (p-value < 0.001) indica que a média de MonthlyCharges para clientes que cancelam (média = 74.2) é significativamente maior do que para clientes que não cancelam (média = 60.5). Isto sugere que preços mensais elevados podem contribuir para o churn.”
#
# Assim, integras a análise estatística ao teu raciocínio de negócio, orientando decisões estratégicas para reduzir o churn.

