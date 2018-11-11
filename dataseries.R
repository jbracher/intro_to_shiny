install.packages("dataseries")
library(dataseries)

# Hole Wechselkurse des CHF mit Euro, US-Dollar, Pfund (Codes auf http://www.dataseries.org/)
wechselkurse <- dataseries::ds(c("FXR.M0.USD1", "FXR.M0.EUR1", "FXR.M0.GBP1"))
# Benenne Spalten neu:
colnames(wechselkurse) <- c("Zeit", "USD", "EUR", "GBP")

# Erzeuge Grafik:
plot(wechselkurse$Zeit, wechselkurse$EUR,
     xlab = "Zeit", ylab = "Franken pro Fremdwährung", # Achsenbeschriftungen
     type = "l") # zeichne Linie anstelle von Punkten
