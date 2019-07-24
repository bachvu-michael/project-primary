


<cfparam name="args.title"                  default="" />
<cfparam name="args.list_question_answer"   default="" />
<cfparam name="args.is_container"           default="" />

<cfscript>

</cfscript>
<cfoutput>
    <div class="<cfif args.is_container == 1>container<cfelse>container-fluid</cfif>">
        <cfif !isEmpty(args.title)>
            <div class="title-base text-left">
                <hr />
                #renderContent( "richeditor", args.title )#
            </div>
        </cfif>
        <div class="list-group accordion-list" data-time="1000" data-type='accordion'>
            <cfif !isEmpty(args.list_question_answer)>
                #renderView(
                    view          = "/widgets/faq/_item"
                  , presideObject = "items_faq"
                  , filter        = { id=listToArray( args.list_question_answer ) }
                  , orderBy       = "FIELD( id, #listqualify( args.list_question_answer, "'" )# )"
                )#
            </cfif>
        </div>
    </div>
</cfoutput>


