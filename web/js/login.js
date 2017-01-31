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
                 window.location.href = "index_nuovo.jsp";
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