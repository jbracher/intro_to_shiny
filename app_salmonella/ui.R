library(shiny)

# UI für App, die Währungskurse zeigt
shinyUI(fluidPage(

  # Titel
  titlePanel("Salmonella im Vereinigten Königreich"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      # Slider für Woche, in der wir die Vorhersage abgeben:
      sliderInput("zeitpunkt_vorhersage", # Name der Eingabe
                  "Vorhersagezeitpunkt:", # Titel
                  min = 104, # Min. Wert (2 Jahre)
                  max = 311, # Max. Wert (1W. vor Ende d. Daten)
                  value = 150) # Default
    ),

    # Main Panel mit Plot
    mainPanel(
       plotOutput("salmonella_plot")
    )
  )
))
