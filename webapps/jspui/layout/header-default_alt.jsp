<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - HTML header for main home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.dspace.app.webui.util.JSPManager" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.app.util.Util" %>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.*" %>

<%
    String title = (String) request.getAttribute("dspace.layout.title");
    String navbar = (String) request.getAttribute("dspace.layout.navbar");
    boolean locbar = ((Boolean) request.getAttribute("dspace.layout.locbar")).booleanValue();

    String siteName = ConfigurationManager.getProperty("dspace.name");
    String feedRef = (String)request.getAttribute("dspace.layout.feedref");
    boolean osLink = ConfigurationManager.getBooleanProperty("websvc.opensearch.autolink");
    String osCtx = ConfigurationManager.getProperty("websvc.opensearch.svccontext");
    String osName = ConfigurationManager.getProperty("websvc.opensearch.shortname");
    List parts = (List)request.getAttribute("dspace.layout.linkparts");
    String extraHeadData = (String)request.getAttribute("dspace.layout.head");
    String extraHeadDataLast = (String)request.getAttribute("dspace.layout.head.last");
    String dsVersion = Util.getSourceVersion();
    String generator = dsVersion == null ? "DSpace" : "DSpace "+dsVersion;
    String analyticsKey = ConfigurationManager.getProperty("jspui.google.analytics.key");
%>

<!DOCTYPE html>
<html>
    <head>
        <title>TEST: <%= siteName %>: <%= title %></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="Generator" content="<%= generator %>" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/favicon.ico" type="image/x-icon"/>
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/jquery-ui-1.10.3.custom/redmond/jquery-ui-1.10.3.custom.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap.min.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/bootstrap-theme.min.css" type="text/css" />
            <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/libheader7_lite.css" type="text/css" />
            <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/libheader7_lite_bootswatch.css" type="text/css" />
	    <link rel="stylesheet" href="<%= request.getContextPath() %>/static/css/bootstrap/dspace-theme.css" type="text/css" />
<%
    if (!"NONE".equals(feedRef))
    {
        for (int i = 0; i < parts.size(); i+= 3)
        {
%>
        <link rel="alternate" type="application/<%= (String)parts.get(i) %>" title="<%= (String)parts.get(i+1) %>" href="<%= request.getContextPath() %>/feed/<%= (String)parts.get(i+2) %>/<%= feedRef %>"/>
<%
        }
    }
    
    if (osLink)
    {
%>
        <link rel="search" type="application/opensearchdescription+xml" href="<%= request.getContextPath() %>/<%= osCtx %>description.xml" title="<%= osName %>"/>
<%
    }

    if (extraHeadData != null)
        { %>
<%= extraHeadData %>
<%
        }
%>
        
	<script type='text/javascript' src="<%= request.getContextPath() %>/static/js/jquery/jquery-1.10.2.min.js"></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/static/js/jquery/jquery-ui-1.10.3.custom.min.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/static/js/bootstrap/bootstrap.min.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/static/js/holder.js'></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/utils.js"></script>
    <script type="text/javascript" src="<%= request.getContextPath() %>/static/js/choice-support.js"> </script>

    <%--Gooogle Analytics recording.--%>
    <%
    if (analyticsKey != null && analyticsKey.length() > 0)
    {
    %>
        <script type="text/javascript">
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '<%= analyticsKey %>']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
    <%
    }
    if (extraHeadDataLast != null)
    { %>
		<%= extraHeadDataLast %>
		<%
		    }
    %>
    

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="<%= request.getContextPath() %>/static/js/html5shiv.js"></script>
  <script src="<%= request.getContextPath() %>/static/js/respond.min.js"></script>
<![endif]-->
    </head>

    <%-- HACK: leftmargin, topmargin: for non-CSS compliant Microsoft IE browser --%>
    <%-- HACK: marginwidth, marginheight: for non-CSS compliant Netscape browser --%>
    <body class="undernavigation">
<a class="sr-only" href="#content">Skip navigation</a>

<%-- imports added to test admin auth condition below --%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.content.Collection" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.eperson.EPerson" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.browse.BrowseIndex" %>
<%@ page import="org.dspace.browse.BrowseInfo" %>
<%@ page import="java.util.Map" %>

