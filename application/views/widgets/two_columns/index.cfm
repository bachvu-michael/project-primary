

<cfparam name="args.right_content"      default="" />
<cfparam name="args.left_content"       default="" />
<cfparam name="args.layout"             default=6 />
<cfparam name="args.style"              default="default" />
<cfscript>
    classLeft = "";
    classRight = "";
    if(args.style == "left-color"){
        classLeft = "boxed white middle-content"
    }
    if(args.style == "right-color"){
        classRight = "boxed white middle-content"
    }
</cfscript>
<cfoutput>
    <div class="section-empty">
        <div class="container content">
            <div class="row proporzional-row">
                <div class="col-md-#args.layout# col-sm-12 #classLeft#">
                    <cfif !isEmpty(args.left_content)>
                        #renderContent("richeditor",args.left_content)#
                    </cfif>
                </div>
                <div class="col-md-#12 - args.layout# col-sm-12 #classRight#">
                    <cfif !isEmpty(args.right_content)>
                        #renderContent("richeditor",args.right_content)#
                    </cfif>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
