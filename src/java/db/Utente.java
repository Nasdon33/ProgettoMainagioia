/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.io.Serializable;



/**
 *
 * @author Carlo
 */
public class Utente implements Serializable {
    
    private String id;
    private String nome;
    private String cognome;
    private String ruolo;
    private String email;

    
    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getRuolo() {
        return ruolo;
    }

    
    public void setRuolo(String ruolo) {
        this.ruolo = ruolo;
    }
    
    
    public String getNome() {
        return nome;
    }

    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    public String getCognome() {
        return cognome;
    }

    
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }
    
    
    public String getEmail() {
        return email;
    }

    
    public void setEmail(String email) {
        this.email = email;
    }
}
