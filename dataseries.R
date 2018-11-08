install.packages("dataseries")

# Hole Wechselkurse des CHF mit Euro, US-Dollar, Pfund, Dänischer Krone und türkischer Lira
wechselkurse <- dataseries::ds(c("FXR.M0.USD1", "FXR.M0.EUR1",
                                 "FXR.M0.GBP1", "FXR.M0.DKK100",
                                 "FXR.M0.TRY100"))
# Benenne Achsen neu:
colnames(wechselkurse) <- c("Zeit", "USD", "EUR", "GBP", "DKK", "TRY")

# Erzeuge Grafik:
plot(wechselkurse$Zeit, wechselkurse$EUR,
     xlab = "Zeit", ylab = "Franken pro Fremdwährung", # Achsenbeschriftungen
     type = "l") # zeichne Linie anstelle von Punkten
