﻿$(document).ready(function () {
    $(".graphPanel").each(function () {
        if ($(this).attr("value")) {
            var graph = $(this).attr("graph");
            $(".btn-success." + graph).attr("disabled", false);
        }
    });

    $(".btn-success").click(function () {
        var graph = $(this).attr("graph");
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
        var graph = $(this).attr("graph");
        var panel = $(".graphPanel." + graph);
        switch (graph) {
            case "pda":
                break;
            case "pda2":
                break;
            case "cfg":
                clearCFG();
                break;
            default:
                break;
        }
        return false;
    });
    function processCFG() {
        var panel = $(".cfg.graphPanel");
        var list = $(".cfg.graphPanel").attr("value").split(":");

        $.each(list, function () {
            panel.append("<div><span class='glyphicon glyphicon-arrow-down'></span></div>");
            panel.append("<div>" + this + "</div>");
        });
    }

    function clearCFG(panel) {
        var list = $(".cfg.graphPanel").attr("value", "");
        $("#cfgText").val("");
        $(".cfg.btn-success").attr("disabled", "disabled");
        $(".cfg.graphPanel").html("");
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
                    panel.find(".path").append("<span class='glyphicon glyphicon-arrow-right'></span>" + list[index]);
                    panel.find('.' + list[index]).css({ fill: "#87CEFA" });
                    panel.find('circle:not(.' + list[index] + ')').css({ fill: "#ffffff" });
                }, i * 2000);
            })(i);
        }
    }
});