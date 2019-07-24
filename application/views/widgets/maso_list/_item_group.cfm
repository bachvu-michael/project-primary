<cfparam name="args.name"      default="" />
<cfscript>
</cfscript>
<cfoutput>
    <li><a data-filter="#args._id.left(8)#">#args.name#</a></li>
</cfoutput>