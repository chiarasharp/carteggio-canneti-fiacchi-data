# Dati edizione digitale Carteggio Canneti Fiacchi

Dataset TEI XML del carteggio fra i monaci camaldolesi Pietro Canneti e Mariangelo Fiacchi, una collaborazione con il laboratorio LUDI del Dipartimento di Beni Culturali dell'Università di Bologna insieme alla Biblioteca Classense di Ravenna.

### Struttura del Dataset
Il dataset è organizzato nelle seguenti directory principali:
* **entities**: raccoglie i file relativi alle entità identificate nelle lettere e nei loro metadati, tra cui:
  * le **persone**: file che elencano e descrivono le persone citate, come `cited-people.xml` e risorse di supporto per la generazione di elementi TEI `<person>`;
  * le **opere**: file per la descrizione di manoscritti (`manuscripts.xml`) e opere a stampa (`prints.xml`), con risorse per la creazione di elementi `<bibl>`;
  * i **luoghi**: file `places.xml` che documenta i luoghi menzionati, accompagnato da risorse di supporto per la generazione di elementi TEI `<place>`;
  * le **organizzazioni**: file `orgs.xml` con la lista delle organizzazioni citate, integrato da risorse per la generazione di elementi `<org>`;
* **letters**: attualmente include solamente la sottodirectory **busta-10**, contenente i file XML delle lettere di questa raccolta, ciascuno nominato secondo lo schema `DLCL_CF_EYYXXX.xml`, dove:
  * `DLCL`: corrisponde a *Digilet Classense Letters*, il nome del progetto principale;
  * `CF`: corrisponde al codice del carteggio *Canneti-Fiacchi*;
  * `EYY`: indica il numero della busta in cui è contenuta la lettera (esempio: E10 per la Busta 10);
  * `XXX`: è un numero progressivo a tre cifre per ogni lettera (esempio:`DLCL_CF_E10001.xml` è la prima lettera della Busta 10);
* **schema**: contiene i file che definiscono la struttura del progetto TEI:
  * `carteggio-cannetifiacchi-odd.odd`: file ODD (One Document Does it All) che descrive il progetto e specifica gli elementi TEI utilizzati;
  * `carteggio-cannetifiacchi-rng.rng`: schema Relax NG derivato dal file ODD, utilizzato per la validazione dei file XML.

 
Il progetto è finanziato dall’Unione Europea - NextGenerationEU a valere sul Piano Nazionale di Ripresa e Resilienza (PNRR) – Missione 4 Istruzione e ricerca – Componente 2 Dalla ricerca all’impresa – Investimento Investimento 1.3, Avviso D.D. 341 del 15/03/2022, dal titolo: Cultural Heritage Active Innovation for Sustainable Society, codice proposta PE0000020.

![Testata PNRR](testata-pnrr.png "Testata PNRR")
