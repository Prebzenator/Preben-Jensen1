include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

event-data=
  load-table: ID, Fornavn, Etternavn, Epost, Kjonn, IP, Alder
    source: load-spreadsheet(ssid).sheet-by-name("o1-oppg3", true)
  end

fun alder(tabell):
  doc: "Filtrer tabellen mellom 80år gammel og 30år."
  filter-with(tabell, lam(row): (row["Alder"] <= 80) and (row["Alder"] >= 30) end) #Selvet filtreringen 
end
 
 
alder(event-data) # Input og Print
#


fun navn-alder(status):
  doc: "Funksjonen gir returverdi av den eldste eller den yngste."
  
    if status == "gammel": # Hvis man skriver "gammel" som status så returnerer den eldste
      sortertabell = order event-data: # Sorteringen
        Alder descending
    end
      sortertabell.row-n(1)
    else if status == "ung": # Ved å skrive "Ung" som status så er returverdi den yngste
      sortertabell = order event-data: # Sorteringen
        Alder ascending
    end
    sortertabell.row-n(1)
  end
end
 
 
navn-alder("gammel") # Input

fun gjennomsnittalder(tabell):
  doc: "Returnerer gjennomsnittsalder"
  median(tabell, "Alder") 
where:
  gjennomsnittalder(event-data) is 58 # Test
end
 
gjennomsnittalder(event-data) # Input og print



fun alder-gjennomsnittalder(tabell):
  doc: "Returnerer gjennomsnittsalder"
  mean(tabell, "Alder") 
where:
  alder-gjennomsnittalder(event-data) is 55.9 # Test
end
 
alder-gjennomsnittalder(event-data) # Input og print

alder-tabell = table: name :: String, Age :: Number
  # Definere hva dataen er
  row: "Christel Litherland", 25
  row: "Veda Seiller", 31
  row: "Adham Wynch", 65
  row: "York Andover", 86
  row: "Benn Drawmer", 45
  row: "Delila Tackes", 22
  row: "Myrtia Eary", 68
  row: "Veronika Berget", 80
  row: "Rivi Locke", 51
  row: "Aretha Marconi", 86
end # Liste opp all data

bar-chart(alder-tabell, "name", "Age") # Kjøre input
