<!-----------------------------------------------------------------------
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldboxframework.com | www.luismajano.com | www.ortussolutions.com
********************************************************************************

Author 	    :	Luis Majano
Date        :	January 18, 2007
Description :
	This is an object cache pool.

Modification History:
01/18/2007 - Created
----------------------------------------------------------------------->
<cfcomponent name="objectPool" hint="I manage persistance for objects." output="false">

<!------------------------------------------- CONSTRUCTOR ------------------------------------------->

	<cffunction name="init" access="public" output="false" returntype="objectPool" hint="Constructor">
		<cfscript>
			var Collections = createObject("java", "java.util.Collections");
			var Map = CreateObject("java","java.util.HashMap").init();
			var MetadataMap = CreateObject("java","java.util.HashMap").init();
			
			/* Prepare instance */
			variables.instance = structnew();
			
			/* Instantiate object pools */
			instance.pool = Collections.synchronizedMap( Map );
			instance.pool_metadata = Collections.synchronizedMap( MetadataMap );
			
			/* Return pool */
			return this;
		</cfscript>
	</cffunction>

<!------------------------------------------- PUBLIC ------------------------------------------->

	<!--- Getter/Setter For pool --->
	<cffunction name="getpool" access="public" returntype="any" output="false">
		<cfreturn instance.pool>
	</cffunction>
	<cffunction name="setpool" access="public" returntype="void" output="false">
		<cfargument name="pool" type="struct" required="true">
		<cfset instance.pool = arguments.pool>
	</cffunction>

	<!--- Getter/Setter for Pool Metdata --->
	<cffunction name="getpool_metadata" access="public" returntype="any" output="false">
		<cfreturn instance.pool_metadata >
	</cffunction>
	<cffunction name="setpool_metadata" access="public" returntype="void" output="false">
		<cfargument name="pool_metadata" type="struct" required="true">
		<cfset instance.pool_metadata = arguments.pool_metadata>
	</cffunction>

	<!--- Setter/Getter metdata property --->
	<cffunction name="getObjectMetadata" access="public" returntype="any" output="false">
		<cfargument name="objectKey" type="any" required="true">
		<cfreturn instance.pool_metadata[arguments.objectKey] >
	</cffunction>
	<cffunction name="setObjectMetadata" access="public" returntype="void" output="false">
		<cfargument name="objectKey" type="any" required="true">
		<cfargument name="metadata"  type="any" required="true">
		<cfset instance.pool_metadata[arguments.objectKey] = arguments.metadata>
	</cffunction>
	<cffunction name="getMetadataProperty" access="public" returntype="any" output="false">
		<cfargument name="objectKey" type="any" required="true">
		<cfargument name="property"  type="any" required="true">
		<cfreturn instance.pool_metadata[arguments.objectKey][arguments.property] >
	</cffunction>
	<cffunction name="setMetadataProperty" access="public" returntype="void" output="false">
		<cfargument name="objectKey" type="any" required="true">
		<cfargument name="property"  type="any" required="true">
		<cfargument name="value"  	 type="any"    required="true">
		<cfset instance.pool_metadata[arguments.objectKey][arguments.property] = arguments.value >
	</cffunction>

	<!--- Simple Object Lookup --->
	<cffunction name="lookup" access="public" output="false" returntype="boolean" hint="Check if an object is in cache.">
		<!--- ************************************************************* --->
		<cfargument name="objectKey" type="any" required="true">
		<!--- ************************************************************* --->
		<!--- Check for Object in Cache. --->
		<cfreturn structKeyExists(instance.pool, arguments.objectKey) >
	</cffunction>

	<!--- Get an object from the pool --->
	<cffunction name="get" access="public" output="false" returntype="any" hint="Get an object from cache. If it doesn't exist it returns a blank structure.">
		<!--- ************************************************************* --->
		<cfargument name="objectKey" type="any" required="true">
		<!--- ************************************************************* --->
		<cfscript>
			//Record Metadata
			setMetadataProperty(arguments.objectKey,"hits", getMetaDataProperty(arguments.objectKey,"hits")+1);
			setMetadataProperty(arguments.objectKey,"lastAccesed", now());
			//Return object.
			return instance.pool[arguments.objectKey];
		</cfscript>
	</cffunction>

	<!--- Set an Object in the pool --->
	<cffunction name="set" access="public" output="false" returntype="void" hint="sets an object in cache.">
		<!--- ************************************************************* --->
		<cfargument name="objectKey" 			type="any"  required="true">
		<cfargument name="MyObject"				type="any" 	required="true">
		<cfargument name="Timeout"				type="any"  required="false" default="" hint="Timeout in minutes. If timeout = 0 then object never times out. If timeout is blank, then timeout will be inherited from framework.">
		<cfargument name="LastAccessTimeout"	type="any"  required="false" default="" hint="Timeout in minutes. If timeout is blank, then timeout will be inherited from framework.">
		<!--- ************************************************************* --->
		<cfscript>
			var MetaData = structnew();
			//Set new Object into cache.
			instance.pool[arguments.objectKey] = arguments.MyObject;
			//Create object's metdata
			MetaData.hits = 1;
			MetaData.Timeout = arguments.timeout;
			MetaData.LastAccessTimeout = arguments.LastAccessTimeout;
			MetaData.Created = now();
			MetaData.LastAccesed = now();
			//Set the metadata
			setObjectMetaData(arguments.objectkey,MetaData);
		</cfscript>
	</cffunction>

	<!--- Clear an object from the pool --->
	<cffunction name="clearKey" access="public" output="false" returntype="boolean" hint="Clears a key from the cache.">
		<!--- ************************************************************* --->
		<cfargument name="objectKey" type="string" required="true">
		<!--- ************************************************************* --->
		<cfscript>
		var Results = false;
		try{
			structDelete(instance.pool,arguments.objectKey);
			structDelete(instance.pool_metadata,arguments.objectKey);
			Results = true;
		}
		catch(Any e){
		//Nothing;
		}
		return Results;
		</cfscript>
	</cffunction>

	<!--- Get the size of the pool --->
	<cffunction name="getSize" access="public" output="false" returntype="numeric" hint="Get the cache's size in items">
		<cfscript>
		return StructCount(instance.pool);
		</cfscript>
	</cffunction>

	<!--- Get the itemList --->
	<cffunction name="getObjectsKeyList" access="public" output="false" returntype="string" hint="Get the cache's object entries listing.">
		<cfscript>
		return structKeyList(instance.pool);
		</cfscript>
	</cffunction>

<!------------------------------------------- PRIVATE ------------------------------------------->



</cfcomponent>