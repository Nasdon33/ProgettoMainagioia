function sottometti() {

    var email = $("input[name=email]").val();
    var password = $("input[name=password]").val();
    console.log(email);
    console.log(password);
    if (email === "" && password === "") {
        alert("CAMPI INCOMPLETI");
    }
    if (email === "") {

        alert("EMAIL RICHIESTA");
        return;
    }
    if (password === "") {

        alert("PASSWORD RICHIESTA");
        return;
    }
    $.ajax({
        type: "GET",
        url: "validate",
        data: {email: email, password: password},
        success: function (risposta) {
            if (risposta === "OK") {
                 window.location.href = "index.jsp";
                console.log("login effettuato");
            } else if (risposta === "NOTFOUND") {
                 alert("UTENTE O PASSWORD ERRATI");
                console.log("UTENTE O PASSWORD ERRATI");
            } else {
                window.location.href = "argh_page.jsp";
            }
        }
    });
}
;

function modifica() {

    var email = $("input[name=email]").val();
    var vpassword = $("input[name=vpassword]").val();
    
    console.log(email);
    console.log(vpassword);
    if (email === "" && vpassword === "") {
        alert("CAMPI INCOMPLETI");
        return;
    }
    if (email === "") {

        alert("EMAIL RICHIESTA");
        return;
    }
    if (vpassword === "") {

        alert("PASSWORD RICHIESTA");
        return;
    }
    $.ajax({
        type: "POST",
        url: "validate",
        data: {email: email, password: vpassword},
        success: function (risposta) {
            dt=risposta;
            console.log("avrei finito il validate");
        },
        complete: function(){
            if (dt === "OK") {
                var password = $("input[name=password]").val();
                var nick = $("input[name=nickname]").val();
                $.ajax({
                    type: "POST",
                    url: "User",
                    data: {email: email, password: password, nickname: nick},
                    success: function () {
                        console.log("terminato js");
                        alert("MODIFICHE EFFETTUATE")
                    }
                });
                console.log("modifica account terminata");
            } else if (dt === "NOTFOUND") {
                 alert("EMAIL O PASSWORD ERRATA");
                console.log("EMAIL O PASSWORD ERRATI");
            } else {
                window.location.href = "argh_page.jsp";
            }
            
        }
    });
}
;

function ristorante() {

    var email = $("input[name=email]").val();
    var password = $("input[name=password]").val();
    
    console.log(email);
    console.log(password);
    if (password === "") {

        alert("PASSWORD RICHIESTA");
        return;
    }
    $.ajax({
        type: "POST",
        url: "validate",
        data: {email: email, password: password},
        success: function (risposta) {
            dt=risposta;
            console.log("avrei finito il validate");
        },
        complete: function(){
            if (dt === "OK") {
                var id = $("input[name=id]").val();
                var nome = $("input[name=nome]").val();
                var description = $("textarea[name=description]").val();
                var web_site_url = $("input[name=web_site_url]").val();
                var prezzo = $("input[name=prezzo]:checked").val();
                console.log(prezzo);
                var address = $("input[name=address1]").val();
                var CAP = $("input[name=address2]").val();
                var city = $("input[name=address3]").val();
                var province = $("input[name=address4]").val();
                var state = $("input[name=address5]").val();
                var cucine = [];
                if ($('#altezza').is(":checked"))
                {
                  cucine.push($(this).val());
                }
                $('.cucina:checked').each(function() {
                  cucine.push($(this).val());
                });
                var giorni = [];
                $('.giorno:checked').each(function() {
                  giorni.push($(this).val());
                });
                var orari = [];
                $('#orari :selected').each(function() {
                    orari.push($(this).text());
                });
                
                $.ajax({
                    type: "GET",
                    url: "Ristorante",
                    data: {id: id, nome: nome, description: description, web_site_url: web_site_url, prezzo: prezzo, address: address, CAP: CAP, city: city, province: province, state: state, cucine: cucine, giorni: giorni, orari: orari},
                    success: function () {
                        console.log("terminato js");
                        alert("MODIFICHE EFFETTUATE")
                    }
                });
                console.log("modifica account terminata");
            } else if (dt === "NOTFOUND") {
                 alert("EMAIL O PASSWORD ERRATA");
                console.log("EMAIL O PASSWORD ERRATI");
            } else {
                window.location.href = "argh_page.jsp";
            }
            
        }
    });
}
;