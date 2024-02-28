package it.itsvil.citywanderbackend.enums;
public enum EnumAttributiMessaggio{
    CONVERSIONE_INTERO("CONVERSIONE_INTERO", "attributo utilizzato per effettuare la conversione di Long");
    private String codice;
    private String descrizione;

    private EnumAttributiMessaggio(String codice, String descrizione) {
        this.codice = codice;
        this.descrizione = descrizione;
    }

    public String getCodice() {
        return this.codice;
    }

    public String getDescrizione() {
        return this.descrizione;
    }
}
