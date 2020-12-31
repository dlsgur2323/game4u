<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>

<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"/>

<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}
	<li class="nav-item subMenu" >
      	<a href="javascript:goPage('{{murl }}','{{mcode}}');" class="nav-link">
          <i class="{{micon }}"></i>
             <p>{{mname }}</p>
        </a>
	</li>
{{/each}}
</script>

<script>
	
</script>