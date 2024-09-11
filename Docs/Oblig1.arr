# Oppgave 1
fun nok_to_valuta(nok_amount, hvilken_valuta): # Veksling * x kroner * valuta
  doc:"Norsk kroneverdi == NOK antall * Valuta du går utifra"
  if hvilken_valuta == "Euro": # Hvis vi velger Euro så bruker koden denne
    nok_amount * 0.084 # Antatt Valutakurs for Euro
  else if hvilken_valuta == "USD": # Hvis det står ikke Euro så går koden til USD
    nok_amount * 0.093 # Antatt Valutakurs for USD
  else: # Hvis man prøver å finne ut kurs på en annen valuta enn de som er kodet
    "ingen gyldig valuta" # Feilmelding hvis ikke USD eller Euro
  end
where: # Test av Valuta Endring
  # Test av USD Endring
  nok_to_valuta(10, "USD") is 0.93
  nok_to_valuta(15, "USD") is 1.395
  nok_to_valuta(30, "USD") is 2.79
  nok_to_valuta(100, "USD") is 9.3
  # Test av Euro Endring
  nok_to_valuta(10, "Euro") is 0.84
  nok_to_valuta(15, "Euro") is 1.26
  nok_to_valuta(30, "Euro") is 2.52
  nok_to_valuta(100, "Euro") is 8.4
end
 
nok_to_valuta(10, "Euro") # Input og printer ut returverdi for Euro
nok_to_valuta(1, "USD") # Input og printer ut returverdi for USD

#Nok to valuta finner man ut ved parameterene (nok amount, hvilken valuta")
#Disse 2 skal utgjøre regne

# Oppgave 1, FUN
fun nok_to_euro(nok_amount):
  doc:"Valuta endring fra nok til euro, utifra fra valutakursen, altså NOK multiplisert med kursen for EURO"
  #dagens valutakurs=1nok=0.084 EUR
  exchange_rate = 0.084
  nok_amount * exchange_rate
where:
  nok_to_euro(1) is 0.084
  nok_to_euro(2) is 0.168
  nok_to_euro(3) is 0.252
end

euro = nok_to_euro(3)
euro



fun nok_to_usd(nok_amount):
  #dagens valutakurs=1nok=0.092 USD
  exchange_rate = 0.092
  nok_amount * exchange_rate
where:
  nok_to_usd(1) is 0.092
  nok_to_usd(2) is 0.184
  nok_to_usd(3) is 0.276
end

usd = nok_to_usd(3)
usd

#Testet hver funksjon 3 ganger for å faktesjekket
#nok_to_euro :: nok_amount * exchange_rate
#Input er nok_amount og exhange_rate
#prosesseringen legger tallene sammen
#output er tallene programme legger sammen

# Oppgave 2
#kontrakt circle(number, Strings, String) -> Image
circle-red = circle(30,  "outline", "red")
circle-blue = circle(30, "outline", "blue")
circle-yellow = circle(30, "outline", "yellow")
circle-black = circle(30, "outline", "black")
circle-green = circle(30, "outline", "green")
#vise circle

background = empty-scene(300,150)
#Dette er bakgrunnen for OL-flagget, etter dette må jeg fordele i scener(typ skjermbilder, lappe dem oppå hverandre)

scene1 = overlay(
  put-image(circle-blue, 75, 100, background),
  put-image(circle-black, 75 + 70, 100, background))

scene2 = overlay(
  put-image(circle-red, 75 + 140, 100, scene1),scene1)

scene3 = overlay(
  put-image(circle-yellow, 75 + 35, 65, scene2),scene2)

scene4= overlay(
  put-image(circle-green, 75 + 105, 65,scene3),scene3)

#Velger scene4 nederst for at den skal runne den siste overlayen, hadde jeg tatt scene 3, ville ikke circle green vært med

ol-ringer-farge = overlay(
  put-image(circle-green, 75 + 105, 65,scene3),scene3)

scene5 = overlay(
  put-image(circle-black, 75, 100, background),
  put-image(circle-black, 75 + 70, 100, background))

scene6 = overlay(
  put-image(circle-black, 75 + 140, 100, scene5),scene5)

scene7 = overlay(
  put-image(circle-black, 75 + 35, 65, scene6),scene6)

scene8= overlay(
  put-image(circle-black, 75 + 105, 65,scene7),scene7)

#velger scene 7 på siste overlay for at den skal klippe ut en ny "screenshot"(i mono)helt lik framgangsmåte som i den fargete ol-falgget


ol-mono-farge = overlay(
  put-image(circle-black, 75 + 105, 65,scene7),scene7)



ol-mono-farge  

fun flagg(hvilken-farge):
  if hvilken-farge == "farge":
    ol-ringer-farge
  else if hvilken-farge == "monokrom":
    ol-mono-farge
  else:
    "feilmelding"
  end
end
