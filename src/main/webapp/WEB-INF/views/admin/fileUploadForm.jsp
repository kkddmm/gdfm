<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 폼</title>
</head>
 
<h3>파일 업로드 폼</h3>
<center>
    <!-- 
        파일업로드를 위해선 반드시 method="post" enctype="Multipart/form-data"여야함!
     -->
     
     <br>
     <br>
     <br>
     <br>
     <br>
     
    <form action="fileUpload" method="post" enctype="multipart/form-data">
       
       
       
       <!--  올린 사람 : <input type="text" name="name" /><br/>
        제목        : <input type="text" name="subject" /><br/> -->
        <!-- 
            파일 업로드는 input type="file"로 지정한다.
         -->
      <!--   파일명1 : <input type="file" name="fileName1" /><br/>
        <input type="submit" value="전송" />  
        <input type="reset" value="취소" /> -->
        
        
        
        	<tr>
				                <th>영화 포스터  :  </th>
					                <td>
						                <input type="text" placeholder="포스터를 등록하세요 " name="movie_name" value="${movie.movie_name}"/><br>
						                
										         <!-- <input type="button" value="전송" onclick=""/> -->
										                 <!-- 
											            파일 업로드는 input type="file"로 지정한다.
								        			         -->
								       
											        파일명  : <input type="file" name="poster_file" /> </br>
											         <input type="hidden" name="movie_id" value="${movie.movie_id}" /> </br>
											        <input type="submit" value="전송" />  
											        <input type="reset" value="취소" />
											    </form>
					               </td>

  			          </tr>
  			          
  			        <!--   <tr>
				                <th>영화 트레일러  :  </th>
				                <td><input type="text" placeholder="영화 트레일러를 등록하세요 " name="movie_trailer" value=""/><br>
				                		<input type="button" value="전송"  onclick=""/>
				                			
											        파일명1 : <input type="file" name="fileName1" /> </br>
											        <input type="submit" value="전송" />  
											        <input type="reset" value="취소" />
											    </form>
				                </td>
  			          </tr>
  			          
  			          <tr>
				                <th>영화 스틸컷  :  </th>
				                <td><input type="text" placeholder="영화 스틸컷을 등록하세요 " name="stillcut" value=""/> <br>
											        파일명  : <input type="file" name="fileName1" /> </br>
											        <input type="submit" value="전송" />  
											        <input type="reset" value="취소" />

											    </td>
  			          </tr> -->
    </form>
</center>


