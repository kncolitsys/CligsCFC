<!---
Created on: 12/29/2008
Created by: Birgit Pauli-Haack (birgit.pauli@gmail.com)
Original posted to : http://cligs.riaforge.org

Notes:
 	This wrapper uses v1 of the API, version v2 is obviously in the works... 
	Watch cligs.riaforge.org for update to this API
	
	Get your own API Key after you sign-up for cli.gs 
	http://cli.gs/user/api
	
	Error Handling has not yet been implemented.
	
	The CFC works also without the apiKey, but you will not be able to track clicks on it.
	  
--->

<cfcomponent displayname="cligs" hint="I use the Cligs API for some URL shortening on Twitter." output="true">

	<cffunction name="create" access="public" hint="I call the create function and get an shortened url back" returntype="Any">
		<cfargument name="longurl" required="true" type="string">
		<cfargument name="title" required="true" type="string">
		<cfargument name="callurl" required="true" type="string">
		<cfargument name="appid" required="true" type="string">
		<cfargument name="apiKey" required="true" type="string">
		
		<cfset var mycallUrl = arguments.callUrl & "create?url="& UrlEncodedFormat(arguments.longurl)>
		<Cfset mycallURL = mycallUrl & "&title=" & UrlEncodedFormat(arguments.title)>
		<cfset mycallUrl = mycallUrl & "&key=" & arguments.apiKey>
		<cfset mycallURL = mycallUrl & "&appid=" & UrlEncodedFormat(arguments.appid)>
			 
		<cfhttp url="#mycallUrl#" method="get" result="ReturnCreate"/>
		
		<cfreturn ReturnCreate.filecontent>
		
	</cffunction>
	
	<cffunction name="expand" access="public" hint="I call the expand function to receive back the long url" returntype="Any">
		<cfargument name="clig" required="true" type="string">
		<cfargument name="callUrl" required="true" type="string">
		<cfset var mycallUrl = arguments.CallUrl & "expand?clig=" &arguments.clig>
		
		<cfhttp url="#mycallUrl#" method="get" result="ReturnExpand" />
		
		<cfreturn ReturnExpand.filecontent>
		
	</cffunction>
	
</cfcomponent>