library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Wechselkurse"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      # Checkboxen für verschiedene Währungen
      selectInput("waehrung", label = "Währung",
                         choices = list("US-Dollar" = "USD",
                                        "Euro" = "EUR",
                                        "Britisches Pfund" = "GBP"),
                         selected = 1)
    ),

    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("wechselkurse_plot")
    )
  )
))
