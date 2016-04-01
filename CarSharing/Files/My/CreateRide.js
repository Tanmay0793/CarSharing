
$(document).ready(function () {
    $("#return").hide();
    $("#divreturn").hide();
    $("#rbtntype").click(function () {
        var status = $("[id*=rbtntype] input:checked");
        var value = status.val();
        if (value == "Return") {
            $("#return").show();
            $("#divreturn").show();
        }
        else if (value == "Single") {
            $("#return").hide();
            $("#divreturn").hide();
        }
    });


    $("#myacc").click(function () {
        $("#showacc").toggle();
    });

    $("#txtto").focusout(function () {
        getMap();

    });
});




//**********************************************//


