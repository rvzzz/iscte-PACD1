source("02 - conversões e limpeza de dados.R")


# Create the initial 3D scatter plot with default opacity (e.g., 0.7)
fig <- plot_ly(
    data = df,
    x = ~tenure,
    y = ~MonthlyCharges,
    z = ~TotalCharges,
    color = ~Churn,
    colors = c("green", "red"),
    type = "scatter3d",
    mode = "markers",
    marker = list(size = 3, opacity = 0.7),
    text = ~paste("Customer ID:", customerID,
                  "<br>Gender:", gender,
                  "<br>Senior Citizen:", SeniorCitizen,
                  "<br>Partner:", Partner,
                  "<br>Dependents:", Dependents,
                  "<br>Churn:", Churn)
)

# Define a slider to adjust the marker opacity from 0.1 to 1 by increments of 0.1
opacity_steps <- lapply(seq(0.1, 1, by = 0.1), function(op_val) {
    list(
        label = as.character(op_val),
        method = "restyle",
        args = list("marker.opacity", op_val)
    )
})

fig <- fig %>% layout(
    title = "3D Scatter Plot with Opacity Slider",
    scene = list(
        xaxis = list(title = "Tenure (months)"),
        yaxis = list(title = "Monthly Charges"),
        zaxis = list(title = "Total Charges")
    ),
    sliders = list(
        list(
            active = 6,
            currentvalue = list(prefix = "Opacity: "),
            pad = list(t = 50),
            steps = opacity_steps
        )
    )
)

fig
