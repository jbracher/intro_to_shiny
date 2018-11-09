library(shiny)
library(surveillance)
library(hhh4addon)

# Server-Code:
shinyServer(function(input, output) {

  # lade Datensatz:
  salmonella <- data("salmonella.agona")

  # Plot-Objekt, das von ui aus vewendet werden kann:
  output$salmonella_plot <- renderPlot({
    # Eingabe von ui übernehmen:
    zeitpunkt_vorhersage <- input$zeitpunkt_vorhersage
    # Modell-Einstellungen
    # (Nutzer legt nur Datenbasis fest via Argument subset)
    control_salmonella <-
      list(end = list(f = addSeason2formula(~ 1)),
                               ar = list(f = addSeason2formula(~ 1)),
                               subset = 2:zeitpunkt_vorhersage)
    # Wende Modell auf Daten an:
    fit_salmonella <- hhh4(salmonella.agona, control_salmonella)
    # Generiere Vorhersage:
    prediction <- predictive_moments(fit_salmonella,
                                     t_condition = zeitpunkt_vorhersage,
                                     lgt = 312 - zeitpunkt_vorhersage)
    # Plotte:
    plot(fit_salmonella, names = "Salmonellen") # Modell
    fanplot_prediction(prediction, add = TRUE) # Vorhersage dazu
  })
})
