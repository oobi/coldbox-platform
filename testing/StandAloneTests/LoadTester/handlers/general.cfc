<!-----------------------------------------------------------------------


	<cffunction name="preHandler" access="public" returntype="void" output="false" hint="Executes before any event in this handler">
		<cfargument name="Event" type="any" required="yes">
		<cfset var rc = event.getCollection()>
		<cfscript>	
	
		</cfscript>
	</cffunction>
	<cffunction name="postHandler" access="public" returntype="void" output="false" hint="Executes after any event in this handler">
		<cfargument name="Event" type="any" required="yes">
		<cfset var rc = event.getCollection()>
		<cfscript>	
	
		</cfscript>
	</cffunction>
	<cffunction name="onMissingAction" access="public" returntype="void" output="false" hint="Executes if a request action (method) is not found in this handler">
		<cfargument name="Event" 			type="any" required="yes">
		<cfset var rc = event.getCollection()>
		<cfscript>	
	
		</cfscript>
	</cffunction>

