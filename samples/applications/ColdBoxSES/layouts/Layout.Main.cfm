<!-----------------------------------------------------------------------********************************************************************************Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corpwww.coldboxframework.com | www.luismajano.com | www.ortussolutions.com********************************************************************************Author     :	Sana UllahDate        :	March 05 2008Description :	This proxy is an inherited coldbox remote proxy used for enabling	coldbox as a model framework.-----------------------------------------------------------------------><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" /><title>Welcome to ColdBox SES coolness!!</title><cfoutput><base href="#getSetting('htmlBaseURL')#"></cfoutput><link rel="stylesheet" type="text/css" href="css/style.css" /><link rel="stylesheet" type="text/css" href="css/blue.css" /></head><body>  <div id="main">    <div id="logo"><img src="css/coldbox_110.png"></div>       <div id="menu">      <ul>        <!-- **** INSERT NAVIGATION ITEMS HERE (use id="selected" to identify the page you're on **** -->        <li><a id="selected" href="index.cfm">home</a></li>        <li><a href="javascript:void(0);">Part1 Soon</a></li>        <li><a href="javascript:void(0);">Part2 Soon</a></li>        <li><a href="javascript:void(0);">Part3 Soon</a></li>        <li><a href="javascript:void(0);">Part4 Soon</a></li>      </ul>    </div>	 <div id="content">      <div id="column1">        <div class="sidebaritem">          <div class="sbihead">            <h1>ColdBox Examples</h1>          </div>          <div class="sbilinks">            <!-- **** INSERT ADDITIONAL LINKS HERE **** -->            <cfinclude template="#rc.locInclude##ListFirst(event.getCurrentEvent(),'.')#Menu.cfm">          </div>        </div>      </div>            <div id="column2">        <p>          <cfoutput>#renderView()#</cfoutput>        </p>      </div>    </div>        <div id="footer">      copyright &copy; 2008 Ortus Solutions, Corp  | <a href="http://validator.w3.org/check?uri=referer">XHTML 1.1</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a> | <a href="http://www.dcarter.co.uk">design by dcarter</a>    </div></div></body></html>