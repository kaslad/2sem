<script src="/assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="/assets/js/tree.min.js"></script>
<script src="/assets/js/select2.min.js"></script>
<script src="/assets/js/jquery-ui.custom.min.js"></script>
<script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="/assets/js/holder.min.js"></script>

<!-- ace scripts -->
<script src="/assets/js/ace-elements.min.js"></script>
<script src="/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {

        //data for tree element
        var category = {
            "player-degree": {text: 'Player Degree', type: 'folder'},
            "coach-degree": {text: 'Coach Degree', type: 'folder'}
        }
        category['player-degree']['additionalParameters'] = {
            'children': {
                'KMS': {text: 'KMS', type: 'item'},
                'MS': {text: 'MSMK', type: 'item'},
                'FIRST': {text: '1st degree', type: 'item'},
                'SECOND': {text: '2nd degree', type: 'item'},
                'THIRD': {text: '3rd degree', type: 'item'}
            }
        }
        category['coach-degree']['additionalParameters'] = {
            'children': {
                'MASTER': {text: 'Master', type: 'item'},
                'FIRST': {text: '1st degree', type: 'item'},
                'SECOND': {text: '2nd degree', type: 'item'},
                'THIRD': {text: '3rd degree', type: 'item'}
            }
        }

        var dataSource1 = function (options, callback) {
            var $data = null
            if (!("text" in options) && !("type" in options)) {
                $data = category;//the root tree
                callback({data: $data});
                return;
            }
            else if ("type" in options && options.type == "folder") {
                if ("additionalParameters" in options && "children" in options.additionalParameters)
                    $data = options.additionalParameters.children || {};
                else $data = {}//no data
            }

            callback({data: $data})
        }

        /*	$('#cat-tree').ace_tree({
                dataSource: dataSource1,
                multiSelect: true,
                cacheItems: true,
                'open-icon' : 'ace-icon tree-minus',
                'close-icon' : 'ace-icon tree-plus',
                'itemSelect' : true,
                'folderSelect': false,
                'selected-icon' : 'ace-icon fa fa-check',
                'unselected-icon' : 'ace-icon fa fa-times',
                loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
            });


            $('.tree-container').ace_scroll({size: 250, mouseWheelLock: true});
            $('#cat-tree').on('closed.fu.tree disclosedFolder.fu.tree', function() {
                $('.tree-container').ace_scroll('reset').ace_scroll('start');
            });
            */


        //select2 location element
        $('.select2').css('min-width', '150px').select2({allowClear: true});


        //jQuery ui distance slider
        $("#slider-range").css('width', '150px').slider({
            range: true,
            min: 0,
            max: 5000,
            values: [200, 1000],
            slide: function (event, ui) {
                var val = ui.values[$(ui.handle).index() - 1] + "";

                if (!ui.handle.firstChild) {
                    $("<div class='tooltip bottom in' style='display:none;left:-6px;top:14px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
                            .prependTo(ui.handle);
                }
                $(ui.handle.firstChild).show().children().eq(1).text(val);
            }
        }).find('span.ui-slider-handle').on('blur', function () {
            $(this.firstChild).hide();
        });


        //this is for demo only
        $('.thumbnail').on('mouseenter', function () {
            $(this).find('.info-label').addClass('label-primary');
        }).on('mouseleave', function () {
            $(this).find('.info-label').removeClass('label-primary');
        });


        //toggle display format buttons
        $('#toggle-result-format .btn').tooltip({container: 'body'}).on('click', function (e) {
            $(this).siblings().each(function () {
                $(this).removeClass($(this).attr('data-class')).addClass('btn-grey');
            });
            $(this).removeClass('btn-grey').addClass($(this).attr('data-class'));
        });

        ////////////////////
        //show different search page
        $('#toggle-result-page .btn').on('click', function (e) {
            var target = $(this).find('input[type=radio]');
            var which = parseInt(target.val());
            $('.search-page').parent().addClass('hide');
            $('#search-page-' + which).parent().removeClass('hide');
        });
        /* $('#range-value').on('change', function () {
             $('#categorySelector').val($(this).val())
         });
         $('#categorySelector').on('change', function () {
             $('#range-value').val($(this).val())
         });
         */
    });

    function updateTextInput(val) {
        document.getElementById('range-value1').value = val;
    }

    function updateTextInput1(val) {
        document.getElementById('range-value2').value = val;
    }


    document.getElementById('button-update').onclick = function () {
        var playerDegreeSelections = [];
        $('#categorySelector option').each(function (i) {
            if (this.selected == true) {
                playerDegreeSelections.push(this.value);
            }
        });
        var cost1 = $('#costSelector1').val();
        var cost2 = $('#costSelector2').val();


        $.ajax({
                    dataType: "json",
                    method: "GET",
                    data: {
                        "cost1": cost1,
                        "cost2": cost2
                    },
                    /*url: "/search", */
                    url: "/search/ajax",

                    success: function (data) {
                        document.getElementById('search-results').innerHTML = "";
                        for (i = 0; i < data.result.length; i++) {

                            coachName = data.result[i].snd.name;
                            coachDegree = data.result[i].fst.coachDegree;
                            playerDegree = data.result[i].fst.playerDegree;
                            document.getElementById('search-results').innerHTML += " <div class=\"media search-media\">\n" +
                                    "                                                        <div class=\"media-left\">\n" +
                                    "                                                            <a href=\"#\">\n" +
                                    "                                                                <img class=\"media-object\" data-src=\"holder.js/72x72\"/>\n" +
                                    "                                                            </a>\n" +
                                    "                                                        </div>\n" +
                                    "\n" +
                                    "                                                        <div class=\"media-body\">\n" +
                                    "                                                            <div>\n" +
                                    "                                                                <h4 class=\"media-heading\">\n" +
                                    "                                                                    <a href=\"#\" class=\"blue\">" + coachName + "</a>\n" +
                                    "                                                                </h4>\n" +
                                    "                                                            </div>\n" +
                                    "                                                            <p>coachDegree: " + coachDegree + "\n" +
                                    "                                                                playerDegree: " + playerDegree + "\n" +
                                    "                                                                </p>\n" +
                                    "\n" +
                                    "                                                            <div class=\"search-actions text-center\">\n" +
                                    "                                                                <span class=\"text-info\">$</span>\n" +
                                    "\n" +
                                    "                                                                <span class=\"blue bolder bigger-150\">300</span>\n" +
                                    "\n" +
                                    "                                                                hourly\n" +
                                    "                                                                <div class=\"action-buttons bigger-125\">\n" +
                                    "                                                                    <a href=\"#\">\n" +
                                    "                                                                        <i class=\"ace-icon fa fa-phone green\"></i>\n" +
                                    "                                                                    </a>\n" +
                                    "\n" +
                                    "                                                                    <a href=\"#\">\n" +
                                    "                                                                        <i class=\"ace-icon fa fa-heart red\"></i>\n" +
                                    "                                                                    </a>\n" +
                                    "\n" +
                                    "                                                                    <a href=\"#\">\n" +
                                    "                                                                        <i class=\"ace-icon fa fa-star orange2\"></i>\n" +
                                    "                                                                    </a>\n" +
                                    "                                                                </div>\n" +
                                    "                                                                <a class=\"search-btn-action btn btn-sm btn-block btn-info\">Book\n" +
                                    "                                                                    it!</a>\n" +
                                    "                                                            </div>\n" +
                                    "                                                        </div>\n" +
                                    "                                                    </div>\n"
                        }
                        console.log(data);
                    }
                }
        );
    }


</script>
<script>
    (function () {
        var widget_id = 896924;
        _shcp = [{widget_id: widget_id}];
        var lang = (navigator.language || navigator.systemLanguage
                || navigator.userLanguage || "en")
                .substr(0, 2).toLowerCase();
        var url = "widget.siteheart.com/widget/sh/" + widget_id + "/" + lang + "/widget.js";
        var hcc = document.createElement("script");
        hcc.type = "text/javascript";
        hcc.async = true;
        hcc.src = ("https:" == document.location.protocol ? "https" : "http")
                + "://" + url;
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hcc, s.nextSibling);
    })();
</script>

</body>
</html>
