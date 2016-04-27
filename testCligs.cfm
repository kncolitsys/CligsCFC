<cfset arrLink = ArrayNew(2)>
<cfset arrLink[1][1] = "http://www.aero-news.net/index.cfm?ContentBlockID=ffe2620a-c91b-418b-86a4-008e22f38a43&">
<cfset arrLink[1][2] = "Aero-TV Visits With Rod Machado For A Serious Talk About Flight Safety (Part 1)">
<cfset arrLink[2][1] = "http://www.aero-news.net/index.cfm?ContentBlockID=61479e48-c772-418a-8f12-96104ec4d972&">
<cfset arrLink[2][2] = "Report: Military Aircraft Down Near MCAS Cherry Point">
<cfset arrLink[3][1] = "http://www.aero-news.net/index.cfm?ContentBlockID=02a096e4-8936-4618-b93d-1bbcc7baacd0&">
<cfset arrLink[3][2] = "The Numbers Have It: Holiday Travel Was Truly Awful">



<cfset cligsAPIKey = "">

<cfset Endpoint = "http://cli.gs/api/v1/cligs/">
<!--- 
	
	--->
<cfset appID = "">
<cfset mycligs = createObject("component", "cligs")>


 
<cfloop from="1" to="#ArrayLen(arrLink)#" index="l">
	<cfset arrLink[l][3] = mycligs.create(arrlink[l][1],arrlink[l][2], Endpoint , appid, cligsAPIKey)>
</cfloop> 
 
<cfloop from="1" to="#ArrayLen(arrlink)#" index="c">
	<cfset arrlink[c][4] = mycligs.expand(arrlink[c][3],Endpoint)>
</cfloop>

<cfdump var="#arrLink#"> 

<cfloop from="1" to="#ArrayLen(arrlink)#" index="l">
<cfoutput><a href="#arrlink[l][3]#">#arrlink[l][2]#</a><br/></cfoutput>
</cfloop>