<%
    // Is anyone logged in?
    EPerson user = (EPerson) request.getAttribute("dspace.current.user");

    // Is the logged in user an admin
    Boolean admin = (Boolean)request.getAttribute("is.admin");
    // Boolean admin = true;
    boolean isAdmin = (admin == null ? false : admin.booleanValue());
    //Boolean test = true;
    //boolean isTest = (test == null ? false : test.booleanValue());

    // Get the current page, minus query string
    String currentPage = UIUtil.getOriginalURL(request);
    int c = currentPage.indexOf( '?' );
    if( c > -1 )
    {
        currentPage = currentPage.substring( 0, c );
    }

    // E-mail may have to be truncated
    String navbarEmail = null;

    if (user != null)
    {
        navbarEmail = user.getEmail();
    }

    // get the browse indices

        BrowseIndex[] bis = BrowseIndex.getBrowseIndices();
    BrowseInfo binfo = (BrowseInfo) request.getAttribute("browse.info");
    String browseCurrent = "";
    if (binfo != null)
    {
        BrowseIndex bix = binfo.getBrowseIndex();
        // Only highlight the current browse, only if it is a metadata index,
        // or the selected sort option is the default for the index
        if (bix.isMetadataIndex() || bix.getSortOption() == binfo.getSortOption())
        {
            if (bix.getName() != null)
                        browseCurrent = bix.getName();
        }
    }

if (isAdmin)
{
%>
<header class="navbar navbar-inverse navbar-fixed-top">
<%
}
else
{
%>
<header class="hide-admin-header navbar navbar-inverse navbar-fixed-top">
<%
}
%>
    <%
    if (!navbar.equals("off"))
    {
%>
            <div class="container">
                <dspace:include page="<%= navbar %>" />
            </div>
<%
    }
    else
    {
        %>
        <div class="container">
            <dspace:include page="/layout/navbar-minimal.jsp" />
        </div>
<%
    }
%>
</header>


        <header class="navbar-fixed-top"><!-- this is the Libsite7 Lite Header -->
            <div id="libheader-container">
                <div id="libheader" class="container">
                    <div class="libheader-logo hide-lo"><a href="http://www.gwu.edu" target="_blank" title="GWU website"><img src="https://wikis.library.gwu.edu/img/gwheaderlogo.png" alt="logo: The George Washington University" /></a></div>
                    <div class="libheader-liblink"><a href="http://library.gwu.edu" target="_blank" title="GW Libraries website">GW Libraries</a></div>

                    <!-- optional links can go here (note: use short text, test it does not bump into the GW logo) -->
                    <div class="libheader-link"><a href="/jspui/" target="" title="">home</a></div>
                    <!-- this is an optional 'bullet' to place between links -->
                    <div class="bullet">&bull;</div>
                    <div class="libheader-link"><a href="/jspui/feedback" target="_blank" title="">feedback</a></div>
                    <!-- end optional links -->

                    <!-- optional bootstrap user icons, example placement -->
                    <!-- end optional bootstrap user icons -->

        <%-- Search Box --%>
        <form method="get" action="<%= request.getContextPath() %>/simple-search" class="navbar-form navbar-right" scope="search">
            <div class="form-group">
          <input type="text" class="form-control" placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query" id="tequery" size="25"/>
        </div>
        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>

                </div>
            </div>
        </header><!-- end Libsite7 Lite Header -->

<main id="content" role="main">
<div class="container banner">
	<div class="row">
		<div class="col-md-9 brand">
		<h1><fmt:message key="jsp.layout.header-default.brand.heading" /></h1>
        <fmt:message key="jsp.layout.header-default.brand.description" /> 
        </div>
        <div class="col-md-3"><img class="pull-right" src="<%= request.getContextPath() %>/image/logo.gif">
        </div>
	</div>
</div>	
<br/>
                <%-- Location bar --%>
<%
    if (locbar)
    {
%>
<div class="container">
                <dspace:include page="/layout/location-bar.jsp" />
</div>                
<%
    }
%>


        <%-- Page contents --%>
<div class="container">
<% if (request.getAttribute("dspace.layout.sidebar") != null) { %>
	<div class="row">
		<div class="col-md-9">
<% } %>		
