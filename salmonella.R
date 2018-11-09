## Um hhh4addon direkt von github zu installieren:
# install.packages("devtools")
# library(devtools)
# install_github("jbracher/hhh4addon")

# Lade packages
library(surveillance) #enthält Daten und Modellierungsmethoden
library(hhh4addon) # enthält Vorhersage-Methoden

# lade einen der Beispieldatensätze:
salmonella <- data("salmonella.agona")

# Definiere einen Zeitpunkt, von dem ab eine Vorhersage gemacht werden soll:
zeitpunkt_vorhersage <- 208 # 4 Jahre

# Modell-Einstellungen (Details: ?hhh4)
control_salmonella <- list(end = list(f = addSeason2formula(~ 1)),
                           ar = list(f = addSeason2formula(~ 1)),
                           subset = 2:zeitpunkt_vorhersage)
# subset = 2:zeitpunkt_vorhersage bedeutet, dass nur Daten bis
# zeitpunkt_vorhersage verwendet werden

# Wende Modell auf Daten an:
fit_salmonella <- hhh4(salmonella.agona, control_salmonella)

# Generiere eine Vorhersage für alle noch folgenden Wochen
# bis zum Ende des Datensatzes:
prediction <- predictive_moments(fit_salmonella,
                                 t_condition = zeitpunkt_vorhersage,
                                 lgt = 312 - zeitpunkt_vorhersage)
# Plotte:
plot(fit_salmonella, names = "Salmonellen") # Modell
fanplot_prediction(prediction, add = TRUE, interpolate_probs = FALSE) # Vorhersage
