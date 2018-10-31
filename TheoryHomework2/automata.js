$(document).ready(function () {
    $(".graphPanel").each(function () {
        if ($(this).attr("value")) {
            var graph = $(this).attr("graph");
            $(".btn-info." + graph).attr("disabled", false);
        }
    });

    $(".btn-info").click(function () {
        var graph = $(this).attr("graph");
        $(this).html("Processing...").addClass("processing");
        var panel = $(".graphPanel." + graph);
        switch (graph)
        {
            case "pda":
                processPDA("pda");
                break;
            case "pda2":
                processPDA("pda2");
                break;
            case "cfg":
                processCFG(panel);
                break;
            default:
                break;
        }
        return false;
    });

    $(".reset").click(function () {
        window.location.href = window.location.href;
        return false;
    });

    function processCFG() {
        var panel = $(".cfg.graphPanel");
        var list = $(".cfg.graphPanel").attr("value").split(":");

        for (var i = 1; i <= list.length - 1; i++) {
            $('circle').css({ fill: "#ffffff" });
            var state = list[i];
            (function (index) {
                setTimeout(function () {
                    panel.append("<div><span class='glyphicon glyphicon-arrow-down'></span></div>");
                    panel.append("<div>" + list[index] + "</div>");
                    if (index == list.length - 1) {
                        $(".processing").removeClass("processing").html("Finished");
                    }
                }, i * 1500);
            })(i);
        }
    }

    function processPDA(graph) {
        var panel = $("."+ graph +".graphPanel");
        var list = $("." + graph +".graphPanel").attr("value").split(":");


        for (var i = 1; i <= list.length - 1; i++) {
            $('circle').css({ fill: "#ffffff" });
            var state = list[i];
            (function (index) {
                setTimeout(function ()
                {
                    var isAccept = panel.attr("isaccepted") == "True";
                    var isEmptyStack = panel.attr("stackisempty") == "True";
                    panel.find(".path").append("<span class='glyphicon glyphicon-arrow-right'></span>" + list[index]);
                    panel.find('.' + list[index]).css({ fill: "#87CEFA" });
                    panel.find('circle:not(.' + list[index] + ')').css({ fill: "#ffffff" });
                    if (index == list.length -1) {
                        var color = (isAccept && isEmptyStack) ? "#53c653" : "#ff3333";
                        panel.find('.Q1').css({ fill: color });
                        panel.find('.accept').css({ fill: color });
                        $(".processing").removeClass("processing").html("Finished");
                    }
                }, i * 2000);
            })(i);
        }
    }
});