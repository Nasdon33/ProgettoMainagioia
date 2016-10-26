package db;
import java.io.Serializable;


public class Ristorante implements Serializable {
    
    
    private String nome;
    private String cognome;
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
        this.descrizione = descrizione;
    }
    
    
    public String getoffLink() {
        return offLink;
    }

    
    public void setoffLink(String offLink) {
        this.offLink = offLink;
    }

     public void setCucine(String cucine) {
        this.cucine = cucine;
    }
    
    
    public String getCucine() {
        return cucine;
    }
    
    
    public void setCoordinate(String coordinate){
        this.coordinate=coordinate;
    }
    
    public String getCoordinate(){
        return coordinate;
    }
    
    public void setOrari(String orari){
        this.orari=orari;
    }
    
    public String getOrari(){
        return orari;
    }
    
    public void setFasciaPrezzo(String fasciaPrezzo){
        this.fasciaPrezzo=fasciaPrezzo;
    }
    
    public String getFasciaPrezzo(){
        return fasciaPrezzo;
    }
    
    public void setVal(int val){
        this. val=val;
    }
    
    public int getVal(){
        return val;
    }
    
}
