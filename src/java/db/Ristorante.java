package db;
import java.io.Serializable;


public class Utente implements Serializable {
    
    
    private String nome;
    private String descrizione;
    private String offLink;
    private String cucine;
    private String coordinate;
    private String orari;
    private String fasciaPrezzo;
    private int val; 
    
    public String getNome() {
        return nome;
    }

    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    public String getDescrizione() {
        return cognome;
    }

    
    public void setDescrizione(String descrizione) {
        this.cognome = cognome;
    }
    
    
    public String getoffLink() {
        return offLink;
    }

    
    public void setoffLink(String offLink) {
        this.offLink = offLink;
    }

     public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    public String getDescrizione() {
        return cognome;
    }
}
