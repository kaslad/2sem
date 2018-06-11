<#include "client_base.ftl">

    <h3 class="w3l_header w3_agileits_header">Мои <span>натяжки</span>

    </h3>


    <div class="agile_team_grids_top">
        <div class="col-md-6 col-md-offset-3 w3_agile_services_grid">
            <form method="get">
                <label for="exampleFormControlSelect1">Выберите статус</label>
                <select class="form-control" id="exampleFormControlSelect1" name="state">
                    <option value="NEW">Новая</option>
                    <option value="PROGRESS">В процессе</option>
                    <option value="REVIEW">Отзыв</option>
                    <option value="CANCELLED">Архив</option>
                </select>
                <input type="submit" value="OK">
            </form>

            <div class="agile_services_grid1 wthree_services_grid1">
                <#if model.applications??>
                <ul class="list-group w3-agile">
                    <#list model.applications as app >
                    <li class="list-group-item"><a href="#" data-toggle="modal" data-target="#myModal"><#if app.name??>${app.name}</#if> ${app.horizontalWeight}/${app.verticalWeight} <p>05 January 2017</p></a></li>
                    </#list>

                </ul>
                </#if>
            </div>
        </div>
</div>
    <!-- bootstrap-pop-up -->
    <div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="agileinfo_sign">Tennis Court</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>
                <section>
                    <div class="modal-body">
                        <img src="/static/images/banner1.jpg" alt=" " class="img-responsive"/>
                        <p>Ut enim ad minima veniam, quis nostrum
                            exercitationem ullam corporis suscipit laboriosam,
                            nisi ut aliquid ex ea commodi consequatur? Quis autem
                            vel eum iure reprehenderit qui in ea voluptate velit
                            esse quam nihil molestiae consequatur, vel illum qui
                            dolorem eum fugiat quo voluptas nulla pariatur.
                            <i>" Quis autem vel eum iure reprehenderit qui in ea voluptate velit
                                esse quam nihil molestiae consequatur.</i></p>
                    </div>
                </section>
            </div>
        </div>
    </div>
<!-- js -->
    <script type="text/javascript" >
        elem = document.getElementById("exampleFormControlSelect1");
        for(var i = 0; i < elem.options.length; i++){
            if(elem.options[i].value === "${model.state}"){
                elem.selectedIndex = i;
                break;
            }
        }

    </script>
<script type="text/javascript" src="/js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
        });
    });
</script>
<!-- start-smooth-scrolling -->
<!-- for bootstrap working -->
<script src="/js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- here stars scrolling icon -->

<script type="text/javascript">
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
</script>
<!-- //here ends scrolling icon -->
<#include "bottom.ftl">