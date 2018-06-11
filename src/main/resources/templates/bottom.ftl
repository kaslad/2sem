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
        document.getElementById('range-value').value = val;
    }


    document.getElementById('button-update').onclick = function () {
        alert(55);
        var playerDegreeSelections = [];
        $('#categorySelector option').each(function (i) {
            if (this.selected == true) {
                playerDegreeSelections.push(this.value);
            }
        });
        var cost1 = $('#costSelector').val();
        alert(cost1);


        $.ajax({
                    dataType: "json",
                    data: {
                        "cost": cost1,
                        "categories": playerDegreeSelections
                    },
                    /*url: "/search", */
                    url: $(this).attr('action'),
                    error: function () {
                        alert(44)
                    },
                    success: function (r) {
                        alert(555)
                    }
                }
        );
    }


</script>

</body>
</html>
