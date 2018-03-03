<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="slider">

	<!-- <h2>영화 정보 관리자 페이지 </h2> -->

                
      <form action="${pageContext.request.contextPath}/admin/insertSnack" method="post">
				<form id="snackFrm" name="snackFrm" enctype="multipart/form-data">


			
			<div class="container">
			
				  <h2>Snack Admin Table</h2>
				  
				  <p>스낵정보 입력</p>
				              
				  <table class="table">
				    	
				    	<tbody>
				    	
				    			<tr>
				    						<th>스낵 콤보여부 : </th>
				    						 <td>
				    						   		 <label>
													    <input type="radio" value="" name="snack_combo_yn">													   				Y
													  </label>
													  
													  <label>
													    <input type="radio" value="" name="snack_combo_yn">													   				N
													  </label>
											</td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 타입 : </th>
				    						<td>
				    						   <label>
											    <input type="radio" value="combo" name="snack_type">
											   			combo	
											  </label>
											  
											  <label>
											    <input type="radio" value="popcorn" name="snack_type">
											    popcorn											   				
											  </label>
											  <label>
											  	<input type="radio" value="snack" name="snack_type">
											  	snack
											  </label>
											  <label>
											  	<input type="radio" value="drink" name="snack_type">
											  	drink
											  </label>
											</td>
													  
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 이름 : </th>
				    						    <td><input type="text" name="snack_name" /></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 부제 : </th>
				    						<td><input type="text" name="snack_subname" /></td>
				    			</tr>
				    			
				    			
				    			<tr>
						    				<th>스낵 가격  : </th>
						    				<td><input type="text" name="snack_price" /> 원</td>
				    			</tr>	
				    		
				    			
				    			<tr>
				    						<th>스낵 사이즈 : </th>
				    						 <td>
				    						   		 <label>
													    <input type="radio" value="M" name="snack_size">													   				
													    M
													  </label>
													  
													  <label>
													    <input type="radio" value="L" name="snack_size">
													    L													   				
													  </label>
											</td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 원산지 : </th>				    								
				    						<td><input type="text" name="snack_origin" /></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 원재료 : </th>				    								
				    						<td><input type="text" name="snack_mat" /></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 상품설명 : </th>
				    						<td><input type="text" name="snack_info" /></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 유효기간 : </th>
				    						<td><input type="text" name="snack_exp" /></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 상품교환방법 : </th>
				    						<td><input type="text" name="snack_change_info" /></td>
				    			</tr>
				    			
				    			<tr>
				    						<th>스낵 상품이용안내 : </th>
				    						<td><input type="text" name="snack_use_info" /></td>
				    			</tr>
				    			
				    			

				   
				     
				 			</tbody>
				  </table>
				  
				  
				</div>
			
			
			  				<p align="right">
           				<input style="color: white;" type="submit" class="btn btn-warning" value="스낵정보 등록" 
           						onClick="location.href='${pageContext.request.contextPath}/admin/snack'"> 
                </p>
			  	
			
			
			</form>
				
		</div>
		</table>
</div>

