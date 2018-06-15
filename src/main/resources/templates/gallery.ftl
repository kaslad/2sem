<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/assets/font-awesome/4.5.0/css/font-awesome.min.css"/>

<!-- page specific plugin styles -->
<link rel="stylesheet" href="/assets/css/colorbox.min.css"/>

<!-- text fonts -->
<link rel="stylesheet" href="/assets/css/fonts.googleapis.com.css"/>

<!-- ace styles -->
<link rel="stylesheet" href="/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>

<!--[if lte IE 9]>
    <link rel="stylesheet" href="/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
<![endif]-->
<link rel="stylesheet" href="/assets/css/ace-skins.min.css"/>
<link rel="stylesheet" href="/assets/css/ace-rtl.min.css"/>

<!--[if lte IE 9]>
  <link rel="stylesheet" href="/assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="/assets/js/ace-extra.min.js"></script>
<#if model.role??>
    <#if model.role == "CLIENT">
        <#include "client_base.ftl">
    </#if>
    <#if model.role == "COACH">
        <#include "coach_base.ftl">
    </#if>
    <#if model.role == "STRINGER">
        <#include "stringer_base.ftl">
    </#if>
</#if>
<div class="main-content">
 <div class="main-content-inner">
    <div class="breadcrumbs ace-save-state" id="breadcrumbs">
        <ul class="breadcrumb">
            <li class="active">Gallery</li>
        </ul><!-- /.breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                Photos of our players

            </h1>
        </div><!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->
                <div>
                    <ul class="ace-thumbnails clearfix">
                        <li>
                            <a href="/assets/images/gallery/image-1.jpg" title="Photo Title" data-rel="colorbox"
                               class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-1.jpg">
                            </a>

                            <div class="tags">
												<span class="label-holder">
													<span class="label label-info">breakfast</span>
												</span>

                                <span class="label-holder">
													<span class="label label-danger">fruits</span>
												</span>

                                <span class="label-holder">
													<span class="label label-success">toast</span>
												</span>

                                <span class="label-holder">
													<span class="label label-warning arrowed-in">diet</span>
												</span>
                            </div>

                            <div class="tools">
                                <a href="#">
                                    <i class="ace-icon fa fa-link"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-paperclip"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a href="/assets/images/gallery/image-2.jpg" data-rel="colorbox" class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-2.jpg">
                                <div class="text">
                                    <div class="inner">Sample Caption on Hover</div>
                                </div>
                            </a>
                        </li>

                        <li>
                            <a href="/assets/images/gallery/image-3.jpg" data-rel="colorbox" class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-3.jpg">
                                <div class="text">
                                    <div class="inner">Sample Caption on Hover</div>
                                </div>
                            </a>

                            <div class="tools tools-bottom">
                                <a href="#">
                                    <i class="ace-icon fa fa-link"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-paperclip"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a href="/assets/images/gallery/image-4.jpg" data-rel="colorbox" class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-4.jpg">
                                <div class="tags">
													<span class="label-holder">
														<span class="label label-info arrowed">fountain</span>
													</span>

                                    <span class="label-holder">
														<span class="label label-danger">recreation</span>
													</span>
                                </div>
                            </a>

                            <div class="tools tools-top">
                                <a href="#">
                                    <i class="ace-icon fa fa-link"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-paperclip"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </li>

                        <li>
                            <div>
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-5.jpg">
                                <div class="text">
                                    <div class="inner">
                                        <span>Some Title!</span>

                                        <br>
                                        <a href="/assets/images/gallery/image-5.jpg" data-rel="colorbox"
                                           class="cboxElement">
                                            <i class="ace-icon fa fa-search-plus"></i>
                                        </a>

                                        <a href="#">
                                            <i class="ace-icon fa fa-user"></i>
                                        </a>

                                        <a href="#">
                                            <i class="ace-icon fa fa-share"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </li>

                        <li>
                            <a href="/assets/images/gallery/image-6.jpg" data-rel="colorbox" class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-6.jpg">
                            </a>

                            <div class="tools tools-right">
                                <a href="#">
                                    <i class="ace-icon fa fa-link"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-paperclip"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a href="/assets/images/gallery/image-1.jpg" data-rel="colorbox" class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-1.jpg">
                            </a>

                            <div class="tools">
                                <a href="#">
                                    <i class="ace-icon fa fa-link"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-paperclip"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </li>

                        <li>
                            <a href="/assets/images/gallery/image-2.jpg" data-rel="colorbox" class="cboxElement">
                                <img width="150" height="150" alt="150x150" src="/assets/images/gallery/thumb-2.jpg">
                            </a>

                            <div class="tools tools-top in">
                                <a href="#">
                                    <i class="ace-icon fa fa-link"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-paperclip"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-pencil"></i>
                                </a>

                                <a href="#">
                                    <i class="ace-icon fa fa-times red"></i>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div><!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div>
</div>
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script src="/assets/js/bootstrap.min.js"></script>

<!-- page specific plugin scripts -->
<script src="/assets/js/jquery.colorbox.min.js"></script>

<!-- ace scripts -->
<script src="/assets/js/ace-elements.min.js"></script>
<script src="/assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function ($) {
        var $overflow = '';
        var colorbox_params = {
            rel: 'colorbox',
            reposition: true,
            scalePhotos: true,
            scrolling: false,
            previous: '<i class="ace-icon fa fa-arrow-left"></i>',
            next: '<i class="ace-icon fa fa-arrow-right"></i>',
            close: '&times;',
            current: '{current} of {total}',
            maxWidth: '100%',
            maxHeight: '100%',
            onOpen: function () {
                $overflow = document.body.style.overflow;
                document.body.style.overflow = 'hidden';
            },
            onClosed: function () {
                document.body.style.overflow = $overflow;
            },
            onComplete: function () {
                $.colorbox.resize();
            }
        };

        $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
        $("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>");//let's add a custom loading icon


        $(document).one('ajaxloadstart.page', function (e) {
            $('#colorbox, #cboxOverlay').remove();
        });
    })
</script>
<#include "bottom.ftl">