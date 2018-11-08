library(shiny)

# Server-Code für Wechselkurse-App
shinyServer(function(input, output) {

  # Hole Wechselkurse des CHF mit Euro, US-Dollar, Pfund
  # (Codes zu finden auf http://www.dataseries.org/)
  wechselkurse <- dataseries::ds(c("FXR.M0.USD1", "FXR.M0.EUR1", "FXR.M0.GBP1"))
  # Benenne Achsen neu:
  colnames(wechselkurse) <- c("Zeit", "USD", "EUR", "GBP")

  output$wechselkurse_plot <- renderPlot({
    # Erzeuge Grafik:
    plot(wechselkurse$Zeit, wechselkurse[, input$waehrung], # Wähle Spalte mit selbem Namen wie input$waehrung
         main = paste("Wechselkurs CHF /", input$waehrung), # Titel für Plot
         xlab = "Zeit", ylab = "Franken pro Fremdwährung", # Achsenbeschriftungen
         type = "l") # zeichne Linie anstelle von Punkten

  })

})
