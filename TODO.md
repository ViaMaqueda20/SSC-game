## Fase iniziale 
- [x] Convincere Ranno a programmare
- [x] Creare il progetto
- [x] Creare una TODO list


## Plugins
Dialogic 
	in fase si valutazione
	alternativa a ink+godot
Probabilmente un plugin per gestire i controlli da telefono

### Programmi da usare
Tiled 
	da valutare se migliore delle tilemap di godot
Inkscape 
	per le grafiche provvisorie e ui
	
Pixelorama 
	per le pixel art
	alternativa opensource a asprites 
	in valutazione

## Studi preliminari 
- [ ] va visto prima quali sono le possibilità per le ombre da prima così da capire se dobbiamo implementare le cose in un certo modo
- [ ] valutare cosa si deve fare per mettere il gioco su android prima di uno sviluppo avanzato

## Meccaniche di base

- **Movimento del personaggio**
	- [x] Controlli 8 direzioni o solo 4?
	- [ ] Sistema di collisione con tilemap e oggetti.
	- [ ] Animazioni direzionali (idle/walk).
- **Gestione mappa/tilemap**
	- [ ] Layer multipli (terreno, oggetti, sopra il player).
	- [ ] Zone di transizione (porte, warp, cambi scena).
	- [ ] Eventi sul terreno (trigger invisibili al passaggio).
- **NPC e dialoghi**
	- [ ] Sistema di dialoghi multilinea.
	- [ ] Scelte multiple con ramificazioni.
	- [ ] NPC con routine (es. cammina, si ferma, parla).
	- [ ] Condizioni di dialogo basate sullo stato del gioco.

---

##  Sistema narrativo

- **Gestione quest principali e secondarie**
	- [ ] Registro delle quest.
	- [ ] Stato della quest (non iniziata, in corso, completata).
	- [ ] Ricompense (oggetti, accesso a nuove aree, info).
- **Variabili globali di gioco**
	- [ ] Flag di storia (evento X completato).
	- [ ] Valori numerici (es. reputazione, punti amicizia).
	- [ ] Timer o giorni/ore in game (se vuoi tempo dinamico).
- **Scelte e conseguenze**
	- [ ] Dialoghi ramificati.
	- [ ] Finale multiplo o cambi nel mondo in base alle scelte.

---

##  Interazioni e minigiochi

- **Oggetti collezionabili**
	- [ ] Pickup visibili sulla mappa.
	- [ ] Inventario (anche semplice).
	- [ ] Uso di oggetti per sbloccare dialoghi/aree.

---

##  UI e qualità di vita

- **HUD / Menù**
	- [ ] Registro missioni/diari.
	- [ ] Inventario oggetti.
	- [ ] Log dialoghi (opzionale ma utile).
- **Salvataggio e caricamento**
	- [ ] Stato del player (posizione, variabili globali, quest).
	- [ ] Sistema di autosave + save manuale.
- **Accessibilità e opzioni**
	- [ ] Velocità testo regolabile.
	- [ ] Skip dialoghi.
	- [ ] Riassegnazione controlli.

---

##  Extra tecnici 

- [ ] **Pathfinding NPC** (es. A* su tilemap).
- [ ] **Eventi dinamici** (pioggia, giorno/notte, feste in città).
- [ ] **Cutscene system** (muovi personaggi, mostra dialoghi, cambia scena senza input).
- [ ] **Localizzazione** (multi-lingua, caricamento da file esterno).
- **Audio**
	- [ ] Musica contestuale (diversa per mappa/evento).
	- [ ] Effetti sonori nei dialoghi e nelle interazioni.

---

## Arte 
1. Disegnare gli outline della mappa <-- we are here
2. ui funzionale
3. shaders funzionali 
4. sostituire gli outline con pixel art 
5. ui bella 
6. animazioni
7. Particle system 
8. shaders belli
9. fare la musica 

## Extra 
portabilità 
