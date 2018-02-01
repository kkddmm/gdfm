<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<table class="table">
			<thead></thead>
			<tbody>
				<c:if test="${not empty boardtypeList}" >
					<c:forEach var="boardtype" items="${boardtypeList}">
						<tr>
							<td>${boardtype.bo_type_name}</td>
						</tr>
					</c:forEach>			
				</c:if>
			</tbody>
		</table>