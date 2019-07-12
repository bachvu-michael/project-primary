<cfscript>
	menuItems = args.menuItems ?: [];
</cfscript>
<cfoutput>
	<cfloop array="#menuItems#" index="menuItem">
		<cfset menuItemClass = "site-head-nav-dropdown" />
		<cfif menuItem.active>
			<cfset menuItemClass &= " is-active" />
		</cfif>
		<li class="#menuItemClass#">
			<a href="#event.buildLink( page=menuItem.id )#">#menuItem.title#</a>
		</li>
	</cfloop>
</cfoutput>