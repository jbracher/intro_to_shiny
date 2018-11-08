library(shiny)

# UI für App, die Währungskurse zeigt
shinyUI(fluidPage(

  # Titel
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

    # Main Panel mit Plot
    mainPanel(
       plotOutput("wechselkurse_plot")
    )
  )
))
