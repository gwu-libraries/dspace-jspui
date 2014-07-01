<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>
	<%-- Page footer --%>
        <footer class="navbar-fixed-bottom"><!-- the Libsite7 Lite Footer -->
            <div id="libfooter-container">
                <div id="libfooter" class="container">
                    <div class="libfooter-text"><span class="address"><a href="http://library.gwu.edu" target="_blank" title="GW Libraries Website">GW Libraries</a> &#8226; 2130 H Street NW &#8226; Washington DC 20052</span> &#8226; <span class="tel">202.994.7549</span> &#8226; <a href="mailto:speccoll@gwu.edu" target="_blank" title="">speccoll@gwu.edu</a><div style="float:right;"><a href="/jspui/profile">staff login</a></div></div>
                </div>
            </div>
        </footer><!-- end Libsite7 Lite Footer -->
    </body>
</html>
