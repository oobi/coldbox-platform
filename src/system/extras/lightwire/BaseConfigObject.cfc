<cfcomponent name="BaseConfigObject">
<!--- getter and setter for coldbox controller --->
<cffunction name="getcontroller" access="public" returntype="any" output="false" hint="Get the coldbox controller">
	<cfreturn variables.controller>
</cffunction>
<cffunction name="setcontroller" access="public" returntype="void" output="false" hint="Set the coldbox controller">
	<cfargument name="controller" type="any" required="true">
	<cfset variables.controller = arguments.controller>
</cffunction>