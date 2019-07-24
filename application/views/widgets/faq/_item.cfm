
<cfparam name="args.question"      default="" />
<cfparam name="args.answer"            default="" />

<cfoutput>
    <div class="list-group-item">
        <a>#args.question#</a>
        <div class="panel">
            <div class="inner">
                <cfif !isEmpty(args.answer)>
                    #rendercontent("richeditor", args.answer)#
                </cfif>
            </div>
        </div>
    </div>
</cfoutput>
