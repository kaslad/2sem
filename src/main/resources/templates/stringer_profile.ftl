<#include "stringer_base.ftl">

<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li class="active">User Profile</li>
            </ul>

            <div class="nav-search" id="nav-search">
                <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">
                <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                    <i class="ace-icon fa fa-cog bigger-130"></i>
                </div>

                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar"
                                   autocomplete="off"/>
                            <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar"
                                   autocomplete="off"/>
                            <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                   id="ace-settings-breadcrumbs" autocomplete="off"/>
                            <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off"/>
                            <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                   id="ace-settings-add-container" autocomplete="off"/>
                            <label class="lbl" for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div><!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"
                                   autocomplete="off"/>
                            <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"
                                   autocomplete="off"/>
                            <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"
                                   autocomplete="off"/>
                            <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                        </div>
                    </div><!-- /.pull-left -->
                </div><!-- /.ace-settings-box -->
            </div><!-- /.ace-settings-container -->

            <div class="page-header">
                <h1>
                    User Profile Page
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        3 styles with inline editable feature
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="clearfix">
                        <div class="pull-left alert alert-success no-margin alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>

                            <i class="ace-icon fa fa-umbrella bigger-120 blue"></i>
                            Click on the image below or on profile fields to edit them ...
                        </div>
                    </div>

                    <div class="hr dotted"></div>


                    <div id="user-profile-3" class="user-profile row">
                        <div class="col-sm-offset-1 col-sm-10">
                            <div class="well well-sm">
                                <!-- -
<button type="button" class="close" data-dismiss="alert">&times;</button>
&nbsp; -->
                                <div class="inline middle blue bigger-110"> Your profile is 70% complete</div>

                                &nbsp; &nbsp; &nbsp;
                                <div style="width:200px;" data-percent="70%"
                                     class="inline middle no-margin progress progress-striped active pos-rel">
                                    <div class="progress-bar progress-bar-success" style="width:70%"></div>
                                </div>
                            </div><!-- /.well -->

                            <div class="space"></div>

                            <form class="form-horizontal" method="POST">
                                <div class="tabbable">
                                    <ul class="nav nav-tabs padding-16">
                                        <li class="active">
                                            <a data-toggle="tab" href="#edit-basic">
                                                <i class="green ace-icon fa fa-pencil-square-o bigger-125"></i>
                                                Basic Info
                                            </a>
                                        </li>


                                        <li>
                                            <a data-toggle="tab" href="#edit-password">
                                                <i class="blue ace-icon fa fa-key bigger-125"></i>
                                                Password
                                            </a>
                                        </li>
                                    </ul>

                                    <div class="tab-content profile-edit-tab-content">
                                        <div id="edit-basic" class="tab-pane in active">
                                            <h4 class="header blue bolder smaller">General</h4>

                                            <div class="row">
                                                <div class="col-xs-12 col-sm-4">
                                                    <input type="file"/>
                                                </div>

                                                <div class="vspace-12-sm"></div>

                                                <div class="col-xs-12 col-sm-8">
                                                    <div class="form-group">
                                                        <label class="col-sm-4 control-label no-padding-right"
                                                               for="form-field-username">Username</label>

                                                        <div class="col-sm-8">
                                                            <input class="col-xs-12 col-sm-10" type="text"
                                                                   id="form-field-username" placeholder="Username"
                                                                   value="<#if model.user.login??>${model.user.login}</#if>"
                                                                   name="login"/>
                                                        </div>
                                                    </div>

                                                    <div class="space-4"></div>

                                                    <div class="form-group">
                                                        <label class="col-sm-4 control-label no-padding-right"
                                                               for="form-field-first">Name</label>

                                                        <div class="col-sm-8">
                                                            <input class="col-xs-12 col-sm-10" type="text"
                                                                   id="form-field-username" placeholder="Name"
                                                                   value="<#if model.user.name??>${model.user.name}</#if>"
                                                                   name="name"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <hr/>

                                            <div class="space"></div>
                                            <h4 class="header blue bolder smaller">Contact</h4>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-email">Email</label>

                                                <div class="col-sm-9">
																	<span class="input-icon input-icon-right">
																		<input type="email" id="form-field-email"
                                                                               value="<#if model.user.phone??>${model.user.email}</#if>"
                                                                               name="email"/>
																		<i class="ace-icon fa fa-envelope"></i>
																	</span>
                                                </div>
                                            </div>

                                            <div class="space-4"></div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-phone">Phone</label>

                                                <div class="col-sm-9">
																	<span class="input-icon input-icon-right">
																		<input class="input-medium input-mask-phone"
                                                                               type="text" id="form-field-phone"
                                                                               value="<#if model.user.phone??>${model.user.phone}</#if>"
                                                                               name="phone"
                                                                        />
																		<i class="ace-icon fa fa-phone fa-flip-horizontal"></i>
																	</span>
                                                </div>
                                            </div>

                                            <div class="space"></div>
                                            <h4 class="header blue bolder smaller">Achievments</h4>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-facebook">Price</label>

                                                <div class="col-sm-9">
																	<span class="input-icon">
																		<input type="text"
                                                                                value="<#if model.stringer.price??>${model.stringer.price}
                                                                         </#if>" name="price"
                                                                               id="form-field-facebook"/>
																		<i class="ace-icon fa fa-money"></i>
																	</span>
                                                </div>
                                            </div>

                                            <div class="space-4"></div>


                                        </div>


                                        <div id="edit-password" class="tab-pane">
                                            <div class="space-10"></div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-pass1">New Password</label>

                                                <div class="col-sm-9">
                                                    <input type="password" id="form-field-pass1" name="password1"/>
                                                </div>
                                            </div>

                                            <div class="space-4"></div>

                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"
                                                       for="form-field-pass2">Confirm Password</label>

                                                <div class="col-sm-9">
                                                    <input type="password" id="form-field-pass2" name="password2"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix form-actions">
                                    <div class="col-md-offset-3 col-md-9">
                                        <input class="btn btn-info" type="submit">
                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                        Save
                                        </input>
                                    </div>
                                </div>
                            </form>
                        </div><!-- /.span -->
                    </div><!-- /.user-profile -->


                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->


