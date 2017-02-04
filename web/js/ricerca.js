$(document).ready(function () {

    console.log("sono nel js");
    var r = $('input[name=paramricercatmp]').val();
    console.log(r);
    $("input[name='paramricerca'][value='" + r + "']").prop("checked", true);
    $("input[name='paramricerca'][id='tmp']").attr("value", r);

    var ra = $('input[name=paramradiob]').val();
    console.log(ra);
    $("input[name='radioidord'][value='" + ra + "']").prop("checked", true);

    var sel = $('input[name=radioidord]:checked').val();
    var cerca = $("input[name=search][id='tmp']").val();
    console.log(cerca);
    $("#SpazioRicerca").load("Ricerca?" + $.param({radiob: sel, tipo: r, cerca: cerca}));
});