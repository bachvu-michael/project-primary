



<cfparam name="args.background_color"  default="" />
<cfparam name="args.number_1"  default="" />
<cfparam name="args.number_2"  default="" />
<cfparam name="args.number_3"  default="" />
<cfparam name="args.number_4"  default="" />
<cfparam name="args.number_5"  default="" />
<cfparam name="args.number_6"  default="" />
<cfparam name="args.title_1"  default="" />
<cfparam name="args.title_2"  default="" />
<cfparam name="args.title_3"  default="" />
<cfparam name="args.title_4"  default="" />
<cfparam name="args.title_5"  default="" />
<cfparam name="args.title_6"  default="" />
<cfscript>

</cfscript>
<cfoutput>
    <div class="section-bg-color bg-color white" style="background-color:#args.background_color#;">
        <div class="container content">
            <div class="row">
                <div class="col-md-2">
                    <div class="icon-box counter-box-icon">
                        <div class="icon-box-cell">
                            <i class="fa fa-group text-xl"></i>
                        </div>
                        <div class="icon-box-cell">
                            <label class="counter text-l" data-speed="5000" data-to="#args.number_1#">#args.number_1#</label>
                            <p>#args.title_1#</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="icon-box counter-box-icon">
                        <div class="icon-box-cell">
                            <i class="fa fa-bar-chart text-xl"></i>
                        </div>
                        <div class="icon-box-cell">
                            <label class="counter text-l" data-speed="5000" data-to="#args.number_2#">#args.number_2#</label>
                            <p>#args.title_2#</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="icon-box counter-box-icon">
                        <div class="icon-box-cell">
                            <i class="fa fa-building-o text-xl"></i>
                        </div>
                        <div class="icon-box-cell">
                            <label class="counter text-l" data-speed="5000" data-to="#args.number_3#">#args.number_3#</label>
                            <p>#args.title_3#</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="icon-box counter-box-icon">
                        <div class="icon-box-cell">
                            <i class="fa fa-user-md text-xl"></i>
                        </div>
                        <div class="icon-box-cell">
                            <label class="counter text-l" data-speed="5000" data-to="#args.number_4#">#args.number_4#</label>
                            <p>#args.title_4#</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="icon-box counter-box-icon">
                        <div class="icon-box-cell">
                            <i class="fa fa-home text-xl"></i>
                        </div>
                        <div class="icon-box-cell">
                            <label class="counter text-l" data-speed="5000" data-to="#args.number_5#">#args.number_5#</label>
                            <p>#args.title_5#</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="icon-box counter-box-icon">
                        <div class="icon-box-cell">
                            <i class="fa fa-map-o text-xl"></i>
                        </div>
                        <div class="icon-box-cell">
                            <label class="counter text-l" data-speed="5000" data-to="#args.number_6#">#args.number_6#</label>
                            <p>#args.title_6#</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</cfoutput>