<!-- basic scripts -->

<!--[if !IE]> -->
<script src="/assets/js/jquery-2.1.4.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="/assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
<script src="/assets/js/excanvas.min.js"></script>
<![endif]-->
<script src="/assets/js/jquery-ui.custom.min.js"></script>
<script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="/assets/js/jquery.gritter.min.js"></script>
<script src="/assets/js/bootbox.js"></script>
<script src="/assets/js/jquery.easypiechart.min.js"></script>
<script src="/assets/js/bootstrap-datepicker.min.js"></script>
<script src="/assets/js/jquery.hotkeys.index.min.js"></script>
<script src="/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="/assets/js/select2.min.js"></script>
<script src="/assets/js/spinbox.min.js"></script>
<script src="/assets/js/bootstrap-editable.min.js"></script>
<script src="/assets/js/ace-editable.min.js"></script>
<script src="/assets/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->
<script src="/assets/js/ace-elements.min.js"></script>
<script src="/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->

<!-- <![endif]-->

<!--[if IE]>
<script src="/assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->

<!--[if lte IE 8]>
  <script src="/assets/js/excanvas.min.js"></script>
<![endif]-->
<script src="/assets/js/jquery-ui.custom.min.js"></script>
<script src="/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="/assets/js/jquery.gritter.min.js"></script>
<script src="/assets/js/bootbox.js"></script>
<script src="/assets/js/jquery.easypiechart.min.js"></script>
<script src="/assets/js/bootstrap-datepicker.min.js"></script>
<script src="/assets/js/jquery.hotkeys.index.min.js"></script>
<script src="/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="/assets/js/select2.min.js"></script>
<script src="/assets/js/spinbox.min.js"></script>
<script src="/assets/js/bootstrap-editable.min.js"></script>
<script src="/assets/js/ace-editable.min.js"></script>
<script src="/assets/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->
<script src="/assets/js/ace-elements.min.js"></script>
<script src="/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {

        //editables on first profile page
        $.fn.editable.defaults.mode = 'inline';
        $.fn.editableform.loading = "<div class='editableform-loading'><i class='ace-icon fa fa-spinner fa-spin fa-2x light-blue'></i></div>";
        $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit"><i class="ace-icon fa fa-check"></i></button>' +
                '<button type="button" class="btn editable-cancel"><i class="ace-icon fa fa-times"></i></button>';

        //editables

        //text editable
        $('#username')
                .editable({
                    type: 'text',
                    name: 'username'
                });


        //select2 editable
        var countries = [];
        $.each({
            "CA": "Canada",
            "IN": "India",
            "NL": "Netherlands",
            "TR": "Turkey",
            "US": "United States"
        }, function (k, v) {
            countries.push({id: k, text: v});
        });

        var cities = [];
        cities["CA"] = [];
        $.each(["Toronto", "Ottawa", "Calgary", "Vancouver"], function (k, v) {
            cities["CA"].push({id: v, text: v});
        });
        cities["IN"] = [];
        $.each(["Delhi", "Mumbai", "Bangalore"], function (k, v) {
            cities["IN"].push({id: v, text: v});
        });
        cities["NL"] = [];
        $.each(["Amsterdam", "Rotterdam", "The Hague"], function (k, v) {
            cities["NL"].push({id: v, text: v});
        });
        cities["TR"] = [];
        $.each(["Ankara", "Istanbul", "Izmir"], function (k, v) {
            cities["TR"].push({id: v, text: v});
        });
        cities["US"] = [];
        $.each(["New York", "Miami", "Los Angeles", "Chicago", "Wysconsin"], function (k, v) {
            cities["US"].push({id: v, text: v});
        });

        var currentValue = "NL";
        $('#country').editable({
            type: 'select2',
            value: 'NL',
            //onblur:'ignore',
            source: countries,
            select2: {
                'width': 140
            },
            success: function (response, newValue) {
                if (currentValue == newValue) return;
                currentValue = newValue;

                var new_source = (!newValue || newValue == "") ? [] : cities[newValue];

                //the destroy method is causing errors in x-editable v1.4.6+
                //it worked fine in v1.4.5
                /**
                 $('#city').editable('destroy').editable({
							type: 'select2',
							source: new_source
						}).editable('setValue', null);
                 */

                        //so we remove it altogether and create a new element
                var city = $('#city').removeAttr('id').get(0);
                $(city).clone().attr('id', 'city').text('Select City').editable({
                    type: 'select2',
                    value: null,
                    //onblur:'ignore',
                    source: new_source,
                    select2: {
                        'width': 140
                    }
                }).insertAfter(city);//insert it after previous instance
                $(city).remove();//remove previous instance

            }
        });

        $('#city').editable({
            type: 'select2',
            value: 'Amsterdam',
            //onblur:'ignore',
            source: cities[currentValue],
            select2: {
                'width': 140
            }
        });


        //custom date editable
        $('#signup').editable({
            type: 'adate',
            date: {
                //datepicker plugin options
                format: 'yyyy/mm/dd',
                viewformat: 'yyyy/mm/dd',
                weekStart: 1

                //,nativeUI: true//if true and browser support input[type=date], native browser control will be used
                //,format: 'yyyy-mm-dd',
                //viewformat: 'yyyy-mm-dd'
            }
        })

        $('#age').editable({
            type: 'spinner',
            name: 'age',
            spinner: {
                min: 16,
                max: 99,
                step: 1,
                on_sides: true
                //,nativeUI: true//if true and browser support input[type=number], native browser control will be used
            }
        });


        $('#login').editable({
            type: 'slider',
            name: 'login',

            slider: {
                min: 1,
                max: 50,
                width: 100
                //,nativeUI: true//if true and browser support input[type=range], native browser control will be used
            },
            success: function (response, newValue) {
                if (parseInt(newValue) == 1)
                    $(this).html(newValue + " hour ago");
                else $(this).html(newValue + " hours ago");
            }
        });

        $('#about').editable({
            mode: 'inline',
            type: 'wysiwyg',
            name: 'about',

            wysiwyg: {
                //css : {'max-width':'300px'}
            },
            success: function (response, newValue) {
            }
        });


        // *** editable avatar *** //
        try {//ie8 throws some harmless exceptions, so let's catch'em

            //first let's add a fake appendChild method for Image element for browsers that have a problem with this
            //because editable plugin calls appendChild, and it causes errors on IE at unpredicted points
            try {
                document.createElement('IMG').appendChild(document.createElement('B'));
            } catch (e) {
                Image.prototype.appendChild = function (el) {
                }
            }

            var last_gritter
            $('#avatar').editable({
                type: 'image',
                name: 'avatar',
                value: null,
                //onblur: 'ignore',  //don't reset or hide editable onblur?!
                image: {
                    //specify ace file input plugin's options here
                    btn_choose: 'Change Avatar',
                    droppable: true,
                    maxSize: 110000,//~100Kb

                    //and a few extra ones here
                    name: 'avatar',//put the field name here as well, will be used inside the custom plugin
                    on_error: function (error_type) {//on_error function will be called when the selected file has a problem
                        if (last_gritter) $.gritter.remove(last_gritter);
                        if (error_type == 1) {//file format error
                            last_gritter = $.gritter.add({
                                title: 'File is not an image!',
                                text: 'Please choose a jpg|gif|png image!',
                                class_name: 'gritter-error gritter-center'
                            });
                        } else if (error_type == 2) {//file size rror
                            last_gritter = $.gritter.add({
                                title: 'File too big!',
                                text: 'Image size should not exceed 100Kb!',
                                class_name: 'gritter-error gritter-center'
                            });
                        }
                        else {//other error
                        }
                    },
                    on_success: function () {
                        $.gritter.removeAll();
                    }
                },
                url: function (params) {
                    // ***UPDATE AVATAR HERE*** //
                    //for a working upload example you can replace the contents of this function with
                    //examples/profile-avatar-update.js

                    var deferred = new $.Deferred

                    var value = $('#avatar').next().find('input[type=hidden]:eq(0)').val();
                    if (!value || value.length == 0) {
                        deferred.resolve();
                        return deferred.promise();
                    }


                    //dummy upload
                    setTimeout(function () {
                        if ("FileReader" in window) {
                            //for browsers that have a thumbnail of selected image
                            var thumb = $('#avatar').next().find('img').data('thumb');
                            if (thumb) $('#avatar').get(0).src = thumb;
                        }

                        deferred.resolve({'status': 'OK'});

                        if (last_gritter) $.gritter.remove(last_gritter);
                        last_gritter = $.gritter.add({
                            title: 'Avatar Updated!',
                            text: 'Uploading to server can be easily implemented. A working example is included with the template.',
                            class_name: 'gritter-info gritter-center'
                        });

                    }, parseInt(Math.random() * 800 + 800))

                    return deferred.promise();

                    // ***END OF UPDATE AVATAR HERE*** //
                },

                success: function (response, newValue) {
                }
            })
        } catch (e) {
        }

        /**
         //let's display edit mode by default?
         var blank_image = true;//somehow you determine if image is initially blank or not, or you just want to display file input at first
         if(blank_image) {
					$('#avatar').editable('show').on('hidden', function(e, reason) {
						if(reason == 'onblur') {
							$('#avatar').editable('show');
							return;
						}
						$('#avatar').off('hidden');
					})
				}
         */

        //another option is using modals
        $('#avatar2').on('click', function () {
            var modal =
                    '<div class="modal fade">\
                      <div class="modal-dialog">\
                       <div class="modal-content">\
                        <div class="modal-header">\
                            <button type="button" class="close" data-dismiss="modal">&times;</button>\
                            <h4 class="blue">Change Avatar</h4>\
                        </div>\
                        \
                        <form class="no-margin">\
                         <div class="modal-body">\
                            <div class="space-4"></div>\
                            <div style="width:75%;margin-left:12%;"><input type="file" name="file-input" /></div>\
                         </div>\
                        \
                         <div class="modal-footer center">\
                            <button type="submit" class="btn btn-sm btn-success"><i class="ace-icon fa fa-check"></i> Submit</button>\
                            <button type="button" class="btn btn-sm" data-dismiss="modal"><i class="ace-icon fa fa-times"></i> Cancel</button>\
                         </div>\
                        </form>\
                      </div>\
                     </div>\
                    </div>';


            var modal = $(modal);
            modal.modal("show").on("hidden", function () {
                modal.remove();
            });

            var working = false;

            var form = modal.find('form:eq(0)');
            var file = form.find('input[type=file]').eq(0);
            file.ace_file_input({
                style: 'well',
                btn_choose: 'Click to choose new avatar',
                btn_change: null,
                no_icon: 'ace-icon fa fa-picture-o',
                thumbnail: 'small',
                before_remove: function () {
                    //don't remove/reset files while being uploaded
                    return !working;
                },
                allowExt: ['jpg', 'jpeg', 'png', 'gif'],
                allowMime: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
            });

            form.on('submit', function () {
                if (!file.data('ace_input_files')) return false;

                file.ace_file_input('disable');
                form.find('button').attr('disabled', 'disabled');
                form.find('.modal-body').append("<div class='center'><i class='ace-icon fa fa-spinner fa-spin bigger-150 orange'></i></div>");

                var deferred = new $.Deferred;
                working = true;
                deferred.done(function () {
                    form.find('button').removeAttr('disabled');
                    form.find('input[type=file]').ace_file_input('enable');
                    form.find('.modal-body > :last-child').remove();

                    modal.modal("hide");

                    var thumb = file.next().find('img').data('thumb');
                    if (thumb) $('#avatar2').get(0).src = thumb;

                    working = false;
                });


                setTimeout(function () {
                    deferred.resolve();
                }, parseInt(Math.random() * 800 + 800));

                return false;
            });

        });


        //////////////////////////////
        $('#profile-feed-1').ace_scroll({
            height: '250px',
            mouseWheelLock: true,
            alwaysVisible: true
        });

        $('a[ data-original-title]').tooltip();

        $('.easy-pie-chart.percentage').each(function () {
            var barColor = $(this).data('color') || '#555';
            var trackColor = '#E2E2E2';
            var size = parseInt($(this).data('size')) || 72;
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size / 10),
                animate: false,
                size: size
            }).css('color', barColor);
        });

        ///////////////////////////////////////////

        //right & left position
        //show the user info on right or left depending on its position
        $('#user-profile-2 .memberdiv').on('mouseenter touchstart', function () {
            var $this = $(this);
            var $parent = $this.closest('.tab-pane');

            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $this.offset();
            var w2 = $this.width();

            var place = 'left';
            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) place = 'right';

            $this.find('.popover').removeClass('right left').addClass(place);
        }).on('click', function (e) {
            e.preventDefault();
        });


        ///////////////////////////////////////////
        $('#user-profile-3')
                .find('input[type=file]').ace_file_input({
            style: 'well',
            btn_choose: 'Change avatar',
            btn_change: null,
            no_icon: 'ace-icon fa fa-picture-o',
            thumbnail: 'large',
            droppable: true,

            allowExt: ['jpg', 'jpeg', 'png', 'gif'],
            allowMime: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
        })
                .end().find('button[type=reset]').on(ace.click_event, function () {
            $('#user-profile-3 input[type=file]').ace_file_input('reset_input');
        })
                .end().find('.date-picker').datepicker().next().on(ace.click_event, function () {
            $(this).prev().focus();
        })
        $('.input-mask-phone').mask('(999) 999-9999');

        $('#user-profile-3').find('input[type=file]').ace_file_input('show_file_list', [{
            type: 'image',
            name: $('#avatar').attr('src')
        }]);


        ////////////////////
        //change profile
        $('[data-toggle="buttons"] .btn').on('click', function (e) {
            var target = $(this).find('input[type=radio]');
            var which = parseInt(target.val());
            $('.user-profile').parent().addClass('hide');
            $('#user-profile-' + which).parent().removeClass('hide');
        });


        /////////////////////////////////////
        $(document).one('ajaxloadstart.page', function (e) {
            //in ajax mode, remove remaining elements before leaving page
            try {
                $('.editable').editable('destroy');
            } catch (e) {
            }
            $('[class*=select2]').remove();
        });
    });
</script>
<#include "bottom.ftl">

