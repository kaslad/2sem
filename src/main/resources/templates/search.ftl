<#include "client_base.ftl">

    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>

                    <li>
                        <a href="#">More Pages</a>
                    </li>
                    <li class="active">Search Results</li>
                </ul><!-- /.breadcrumb -->

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
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-navbar" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-sidebar" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2 ace-save-state"
                                       id="ace-settings-breadcrumbs" autocomplete="off"/>
                                <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                            </div>

                            <div class="ace-settings-item">
                                <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"
                                       autocomplete="off"/>
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
                    <h1>Search Results </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="clearfix">
                            <div class="pull-right">
                                <span class="green middle bolder">Choose result page type: &nbsp;</span>

                                <div class="btn-toolbar inline middle no-margin">
                                    <div id="toggle-result-page" data-toggle="buttons" class="btn-group no-margin">
                                        <label class="btn btn-sm btn-yellow active">
                                            <span class="bigger-110">1</span>

                                            <input type="radio" value="1"/>
                                        </label>

                                        <label class="btn btn-sm btn-yellow">
                                            <span class="bigger-110">2</span>

                                            <input type="radio" value="2"/>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="hr dotted"></div>

                        <div>
                            <div class="row search-page" id="search-page-1">
                                <div class="col-xs-12">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-3">
                                            <div class="search-area well well-sm">
                                                <div class="search-filter-header bg-primary">
                                                    <h5 class="smaller no-margin-bottom">
                                                        <i class="ace-icon fa fa-sliders light-green bigger-130"></i>&nbsp;
                                                        Refine your Search
                                                    </h5>
                                                </div>

                                                <div class="space-10"></div>

                                                <form method="get">
                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-11 col-md-10">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control" name="keywords"
                                                                       placeholder="Look within results"/>
                                                            </div>
                                                        </div>
                                                    </div>


                                                <div class="hr hr-dotted"></div>
                                                    <h4 class="blue smaller">
                                                        <i class="fa fa-tags"></i>
                                                        Coach Degree
                                                    </h4>

                                                    <div class="tree-container">
                                                        <select id="categorySelector1" class="form-control"
                                                                name="coachDegree" >
                                                            <option value="FIRST">1st</option>
                                                            <option value="SECOND">2nd</option>
                                                            <option value="THIRD">3rd</option>
                                                            <option value="MASTER">Master</option>
                                                        </select>
                                                    </div>
                                                    <div class="hr hr-dotted"></div>
                                                    <h4 class="blue smaller">
                                                        <i class="fa fa-tags"></i>
                                                        Player Degree
                                                    </h4>
                                                    <div class="tree-container">
                                                        <select id="categorySelector2" class="form-control"
                                                                name="playerDegree">
                                                            <option value="FIRST">1st</option>
                                                            <option value="SECOND">2nd</option>
                                                            <option value="THIRD">3rd</option>
                                                            <option value="KMS">KMS</option>
                                                            <option value="MS">MS</option>
                                                        </select>
                                                    </div>
                                                    <div class="hr hr-dotted"></div>

                                                    <div class="input-group-btn">
                                                        <input type="submit"
                                                               class="btn btn-default no-border btn-sm">Search all
                                                        <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
                                                        </input>
                                                    </div>


                                                    <div class="hr hr-dotted"></div>

                                                    <h4 class="blue smaller">
                                                        <i class="fa fa-location-arrow light-grey bigger-110"></i>
                                                        Price
                                                    </h4>

                                                    <div class="search-filter-element">
                                                        <span>from</span>
                                                        <input type="range" min="100" max="5000" step="1" name="cost1"
                                                               id="costSelector1"
                                                               onchange="updateTextInput(this.value);">
                                                        <input type="text" id="range-value1" value="" readonly/>
                                                    </div>
                                                    <div class="search-filter-element">

                                                    <span>to</span>
                                                        <input type="range" min="100" max="5000" step="1" name="cost2"
                                                               id="costSelector2"
                                                               onchange="updateTextInput1(this.value);">
                                                        <input type="text" id="range-value2" value="" readonly/>
                                                        </div>
                                                        <!-- <div id="slider-range" class="inline"></div> <span>rubles</span>-->
                                                        &nbsp;

                                                    <div class="hr hr-dotted hr-24"></div>

                                                        <button type="button"
                                                                class="btn btn-default btn-round btn-white"
                                                                id="button-update">
                                                            <i class="ace-icon fa fa-refresh green"></i>
                                                            Update only price
                                                        </button>
                                                    </div>

                                                    <div class="space-4"></div>
                                            </form>

                                        </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-9">
                                            <div class="row">
                                                <div class="col-xs-12" id="search-results">
                                                    <#if model??>
                                                    <#if model.result??>
                                                    <#list model.result as list >
                                                        <div class="media search-media">
                                                        <div class="media-body">
                                                            <div>
                                                                <h4 class="media-heading">
                                                                    <a href="#" class="blue">${list.value.name}</a>
                                                                </h4>
                                                            </div>
                                                            <p>playerDegree: ${list.key.playerDegree}
                                                                coachDegree: ${list.key.coachDegree}
                                                            </p>

                                                            <div class="search-actions text-center">
                                                                <span class="text-info">$</span>

                                                                <span class="blue bolder bigger-150">${list.key.price}</span>

                                                                hourly
                                                                <div class="action-buttons bigger-125">
                                                                    <a href="#">
                                                                        <i class="ace-icon fa fa-phone green"></i>
                                                                    </a>

                                                                    <a href="#">
                                                                        <i class="ace-icon fa fa-heart red"></i>
                                                                    </a>

                                                                    <a href="#">
                                                                        <i class="ace-icon fa fa-star orange2"></i>
                                                                    </a>
                                                                </div>
                                                                <a class="search-btn-action btn btn-sm btn-block btn-info">Book
                                                                    it!</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </#list>
                                                    </#if>
                                                    </#if>


                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- PAGE CONTENT ENDS -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div class="footer">
        <div class="footer-inner">
            <div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

                &nbsp; &nbsp;
                <span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div><!-- /.main-container -->
<!-- Start SiteHeart code -->

<!-- End SiteHeart code -->
 <#include "bottom.ftl">
