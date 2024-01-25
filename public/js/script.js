function narudzbina() {
    alert("Narucili ste majcu velicine: " + $('input:radio[name=velicina]:checked').val())
}
function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;
    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
}
;
$(document).ready(function () {
    var page = getUrlParameter('page');
    if (page === 'panel') {
        var morris_bar, morris_bar2, morris_donut;
        $('.tab-content').children().hide();
        var panel_part = getUrlParameter('panel_part');
        switch (panel_part) {
            case 'menu1':
                $('#menu1').show();
                break;
            case 'menu2':
                $('#menu2').show();
                break;
            case 'menu3':
                $('#menu3').show();
                break;
            case 'menu4':
                $('#menu4').show();
                break;
            case 'menu5':
                $('#menu5').show();
                break;
            case 'menu6':
                $('#menu6').show();
                setTimeout(function () {
                    $("#graph1").click();
                    $("#graph3").click();
                    $.get("api_2.php?", function (data) {
                        if (!morris_donut) {
                            morris_donut = new Morris.Donut({
                                element: 'graph22',
                                data: JSON.parse(data),
                                colors: ['rgb(255, 0, 0)', 'rgb(167, 0, 4)', 'rgb(255, 100, 100)'],
                                resize: true,
                                donutType: 'pie',
                                dataLabels: true,
                                dataLabelsColor: 'black'
                            });
                            morris_donut.options.colors.forEach(function (color, a) {
                                data1 = JSON.parse(data);
                                if (data1[a] !== undefined) {
                                    var node = document.createElement('span');
                                    node.innerHTML += '<span style="color:' + color + '"><i style="margin-left: 15px;" class="fas fa-square"></i> ' + data1[a]['label'] + '</span>';
                                    document.getElementById("graph22_data").appendChild(node);
                                }
                            });
                        } else {
                            morris_donut.setData(JSON.parse(data));
                        }
                    });

                }, 200);
                //         $('#menu6').siblings().removeClass('.active')
                break;
            default:

                $('#home').show();
                break;
        }
        $("input[name='item_category']").change(function () {
            var category = $(this).val();
            switch (category) {
                case 'muski':
                    $.get("api.php?category=muski", function (data) {
                        $("#type").html(data);
                    });
                    break;
                case 'zenski':
                    $.get("api.php?category=zenski", function (data) {
                        $("#type").html(data);
                    });
                    break;
                case 'deca':
                    $.get("api.php?category=deca", function (data) {
                        $("#type").html(data);
                    });
                    break;
            }
        });

        $("#graph1").click(function (e) {
            e.preventDefault();
            var from_date = $("input[name='from_date']").val();
            var to_date = $("input[name='to_date']").val();
            $.get("api_1.php?from_date=" + from_date + "&to_date=" + to_date, function (data) {
                if (!morris_bar) {
                    morris_bar = new Morris.Bar({
                        element: 'graph11',
                        data: JSON.parse(data),
                        xkey: 'day',
                        ykeys: ['sales'],
                        labels: ['prodato', 'dan'],
                        barColors: ['rgb(167, 0, 4)']
                    });
                } else {
                    morris_bar.setData(JSON.parse(data));
                }
            });
        });
        $("#graph3").click(function (e) {
            e.preventDefault();
            var from_date = $("input[name='from_date1']").val();
            var to_date = $("input[name='to_date1']").val();
            //console.log("api_3.php?from_date=" + from_date + "&to_date=" + to_date);
            $.get("api_3.php?from_date=" + from_date + "&to_date=" + to_date, function (data) {
                if (!morris_bar2) {
                    morris_bar2 = new Morris.Bar({
                        element: 'graph33',
                        data: JSON.parse(data),
                        xkey: 'day',
                        ykeys: ['sales_deca', 'sales_zene', 'sales_muskarci'],
                        labels: ['deca', 'zene', 'muskarci'],
                        barColors: ['rgb(255, 0, 0)', 'rgb(167, 0, 4)', 'rgb(255, 100, 100)']
                    });
                } else {
                    morris_bar2.setData(JSON.parse(data));
                }
            });
        }
        );
    }
    if (page === 'item') {
        var modal = document.getElementById('myModal');
        var img = document.getElementById('myImg');
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            captionText.innerHTML = this.alt;
        }
        var span = document.getElementsByClassName("close")[0];
        span.onclick = function () {
            modal.style.display = "none";
        }
    }


    


})


