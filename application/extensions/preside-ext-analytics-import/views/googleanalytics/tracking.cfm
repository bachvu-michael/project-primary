<cfparam name="args.trackingId" default="" />
<cfparam name="args.customDimensionIndex" default="" />

<cfif len( args.trackingId ) gt 0>
	<cfoutput>
		<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

			ga('create', '#args.trackingId#', 'auto');
			<cfif isNumeric( args.customDimensionIndex )>
				ga('set', 'dimension#args.customDimensionIndex#', '#event.getCurrentPageId()#');
			</cfif>
			ga('send', 'pageview');
		</script>
	</cfoutput>
</cfif>