<%@ page import="servicecamara.Camara" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'camara.label', default: 'Camara')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
	<g:form action="save" method="post" >
  <div class="dialog">
    <table>
      <tbody> 
		<tr class="prop">
          <td valign="top" class="name"><label for="id">Id:</label></td>
          <td valign="top" 
              class="value ${hasErrors(bean:camara,field:'id','errors')}">
              <input type="text" 
                     maxlength="5" 
                     id="id" 
                     name="id" 
                     value="${fieldValue(bean:camara,field:'id')}"/>
          </td>
        </tr> 
        <tr class="prop">
          <td valign="top" class="name"><label for="numLegislatura">Num Legislatura:</label></td>
          <td valign="top" 
              class="value ${hasErrors(bean:camara,field:'numLegislatura','errors')}">
              <input type="text" 
                     id="numLegislatura" 
                     name="numLegislatura" 
                     value="${fieldValue(bean:camara,field:'numLegislatura')}"/>
          </td>
        </tr>
         </tbody>
    </table>
  </div>
  <div class="buttons">
    <span class="button"><input class="save" type="submit" value="Create" /></span>
  </div>
</g:form>
	</body>
</html>